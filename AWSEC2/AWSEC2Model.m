//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSEC2Model.h"
#import <AWSCore/AWSCategory.h>

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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpcPeeringConnection class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2AccountAttributeValue class]];
}

@end

@implementation AWSEC2AccountAttributeValue

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeValue" : @"AttributeValue",
             };
}

@end

@implementation AWSEC2ActiveInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"instanceType" : @"InstanceType",
             @"spotInstanceRequestId" : @"SpotInstanceRequestId",
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"vpc"] == NSOrderedSame) {
            return @(AWSEC2DomainTypeVPC);
        }
        if ([value caseInsensitiveCompare:@"standard"] == NSOrderedSame) {
            return @(AWSEC2DomainTypeStandard);
        }
        return @(AWSEC2DomainTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DomainTypeVPC:
                return @"vpc";
            case AWSEC2DomainTypeStandard:
                return @"standard";
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"vpc"] == NSOrderedSame) {
            return @(AWSEC2DomainTypeVPC);
        }
        if ([value caseInsensitiveCompare:@"standard"] == NSOrderedSame) {
            return @(AWSEC2DomainTypeStandard);
        }
        return @(AWSEC2DomainTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DomainTypeVPC:
                return @"vpc";
            case AWSEC2DomainTypeStandard:
                return @"standard";
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"vpc"] == NSOrderedSame) {
            return @(AWSEC2DomainTypeVPC);
        }
        if ([value caseInsensitiveCompare:@"standard"] == NSOrderedSame) {
            return @(AWSEC2DomainTypeStandard);
        }
        return @(AWSEC2DomainTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DomainTypeVPC:
                return @"vpc";
            case AWSEC2DomainTypeStandard:
                return @"standard";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2AllocateHostsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoPlacement" : @"AutoPlacement",
             @"availabilityZone" : @"AvailabilityZone",
             @"clientToken" : @"ClientToken",
             @"instanceType" : @"InstanceType",
             @"quantity" : @"Quantity",
             };
}

+ (NSValueTransformer *)autoPlacementJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"on"] == NSOrderedSame) {
            return @(AWSEC2AutoPlacementOn);
        }
        if ([value caseInsensitiveCompare:@"off"] == NSOrderedSame) {
            return @(AWSEC2AutoPlacementOff);
        }
        return @(AWSEC2AutoPlacementUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2AutoPlacementOn:
                return @"on";
            case AWSEC2AutoPlacementOff:
                return @"off";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2AllocateHostsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostIds" : @"HostIds",
             };
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

@implementation AWSEC2AttachClassicLinkVpcRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"groups" : @"Groups",
             @"instanceId" : @"InstanceId",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2AttachClassicLinkVpcResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returned" : @"Return",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpcAttachment class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2IpPermission class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2IpPermission class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2AvailabilityZoneMessage class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSEC2AvailabilityZoneStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"information"] == NSOrderedSame) {
            return @(AWSEC2AvailabilityZoneStateInformation);
        }
        if ([value caseInsensitiveCompare:@"impaired"] == NSOrderedSame) {
            return @(AWSEC2AvailabilityZoneStateImpaired);
        }
        if ([value caseInsensitiveCompare:@"unavailable"] == NSOrderedSame) {
            return @(AWSEC2AvailabilityZoneStateUnavailable);
        }
        return @(AWSEC2AvailabilityZoneStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2AvailabilityZoneStateAvailable:
                return @"available";
            case AWSEC2AvailabilityZoneStateInformation:
                return @"information";
            case AWSEC2AvailabilityZoneStateImpaired:
                return @"impaired";
            case AWSEC2AvailabilityZoneStateUnavailable:
                return @"unavailable";
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

@implementation AWSEC2AvailableCapacity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availableInstanceCapacity" : @"AvailableInstanceCapacity",
             @"availableVCpus" : @"AvailableVCpus",
             };
}

+ (NSValueTransformer *)availableInstanceCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceCapacity class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2EbsBlockDevice class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Storage class]];
}

@end

@implementation AWSEC2BundleInstanceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleTask" : @"BundleTask",
             };
}

+ (NSValueTransformer *)bundleTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2BundleTask class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2BundleTaskError class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSEC2BundleTaskStatePending);
        }
        if ([value caseInsensitiveCompare:@"waiting-for-shutdown"] == NSOrderedSame) {
            return @(AWSEC2BundleTaskStateWaitingForShutdown);
        }
        if ([value caseInsensitiveCompare:@"bundling"] == NSOrderedSame) {
            return @(AWSEC2BundleTaskStateBundling);
        }
        if ([value caseInsensitiveCompare:@"storing"] == NSOrderedSame) {
            return @(AWSEC2BundleTaskStateStoring);
        }
        if ([value caseInsensitiveCompare:@"cancelling"] == NSOrderedSame) {
            return @(AWSEC2BundleTaskStateCancelling);
        }
        if ([value caseInsensitiveCompare:@"complete"] == NSOrderedSame) {
            return @(AWSEC2BundleTaskStateComplete);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)storageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Storage class]];
}

+ (NSValueTransformer *)updateTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2BundleTask class]];
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

@implementation AWSEC2CancelImportTaskRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cancelReason" : @"CancelReason",
             @"dryRun" : @"DryRun",
             @"importTaskId" : @"ImportTaskId",
             };
}

@end

@implementation AWSEC2CancelImportTaskResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importTaskId" : @"ImportTaskId",
             @"previousState" : @"PreviousState",
             @"state" : @"State",
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesListing class]];
}

@end

@implementation AWSEC2CancelSpotFleetRequestsError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"fleetRequestIdDoesNotExist"] == NSOrderedSame) {
            return @(AWSEC2CancelBatchErrorCodeFleetRequestIdDoesNotExist);
        }
        if ([value caseInsensitiveCompare:@"fleetRequestIdMalformed"] == NSOrderedSame) {
            return @(AWSEC2CancelBatchErrorCodeFleetRequestIdMalformed);
        }
        if ([value caseInsensitiveCompare:@"fleetRequestNotInCancellableState"] == NSOrderedSame) {
            return @(AWSEC2CancelBatchErrorCodeFleetRequestNotInCancellableState);
        }
        if ([value caseInsensitiveCompare:@"unexpectedError"] == NSOrderedSame) {
            return @(AWSEC2CancelBatchErrorCodeUnexpectedError);
        }
        return @(AWSEC2CancelBatchErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2CancelBatchErrorCodeFleetRequestIdDoesNotExist:
                return @"fleetRequestIdDoesNotExist";
            case AWSEC2CancelBatchErrorCodeFleetRequestIdMalformed:
                return @"fleetRequestIdMalformed";
            case AWSEC2CancelBatchErrorCodeFleetRequestNotInCancellableState:
                return @"fleetRequestNotInCancellableState";
            case AWSEC2CancelBatchErrorCodeUnexpectedError:
                return @"unexpectedError";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2CancelSpotFleetRequestsErrorItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"Error",
             @"spotFleetRequestId" : @"SpotFleetRequestId",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2CancelSpotFleetRequestsError class]];
}

@end

@implementation AWSEC2CancelSpotFleetRequestsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"spotFleetRequestIds" : @"SpotFleetRequestIds",
             @"terminateInstances" : @"TerminateInstances",
             };
}

@end

@implementation AWSEC2CancelSpotFleetRequestsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"successfulFleetRequests" : @"SuccessfulFleetRequests",
             @"unsuccessfulFleetRequests" : @"UnsuccessfulFleetRequests",
             };
}

+ (NSValueTransformer *)successfulFleetRequestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2CancelSpotFleetRequestsSuccessItem class]];
}

+ (NSValueTransformer *)unsuccessfulFleetRequestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2CancelSpotFleetRequestsErrorItem class]];
}

@end

@implementation AWSEC2CancelSpotFleetRequestsSuccessItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"currentSpotFleetRequestState" : @"CurrentSpotFleetRequestState",
             @"previousSpotFleetRequestState" : @"PreviousSpotFleetRequestState",
             @"spotFleetRequestId" : @"SpotFleetRequestId",
             };
}

+ (NSValueTransformer *)currentSpotFleetRequestStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"submitted"] == NSOrderedSame) {
            return @(AWSEC2BatchStateSubmitted);
        }
        if ([value caseInsensitiveCompare:@"active"] == NSOrderedSame) {
            return @(AWSEC2BatchStateActive);
        }
        if ([value caseInsensitiveCompare:@"cancelled"] == NSOrderedSame) {
            return @(AWSEC2BatchStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSEC2BatchStateFailed);
        }
        if ([value caseInsensitiveCompare:@"cancelled_running"] == NSOrderedSame) {
            return @(AWSEC2BatchStateCancelledRunning);
        }
        if ([value caseInsensitiveCompare:@"cancelled_terminating"] == NSOrderedSame) {
            return @(AWSEC2BatchStateCancelledTerminating);
        }
        if ([value caseInsensitiveCompare:@"modifying"] == NSOrderedSame) {
            return @(AWSEC2BatchStateModifying);
        }
        return @(AWSEC2BatchStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2BatchStateSubmitted:
                return @"submitted";
            case AWSEC2BatchStateActive:
                return @"active";
            case AWSEC2BatchStateCancelled:
                return @"cancelled";
            case AWSEC2BatchStateFailed:
                return @"failed";
            case AWSEC2BatchStateCancelledRunning:
                return @"cancelled_running";
            case AWSEC2BatchStateCancelledTerminating:
                return @"cancelled_terminating";
            case AWSEC2BatchStateModifying:
                return @"modifying";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)previousSpotFleetRequestStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"submitted"] == NSOrderedSame) {
            return @(AWSEC2BatchStateSubmitted);
        }
        if ([value caseInsensitiveCompare:@"active"] == NSOrderedSame) {
            return @(AWSEC2BatchStateActive);
        }
        if ([value caseInsensitiveCompare:@"cancelled"] == NSOrderedSame) {
            return @(AWSEC2BatchStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSEC2BatchStateFailed);
        }
        if ([value caseInsensitiveCompare:@"cancelled_running"] == NSOrderedSame) {
            return @(AWSEC2BatchStateCancelledRunning);
        }
        if ([value caseInsensitiveCompare:@"cancelled_terminating"] == NSOrderedSame) {
            return @(AWSEC2BatchStateCancelledTerminating);
        }
        if ([value caseInsensitiveCompare:@"modifying"] == NSOrderedSame) {
            return @(AWSEC2BatchStateModifying);
        }
        return @(AWSEC2BatchStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2BatchStateSubmitted:
                return @"submitted";
            case AWSEC2BatchStateActive:
                return @"active";
            case AWSEC2BatchStateCancelled:
                return @"cancelled";
            case AWSEC2BatchStateFailed:
                return @"failed";
            case AWSEC2BatchStateCancelledRunning:
                return @"cancelled_running";
            case AWSEC2BatchStateCancelledTerminating:
                return @"cancelled_terminating";
            case AWSEC2BatchStateModifying:
                return @"modifying";
            default:
                return nil;
        }
    }];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2CancelledSpotInstanceRequest class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"active"] == NSOrderedSame) {
            return @(AWSEC2CancelSpotInstanceRequestStateActive);
        }
        if ([value caseInsensitiveCompare:@"open"] == NSOrderedSame) {
            return @(AWSEC2CancelSpotInstanceRequestStateOpen);
        }
        if ([value caseInsensitiveCompare:@"closed"] == NSOrderedSame) {
            return @(AWSEC2CancelSpotInstanceRequestStateClosed);
        }
        if ([value caseInsensitiveCompare:@"cancelled"] == NSOrderedSame) {
            return @(AWSEC2CancelSpotInstanceRequestStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"completed"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ClassicLinkDnsSupport

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classicLinkDnsSupported" : @"ClassicLinkDnsSupported",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2ClassicLinkInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groups" : @"Groups",
             @"instanceId" : @"InstanceId",
             @"tags" : @"Tags",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2ClientData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comment" : @"Comment",
             @"uploadEnd" : @"UploadEnd",
             @"uploadSize" : @"UploadSize",
             @"uploadStart" : @"UploadStart",
             };
}

+ (NSValueTransformer *)uploadEndJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)uploadStartJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
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
             @"returned" : @"Return",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ImportInstanceTaskDetails class]];
}

+ (NSValueTransformer *)importVolumeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ImportVolumeTaskDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"active"] == NSOrderedSame) {
            return @(AWSEC2ConversionTaskStateActive);
        }
        if ([value caseInsensitiveCompare:@"cancelling"] == NSOrderedSame) {
            return @(AWSEC2ConversionTaskStateCancelling);
        }
        if ([value caseInsensitiveCompare:@"cancelled"] == NSOrderedSame) {
            return @(AWSEC2ConversionTaskStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"completed"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2ReplicateImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"detail" : @"Description",
             @"dryRun" : @"DryRun",
             @"encrypted" : @"Encrypted",
             @"kmsKeyId" : @"KmsKeyId",
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
             @"detail" : @"Description",
             @"destinationRegion" : @"DestinationRegion",
             @"dryRun" : @"DryRun",
             @"encrypted" : @"Encrypted",
             @"kmsKeyId" : @"KmsKeyId",
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

@implementation AWSEC2CreateCustomerGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bgpAsn" : @"BgpAsn",
             @"dryRun" : @"DryRun",
             @"publicIp" : @"PublicIp",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipsec.1"] == NSOrderedSame) {
            return @(AWSEC2GatewayTypeIpsec1);
        }
        return @(AWSEC2GatewayTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2GatewayTypeIpsec1:
                return @"ipsec.1";
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2CustomerGateway class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2LatestDhcpConfiguration class]];
}

@end

@implementation AWSEC2CreateDhcpOptionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dhcpOptions" : @"DhcpOptions",
             };
}

+ (NSValueTransformer *)dhcpOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2DhcpOptions class]];
}

@end

@implementation AWSEC2CreateFlowLogsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"deliverLogsPermissionArn" : @"DeliverLogsPermissionArn",
             @"logGroupName" : @"LogGroupName",
             @"resourceIds" : @"ResourceIds",
             @"resourceType" : @"ResourceType",
             @"trafficType" : @"TrafficType",
             };
}

+ (NSValueTransformer *)resourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VPC"] == NSOrderedSame) {
            return @(AWSEC2FlowLogsResourceTypeVpc);
        }
        if ([value caseInsensitiveCompare:@"Subnet"] == NSOrderedSame) {
            return @(AWSEC2FlowLogsResourceTypeSubnet);
        }
        if ([value caseInsensitiveCompare:@"NetworkInterface"] == NSOrderedSame) {
            return @(AWSEC2FlowLogsResourceTypeNetworkInterface);
        }
        return @(AWSEC2FlowLogsResourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2FlowLogsResourceTypeVpc:
                return @"VPC";
            case AWSEC2FlowLogsResourceTypeSubnet:
                return @"Subnet";
            case AWSEC2FlowLogsResourceTypeNetworkInterface:
                return @"NetworkInterface";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)trafficTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCEPT"] == NSOrderedSame) {
            return @(AWSEC2TrafficTypeAccept);
        }
        if ([value caseInsensitiveCompare:@"REJECT"] == NSOrderedSame) {
            return @(AWSEC2TrafficTypeReject);
        }
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSEC2TrafficTypeAll);
        }
        return @(AWSEC2TrafficTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TrafficTypeAccept:
                return @"ACCEPT";
            case AWSEC2TrafficTypeReject:
                return @"REJECT";
            case AWSEC2TrafficTypeAll:
                return @"ALL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2CreateFlowLogsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"flowLogIds" : @"FlowLogIds",
             @"unsuccessful" : @"Unsuccessful",
             };
}

+ (NSValueTransformer *)unsuccessfulJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2UnsuccessfulItem class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ExportToS3TaskSpecification class]];
}

+ (NSValueTransformer *)targetEnvironmentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"citrix"] == NSOrderedSame) {
            return @(AWSEC2ExportEnvironmentCitrix);
        }
        if ([value caseInsensitiveCompare:@"vmware"] == NSOrderedSame) {
            return @(AWSEC2ExportEnvironmentVMware);
        }
        if ([value caseInsensitiveCompare:@"microsoft"] == NSOrderedSame) {
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ExportTask class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InternetGateway class]];
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

@implementation AWSEC2CreateNatGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocationId" : @"AllocationId",
             @"clientToken" : @"ClientToken",
             @"subnetId" : @"SubnetId",
             };
}

@end

@implementation AWSEC2CreateNatGatewayResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"natGateway" : @"NatGateway",
             };
}

+ (NSValueTransformer *)natGatewayJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NatGateway class]];
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
             @"protocols" : @"Protocol",
             @"ruleAction" : @"RuleAction",
             @"ruleNumber" : @"RuleNumber",
             };
}

+ (NSValueTransformer *)icmpTypeCodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IcmpTypeCode class]];
}

+ (NSValueTransformer *)portRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2PortRange class]];
}

+ (NSValueTransformer *)ruleActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"allow"] == NSOrderedSame) {
            return @(AWSEC2RuleActionAllow);
        }
        if ([value caseInsensitiveCompare:@"deny"] == NSOrderedSame) {
            return @(AWSEC2RuleActionDeny);
        }
        return @(AWSEC2RuleActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RuleActionAllow:
                return @"allow";
            case AWSEC2RuleActionDeny:
                return @"deny";
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NetworkAcl class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2PrivateIpAddressSpecification class]];
}

@end

@implementation AWSEC2CreateNetworkInterfaceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkInterface" : @"NetworkInterface",
             };
}

+ (NSValueTransformer *)networkInterfaceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NetworkInterface class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"cluster"] == NSOrderedSame) {
            return @(AWSEC2PlacementStrategyCluster);
        }
        return @(AWSEC2PlacementStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PlacementStrategyCluster:
                return @"cluster";
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2PriceScheduleSpecification class]];
}

@end

@implementation AWSEC2CreateReservedInstancesListingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedInstancesListings" : @"ReservedInstancesListings",
             };
}

+ (NSValueTransformer *)reservedInstancesListingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesListing class]];
}

@end

@implementation AWSEC2CreateRouteRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationCidrBlock" : @"DestinationCidrBlock",
             @"dryRun" : @"DryRun",
             @"gatewayId" : @"GatewayId",
             @"instanceId" : @"InstanceId",
             @"natGatewayId" : @"NatGatewayId",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"routeTableId" : @"RouteTableId",
             @"vpcPeeringConnectionId" : @"VpcPeeringConnectionId",
             };
}

@end

@implementation AWSEC2CreateRouteResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returned" : @"Return",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2RouteTable class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotDatafeedSubscription class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Subnet class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"all"] == NSOrderedSame) {
            return @(AWSEC2PermissionGroupAll);
        }
        return @(AWSEC2PermissionGroupUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PermissionGroupAll:
                return @"all";
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2CreateVolumePermission class]];
}

+ (NSValueTransformer *)removeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2CreateVolumePermission class]];
}

@end

@implementation AWSEC2CreateVolumeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"dryRun" : @"DryRun",
             @"encrypted" : @"Encrypted",
             @"iops" : @"Iops",
             @"kmsKeyId" : @"KmsKeyId",
             @"size" : @"Size",
             @"snapshotId" : @"SnapshotId",
             @"volumeType" : @"VolumeType",
             };
}

+ (NSValueTransformer *)volumeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"standard"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"io1"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeIO1);
        }
        if ([value caseInsensitiveCompare:@"gp2"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeGp2);
        }
        if ([value caseInsensitiveCompare:@"sc1"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeSc1);
        }
        if ([value caseInsensitiveCompare:@"st1"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeSt1);
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
            case AWSEC2VolumeTypeSc1:
                return @"sc1";
            case AWSEC2VolumeTypeSt1:
                return @"st1";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2CreateVpcEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"dryRun" : @"DryRun",
             @"policyDocument" : @"PolicyDocument",
             @"routeTableIds" : @"RouteTableIds",
             @"serviceName" : @"ServiceName",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2CreateVpcEndpointResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"vpcEndpoint" : @"VpcEndpoint",
             };
}

+ (NSValueTransformer *)vpcEndpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpcEndpoint class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpcPeeringConnection class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"default"] == NSOrderedSame) {
            return @(AWSEC2TenancyDefault);
        }
        if ([value caseInsensitiveCompare:@"dedicated"] == NSOrderedSame) {
            return @(AWSEC2TenancyDedicated);
        }
        if ([value caseInsensitiveCompare:@"host"] == NSOrderedSame) {
            return @(AWSEC2TenancyHost);
        }
        return @(AWSEC2TenancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TenancyDefault:
                return @"default";
            case AWSEC2TenancyDedicated:
                return @"dedicated";
            case AWSEC2TenancyHost:
                return @"host";
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Vpc class]];
}

@end

@implementation AWSEC2CreateVpnConnectionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customerGatewayId" : @"CustomerGatewayId",
             @"dryRun" : @"DryRun",
             @"options" : @"Options",
             @"types" : @"Type",
             @"vpnGatewayId" : @"VpnGatewayId",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpnConnectionOptionsSpecification class]];
}

@end

@implementation AWSEC2CreateVpnConnectionResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpnConnection" : @"VpnConnection",
             };
}

+ (NSValueTransformer *)vpnConnectionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpnConnection class]];
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
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipsec.1"] == NSOrderedSame) {
            return @(AWSEC2GatewayTypeIpsec1);
        }
        return @(AWSEC2GatewayTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2GatewayTypeIpsec1:
                return @"ipsec.1";
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpnGateway class]];
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
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
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

@implementation AWSEC2DeleteFlowLogsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowLogIds" : @"FlowLogIds",
             };
}

@end

@implementation AWSEC2DeleteFlowLogsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unsuccessful" : @"Unsuccessful",
             };
}

+ (NSValueTransformer *)unsuccessfulJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2UnsuccessfulItem class]];
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

@implementation AWSEC2DeleteNatGatewayRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"natGatewayId" : @"NatGatewayId",
             };
}

@end

@implementation AWSEC2DeleteNatGatewayResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"natGatewayId" : @"NatGatewayId",
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
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

@implementation AWSEC2DeleteVpcEndpointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"vpcEndpointIds" : @"VpcEndpointIds",
             };
}

@end

@implementation AWSEC2DeleteVpcEndpointsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"unsuccessful" : @"Unsuccessful",
             };
}

+ (NSValueTransformer *)unsuccessfulJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2UnsuccessfulItem class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2AccountAttribute class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeAddressesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addresses" : @"Addresses",
             };
}

+ (NSValueTransformer *)addressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Address class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeAvailabilityZonesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZones" : @"AvailabilityZones",
             };
}

+ (NSValueTransformer *)availabilityZonesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2AvailabilityZone class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeBundleTasksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleTasks" : @"BundleTasks",
             };
}

+ (NSValueTransformer *)bundleTasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2BundleTask class]];
}

@end

@implementation AWSEC2DescribeClassicLinkInstancesRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeClassicLinkInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instances" : @"Instances",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ClassicLinkInstance class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeConversionTasksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conversionTasks" : @"ConversionTasks",
             };
}

+ (NSValueTransformer *)conversionTasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ConversionTask class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeCustomerGatewaysResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customerGateways" : @"CustomerGateways",
             };
}

+ (NSValueTransformer *)customerGatewaysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2CustomerGateway class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeDhcpOptionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dhcpOptions" : @"DhcpOptions",
             };
}

+ (NSValueTransformer *)dhcpOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2DhcpOptions class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ExportTask class]];
}

@end

@implementation AWSEC2DescribeFlowLogsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"flowLogIds" : @"FlowLogIds",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeFlowLogsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"flowLogs" : @"FlowLogs",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)flowLogsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2FlowLog class]];
}

@end

@implementation AWSEC2DescribeHostsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"hostIds" : @"HostIds",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeHostsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hosts" : @"Hosts",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)hostsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Host class]];
}

@end

@implementation AWSEC2DescribeIdFormatRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"Resource",
             };
}

@end

@implementation AWSEC2DescribeIdFormatResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"statuses" : @"Statuses",
             };
}

+ (NSValueTransformer *)statusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2IdFormat class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"description"] == NSOrderedSame) {
            return @(AWSEC2ImageAttributeNameDescription);
        }
        if ([value caseInsensitiveCompare:@"kernel"] == NSOrderedSame) {
            return @(AWSEC2ImageAttributeNameKernel);
        }
        if ([value caseInsensitiveCompare:@"ramdisk"] == NSOrderedSame) {
            return @(AWSEC2ImageAttributeNameRAMDisk);
        }
        if ([value caseInsensitiveCompare:@"launchPermission"] == NSOrderedSame) {
            return @(AWSEC2ImageAttributeNameLaunchPermission);
        }
        if ([value caseInsensitiveCompare:@"productCodes"] == NSOrderedSame) {
            return @(AWSEC2ImageAttributeNameProductCodes);
        }
        if ([value caseInsensitiveCompare:@"blockDeviceMapping"] == NSOrderedSame) {
            return @(AWSEC2ImageAttributeNameBlockDeviceMapping);
        }
        if ([value caseInsensitiveCompare:@"sriovNetSupport"] == NSOrderedSame) {
            return @(AWSEC2ImageAttributeNameSriovNetSupport);
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
            case AWSEC2ImageAttributeNameSriovNetSupport:
                return @"sriovNetSupport";
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeImagesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"images" : @"Images",
             };
}

+ (NSValueTransformer *)imagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Image class]];
}

@end

@implementation AWSEC2DescribeImportImageTasksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"importTaskIds" : @"ImportTaskIds",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeImportImageTasksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importImageTasks" : @"ImportImageTasks",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)importImageTasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ImportImageTask class]];
}

@end

@implementation AWSEC2DescribeImportSnapshotTasksRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"importTaskIds" : @"ImportTaskIds",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeImportSnapshotTasksResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importSnapshotTasks" : @"ImportSnapshotTasks",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)importSnapshotTasksJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ImportSnapshotTask class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"instanceType"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameInstanceType);
        }
        if ([value caseInsensitiveCompare:@"kernel"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameKernel);
        }
        if ([value caseInsensitiveCompare:@"ramdisk"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameRAMDisk);
        }
        if ([value caseInsensitiveCompare:@"userData"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameUserData);
        }
        if ([value caseInsensitiveCompare:@"disableApiTermination"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameDisableApiTermination);
        }
        if ([value caseInsensitiveCompare:@"instanceInitiatedShutdownBehavior"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameInstanceInitiatedShutdownBehavior);
        }
        if ([value caseInsensitiveCompare:@"rootDeviceName"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameRootDeviceName);
        }
        if ([value caseInsensitiveCompare:@"blockDeviceMapping"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameBlockDeviceMapping);
        }
        if ([value caseInsensitiveCompare:@"productCodes"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameProductCodes);
        }
        if ([value caseInsensitiveCompare:@"sourceDestCheck"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameSourceDestCheck);
        }
        if ([value caseInsensitiveCompare:@"groupSet"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameGroupSet);
        }
        if ([value caseInsensitiveCompare:@"ebsOptimized"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameEBSOptimized);
        }
        if ([value caseInsensitiveCompare:@"sriovNetSupport"] == NSOrderedSame) {
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceStatus class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Reservation class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeInternetGatewaysResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"internetGateways" : @"InternetGateways",
             };
}

+ (NSValueTransformer *)internetGatewaysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InternetGateway class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeKeyPairsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keyPairs" : @"KeyPairs",
             };
}

+ (NSValueTransformer *)keyPairsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2KeyPairInfo class]];
}

@end

@implementation AWSEC2DescribeMovingAddressesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"publicIps" : @"PublicIps",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeMovingAddressesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"movingAddressStatuses" : @"MovingAddressStatuses",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)movingAddressStatusesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2MovingAddressStatus class]];
}

@end

@implementation AWSEC2DescribeNatGatewaysRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filter" : @"Filter",
             @"maxResults" : @"MaxResults",
             @"natGatewayIds" : @"NatGatewayIds",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)filterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeNatGatewaysResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"natGateways" : @"NatGateways",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)natGatewaysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2NatGateway class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeNetworkAclsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkAcls" : @"NetworkAcls",
             };
}

+ (NSValueTransformer *)networkAclsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2NetworkAcl class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"description"] == NSOrderedSame) {
            return @(AWSEC2NetworkInterfaceAttributeDescription);
        }
        if ([value caseInsensitiveCompare:@"groupSet"] == NSOrderedSame) {
            return @(AWSEC2NetworkInterfaceAttributeGroupSet);
        }
        if ([value caseInsensitiveCompare:@"sourceDestCheck"] == NSOrderedSame) {
            return @(AWSEC2NetworkInterfaceAttributeSourceDestCheck);
        }
        if ([value caseInsensitiveCompare:@"attachment"] == NSOrderedSame) {
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NetworkInterfaceAttachment class]];
}

+ (NSValueTransformer *)detailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

+ (NSValueTransformer *)sourceDestCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeNetworkInterfacesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"networkInterfaces" : @"NetworkInterfaces",
             };
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2NetworkInterface class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribePlacementGroupsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"placementGroups" : @"PlacementGroups",
             };
}

+ (NSValueTransformer *)placementGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2PlacementGroup class]];
}

@end

@implementation AWSEC2DescribePrefixListsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"prefixListIds" : @"PrefixListIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribePrefixListsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"prefixLists" : @"PrefixLists",
             };
}

+ (NSValueTransformer *)prefixListsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2PrefixList class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeRegionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"regions" : @"Regions",
             };
}

+ (NSValueTransformer *)regionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Region class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeReservedInstancesListingsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedInstancesListings" : @"ReservedInstancesListings",
             };
}

+ (NSValueTransformer *)reservedInstancesListingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesListing class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesModification class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

+ (NSValueTransformer *)instanceTenancyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"default"] == NSOrderedSame) {
            return @(AWSEC2TenancyDefault);
        }
        if ([value caseInsensitiveCompare:@"dedicated"] == NSOrderedSame) {
            return @(AWSEC2TenancyDedicated);
        }
        if ([value caseInsensitiveCompare:@"host"] == NSOrderedSame) {
            return @(AWSEC2TenancyHost);
        }
        return @(AWSEC2TenancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TenancyDefault:
                return @"default";
            case AWSEC2TenancyDedicated:
                return @"dedicated";
            case AWSEC2TenancyHost:
                return @"host";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"t1.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value caseInsensitiveCompare:@"m1.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value caseInsensitiveCompare:@"m1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value caseInsensitiveCompare:@"m1.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value caseInsensitiveCompare:@"m1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value caseInsensitiveCompare:@"m3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_large);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_10xlarge);
        }
        if ([value caseInsensitiveCompare:@"t2.nano"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_nano);
        }
        if ([value caseInsensitiveCompare:@"t2.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value caseInsensitiveCompare:@"t2.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value caseInsensitiveCompare:@"t2.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value caseInsensitiveCompare:@"t2.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_large);
        }
        if ([value caseInsensitiveCompare:@"m2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cr1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"hi1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"hs1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value caseInsensitiveCompare:@"c1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value caseInsensitiveCompare:@"c3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_large);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cg1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_8xlarge);
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
            case AWSEC2InstanceTypeM4_large:
                return @"m4.large";
            case AWSEC2InstanceTypeM4_xlarge:
                return @"m4.xlarge";
            case AWSEC2InstanceTypeM4_2xlarge:
                return @"m4.2xlarge";
            case AWSEC2InstanceTypeM4_4xlarge:
                return @"m4.4xlarge";
            case AWSEC2InstanceTypeM4_10xlarge:
                return @"m4.10xlarge";
            case AWSEC2InstanceTypeT2_nano:
                return @"t2.nano";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeT2_large:
                return @"t2.large";
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
            case AWSEC2InstanceTypeC4_large:
                return @"c4.large";
            case AWSEC2InstanceTypeC4_xlarge:
                return @"c4.xlarge";
            case AWSEC2InstanceTypeC4_2xlarge:
                return @"c4.2xlarge";
            case AWSEC2InstanceTypeC4_4xlarge:
                return @"c4.4xlarge";
            case AWSEC2InstanceTypeC4_8xlarge:
                return @"c4.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeG2_8xlarge:
                return @"g2.8xlarge";
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
            case AWSEC2InstanceTypeD2_xlarge:
                return @"d2.xlarge";
            case AWSEC2InstanceTypeD2_2xlarge:
                return @"d2.2xlarge";
            case AWSEC2InstanceTypeD2_4xlarge:
                return @"d2.4xlarge";
            case AWSEC2InstanceTypeD2_8xlarge:
                return @"d2.8xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Heavy Utilization"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesHeavyUtilization);
        }
        if ([value caseInsensitiveCompare:@"Medium Utilization"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesMediumUtilization);
        }
        if ([value caseInsensitiveCompare:@"Light Utilization"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesLightUtilization);
        }
        if ([value caseInsensitiveCompare:@"No Upfront"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesNoUpfront);
        }
        if ([value caseInsensitiveCompare:@"Partial Upfront"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesPartialUpfront);
        }
        if ([value caseInsensitiveCompare:@"All Upfront"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesAllUpfront);
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
            case AWSEC2OfferingTypeValuesNoUpfront:
                return @"No Upfront";
            case AWSEC2OfferingTypeValuesPartialUpfront:
                return @"Partial Upfront";
            case AWSEC2OfferingTypeValuesAllUpfront:
                return @"All Upfront";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)productDescriptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Linux/UNIX"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionLinuxUNIX);
        }
        if ([value caseInsensitiveCompare:@"Linux/UNIX (Amazon VPC)"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC);
        }
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionWindows);
        }
        if ([value caseInsensitiveCompare:@"Windows (Amazon VPC)"] == NSOrderedSame) {
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesOffering class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Heavy Utilization"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesHeavyUtilization);
        }
        if ([value caseInsensitiveCompare:@"Medium Utilization"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesMediumUtilization);
        }
        if ([value caseInsensitiveCompare:@"Light Utilization"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesLightUtilization);
        }
        if ([value caseInsensitiveCompare:@"No Upfront"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesNoUpfront);
        }
        if ([value caseInsensitiveCompare:@"Partial Upfront"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesPartialUpfront);
        }
        if ([value caseInsensitiveCompare:@"All Upfront"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesAllUpfront);
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
            case AWSEC2OfferingTypeValuesNoUpfront:
                return @"No Upfront";
            case AWSEC2OfferingTypeValuesPartialUpfront:
                return @"Partial Upfront";
            case AWSEC2OfferingTypeValuesAllUpfront:
                return @"All Upfront";
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstances class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeRouteTablesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"routeTables" : @"RouteTables",
             };
}

+ (NSValueTransformer *)routeTablesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2RouteTable class]];
}

@end

@implementation AWSEC2DescribeScheduledInstanceAvailabilityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"firstSlotStartTimeRange" : @"FirstSlotStartTimeRange",
             @"maxResults" : @"MaxResults",
             @"maxSlotDurationInHours" : @"MaxSlotDurationInHours",
             @"minSlotDurationInHours" : @"MinSlotDurationInHours",
             @"nextToken" : @"NextToken",
             @"recurrence" : @"Recurrence",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

+ (NSValueTransformer *)firstSlotStartTimeRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SlotDateTimeRangeRequest class]];
}

+ (NSValueTransformer *)recurrenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ScheduledInstanceRecurrenceRequest class]];
}

@end

@implementation AWSEC2DescribeScheduledInstanceAvailabilityResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scheduledInstanceAvailabilitySet" : @"ScheduledInstanceAvailabilitySet",
             };
}

+ (NSValueTransformer *)scheduledInstanceAvailabilitySetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ScheduledInstanceAvailability class]];
}

@end

@implementation AWSEC2DescribeScheduledInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"scheduledInstanceIds" : @"ScheduledInstanceIds",
             @"slotStartTimeRange" : @"SlotStartTimeRange",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

+ (NSValueTransformer *)slotStartTimeRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SlotStartTimeRangeRequest class]];
}

@end

@implementation AWSEC2DescribeScheduledInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"scheduledInstanceSet" : @"ScheduledInstanceSet",
             };
}

+ (NSValueTransformer *)scheduledInstanceSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ScheduledInstance class]];
}

@end

@implementation AWSEC2DescribeSecurityGroupReferencesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"groupId" : @"GroupId",
             };
}

@end

@implementation AWSEC2DescribeSecurityGroupReferencesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupReferenceSet" : @"SecurityGroupReferenceSet",
             };
}

+ (NSValueTransformer *)securityGroupReferenceSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2SecurityGroupReference class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeSecurityGroupsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroups" : @"SecurityGroups",
             };
}

+ (NSValueTransformer *)securityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2SecurityGroup class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"productCodes"] == NSOrderedSame) {
            return @(AWSEC2SnapshotAttributeNameProductCodes);
        }
        if ([value caseInsensitiveCompare:@"createVolumePermission"] == NSOrderedSame) {
            return @(AWSEC2SnapshotAttributeNameCreateVolumePermission);
        }
        return @(AWSEC2SnapshotAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SnapshotAttributeNameProductCodes:
                return @"productCodes";
            case AWSEC2SnapshotAttributeNameCreateVolumePermission:
                return @"createVolumePermission";
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2CreateVolumePermission class]];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ProductCode class]];
}

@end

@implementation AWSEC2DescribeSnapshotsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"ownerIds" : @"OwnerIds",
             @"restorableByUserIds" : @"RestorableByUserIds",
             @"snapshotIds" : @"SnapshotIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeSnapshotsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"snapshots" : @"Snapshots",
             };
}

+ (NSValueTransformer *)snapshotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Snapshot class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotDatafeedSubscription class]];
}

@end

@implementation AWSEC2DescribeSpotFleetInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"spotFleetRequestId" : @"SpotFleetRequestId",
             };
}

@end

@implementation AWSEC2DescribeSpotFleetInstancesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activeInstances" : @"ActiveInstances",
             @"nextToken" : @"NextToken",
             @"spotFleetRequestId" : @"SpotFleetRequestId",
             };
}

+ (NSValueTransformer *)activeInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ActiveInstance class]];
}

@end

@implementation AWSEC2DescribeSpotFleetRequestHistoryRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"eventType" : @"EventType",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"spotFleetRequestId" : @"SpotFleetRequestId",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)eventTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"instanceChange"] == NSOrderedSame) {
            return @(AWSEC2EventTypeInstanceChange);
        }
        if ([value caseInsensitiveCompare:@"fleetRequestChange"] == NSOrderedSame) {
            return @(AWSEC2EventTypeFleetRequestChange);
        }
        if ([value caseInsensitiveCompare:@"error"] == NSOrderedSame) {
            return @(AWSEC2EventTypeError);
        }
        return @(AWSEC2EventTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2EventTypeInstanceChange:
                return @"instanceChange";
            case AWSEC2EventTypeFleetRequestChange:
                return @"fleetRequestChange";
            case AWSEC2EventTypeError:
                return @"error";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2DescribeSpotFleetRequestHistoryResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"historyRecords" : @"HistoryRecords",
             @"lastEvaluatedTime" : @"LastEvaluatedTime",
             @"nextToken" : @"NextToken",
             @"spotFleetRequestId" : @"SpotFleetRequestId",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)historyRecordsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2HistoryRecord class]];
}

+ (NSValueTransformer *)lastEvaluatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2DescribeSpotFleetRequestsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"spotFleetRequestIds" : @"SpotFleetRequestIds",
             };
}

@end

@implementation AWSEC2DescribeSpotFleetRequestsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"spotFleetRequestConfigs" : @"SpotFleetRequestConfigs",
             };
}

+ (NSValueTransformer *)spotFleetRequestConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2SpotFleetRequestConfig class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeSpotInstanceRequestsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spotInstanceRequests" : @"SpotInstanceRequests",
             };
}

+ (NSValueTransformer *)spotInstanceRequestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2SpotInstanceRequest class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2SpotPrice class]];
}

@end

@implementation AWSEC2DescribeStaleSecurityGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2DescribeStaleSecurityGroupsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"staleSecurityGroupSet" : @"StaleSecurityGroupSet",
             };
}

+ (NSValueTransformer *)staleSecurityGroupSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2StaleSecurityGroup class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeSubnetsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"subnets" : @"Subnets",
             };
}

+ (NSValueTransformer *)subnetsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Subnet class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2TagDescription class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"autoEnableIO"] == NSOrderedSame) {
            return @(AWSEC2VolumeAttributeNameAutoEnableIO);
        }
        if ([value caseInsensitiveCompare:@"productCodes"] == NSOrderedSame) {
            return @(AWSEC2VolumeAttributeNameProductCodes);
        }
        return @(AWSEC2VolumeAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VolumeAttributeNameAutoEnableIO:
                return @"autoEnableIO";
            case AWSEC2VolumeAttributeNameProductCodes:
                return @"productCodes";
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ProductCode class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2VolumeStatusItem class]];
}

@end

@implementation AWSEC2DescribeVolumesRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeVolumesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"volumes" : @"Volumes",
             };
}

+ (NSValueTransformer *)volumesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Volume class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"enableDnsSupport"] == NSOrderedSame) {
            return @(AWSEC2VpcAttributeNameEnableDNSSupport);
        }
        if ([value caseInsensitiveCompare:@"enableDnsHostnames"] == NSOrderedSame) {
            return @(AWSEC2VpcAttributeNameEnableDNSHostnames);
        }
        return @(AWSEC2VpcAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VpcAttributeNameEnableDNSSupport:
                return @"enableDnsSupport";
            case AWSEC2VpcAttributeNameEnableDNSHostnames:
                return @"enableDnsHostnames";
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)enableDnsSupportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

@end

@implementation AWSEC2DescribeVpcClassicLinkDnsSupportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"vpcIds" : @"VpcIds",
             };
}

@end

@implementation AWSEC2DescribeVpcClassicLinkDnsSupportResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"vpcs" : @"Vpcs",
             };
}

+ (NSValueTransformer *)vpcsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ClassicLinkDnsSupport class]];
}

@end

@implementation AWSEC2DescribeVpcClassicLinkRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"vpcIds" : @"VpcIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeVpcClassicLinkResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpcs" : @"Vpcs",
             };
}

+ (NSValueTransformer *)vpcsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2VpcClassicLink class]];
}

@end

@implementation AWSEC2DescribeVpcEndpointServicesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSEC2DescribeVpcEndpointServicesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"serviceNames" : @"ServiceNames",
             };
}

@end

@implementation AWSEC2DescribeVpcEndpointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"filters" : @"Filters",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"vpcEndpointIds" : @"VpcEndpointIds",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeVpcEndpointsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"vpcEndpoints" : @"VpcEndpoints",
             };
}

+ (NSValueTransformer *)vpcEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2VpcEndpoint class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeVpcPeeringConnectionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpcPeeringConnections" : @"VpcPeeringConnections",
             };
}

+ (NSValueTransformer *)vpcPeeringConnectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2VpcPeeringConnection class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeVpcsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpcs" : @"Vpcs",
             };
}

+ (NSValueTransformer *)vpcsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Vpc class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeVpnConnectionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpnConnections" : @"VpnConnections",
             };
}

+ (NSValueTransformer *)vpnConnectionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2VpnConnection class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Filter class]];
}

@end

@implementation AWSEC2DescribeVpnGatewaysResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpnGateways" : @"VpnGateways",
             };
}

+ (NSValueTransformer *)vpnGatewaysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2VpnGateway class]];
}

@end

@implementation AWSEC2DetachClassicLinkVpcRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"instanceId" : @"InstanceId",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2DetachClassicLinkVpcResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returned" : @"Return",
             };
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2AttributeValue class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2DhcpConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
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

@implementation AWSEC2DisableVpcClassicLinkDnsSupportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2DisableVpcClassicLinkDnsSupportResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returned" : @"Return",
             };
}

@end

@implementation AWSEC2DisableVpcClassicLinkRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2DisableVpcClassicLinkResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returned" : @"Return",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2DiskImageDetail class]];
}

+ (NSValueTransformer *)volumeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VolumeDetail class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VMDK"] == NSOrderedSame) {
            return @(AWSEC2DiskImageFormatVMDK);
        }
        if ([value caseInsensitiveCompare:@"RAW"] == NSOrderedSame) {
            return @(AWSEC2DiskImageFormatRAW);
        }
        if ([value caseInsensitiveCompare:@"VHD"] == NSOrderedSame) {
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VMDK"] == NSOrderedSame) {
            return @(AWSEC2DiskImageFormatVMDK);
        }
        if ([value caseInsensitiveCompare:@"RAW"] == NSOrderedSame) {
            return @(AWSEC2DiskImageFormatRAW);
        }
        if ([value caseInsensitiveCompare:@"VHD"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2DiskImageVolumeDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"standard"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"io1"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeIO1);
        }
        if ([value caseInsensitiveCompare:@"gp2"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeGp2);
        }
        if ([value caseInsensitiveCompare:@"sc1"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeSc1);
        }
        if ([value caseInsensitiveCompare:@"st1"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeSt1);
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
            case AWSEC2VolumeTypeSc1:
                return @"sc1";
            case AWSEC2VolumeTypeSt1:
                return @"st1";
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"attaching"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusAttaching);
        }
        if ([value caseInsensitiveCompare:@"attached"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusAttached);
        }
        if ([value caseInsensitiveCompare:@"detaching"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusDetaching);
        }
        if ([value caseInsensitiveCompare:@"detached"] == NSOrderedSame) {
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

@implementation AWSEC2EnableVpcClassicLinkDnsSupportRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2EnableVpcClassicLinkDnsSupportResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returned" : @"Return",
             };
}

@end

@implementation AWSEC2EnableVpcClassicLinkRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSEC2EnableVpcClassicLinkResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returned" : @"Return",
             };
}

@end

@implementation AWSEC2EventInformation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventDescription" : @"EventDescription",
             @"eventSubType" : @"EventSubType",
             @"instanceId" : @"InstanceId",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ExportToS3Task class]];
}

+ (NSValueTransformer *)instanceExportDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceExportDetails class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"active"] == NSOrderedSame) {
            return @(AWSEC2ExportTaskStateActive);
        }
        if ([value caseInsensitiveCompare:@"cancelling"] == NSOrderedSame) {
            return @(AWSEC2ExportTaskStateCancelling);
        }
        if ([value caseInsensitiveCompare:@"cancelled"] == NSOrderedSame) {
            return @(AWSEC2ExportTaskStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"completed"] == NSOrderedSame) {
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ova"] == NSOrderedSame) {
            return @(AWSEC2ContainerFormatOVA);
        }
        return @(AWSEC2ContainerFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ContainerFormatOVA:
                return @"ova";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)diskImageFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VMDK"] == NSOrderedSame) {
            return @(AWSEC2DiskImageFormatVMDK);
        }
        if ([value caseInsensitiveCompare:@"RAW"] == NSOrderedSame) {
            return @(AWSEC2DiskImageFormatRAW);
        }
        if ([value caseInsensitiveCompare:@"VHD"] == NSOrderedSame) {
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ova"] == NSOrderedSame) {
            return @(AWSEC2ContainerFormatOVA);
        }
        return @(AWSEC2ContainerFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ContainerFormatOVA:
                return @"ova";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)diskImageFormatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"VMDK"] == NSOrderedSame) {
            return @(AWSEC2DiskImageFormatVMDK);
        }
        if ([value caseInsensitiveCompare:@"RAW"] == NSOrderedSame) {
            return @(AWSEC2DiskImageFormatRAW);
        }
        if ([value caseInsensitiveCompare:@"VHD"] == NSOrderedSame) {
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

@implementation AWSEC2FlowLog

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTime" : @"CreationTime",
             @"deliverLogsErrorMessage" : @"DeliverLogsErrorMessage",
             @"deliverLogsPermissionArn" : @"DeliverLogsPermissionArn",
             @"deliverLogsStatus" : @"DeliverLogsStatus",
             @"flowLogId" : @"FlowLogId",
             @"flowLogStatus" : @"FlowLogStatus",
             @"logGroupName" : @"LogGroupName",
             @"resourceId" : @"ResourceId",
             @"trafficType" : @"TrafficType",
             };
}

+ (NSValueTransformer *)creationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)trafficTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACCEPT"] == NSOrderedSame) {
            return @(AWSEC2TrafficTypeAccept);
        }
        if ([value caseInsensitiveCompare:@"REJECT"] == NSOrderedSame) {
            return @(AWSEC2TrafficTypeReject);
        }
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSEC2TrafficTypeAll);
        }
        return @(AWSEC2TrafficTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TrafficTypeAccept:
                return @"ACCEPT";
            case AWSEC2TrafficTypeReject:
                return @"REJECT";
            case AWSEC2TrafficTypeAll:
                return @"ALL";
            default:
                return nil;
        }
    }];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
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

@implementation AWSEC2HistoryRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventInformation" : @"EventInformation",
             @"eventType" : @"EventType",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)eventInformationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2EventInformation class]];
}

+ (NSValueTransformer *)eventTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"instanceChange"] == NSOrderedSame) {
            return @(AWSEC2EventTypeInstanceChange);
        }
        if ([value caseInsensitiveCompare:@"fleetRequestChange"] == NSOrderedSame) {
            return @(AWSEC2EventTypeFleetRequestChange);
        }
        if ([value caseInsensitiveCompare:@"error"] == NSOrderedSame) {
            return @(AWSEC2EventTypeError);
        }
        return @(AWSEC2EventTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2EventTypeInstanceChange:
                return @"instanceChange";
            case AWSEC2EventTypeFleetRequestChange:
                return @"fleetRequestChange";
            case AWSEC2EventTypeError:
                return @"error";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2Host

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoPlacement" : @"AutoPlacement",
             @"availabilityZone" : @"AvailabilityZone",
             @"availableCapacity" : @"AvailableCapacity",
             @"clientToken" : @"ClientToken",
             @"hostId" : @"HostId",
             @"hostProperties" : @"HostProperties",
             @"hostReservationId" : @"HostReservationId",
             @"instances" : @"Instances",
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)autoPlacementJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"on"] == NSOrderedSame) {
            return @(AWSEC2AutoPlacementOn);
        }
        if ([value caseInsensitiveCompare:@"off"] == NSOrderedSame) {
            return @(AWSEC2AutoPlacementOff);
        }
        return @(AWSEC2AutoPlacementUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2AutoPlacementOn:
                return @"on";
            case AWSEC2AutoPlacementOff:
                return @"off";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)availableCapacityJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AvailableCapacity class]];
}

+ (NSValueTransformer *)hostPropertiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2HostProperties class]];
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2HostInstance class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSEC2AllocationStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"under-assessment"] == NSOrderedSame) {
            return @(AWSEC2AllocationStateUnderAssessment);
        }
        if ([value caseInsensitiveCompare:@"permanent-failure"] == NSOrderedSame) {
            return @(AWSEC2AllocationStatePermanentFailure);
        }
        if ([value caseInsensitiveCompare:@"released"] == NSOrderedSame) {
            return @(AWSEC2AllocationStateReleased);
        }
        if ([value caseInsensitiveCompare:@"released-permanent-failure"] == NSOrderedSame) {
            return @(AWSEC2AllocationStateReleasedPermanentFailure);
        }
        return @(AWSEC2AllocationStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2AllocationStateAvailable:
                return @"available";
            case AWSEC2AllocationStateUnderAssessment:
                return @"under-assessment";
            case AWSEC2AllocationStatePermanentFailure:
                return @"permanent-failure";
            case AWSEC2AllocationStateReleased:
                return @"released";
            case AWSEC2AllocationStateReleasedPermanentFailure:
                return @"released-permanent-failure";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2HostInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceId" : @"InstanceId",
             @"instanceType" : @"InstanceType",
             };
}

@end

@implementation AWSEC2HostProperties

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cores" : @"Cores",
             @"instanceType" : @"InstanceType",
             @"sockets" : @"Sockets",
             @"totalVCpus" : @"TotalVCpus",
             };
}

@end

@implementation AWSEC2IamInstanceProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
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
             @"types" : @"Type",
             };
}

@end

@implementation AWSEC2IdFormat

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deadline" : @"Deadline",
             @"resource" : @"Resource",
             @"useLongIds" : @"UseLongIds",
             };
}

+ (NSValueTransformer *)deadlineJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2Image

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"architecture" : @"Architecture",
             @"blockDeviceMappings" : @"BlockDeviceMappings",
             @"creationDate" : @"CreationDate",
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"i386"] == NSOrderedSame) {
            return @(AWSEC2ArchitectureValuesI386);
        }
        if ([value caseInsensitiveCompare:@"x86_64"] == NSOrderedSame) {
            return @(AWSEC2ArchitectureValuesX86_64);
        }
        return @(AWSEC2ArchitectureValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ArchitectureValuesI386:
                return @"i386";
            case AWSEC2ArchitectureValuesX86_64:
                return @"x86_64";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
}

+ (NSValueTransformer *)hypervisorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ovm"] == NSOrderedSame) {
            return @(AWSEC2HypervisorTypeOvm);
        }
        if ([value caseInsensitiveCompare:@"xen"] == NSOrderedSame) {
            return @(AWSEC2HypervisorTypeXen);
        }
        return @(AWSEC2HypervisorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2HypervisorTypeOvm:
                return @"ovm";
            case AWSEC2HypervisorTypeXen:
                return @"xen";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)imageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"machine"] == NSOrderedSame) {
            return @(AWSEC2ImageTypeValuesMachine);
        }
        if ([value caseInsensitiveCompare:@"kernel"] == NSOrderedSame) {
            return @(AWSEC2ImageTypeValuesKernel);
        }
        if ([value caseInsensitiveCompare:@"ramdisk"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSEC2PlatformValuesWindows);
        }
        return @(AWSEC2PlatformValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PlatformValuesWindows:
                return @"Windows";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ProductCode class]];
}

+ (NSValueTransformer *)rootDeviceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ebs"] == NSOrderedSame) {
            return @(AWSEC2DeviceTypeEBS);
        }
        if ([value caseInsensitiveCompare:@"instance-store"] == NSOrderedSame) {
            return @(AWSEC2DeviceTypeInstanceStore);
        }
        return @(AWSEC2DeviceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DeviceTypeEBS:
                return @"ebs";
            case AWSEC2DeviceTypeInstanceStore:
                return @"instance-store";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSEC2ImageStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSEC2ImageStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"invalid"] == NSOrderedSame) {
            return @(AWSEC2ImageStateInvalid);
        }
        if ([value caseInsensitiveCompare:@"deregistered"] == NSOrderedSame) {
            return @(AWSEC2ImageStateDeregistered);
        }
        if ([value caseInsensitiveCompare:@"transient"] == NSOrderedSame) {
            return @(AWSEC2ImageStateTransient);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSEC2ImageStateFailed);
        }
        if ([value caseInsensitiveCompare:@"error"] == NSOrderedSame) {
            return @(AWSEC2ImageStateError);
        }
        return @(AWSEC2ImageStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ImageStatePending:
                return @"pending";
            case AWSEC2ImageStateAvailable:
                return @"available";
            case AWSEC2ImageStateInvalid:
                return @"invalid";
            case AWSEC2ImageStateDeregistered:
                return @"deregistered";
            case AWSEC2ImageStateTransient:
                return @"transient";
            case AWSEC2ImageStateFailed:
                return @"failed";
            case AWSEC2ImageStateError:
                return @"error";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2StateReason class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

+ (NSValueTransformer *)virtualizationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"hvm"] == NSOrderedSame) {
            return @(AWSEC2VirtualizationTypeHVM);
        }
        if ([value caseInsensitiveCompare:@"paravirtual"] == NSOrderedSame) {
            return @(AWSEC2VirtualizationTypeParavirtual);
        }
        return @(AWSEC2VirtualizationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VirtualizationTypeHVM:
                return @"hvm";
            case AWSEC2VirtualizationTypeParavirtual:
                return @"paravirtual";
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
}

+ (NSValueTransformer *)detailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)kernelIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)launchPermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2LaunchPermission class]];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ProductCode class]];
}

+ (NSValueTransformer *)ramdiskIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)sriovNetSupportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

@end

@implementation AWSEC2ImageDiskContainer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"deviceName" : @"DeviceName",
             @"format" : @"Format",
             @"snapshotId" : @"SnapshotId",
             @"url" : @"Url",
             @"userBucket" : @"UserBucket",
             };
}

+ (NSValueTransformer *)userBucketJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2UserBucket class]];
}

@end

@implementation AWSEC2ImportImageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"architecture" : @"Architecture",
             @"clientData" : @"ClientData",
             @"clientToken" : @"ClientToken",
             @"detail" : @"Description",
             @"diskContainers" : @"DiskContainers",
             @"dryRun" : @"DryRun",
             @"hypervisor" : @"Hypervisor",
             @"licenseType" : @"LicenseType",
             @"platform" : @"Platform",
             @"roleName" : @"RoleName",
             };
}

+ (NSValueTransformer *)clientDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ClientData class]];
}

+ (NSValueTransformer *)diskContainersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ImageDiskContainer class]];
}

@end

@implementation AWSEC2ImportImageResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"architecture" : @"Architecture",
             @"detail" : @"Description",
             @"hypervisor" : @"Hypervisor",
             @"imageId" : @"ImageId",
             @"importTaskId" : @"ImportTaskId",
             @"licenseType" : @"LicenseType",
             @"platform" : @"Platform",
             @"progress" : @"Progress",
             @"snapshotDetails" : @"SnapshotDetails",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             };
}

+ (NSValueTransformer *)snapshotDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2SnapshotDetail class]];
}

@end

@implementation AWSEC2ImportImageTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"architecture" : @"Architecture",
             @"detail" : @"Description",
             @"hypervisor" : @"Hypervisor",
             @"imageId" : @"ImageId",
             @"importTaskId" : @"ImportTaskId",
             @"licenseType" : @"LicenseType",
             @"platform" : @"Platform",
             @"progress" : @"Progress",
             @"snapshotDetails" : @"SnapshotDetails",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             };
}

+ (NSValueTransformer *)snapshotDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2SnapshotDetail class]];
}

@end

@implementation AWSEC2ImportInstanceLaunchSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalInfo" : @"AdditionalInfo",
             @"architecture" : @"Architecture",
             @"groupIds" : @"GroupIds",
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"i386"] == NSOrderedSame) {
            return @(AWSEC2ArchitectureValuesI386);
        }
        if ([value caseInsensitiveCompare:@"x86_64"] == NSOrderedSame) {
            return @(AWSEC2ArchitectureValuesX86_64);
        }
        return @(AWSEC2ArchitectureValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ArchitectureValuesI386:
                return @"i386";
            case AWSEC2ArchitectureValuesX86_64:
                return @"x86_64";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceInitiatedShutdownBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"stop"] == NSOrderedSame) {
            return @(AWSEC2ShutdownBehaviorStop);
        }
        if ([value caseInsensitiveCompare:@"terminate"] == NSOrderedSame) {
            return @(AWSEC2ShutdownBehaviorTerminate);
        }
        return @(AWSEC2ShutdownBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ShutdownBehaviorStop:
                return @"stop";
            case AWSEC2ShutdownBehaviorTerminate:
                return @"terminate";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"t1.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value caseInsensitiveCompare:@"m1.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value caseInsensitiveCompare:@"m1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value caseInsensitiveCompare:@"m1.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value caseInsensitiveCompare:@"m1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value caseInsensitiveCompare:@"m3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_large);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_10xlarge);
        }
        if ([value caseInsensitiveCompare:@"t2.nano"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_nano);
        }
        if ([value caseInsensitiveCompare:@"t2.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value caseInsensitiveCompare:@"t2.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value caseInsensitiveCompare:@"t2.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value caseInsensitiveCompare:@"t2.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_large);
        }
        if ([value caseInsensitiveCompare:@"m2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cr1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"hi1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"hs1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value caseInsensitiveCompare:@"c1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value caseInsensitiveCompare:@"c3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_large);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cg1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_8xlarge);
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
            case AWSEC2InstanceTypeM4_large:
                return @"m4.large";
            case AWSEC2InstanceTypeM4_xlarge:
                return @"m4.xlarge";
            case AWSEC2InstanceTypeM4_2xlarge:
                return @"m4.2xlarge";
            case AWSEC2InstanceTypeM4_4xlarge:
                return @"m4.4xlarge";
            case AWSEC2InstanceTypeM4_10xlarge:
                return @"m4.10xlarge";
            case AWSEC2InstanceTypeT2_nano:
                return @"t2.nano";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeT2_large:
                return @"t2.large";
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
            case AWSEC2InstanceTypeC4_large:
                return @"c4.large";
            case AWSEC2InstanceTypeC4_xlarge:
                return @"c4.xlarge";
            case AWSEC2InstanceTypeC4_2xlarge:
                return @"c4.2xlarge";
            case AWSEC2InstanceTypeC4_4xlarge:
                return @"c4.4xlarge";
            case AWSEC2InstanceTypeC4_8xlarge:
                return @"c4.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeG2_8xlarge:
                return @"g2.8xlarge";
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
            case AWSEC2InstanceTypeD2_xlarge:
                return @"d2.xlarge";
            case AWSEC2InstanceTypeD2_2xlarge:
                return @"d2.2xlarge";
            case AWSEC2InstanceTypeD2_4xlarge:
                return @"d2.4xlarge";
            case AWSEC2InstanceTypeD2_8xlarge:
                return @"d2.8xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)placementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Placement class]];
}

+ (NSValueTransformer *)userDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2UserData class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2DiskImage class]];
}

+ (NSValueTransformer *)launchSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ImportInstanceLaunchSpecification class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSEC2PlatformValuesWindows);
        }
        return @(AWSEC2PlatformValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PlatformValuesWindows:
                return @"Windows";
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ConversionTask class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSEC2PlatformValuesWindows);
        }
        return @(AWSEC2PlatformValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PlatformValuesWindows:
                return @"Windows";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)volumesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ImportInstanceVolumeDetailItem class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2DiskImageDescription class]];
}

+ (NSValueTransformer *)volumeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2DiskImageVolumeDescription class]];
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

@implementation AWSEC2ImportSnapshotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientData" : @"ClientData",
             @"clientToken" : @"ClientToken",
             @"detail" : @"Description",
             @"diskContainer" : @"DiskContainer",
             @"dryRun" : @"DryRun",
             @"roleName" : @"RoleName",
             };
}

+ (NSValueTransformer *)clientDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ClientData class]];
}

+ (NSValueTransformer *)diskContainerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SnapshotDiskContainer class]];
}

@end

@implementation AWSEC2ImportSnapshotResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"importTaskId" : @"ImportTaskId",
             @"snapshotTaskDetail" : @"SnapshotTaskDetail",
             };
}

+ (NSValueTransformer *)snapshotTaskDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SnapshotTaskDetail class]];
}

@end

@implementation AWSEC2ImportSnapshotTask

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"importTaskId" : @"ImportTaskId",
             @"snapshotTaskDetail" : @"SnapshotTaskDetail",
             };
}

+ (NSValueTransformer *)snapshotTaskDetailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SnapshotTaskDetail class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2DiskImageDetail class]];
}

+ (NSValueTransformer *)volumeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VolumeDetail class]];
}

@end

@implementation AWSEC2ImportVolumeResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conversionTask" : @"ConversionTask",
             };
}

+ (NSValueTransformer *)conversionTaskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ConversionTask class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2DiskImageDescription class]];
}

+ (NSValueTransformer *)volumeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2DiskImageVolumeDescription class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"i386"] == NSOrderedSame) {
            return @(AWSEC2ArchitectureValuesI386);
        }
        if ([value caseInsensitiveCompare:@"x86_64"] == NSOrderedSame) {
            return @(AWSEC2ArchitectureValuesX86_64);
        }
        return @(AWSEC2ArchitectureValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ArchitectureValuesI386:
                return @"i386";
            case AWSEC2ArchitectureValuesX86_64:
                return @"x86_64";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceBlockDeviceMapping class]];
}

+ (NSValueTransformer *)hypervisorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ovm"] == NSOrderedSame) {
            return @(AWSEC2HypervisorTypeOvm);
        }
        if ([value caseInsensitiveCompare:@"xen"] == NSOrderedSame) {
            return @(AWSEC2HypervisorTypeXen);
        }
        return @(AWSEC2HypervisorTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2HypervisorTypeOvm:
                return @"ovm";
            case AWSEC2HypervisorTypeXen:
                return @"xen";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)iamInstanceProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IamInstanceProfile class]];
}

+ (NSValueTransformer *)instanceLifecycleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"spot"] == NSOrderedSame) {
            return @(AWSEC2InstanceLifecycleTypeSpot);
        }
        if ([value caseInsensitiveCompare:@"scheduled"] == NSOrderedSame) {
            return @(AWSEC2InstanceLifecycleTypeScheduled);
        }
        return @(AWSEC2InstanceLifecycleTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2InstanceLifecycleTypeSpot:
                return @"spot";
            case AWSEC2InstanceLifecycleTypeScheduled:
                return @"scheduled";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"t1.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value caseInsensitiveCompare:@"m1.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value caseInsensitiveCompare:@"m1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value caseInsensitiveCompare:@"m1.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value caseInsensitiveCompare:@"m1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value caseInsensitiveCompare:@"m3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_large);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_10xlarge);
        }
        if ([value caseInsensitiveCompare:@"t2.nano"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_nano);
        }
        if ([value caseInsensitiveCompare:@"t2.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value caseInsensitiveCompare:@"t2.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value caseInsensitiveCompare:@"t2.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value caseInsensitiveCompare:@"t2.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_large);
        }
        if ([value caseInsensitiveCompare:@"m2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cr1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"hi1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"hs1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value caseInsensitiveCompare:@"c1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value caseInsensitiveCompare:@"c3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_large);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cg1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_8xlarge);
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
            case AWSEC2InstanceTypeM4_large:
                return @"m4.large";
            case AWSEC2InstanceTypeM4_xlarge:
                return @"m4.xlarge";
            case AWSEC2InstanceTypeM4_2xlarge:
                return @"m4.2xlarge";
            case AWSEC2InstanceTypeM4_4xlarge:
                return @"m4.4xlarge";
            case AWSEC2InstanceTypeM4_10xlarge:
                return @"m4.10xlarge";
            case AWSEC2InstanceTypeT2_nano:
                return @"t2.nano";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeT2_large:
                return @"t2.large";
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
            case AWSEC2InstanceTypeC4_large:
                return @"c4.large";
            case AWSEC2InstanceTypeC4_xlarge:
                return @"c4.xlarge";
            case AWSEC2InstanceTypeC4_2xlarge:
                return @"c4.2xlarge";
            case AWSEC2InstanceTypeC4_4xlarge:
                return @"c4.4xlarge";
            case AWSEC2InstanceTypeC4_8xlarge:
                return @"c4.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeG2_8xlarge:
                return @"g2.8xlarge";
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
            case AWSEC2InstanceTypeD2_xlarge:
                return @"d2.xlarge";
            case AWSEC2InstanceTypeD2_2xlarge:
                return @"d2.2xlarge";
            case AWSEC2InstanceTypeD2_4xlarge:
                return @"d2.4xlarge";
            case AWSEC2InstanceTypeD2_8xlarge:
                return @"d2.8xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)launchTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)monitoringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Monitoring class]];
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceNetworkInterface class]];
}

+ (NSValueTransformer *)placementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Placement class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSEC2PlatformValuesWindows);
        }
        return @(AWSEC2PlatformValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PlatformValuesWindows:
                return @"Windows";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ProductCode class]];
}

+ (NSValueTransformer *)rootDeviceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ebs"] == NSOrderedSame) {
            return @(AWSEC2DeviceTypeEBS);
        }
        if ([value caseInsensitiveCompare:@"instance-store"] == NSOrderedSame) {
            return @(AWSEC2DeviceTypeInstanceStore);
        }
        return @(AWSEC2DeviceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DeviceTypeEBS:
                return @"ebs";
            case AWSEC2DeviceTypeInstanceStore:
                return @"instance-store";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)securityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceState class]];
}

+ (NSValueTransformer *)stateReasonJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2StateReason class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

+ (NSValueTransformer *)virtualizationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"hvm"] == NSOrderedSame) {
            return @(AWSEC2VirtualizationTypeHVM);
        }
        if ([value caseInsensitiveCompare:@"paravirtual"] == NSOrderedSame) {
            return @(AWSEC2VirtualizationTypeParavirtual);
        }
        return @(AWSEC2VirtualizationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VirtualizationTypeHVM:
                return @"hvm";
            case AWSEC2VirtualizationTypeParavirtual:
                return @"paravirtual";
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceBlockDeviceMapping class]];
}

+ (NSValueTransformer *)disableApiTerminationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)ebsOptimizedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

+ (NSValueTransformer *)instanceInitiatedShutdownBehaviorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)kernelIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)productCodesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ProductCode class]];
}

+ (NSValueTransformer *)ramdiskIdJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)rootDeviceNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)sourceDestCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)sriovNetSupportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)userDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2EbsInstanceBlockDevice class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2EbsInstanceBlockDeviceSpecification class]];
}

@end

@implementation AWSEC2InstanceCapacity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availableCapacity" : @"AvailableCapacity",
             @"instanceType" : @"InstanceType",
             @"totalCapacity" : @"TotalCapacity",
             };
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSEC2ListingStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"sold"] == NSOrderedSame) {
            return @(AWSEC2ListingStateSold);
        }
        if ([value caseInsensitiveCompare:@"cancelled"] == NSOrderedSame) {
            return @(AWSEC2ListingStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"citrix"] == NSOrderedSame) {
            return @(AWSEC2ExportEnvironmentCitrix);
        }
        if ([value caseInsensitiveCompare:@"vmware"] == NSOrderedSame) {
            return @(AWSEC2ExportEnvironmentVMware);
        }
        if ([value caseInsensitiveCompare:@"microsoft"] == NSOrderedSame) {
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Monitoring class]];
}

@end

@implementation AWSEC2InstanceNetworkInterface

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"association" : @"Association",
             @"attachment" : @"Attachment",
             @"detail" : @"Description",
             @"groups" : @"Groups",
             @"macAddress" : @"MacAddress",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceNetworkInterfaceAssociation class]];
}

+ (NSValueTransformer *)attachmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceNetworkInterfaceAttachment class]];
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

+ (NSValueTransformer *)privateIpAddressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstancePrivateIpAddress class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSEC2NetworkInterfaceStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"attaching"] == NSOrderedSame) {
            return @(AWSEC2NetworkInterfaceStatusAttaching);
        }
        if ([value caseInsensitiveCompare:@"in-use"] == NSOrderedSame) {
            return @(AWSEC2NetworkInterfaceStatusInUse);
        }
        if ([value caseInsensitiveCompare:@"detaching"] == NSOrderedSame) {
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"attaching"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusAttaching);
        }
        if ([value caseInsensitiveCompare:@"attached"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusAttached);
        }
        if ([value caseInsensitiveCompare:@"detaching"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusDetaching);
        }
        if ([value caseInsensitiveCompare:@"detached"] == NSOrderedSame) {
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2PrivateIpAddressSpecification class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceNetworkInterfaceAssociation class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSEC2InstanceStateNamePending);
        }
        if ([value caseInsensitiveCompare:@"running"] == NSOrderedSame) {
            return @(AWSEC2InstanceStateNameRunning);
        }
        if ([value caseInsensitiveCompare:@"shutting-down"] == NSOrderedSame) {
            return @(AWSEC2InstanceStateNameShuttingDown);
        }
        if ([value caseInsensitiveCompare:@"terminated"] == NSOrderedSame) {
            return @(AWSEC2InstanceStateNameTerminated);
        }
        if ([value caseInsensitiveCompare:@"stopping"] == NSOrderedSame) {
            return @(AWSEC2InstanceStateNameStopping);
        }
        if ([value caseInsensitiveCompare:@"stopped"] == NSOrderedSame) {
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceState class]];
}

+ (NSValueTransformer *)previousStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceState class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceStatusEvent class]];
}

+ (NSValueTransformer *)instanceStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceState class]];
}

+ (NSValueTransformer *)instanceStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceStatusSummary class]];
}

+ (NSValueTransformer *)systemStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2InstanceStatusSummary class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"reachability"] == NSOrderedSame) {
            return @(AWSEC2StatusNameReachability);
        }
        return @(AWSEC2StatusNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2StatusNameReachability:
                return @"reachability";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"passed"] == NSOrderedSame) {
            return @(AWSEC2StatusTypePassed);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSEC2StatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"insufficient-data"] == NSOrderedSame) {
            return @(AWSEC2StatusTypeInsufficientData);
        }
        if ([value caseInsensitiveCompare:@"initializing"] == NSOrderedSame) {
            return @(AWSEC2StatusTypeInitializing);
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
            case AWSEC2StatusTypeInitializing:
                return @"initializing";
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"instance-reboot"] == NSOrderedSame) {
            return @(AWSEC2EventCodeInstanceReboot);
        }
        if ([value caseInsensitiveCompare:@"system-reboot"] == NSOrderedSame) {
            return @(AWSEC2EventCodeSystemReboot);
        }
        if ([value caseInsensitiveCompare:@"system-maintenance"] == NSOrderedSame) {
            return @(AWSEC2EventCodeSystemMaintenance);
        }
        if ([value caseInsensitiveCompare:@"instance-retirement"] == NSOrderedSame) {
            return @(AWSEC2EventCodeInstanceRetirement);
        }
        if ([value caseInsensitiveCompare:@"instance-stop"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)notAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)notBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceStatusDetails class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ok"] == NSOrderedSame) {
            return @(AWSEC2SummaryStatusOK);
        }
        if ([value caseInsensitiveCompare:@"impaired"] == NSOrderedSame) {
            return @(AWSEC2SummaryStatusImpaired);
        }
        if ([value caseInsensitiveCompare:@"insufficient-data"] == NSOrderedSame) {
            return @(AWSEC2SummaryStatusInsufficientData);
        }
        if ([value caseInsensitiveCompare:@"not-applicable"] == NSOrderedSame) {
            return @(AWSEC2SummaryStatusNotApplicable);
        }
        if ([value caseInsensitiveCompare:@"initializing"] == NSOrderedSame) {
            return @(AWSEC2SummaryStatusInitializing);
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
            case AWSEC2SummaryStatusInitializing:
                return @"initializing";
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InternetGatewayAttachment class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"attaching"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusAttaching);
        }
        if ([value caseInsensitiveCompare:@"attached"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusAttached);
        }
        if ([value caseInsensitiveCompare:@"detaching"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusDetaching);
        }
        if ([value caseInsensitiveCompare:@"detached"] == NSOrderedSame) {
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
             @"prefixListIds" : @"PrefixListIds",
             @"toPort" : @"ToPort",
             @"userIdGroupPairs" : @"UserIdGroupPairs",
             };
}

+ (NSValueTransformer *)ipRangesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2IpRange class]];
}

+ (NSValueTransformer *)prefixListIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2PrefixListId class]];
}

+ (NSValueTransformer *)userIdGroupPairsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2UserIdGroupPair class]];
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

@implementation AWSEC2LaunchPermission

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"group" : @"Group",
             @"userId" : @"UserId",
             };
}

+ (NSValueTransformer *)groupJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"all"] == NSOrderedSame) {
            return @(AWSEC2PermissionGroupAll);
        }
        return @(AWSEC2PermissionGroupUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PermissionGroupAll:
                return @"all";
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2LaunchPermission class]];
}

+ (NSValueTransformer *)removeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2LaunchPermission class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
}

+ (NSValueTransformer *)iamInstanceProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IamInstanceProfileSpecification class]];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"t1.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value caseInsensitiveCompare:@"m1.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value caseInsensitiveCompare:@"m1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value caseInsensitiveCompare:@"m1.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value caseInsensitiveCompare:@"m1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value caseInsensitiveCompare:@"m3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_large);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_10xlarge);
        }
        if ([value caseInsensitiveCompare:@"t2.nano"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_nano);
        }
        if ([value caseInsensitiveCompare:@"t2.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value caseInsensitiveCompare:@"t2.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value caseInsensitiveCompare:@"t2.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value caseInsensitiveCompare:@"t2.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_large);
        }
        if ([value caseInsensitiveCompare:@"m2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cr1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"hi1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"hs1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value caseInsensitiveCompare:@"c1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value caseInsensitiveCompare:@"c3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_large);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cg1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_8xlarge);
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
            case AWSEC2InstanceTypeM4_large:
                return @"m4.large";
            case AWSEC2InstanceTypeM4_xlarge:
                return @"m4.xlarge";
            case AWSEC2InstanceTypeM4_2xlarge:
                return @"m4.2xlarge";
            case AWSEC2InstanceTypeM4_4xlarge:
                return @"m4.4xlarge";
            case AWSEC2InstanceTypeM4_10xlarge:
                return @"m4.10xlarge";
            case AWSEC2InstanceTypeT2_nano:
                return @"t2.nano";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeT2_large:
                return @"t2.large";
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
            case AWSEC2InstanceTypeC4_large:
                return @"c4.large";
            case AWSEC2InstanceTypeC4_xlarge:
                return @"c4.xlarge";
            case AWSEC2InstanceTypeC4_2xlarge:
                return @"c4.2xlarge";
            case AWSEC2InstanceTypeC4_4xlarge:
                return @"c4.4xlarge";
            case AWSEC2InstanceTypeC4_8xlarge:
                return @"c4.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeG2_8xlarge:
                return @"g2.8xlarge";
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
            case AWSEC2InstanceTypeD2_xlarge:
                return @"d2.xlarge";
            case AWSEC2InstanceTypeD2_2xlarge:
                return @"d2.2xlarge";
            case AWSEC2InstanceTypeD2_4xlarge:
                return @"d2.4xlarge";
            case AWSEC2InstanceTypeD2_8xlarge:
                return @"d2.8xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)monitoringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2RunInstancesMonitoringEnabled class]];
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceNetworkInterfaceSpecification class]];
}

+ (NSValueTransformer *)placementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotPlacement class]];
}

+ (NSValueTransformer *)securityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

@end

@implementation AWSEC2ModifyHostsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoPlacement" : @"AutoPlacement",
             @"hostIds" : @"HostIds",
             };
}

+ (NSValueTransformer *)autoPlacementJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"on"] == NSOrderedSame) {
            return @(AWSEC2AutoPlacementOn);
        }
        if ([value caseInsensitiveCompare:@"off"] == NSOrderedSame) {
            return @(AWSEC2AutoPlacementOff);
        }
        return @(AWSEC2AutoPlacementUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2AutoPlacementOn:
                return @"on";
            case AWSEC2AutoPlacementOff:
                return @"off";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ModifyHostsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"successful" : @"Successful",
             @"unsuccessful" : @"Unsuccessful",
             };
}

+ (NSValueTransformer *)unsuccessfulJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2UnsuccessfulItem class]];
}

@end

@implementation AWSEC2ModifyIdFormatRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resource" : @"Resource",
             @"useLongIds" : @"UseLongIds",
             };
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)launchPermissionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2LaunchPermissionModifications class]];
}

+ (NSValueTransformer *)operationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"add"] == NSOrderedSame) {
            return @(AWSEC2OperationTypeAdd);
        }
        if ([value caseInsensitiveCompare:@"remove"] == NSOrderedSame) {
            return @(AWSEC2OperationTypeRemove);
        }
        return @(AWSEC2OperationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2OperationTypeAdd:
                return @"add";
            case AWSEC2OperationTypeRemove:
                return @"remove";
            default:
                return nil;
        }
    }];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"instanceType"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameInstanceType);
        }
        if ([value caseInsensitiveCompare:@"kernel"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameKernel);
        }
        if ([value caseInsensitiveCompare:@"ramdisk"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameRAMDisk);
        }
        if ([value caseInsensitiveCompare:@"userData"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameUserData);
        }
        if ([value caseInsensitiveCompare:@"disableApiTermination"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameDisableApiTermination);
        }
        if ([value caseInsensitiveCompare:@"instanceInitiatedShutdownBehavior"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameInstanceInitiatedShutdownBehavior);
        }
        if ([value caseInsensitiveCompare:@"rootDeviceName"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameRootDeviceName);
        }
        if ([value caseInsensitiveCompare:@"blockDeviceMapping"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameBlockDeviceMapping);
        }
        if ([value caseInsensitiveCompare:@"productCodes"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameProductCodes);
        }
        if ([value caseInsensitiveCompare:@"sourceDestCheck"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameSourceDestCheck);
        }
        if ([value caseInsensitiveCompare:@"groupSet"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameGroupSet);
        }
        if ([value caseInsensitiveCompare:@"ebsOptimized"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameEBSOptimized);
        }
        if ([value caseInsensitiveCompare:@"sriovNetSupport"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceBlockDeviceMappingSpecification class]];
}

+ (NSValueTransformer *)disableApiTerminationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)ebsOptimizedJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)instanceInitiatedShutdownBehaviorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)kernelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)ramdiskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)sourceDestCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)sriovNetSupportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)userDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2BlobAttributeValue class]];
}

@end

@implementation AWSEC2ModifyInstancePlacementRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"affinity" : @"Affinity",
             @"hostId" : @"HostId",
             @"instanceId" : @"InstanceId",
             @"tenancy" : @"Tenancy",
             };
}

+ (NSValueTransformer *)affinityJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"default"] == NSOrderedSame) {
            return @(AWSEC2AffinityDefault);
        }
        if ([value caseInsensitiveCompare:@"host"] == NSOrderedSame) {
            return @(AWSEC2AffinityHost);
        }
        return @(AWSEC2AffinityUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2AffinityDefault:
                return @"default";
            case AWSEC2AffinityHost:
                return @"host";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tenancyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"dedicated"] == NSOrderedSame) {
            return @(AWSEC2HostTenancyDedicated);
        }
        if ([value caseInsensitiveCompare:@"host"] == NSOrderedSame) {
            return @(AWSEC2HostTenancyHost);
        }
        return @(AWSEC2HostTenancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2HostTenancyDedicated:
                return @"dedicated";
            case AWSEC2HostTenancyHost:
                return @"host";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ModifyInstancePlacementResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returned" : @"Return",
             };
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NetworkInterfaceAttachmentChanges class]];
}

+ (NSValueTransformer *)detailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeValue class]];
}

+ (NSValueTransformer *)sourceDestCheckJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesConfiguration class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"productCodes"] == NSOrderedSame) {
            return @(AWSEC2SnapshotAttributeNameProductCodes);
        }
        if ([value caseInsensitiveCompare:@"createVolumePermission"] == NSOrderedSame) {
            return @(AWSEC2SnapshotAttributeNameCreateVolumePermission);
        }
        return @(AWSEC2SnapshotAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SnapshotAttributeNameProductCodes:
                return @"productCodes";
            case AWSEC2SnapshotAttributeNameCreateVolumePermission:
                return @"createVolumePermission";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createVolumePermissionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2CreateVolumePermissionModifications class]];
}

+ (NSValueTransformer *)operationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"add"] == NSOrderedSame) {
            return @(AWSEC2OperationTypeAdd);
        }
        if ([value caseInsensitiveCompare:@"remove"] == NSOrderedSame) {
            return @(AWSEC2OperationTypeRemove);
        }
        return @(AWSEC2OperationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2OperationTypeAdd:
                return @"add";
            case AWSEC2OperationTypeRemove:
                return @"remove";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ModifySpotFleetRequestRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"excessCapacityTerminationPolicy" : @"ExcessCapacityTerminationPolicy",
             @"spotFleetRequestId" : @"SpotFleetRequestId",
             @"targetCapacity" : @"TargetCapacity",
             };
}

+ (NSValueTransformer *)excessCapacityTerminationPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"noTermination"] == NSOrderedSame) {
            return @(AWSEC2ExcessCapacityTerminationPolicyNoTermination);
        }
        if ([value caseInsensitiveCompare:@"default"] == NSOrderedSame) {
            return @(AWSEC2ExcessCapacityTerminationPolicyDefault);
        }
        return @(AWSEC2ExcessCapacityTerminationPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ExcessCapacityTerminationPolicyNoTermination:
                return @"noTermination";
            case AWSEC2ExcessCapacityTerminationPolicyDefault:
                return @"default";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2ModifySpotFleetRequestResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returned" : @"Return",
             };
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

+ (NSValueTransformer *)enableDnsSupportJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2AttributeBooleanValue class]];
}

@end

@implementation AWSEC2ModifyVpcEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addRouteTableIds" : @"AddRouteTableIds",
             @"dryRun" : @"DryRun",
             @"policyDocument" : @"PolicyDocument",
             @"removeRouteTableIds" : @"RemoveRouteTableIds",
             @"resetPolicy" : @"ResetPolicy",
             @"vpcEndpointId" : @"VpcEndpointId",
             };
}

@end

@implementation AWSEC2ModifyVpcEndpointResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"returned" : @"Return",
             };
}

@end

@implementation AWSEC2ModifyVpcPeeringConnectionOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accepterPeeringConnectionOptions" : @"AccepterPeeringConnectionOptions",
             @"dryRun" : @"DryRun",
             @"requesterPeeringConnectionOptions" : @"RequesterPeeringConnectionOptions",
             @"vpcPeeringConnectionId" : @"VpcPeeringConnectionId",
             };
}

+ (NSValueTransformer *)accepterPeeringConnectionOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2PeeringConnectionOptionsRequest class]];
}

+ (NSValueTransformer *)requesterPeeringConnectionOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2PeeringConnectionOptionsRequest class]];
}

@end

@implementation AWSEC2ModifyVpcPeeringConnectionOptionsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accepterPeeringConnectionOptions" : @"AccepterPeeringConnectionOptions",
             @"requesterPeeringConnectionOptions" : @"RequesterPeeringConnectionOptions",
             };
}

+ (NSValueTransformer *)accepterPeeringConnectionOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2PeeringConnectionOptions class]];
}

+ (NSValueTransformer *)requesterPeeringConnectionOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2PeeringConnectionOptions class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceMonitoring class]];
}

@end

@implementation AWSEC2Monitoring

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"disabled"] == NSOrderedSame) {
            return @(AWSEC2MonitoringStateDisabled);
        }
        if ([value caseInsensitiveCompare:@"disabling"] == NSOrderedSame) {
            return @(AWSEC2MonitoringStateDisabling);
        }
        if ([value caseInsensitiveCompare:@"enabled"] == NSOrderedSame) {
            return @(AWSEC2MonitoringStateEnabled);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSEC2MonitoringStatePending);
        }
        return @(AWSEC2MonitoringStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2MonitoringStateDisabled:
                return @"disabled";
            case AWSEC2MonitoringStateDisabling:
                return @"disabling";
            case AWSEC2MonitoringStateEnabled:
                return @"enabled";
            case AWSEC2MonitoringStatePending:
                return @"pending";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2MoveAddressToVpcRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"publicIp" : @"PublicIp",
             };
}

@end

@implementation AWSEC2MoveAddressToVpcResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocationId" : @"AllocationId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MoveInProgress"] == NSOrderedSame) {
            return @(AWSEC2StatusMoveInProgress);
        }
        if ([value caseInsensitiveCompare:@"InVpc"] == NSOrderedSame) {
            return @(AWSEC2StatusInVpc);
        }
        if ([value caseInsensitiveCompare:@"InClassic"] == NSOrderedSame) {
            return @(AWSEC2StatusInClassic);
        }
        return @(AWSEC2StatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2StatusMoveInProgress:
                return @"MoveInProgress";
            case AWSEC2StatusInVpc:
                return @"InVpc";
            case AWSEC2StatusInClassic:
                return @"InClassic";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2MovingAddressStatus

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"moveStatus" : @"MoveStatus",
             @"publicIp" : @"PublicIp",
             };
}

+ (NSValueTransformer *)moveStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"movingToVpc"] == NSOrderedSame) {
            return @(AWSEC2MoveStatusMovingToVpc);
        }
        if ([value caseInsensitiveCompare:@"restoringToClassic"] == NSOrderedSame) {
            return @(AWSEC2MoveStatusRestoringToClassic);
        }
        return @(AWSEC2MoveStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2MoveStatusMovingToVpc:
                return @"movingToVpc";
            case AWSEC2MoveStatusRestoringToClassic:
                return @"restoringToClassic";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2NatGateway

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"deleteTime" : @"DeleteTime",
             @"failureCode" : @"FailureCode",
             @"failureMessage" : @"FailureMessage",
             @"natGatewayAddresses" : @"NatGatewayAddresses",
             @"natGatewayId" : @"NatGatewayId",
             @"state" : @"State",
             @"subnetId" : @"SubnetId",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)deleteTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)natGatewayAddressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2NatGatewayAddress class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSEC2NatGatewayStatePending);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSEC2NatGatewayStateFailed);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSEC2NatGatewayStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSEC2NatGatewayStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSEC2NatGatewayStateDeleted);
        }
        return @(AWSEC2NatGatewayStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2NatGatewayStatePending:
                return @"pending";
            case AWSEC2NatGatewayStateFailed:
                return @"failed";
            case AWSEC2NatGatewayStateAvailable:
                return @"available";
            case AWSEC2NatGatewayStateDeleting:
                return @"deleting";
            case AWSEC2NatGatewayStateDeleted:
                return @"deleted";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2NatGatewayAddress

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocationId" : @"AllocationId",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"privateIp" : @"PrivateIp",
             @"publicIp" : @"PublicIp",
             };
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2NetworkAclAssociation class]];
}

+ (NSValueTransformer *)entriesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2NetworkAclEntry class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
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
             @"protocols" : @"Protocol",
             @"ruleAction" : @"RuleAction",
             @"ruleNumber" : @"RuleNumber",
             };
}

+ (NSValueTransformer *)icmpTypeCodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IcmpTypeCode class]];
}

+ (NSValueTransformer *)portRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2PortRange class]];
}

+ (NSValueTransformer *)ruleActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"allow"] == NSOrderedSame) {
            return @(AWSEC2RuleActionAllow);
        }
        if ([value caseInsensitiveCompare:@"deny"] == NSOrderedSame) {
            return @(AWSEC2RuleActionDeny);
        }
        return @(AWSEC2RuleActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RuleActionAllow:
                return @"allow";
            case AWSEC2RuleActionDeny:
                return @"deny";
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
             @"interfaceType" : @"InterfaceType",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NetworkInterfaceAssociation class]];
}

+ (NSValueTransformer *)attachmentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NetworkInterfaceAttachment class]];
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

+ (NSValueTransformer *)interfaceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"interface"] == NSOrderedSame) {
            return @(AWSEC2NetworkInterfaceTypeInterface);
        }
        if ([value caseInsensitiveCompare:@"natGateway"] == NSOrderedSame) {
            return @(AWSEC2NetworkInterfaceTypeNatGateway);
        }
        return @(AWSEC2NetworkInterfaceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2NetworkInterfaceTypeInterface:
                return @"interface";
            case AWSEC2NetworkInterfaceTypeNatGateway:
                return @"natGateway";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)privateIpAddressesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2NetworkInterfacePrivateIpAddress class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSEC2NetworkInterfaceStatusAvailable);
        }
        if ([value caseInsensitiveCompare:@"attaching"] == NSOrderedSame) {
            return @(AWSEC2NetworkInterfaceStatusAttaching);
        }
        if ([value caseInsensitiveCompare:@"in-use"] == NSOrderedSame) {
            return @(AWSEC2NetworkInterfaceStatusInUse);
        }
        if ([value caseInsensitiveCompare:@"detaching"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"attaching"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusAttaching);
        }
        if ([value caseInsensitiveCompare:@"attached"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusAttached);
        }
        if ([value caseInsensitiveCompare:@"detaching"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusDetaching);
        }
        if ([value caseInsensitiveCompare:@"detached"] == NSOrderedSame) {
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2NetworkInterfaceAssociation class]];
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

@implementation AWSEC2PeeringConnectionOptions

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowEgressFromLocalClassicLinkToRemoteVpc" : @"AllowEgressFromLocalClassicLinkToRemoteVpc",
             @"allowEgressFromLocalVpcToRemoteClassicLink" : @"AllowEgressFromLocalVpcToRemoteClassicLink",
             };
}

@end

@implementation AWSEC2PeeringConnectionOptionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowEgressFromLocalClassicLinkToRemoteVpc" : @"AllowEgressFromLocalClassicLinkToRemoteVpc",
             @"allowEgressFromLocalVpcToRemoteClassicLink" : @"AllowEgressFromLocalVpcToRemoteClassicLink",
             };
}

@end

@implementation AWSEC2Placement

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"affinity" : @"Affinity",
             @"availabilityZone" : @"AvailabilityZone",
             @"groupName" : @"GroupName",
             @"hostId" : @"HostId",
             @"tenancy" : @"Tenancy",
             };
}

+ (NSValueTransformer *)tenancyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"default"] == NSOrderedSame) {
            return @(AWSEC2TenancyDefault);
        }
        if ([value caseInsensitiveCompare:@"dedicated"] == NSOrderedSame) {
            return @(AWSEC2TenancyDedicated);
        }
        if ([value caseInsensitiveCompare:@"host"] == NSOrderedSame) {
            return @(AWSEC2TenancyHost);
        }
        return @(AWSEC2TenancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TenancyDefault:
                return @"default";
            case AWSEC2TenancyDedicated:
                return @"dedicated";
            case AWSEC2TenancyHost:
                return @"host";
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSEC2PlacementGroupStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSEC2PlacementGroupStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSEC2PlacementGroupStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)strategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"cluster"] == NSOrderedSame) {
            return @(AWSEC2PlacementStrategyCluster);
        }
        return @(AWSEC2PlacementStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2PlacementStrategyCluster:
                return @"cluster";
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

@implementation AWSEC2PrefixList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrs" : @"Cidrs",
             @"prefixListId" : @"PrefixListId",
             @"prefixListName" : @"PrefixListName",
             };
}

@end

@implementation AWSEC2PrefixListId

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"prefixListId" : @"PrefixListId",
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USD"] == NSOrderedSame) {
            return @(AWSEC2CurrencyCodeValuesUSD);
        }
        return @(AWSEC2CurrencyCodeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2CurrencyCodeValuesUSD:
                return @"USD";
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USD"] == NSOrderedSame) {
            return @(AWSEC2CurrencyCodeValuesUSD);
        }
        return @(AWSEC2CurrencyCodeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2CurrencyCodeValuesUSD:
                return @"USD";
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"devpay"] == NSOrderedSame) {
            return @(AWSEC2ProductCodeValuesDevpay);
        }
        if ([value caseInsensitiveCompare:@"marketplace"] == NSOrderedSame) {
            return @(AWSEC2ProductCodeValuesMarketplace);
        }
        return @(AWSEC2ProductCodeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ProductCodeValuesDevpay:
                return @"devpay";
            case AWSEC2ProductCodeValuesMarketplace:
                return @"marketplace";
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

@implementation AWSEC2PurchaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceCount" : @"InstanceCount",
             @"purchaseToken" : @"PurchaseToken",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ReservedInstanceLimitPrice class]];
}

@end

@implementation AWSEC2PurchaseReservedInstancesOfferingResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"reservedInstancesId" : @"ReservedInstancesId",
             };
}

@end

@implementation AWSEC2PurchaseScheduledInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"dryRun" : @"DryRun",
             @"purchaseRequests" : @"PurchaseRequests",
             };
}

+ (NSValueTransformer *)purchaseRequestsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2PurchaseRequest class]];
}

@end

@implementation AWSEC2PurchaseScheduledInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scheduledInstanceSet" : @"ScheduledInstanceSet",
             };
}

+ (NSValueTransformer *)scheduledInstanceSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ScheduledInstance class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Hourly"] == NSOrderedSame) {
            return @(AWSEC2RecurringChargeFrequencyHourly);
        }
        return @(AWSEC2RecurringChargeFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RecurringChargeFrequencyHourly:
                return @"Hourly";
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"i386"] == NSOrderedSame) {
            return @(AWSEC2ArchitectureValuesI386);
        }
        if ([value caseInsensitiveCompare:@"x86_64"] == NSOrderedSame) {
            return @(AWSEC2ArchitectureValuesX86_64);
        }
        return @(AWSEC2ArchitectureValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ArchitectureValuesI386:
                return @"i386";
            case AWSEC2ArchitectureValuesX86_64:
                return @"x86_64";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
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

@implementation AWSEC2ReleaseHostsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"hostIds" : @"HostIds",
             };
}

@end

@implementation AWSEC2ReleaseHostsResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"successful" : @"Successful",
             @"unsuccessful" : @"Unsuccessful",
             };
}

+ (NSValueTransformer *)unsuccessfulJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2UnsuccessfulItem class]];
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
             @"protocols" : @"Protocol",
             @"ruleAction" : @"RuleAction",
             @"ruleNumber" : @"RuleNumber",
             };
}

+ (NSValueTransformer *)icmpTypeCodeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IcmpTypeCode class]];
}

+ (NSValueTransformer *)portRangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2PortRange class]];
}

+ (NSValueTransformer *)ruleActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"allow"] == NSOrderedSame) {
            return @(AWSEC2RuleActionAllow);
        }
        if ([value caseInsensitiveCompare:@"deny"] == NSOrderedSame) {
            return @(AWSEC2RuleActionDeny);
        }
        return @(AWSEC2RuleActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RuleActionAllow:
                return @"allow";
            case AWSEC2RuleActionDeny:
                return @"deny";
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
             @"natGatewayId" : @"NatGatewayId",
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ok"] == NSOrderedSame) {
            return @(AWSEC2ReportStatusTypeOK);
        }
        if ([value caseInsensitiveCompare:@"impaired"] == NSOrderedSame) {
            return @(AWSEC2ReportStatusTypeImpaired);
        }
        return @(AWSEC2ReportStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ReportStatusTypeOK:
                return @"ok";
            case AWSEC2ReportStatusTypeImpaired:
                return @"impaired";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2RequestSpotFleetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"spotFleetRequestConfig" : @"SpotFleetRequestConfig",
             };
}

+ (NSValueTransformer *)spotFleetRequestConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotFleetRequestConfigData class]];
}

@end

@implementation AWSEC2RequestSpotFleetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"spotFleetRequestId" : @"SpotFleetRequestId",
             };
}

@end

@implementation AWSEC2RequestSpotInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZoneGroup" : @"AvailabilityZoneGroup",
             @"blockDurationMinutes" : @"BlockDurationMinutes",
             @"clientToken" : @"ClientToken",
             @"dryRun" : @"DryRun",
             @"instanceCount" : @"InstanceCount",
             @"launchGroup" : @"LaunchGroup",
             @"launchSpecification" : @"LaunchSpecification",
             @"spotPrice" : @"SpotPrice",
             @"types" : @"Type",
             @"validFrom" : @"ValidFrom",
             @"validUntil" : @"ValidUntil",
             };
}

+ (NSValueTransformer *)launchSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2RequestSpotLaunchSpecification class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"one-time"] == NSOrderedSame) {
            return @(AWSEC2SpotInstanceTypeOneTime);
        }
        if ([value caseInsensitiveCompare:@"persistent"] == NSOrderedSame) {
            return @(AWSEC2SpotInstanceTypePersistent);
        }
        return @(AWSEC2SpotInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SpotInstanceTypeOneTime:
                return @"one-time";
            case AWSEC2SpotInstanceTypePersistent:
                return @"persistent";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)validFromJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)validUntilJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2SpotInstanceRequest class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
}

+ (NSValueTransformer *)iamInstanceProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IamInstanceProfileSpecification class]];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"t1.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value caseInsensitiveCompare:@"m1.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value caseInsensitiveCompare:@"m1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value caseInsensitiveCompare:@"m1.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value caseInsensitiveCompare:@"m1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value caseInsensitiveCompare:@"m3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_large);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_10xlarge);
        }
        if ([value caseInsensitiveCompare:@"t2.nano"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_nano);
        }
        if ([value caseInsensitiveCompare:@"t2.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value caseInsensitiveCompare:@"t2.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value caseInsensitiveCompare:@"t2.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value caseInsensitiveCompare:@"t2.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_large);
        }
        if ([value caseInsensitiveCompare:@"m2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cr1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"hi1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"hs1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value caseInsensitiveCompare:@"c1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value caseInsensitiveCompare:@"c3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_large);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cg1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_8xlarge);
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
            case AWSEC2InstanceTypeM4_large:
                return @"m4.large";
            case AWSEC2InstanceTypeM4_xlarge:
                return @"m4.xlarge";
            case AWSEC2InstanceTypeM4_2xlarge:
                return @"m4.2xlarge";
            case AWSEC2InstanceTypeM4_4xlarge:
                return @"m4.4xlarge";
            case AWSEC2InstanceTypeM4_10xlarge:
                return @"m4.10xlarge";
            case AWSEC2InstanceTypeT2_nano:
                return @"t2.nano";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeT2_large:
                return @"t2.large";
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
            case AWSEC2InstanceTypeC4_large:
                return @"c4.large";
            case AWSEC2InstanceTypeC4_xlarge:
                return @"c4.xlarge";
            case AWSEC2InstanceTypeC4_2xlarge:
                return @"c4.2xlarge";
            case AWSEC2InstanceTypeC4_4xlarge:
                return @"c4.4xlarge";
            case AWSEC2InstanceTypeC4_8xlarge:
                return @"c4.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeG2_8xlarge:
                return @"g2.8xlarge";
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
            case AWSEC2InstanceTypeD2_xlarge:
                return @"d2.xlarge";
            case AWSEC2InstanceTypeD2_2xlarge:
                return @"d2.2xlarge";
            case AWSEC2InstanceTypeD2_4xlarge:
                return @"d2.4xlarge";
            case AWSEC2InstanceTypeD2_8xlarge:
                return @"d2.8xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)monitoringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2RunInstancesMonitoringEnabled class]];
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceNetworkInterfaceSpecification class]];
}

+ (NSValueTransformer *)placementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotPlacement class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

+ (NSValueTransformer *)instancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Instance class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USD"] == NSOrderedSame) {
            return @(AWSEC2CurrencyCodeValuesUSD);
        }
        return @(AWSEC2CurrencyCodeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2CurrencyCodeValuesUSD:
                return @"USD";
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USD"] == NSOrderedSame) {
            return @(AWSEC2CurrencyCodeValuesUSD);
        }
        return @(AWSEC2CurrencyCodeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2CurrencyCodeValuesUSD:
                return @"USD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)endJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)instanceTenancyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"default"] == NSOrderedSame) {
            return @(AWSEC2TenancyDefault);
        }
        if ([value caseInsensitiveCompare:@"dedicated"] == NSOrderedSame) {
            return @(AWSEC2TenancyDedicated);
        }
        if ([value caseInsensitiveCompare:@"host"] == NSOrderedSame) {
            return @(AWSEC2TenancyHost);
        }
        return @(AWSEC2TenancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TenancyDefault:
                return @"default";
            case AWSEC2TenancyDedicated:
                return @"dedicated";
            case AWSEC2TenancyHost:
                return @"host";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"t1.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value caseInsensitiveCompare:@"m1.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value caseInsensitiveCompare:@"m1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value caseInsensitiveCompare:@"m1.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value caseInsensitiveCompare:@"m1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value caseInsensitiveCompare:@"m3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_large);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_10xlarge);
        }
        if ([value caseInsensitiveCompare:@"t2.nano"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_nano);
        }
        if ([value caseInsensitiveCompare:@"t2.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value caseInsensitiveCompare:@"t2.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value caseInsensitiveCompare:@"t2.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value caseInsensitiveCompare:@"t2.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_large);
        }
        if ([value caseInsensitiveCompare:@"m2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cr1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"hi1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"hs1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value caseInsensitiveCompare:@"c1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value caseInsensitiveCompare:@"c3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_large);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cg1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_8xlarge);
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
            case AWSEC2InstanceTypeM4_large:
                return @"m4.large";
            case AWSEC2InstanceTypeM4_xlarge:
                return @"m4.xlarge";
            case AWSEC2InstanceTypeM4_2xlarge:
                return @"m4.2xlarge";
            case AWSEC2InstanceTypeM4_4xlarge:
                return @"m4.4xlarge";
            case AWSEC2InstanceTypeM4_10xlarge:
                return @"m4.10xlarge";
            case AWSEC2InstanceTypeT2_nano:
                return @"t2.nano";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeT2_large:
                return @"t2.large";
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
            case AWSEC2InstanceTypeC4_large:
                return @"c4.large";
            case AWSEC2InstanceTypeC4_xlarge:
                return @"c4.xlarge";
            case AWSEC2InstanceTypeC4_2xlarge:
                return @"c4.2xlarge";
            case AWSEC2InstanceTypeC4_4xlarge:
                return @"c4.4xlarge";
            case AWSEC2InstanceTypeC4_8xlarge:
                return @"c4.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeG2_8xlarge:
                return @"g2.8xlarge";
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
            case AWSEC2InstanceTypeD2_xlarge:
                return @"d2.xlarge";
            case AWSEC2InstanceTypeD2_2xlarge:
                return @"d2.2xlarge";
            case AWSEC2InstanceTypeD2_4xlarge:
                return @"d2.4xlarge";
            case AWSEC2InstanceTypeD2_8xlarge:
                return @"d2.8xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Heavy Utilization"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesHeavyUtilization);
        }
        if ([value caseInsensitiveCompare:@"Medium Utilization"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesMediumUtilization);
        }
        if ([value caseInsensitiveCompare:@"Light Utilization"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesLightUtilization);
        }
        if ([value caseInsensitiveCompare:@"No Upfront"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesNoUpfront);
        }
        if ([value caseInsensitiveCompare:@"Partial Upfront"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesPartialUpfront);
        }
        if ([value caseInsensitiveCompare:@"All Upfront"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesAllUpfront);
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
            case AWSEC2OfferingTypeValuesNoUpfront:
                return @"No Upfront";
            case AWSEC2OfferingTypeValuesPartialUpfront:
                return @"Partial Upfront";
            case AWSEC2OfferingTypeValuesAllUpfront:
                return @"All Upfront";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)productDescriptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Linux/UNIX"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionLinuxUNIX);
        }
        if ([value caseInsensitiveCompare:@"Linux/UNIX (Amazon VPC)"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC);
        }
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionWindows);
        }
        if ([value caseInsensitiveCompare:@"Windows (Amazon VPC)"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recurringChargesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2RecurringCharge class]];
}

+ (NSValueTransformer *)startJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"payment-pending"] == NSOrderedSame) {
            return @(AWSEC2ReservedInstanceStatePaymentPending);
        }
        if ([value caseInsensitiveCompare:@"active"] == NSOrderedSame) {
            return @(AWSEC2ReservedInstanceStateActive);
        }
        if ([value caseInsensitiveCompare:@"payment-failed"] == NSOrderedSame) {
            return @(AWSEC2ReservedInstanceStatePaymentFailed);
        }
        if ([value caseInsensitiveCompare:@"retired"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"t1.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value caseInsensitiveCompare:@"m1.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value caseInsensitiveCompare:@"m1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value caseInsensitiveCompare:@"m1.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value caseInsensitiveCompare:@"m1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value caseInsensitiveCompare:@"m3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_large);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_10xlarge);
        }
        if ([value caseInsensitiveCompare:@"t2.nano"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_nano);
        }
        if ([value caseInsensitiveCompare:@"t2.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value caseInsensitiveCompare:@"t2.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value caseInsensitiveCompare:@"t2.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value caseInsensitiveCompare:@"t2.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_large);
        }
        if ([value caseInsensitiveCompare:@"m2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cr1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"hi1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"hs1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value caseInsensitiveCompare:@"c1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value caseInsensitiveCompare:@"c3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_large);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cg1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_8xlarge);
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
            case AWSEC2InstanceTypeM4_large:
                return @"m4.large";
            case AWSEC2InstanceTypeM4_xlarge:
                return @"m4.xlarge";
            case AWSEC2InstanceTypeM4_2xlarge:
                return @"m4.2xlarge";
            case AWSEC2InstanceTypeM4_4xlarge:
                return @"m4.4xlarge";
            case AWSEC2InstanceTypeM4_10xlarge:
                return @"m4.10xlarge";
            case AWSEC2InstanceTypeT2_nano:
                return @"t2.nano";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeT2_large:
                return @"t2.large";
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
            case AWSEC2InstanceTypeC4_large:
                return @"c4.large";
            case AWSEC2InstanceTypeC4_xlarge:
                return @"c4.xlarge";
            case AWSEC2InstanceTypeC4_2xlarge:
                return @"c4.2xlarge";
            case AWSEC2InstanceTypeC4_4xlarge:
                return @"c4.4xlarge";
            case AWSEC2InstanceTypeC4_8xlarge:
                return @"c4.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeG2_8xlarge:
                return @"g2.8xlarge";
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
            case AWSEC2InstanceTypeD2_xlarge:
                return @"d2.xlarge";
            case AWSEC2InstanceTypeD2_2xlarge:
                return @"d2.2xlarge";
            case AWSEC2InstanceTypeD2_4xlarge:
                return @"d2.4xlarge";
            case AWSEC2InstanceTypeD2_8xlarge:
                return @"d2.8xlarge";
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)instanceCountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceCount class]];
}

+ (NSValueTransformer *)priceSchedulesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2PriceSchedule class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"active"] == NSOrderedSame) {
            return @(AWSEC2ListingStatusActive);
        }
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSEC2ListingStatusPending);
        }
        if ([value caseInsensitiveCompare:@"cancelled"] == NSOrderedSame) {
            return @(AWSEC2ListingStatusCancelled);
        }
        if ([value caseInsensitiveCompare:@"closed"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

+ (NSValueTransformer *)updateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)effectiveDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)modificationResultsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesModificationResult class]];
}

+ (NSValueTransformer *)reservedInstancesIdsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ReservedInstancesId class]];
}

+ (NSValueTransformer *)updateDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ReservedInstancesConfiguration class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USD"] == NSOrderedSame) {
            return @(AWSEC2CurrencyCodeValuesUSD);
        }
        return @(AWSEC2CurrencyCodeValuesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2CurrencyCodeValuesUSD:
                return @"USD";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTenancyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"default"] == NSOrderedSame) {
            return @(AWSEC2TenancyDefault);
        }
        if ([value caseInsensitiveCompare:@"dedicated"] == NSOrderedSame) {
            return @(AWSEC2TenancyDedicated);
        }
        if ([value caseInsensitiveCompare:@"host"] == NSOrderedSame) {
            return @(AWSEC2TenancyHost);
        }
        return @(AWSEC2TenancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TenancyDefault:
                return @"default";
            case AWSEC2TenancyDedicated:
                return @"dedicated";
            case AWSEC2TenancyHost:
                return @"host";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"t1.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value caseInsensitiveCompare:@"m1.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value caseInsensitiveCompare:@"m1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value caseInsensitiveCompare:@"m1.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value caseInsensitiveCompare:@"m1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value caseInsensitiveCompare:@"m3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_large);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_10xlarge);
        }
        if ([value caseInsensitiveCompare:@"t2.nano"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_nano);
        }
        if ([value caseInsensitiveCompare:@"t2.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value caseInsensitiveCompare:@"t2.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value caseInsensitiveCompare:@"t2.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value caseInsensitiveCompare:@"t2.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_large);
        }
        if ([value caseInsensitiveCompare:@"m2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cr1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"hi1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"hs1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value caseInsensitiveCompare:@"c1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value caseInsensitiveCompare:@"c3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_large);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cg1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_8xlarge);
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
            case AWSEC2InstanceTypeM4_large:
                return @"m4.large";
            case AWSEC2InstanceTypeM4_xlarge:
                return @"m4.xlarge";
            case AWSEC2InstanceTypeM4_2xlarge:
                return @"m4.2xlarge";
            case AWSEC2InstanceTypeM4_4xlarge:
                return @"m4.4xlarge";
            case AWSEC2InstanceTypeM4_10xlarge:
                return @"m4.10xlarge";
            case AWSEC2InstanceTypeT2_nano:
                return @"t2.nano";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeT2_large:
                return @"t2.large";
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
            case AWSEC2InstanceTypeC4_large:
                return @"c4.large";
            case AWSEC2InstanceTypeC4_xlarge:
                return @"c4.xlarge";
            case AWSEC2InstanceTypeC4_2xlarge:
                return @"c4.2xlarge";
            case AWSEC2InstanceTypeC4_4xlarge:
                return @"c4.4xlarge";
            case AWSEC2InstanceTypeC4_8xlarge:
                return @"c4.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeG2_8xlarge:
                return @"g2.8xlarge";
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
            case AWSEC2InstanceTypeD2_xlarge:
                return @"d2.xlarge";
            case AWSEC2InstanceTypeD2_2xlarge:
                return @"d2.2xlarge";
            case AWSEC2InstanceTypeD2_4xlarge:
                return @"d2.4xlarge";
            case AWSEC2InstanceTypeD2_8xlarge:
                return @"d2.8xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)offeringTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Heavy Utilization"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesHeavyUtilization);
        }
        if ([value caseInsensitiveCompare:@"Medium Utilization"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesMediumUtilization);
        }
        if ([value caseInsensitiveCompare:@"Light Utilization"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesLightUtilization);
        }
        if ([value caseInsensitiveCompare:@"No Upfront"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesNoUpfront);
        }
        if ([value caseInsensitiveCompare:@"Partial Upfront"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesPartialUpfront);
        }
        if ([value caseInsensitiveCompare:@"All Upfront"] == NSOrderedSame) {
            return @(AWSEC2OfferingTypeValuesAllUpfront);
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
            case AWSEC2OfferingTypeValuesNoUpfront:
                return @"No Upfront";
            case AWSEC2OfferingTypeValuesPartialUpfront:
                return @"Partial Upfront";
            case AWSEC2OfferingTypeValuesAllUpfront:
                return @"All Upfront";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pricingDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2PricingDetail class]];
}

+ (NSValueTransformer *)productDescriptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Linux/UNIX"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionLinuxUNIX);
        }
        if ([value caseInsensitiveCompare:@"Linux/UNIX (Amazon VPC)"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC);
        }
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionWindows);
        }
        if ([value caseInsensitiveCompare:@"Windows (Amazon VPC)"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recurringChargesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2RecurringCharge class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"launchPermission"] == NSOrderedSame) {
            return @(AWSEC2ResetImageAttributeNameLaunchPermission);
        }
        return @(AWSEC2ResetImageAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ResetImageAttributeNameLaunchPermission:
                return @"launchPermission";
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"instanceType"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameInstanceType);
        }
        if ([value caseInsensitiveCompare:@"kernel"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameKernel);
        }
        if ([value caseInsensitiveCompare:@"ramdisk"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameRAMDisk);
        }
        if ([value caseInsensitiveCompare:@"userData"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameUserData);
        }
        if ([value caseInsensitiveCompare:@"disableApiTermination"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameDisableApiTermination);
        }
        if ([value caseInsensitiveCompare:@"instanceInitiatedShutdownBehavior"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameInstanceInitiatedShutdownBehavior);
        }
        if ([value caseInsensitiveCompare:@"rootDeviceName"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameRootDeviceName);
        }
        if ([value caseInsensitiveCompare:@"blockDeviceMapping"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameBlockDeviceMapping);
        }
        if ([value caseInsensitiveCompare:@"productCodes"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameProductCodes);
        }
        if ([value caseInsensitiveCompare:@"sourceDestCheck"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameSourceDestCheck);
        }
        if ([value caseInsensitiveCompare:@"groupSet"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameGroupSet);
        }
        if ([value caseInsensitiveCompare:@"ebsOptimized"] == NSOrderedSame) {
            return @(AWSEC2InstanceAttributeNameEBSOptimized);
        }
        if ([value caseInsensitiveCompare:@"sriovNetSupport"] == NSOrderedSame) {
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"productCodes"] == NSOrderedSame) {
            return @(AWSEC2SnapshotAttributeNameProductCodes);
        }
        if ([value caseInsensitiveCompare:@"createVolumePermission"] == NSOrderedSame) {
            return @(AWSEC2SnapshotAttributeNameCreateVolumePermission);
        }
        return @(AWSEC2SnapshotAttributeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SnapshotAttributeNameProductCodes:
                return @"productCodes";
            case AWSEC2SnapshotAttributeNameCreateVolumePermission:
                return @"createVolumePermission";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2RestoreAddressToClassicRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dryRun" : @"DryRun",
             @"publicIp" : @"PublicIp",
             };
}

@end

@implementation AWSEC2RestoreAddressToClassicResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"publicIp" : @"PublicIp",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MoveInProgress"] == NSOrderedSame) {
            return @(AWSEC2StatusMoveInProgress);
        }
        if ([value caseInsensitiveCompare:@"InVpc"] == NSOrderedSame) {
            return @(AWSEC2StatusInVpc);
        }
        if ([value caseInsensitiveCompare:@"InClassic"] == NSOrderedSame) {
            return @(AWSEC2StatusInClassic);
        }
        return @(AWSEC2StatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2StatusMoveInProgress:
                return @"MoveInProgress";
            case AWSEC2StatusInVpc:
                return @"InVpc";
            case AWSEC2StatusInClassic:
                return @"InClassic";
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2IpPermission class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2IpPermission class]];
}

@end

@implementation AWSEC2Route

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationCidrBlock" : @"DestinationCidrBlock",
             @"destinationPrefixListId" : @"DestinationPrefixListId",
             @"gatewayId" : @"GatewayId",
             @"instanceId" : @"InstanceId",
             @"instanceOwnerId" : @"InstanceOwnerId",
             @"natGatewayId" : @"NatGatewayId",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"origin" : @"Origin",
             @"state" : @"State",
             @"vpcPeeringConnectionId" : @"VpcPeeringConnectionId",
             };
}

+ (NSValueTransformer *)originJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CreateRouteTable"] == NSOrderedSame) {
            return @(AWSEC2RouteOriginCreateRouteTable);
        }
        if ([value caseInsensitiveCompare:@"CreateRoute"] == NSOrderedSame) {
            return @(AWSEC2RouteOriginCreateRoute);
        }
        if ([value caseInsensitiveCompare:@"EnableVgwRoutePropagation"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"active"] == NSOrderedSame) {
            return @(AWSEC2RouteStateActive);
        }
        if ([value caseInsensitiveCompare:@"blackhole"] == NSOrderedSame) {
            return @(AWSEC2RouteStateBlackhole);
        }
        return @(AWSEC2RouteStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2RouteStateActive:
                return @"active";
            case AWSEC2RouteStateBlackhole:
                return @"blackhole";
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2RouteTableAssociation class]];
}

+ (NSValueTransformer *)propagatingVgwsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2PropagatingVgw class]];
}

+ (NSValueTransformer *)routesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Route class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
}

+ (NSValueTransformer *)iamInstanceProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IamInstanceProfileSpecification class]];
}

+ (NSValueTransformer *)instanceInitiatedShutdownBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"stop"] == NSOrderedSame) {
            return @(AWSEC2ShutdownBehaviorStop);
        }
        if ([value caseInsensitiveCompare:@"terminate"] == NSOrderedSame) {
            return @(AWSEC2ShutdownBehaviorTerminate);
        }
        return @(AWSEC2ShutdownBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ShutdownBehaviorStop:
                return @"stop";
            case AWSEC2ShutdownBehaviorTerminate:
                return @"terminate";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"t1.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value caseInsensitiveCompare:@"m1.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value caseInsensitiveCompare:@"m1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value caseInsensitiveCompare:@"m1.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value caseInsensitiveCompare:@"m1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value caseInsensitiveCompare:@"m3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_large);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_10xlarge);
        }
        if ([value caseInsensitiveCompare:@"t2.nano"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_nano);
        }
        if ([value caseInsensitiveCompare:@"t2.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value caseInsensitiveCompare:@"t2.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value caseInsensitiveCompare:@"t2.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value caseInsensitiveCompare:@"t2.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_large);
        }
        if ([value caseInsensitiveCompare:@"m2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cr1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"hi1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"hs1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value caseInsensitiveCompare:@"c1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value caseInsensitiveCompare:@"c3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_large);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cg1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_8xlarge);
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
            case AWSEC2InstanceTypeM4_large:
                return @"m4.large";
            case AWSEC2InstanceTypeM4_xlarge:
                return @"m4.xlarge";
            case AWSEC2InstanceTypeM4_2xlarge:
                return @"m4.2xlarge";
            case AWSEC2InstanceTypeM4_4xlarge:
                return @"m4.4xlarge";
            case AWSEC2InstanceTypeM4_10xlarge:
                return @"m4.10xlarge";
            case AWSEC2InstanceTypeT2_nano:
                return @"t2.nano";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeT2_large:
                return @"t2.large";
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
            case AWSEC2InstanceTypeC4_large:
                return @"c4.large";
            case AWSEC2InstanceTypeC4_xlarge:
                return @"c4.xlarge";
            case AWSEC2InstanceTypeC4_2xlarge:
                return @"c4.2xlarge";
            case AWSEC2InstanceTypeC4_4xlarge:
                return @"c4.4xlarge";
            case AWSEC2InstanceTypeC4_8xlarge:
                return @"c4.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeG2_8xlarge:
                return @"g2.8xlarge";
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
            case AWSEC2InstanceTypeD2_xlarge:
                return @"d2.xlarge";
            case AWSEC2InstanceTypeD2_2xlarge:
                return @"d2.2xlarge";
            case AWSEC2InstanceTypeD2_4xlarge:
                return @"d2.4xlarge";
            case AWSEC2InstanceTypeD2_8xlarge:
                return @"d2.8xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)monitoringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2RunInstancesMonitoringEnabled class]];
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceNetworkInterfaceSpecification class]];
}

+ (NSValueTransformer *)placementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2Placement class]];
}

@end

@implementation AWSEC2RunScheduledInstancesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientToken" : @"ClientToken",
             @"dryRun" : @"DryRun",
             @"instanceCount" : @"InstanceCount",
             @"launchSpecification" : @"LaunchSpecification",
             @"scheduledInstanceId" : @"ScheduledInstanceId",
             };
}

+ (NSValueTransformer *)launchSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ScheduledInstancesLaunchSpecification class]];
}

@end

@implementation AWSEC2RunScheduledInstancesResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"instanceIdSet" : @"InstanceIdSet",
             };
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

@implementation AWSEC2ScheduledInstance

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"createDate" : @"CreateDate",
             @"hourlyPrice" : @"HourlyPrice",
             @"instanceCount" : @"InstanceCount",
             @"instanceType" : @"InstanceType",
             @"networkPlatform" : @"NetworkPlatform",
             @"nextSlotStartTime" : @"NextSlotStartTime",
             @"platform" : @"Platform",
             @"previousSlotEndTime" : @"PreviousSlotEndTime",
             @"recurrence" : @"Recurrence",
             @"scheduledInstanceId" : @"ScheduledInstanceId",
             @"slotDurationInHours" : @"SlotDurationInHours",
             @"termEndDate" : @"TermEndDate",
             @"termStartDate" : @"TermStartDate",
             @"totalScheduledInstanceHours" : @"TotalScheduledInstanceHours",
             };
}

+ (NSValueTransformer *)createDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)nextSlotStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)previousSlotEndTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)recurrenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ScheduledInstanceRecurrence class]];
}

+ (NSValueTransformer *)termEndDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)termStartDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2ScheduledInstanceAvailability

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"availableInstanceCount" : @"AvailableInstanceCount",
             @"firstSlotStartTime" : @"FirstSlotStartTime",
             @"hourlyPrice" : @"HourlyPrice",
             @"instanceType" : @"InstanceType",
             @"maxTermDurationInDays" : @"MaxTermDurationInDays",
             @"minTermDurationInDays" : @"MinTermDurationInDays",
             @"networkPlatform" : @"NetworkPlatform",
             @"platform" : @"Platform",
             @"purchaseToken" : @"PurchaseToken",
             @"recurrence" : @"Recurrence",
             @"slotDurationInHours" : @"SlotDurationInHours",
             @"totalScheduledInstanceHours" : @"TotalScheduledInstanceHours",
             };
}

+ (NSValueTransformer *)firstSlotStartTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)recurrenceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ScheduledInstanceRecurrence class]];
}

@end

@implementation AWSEC2ScheduledInstanceRecurrence

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"frequency" : @"Frequency",
             @"interval" : @"Interval",
             @"occurrenceDaySet" : @"OccurrenceDaySet",
             @"occurrenceRelativeToEnd" : @"OccurrenceRelativeToEnd",
             @"occurrenceUnit" : @"OccurrenceUnit",
             };
}

@end

@implementation AWSEC2ScheduledInstanceRecurrenceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"frequency" : @"Frequency",
             @"interval" : @"Interval",
             @"occurrenceDays" : @"OccurrenceDays",
             @"occurrenceRelativeToEnd" : @"OccurrenceRelativeToEnd",
             @"occurrenceUnit" : @"OccurrenceUnit",
             };
}

@end

@implementation AWSEC2ScheduledInstancesBlockDeviceMapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceName" : @"DeviceName",
             @"ebs" : @"Ebs",
             @"noDevice" : @"NoDevice",
             @"virtualName" : @"VirtualName",
             };
}

+ (NSValueTransformer *)ebsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ScheduledInstancesEbs class]];
}

@end

@implementation AWSEC2ScheduledInstancesEbs

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

@end

@implementation AWSEC2ScheduledInstancesIamInstanceProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"name" : @"Name",
             };
}

@end

@implementation AWSEC2ScheduledInstancesLaunchSpecification

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
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
             @"subnetId" : @"SubnetId",
             @"userData" : @"UserData",
             };
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ScheduledInstancesBlockDeviceMapping class]];
}

+ (NSValueTransformer *)iamInstanceProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ScheduledInstancesIamInstanceProfile class]];
}

+ (NSValueTransformer *)monitoringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ScheduledInstancesMonitoring class]];
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ScheduledInstancesNetworkInterface class]];
}

+ (NSValueTransformer *)placementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2ScheduledInstancesPlacement class]];
}

@end

@implementation AWSEC2ScheduledInstancesMonitoring

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSEC2ScheduledInstancesNetworkInterface

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatePublicIpAddress" : @"AssociatePublicIpAddress",
             @"deleteOnTermination" : @"DeleteOnTermination",
             @"detail" : @"Description",
             @"deviceIndex" : @"DeviceIndex",
             @"groups" : @"Groups",
             @"networkInterfaceId" : @"NetworkInterfaceId",
             @"privateIpAddress" : @"PrivateIpAddress",
             @"privateIpAddressConfigs" : @"PrivateIpAddressConfigs",
             @"secondaryPrivateIpAddressCount" : @"SecondaryPrivateIpAddressCount",
             @"subnetId" : @"SubnetId",
             };
}

+ (NSValueTransformer *)privateIpAddressConfigsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2ScheduledInstancesPrivateIpAddressConfig class]];
}

@end

@implementation AWSEC2ScheduledInstancesPlacement

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"availabilityZone" : @"AvailabilityZone",
             @"groupName" : @"GroupName",
             };
}

@end

@implementation AWSEC2ScheduledInstancesPrivateIpAddressConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"primary" : @"Primary",
             @"privateIpAddress" : @"PrivateIpAddress",
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2IpPermission class]];
}

+ (NSValueTransformer *)ipPermissionsEgressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2IpPermission class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2SecurityGroupReference

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"referencingVpcId" : @"ReferencingVpcId",
             @"vpcPeeringConnectionId" : @"VpcPeeringConnectionId",
             };
}

@end

@implementation AWSEC2SlotDateTimeRangeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"earliestTime" : @"EarliestTime",
             @"latestTime" : @"LatestTime",
             };
}

+ (NSValueTransformer *)earliestTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)latestTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2SlotStartTimeRangeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"earliestTime" : @"EarliestTime",
             @"latestTime" : @"LatestTime",
             };
}

+ (NSValueTransformer *)earliestTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)latestTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2Snapshot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataEncryptionKeyId" : @"DataEncryptionKeyId",
             @"detail" : @"Description",
             @"encrypted" : @"Encrypted",
             @"kmsKeyId" : @"KmsKeyId",
             @"ownerAlias" : @"OwnerAlias",
             @"ownerId" : @"OwnerId",
             @"progress" : @"Progress",
             @"snapshotId" : @"SnapshotId",
             @"startTime" : @"StartTime",
             @"state" : @"State",
             @"stateMessage" : @"StateMessage",
             @"tags" : @"Tags",
             @"volumeId" : @"VolumeId",
             @"volumeSize" : @"VolumeSize",
             };
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSEC2SnapshotStatePending);
        }
        if ([value caseInsensitiveCompare:@"completed"] == NSOrderedSame) {
            return @(AWSEC2SnapshotStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"error"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2SnapshotDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"deviceName" : @"DeviceName",
             @"diskImageSize" : @"DiskImageSize",
             @"format" : @"Format",
             @"progress" : @"Progress",
             @"snapshotId" : @"SnapshotId",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             @"url" : @"Url",
             @"userBucket" : @"UserBucket",
             };
}

+ (NSValueTransformer *)userBucketJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2UserBucketDetails class]];
}

@end

@implementation AWSEC2SnapshotDiskContainer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"format" : @"Format",
             @"url" : @"Url",
             @"userBucket" : @"UserBucket",
             };
}

+ (NSValueTransformer *)userBucketJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2UserBucket class]];
}

@end

@implementation AWSEC2SnapshotTaskDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"diskImageSize" : @"DiskImageSize",
             @"format" : @"Format",
             @"progress" : @"Progress",
             @"snapshotId" : @"SnapshotId",
             @"status" : @"Status",
             @"statusMessage" : @"StatusMessage",
             @"url" : @"Url",
             @"userBucket" : @"UserBucket",
             };
}

+ (NSValueTransformer *)userBucketJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2UserBucketDetails class]];
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotInstanceStateFault class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Active"] == NSOrderedSame) {
            return @(AWSEC2DatafeedSubscriptionStateActive);
        }
        if ([value caseInsensitiveCompare:@"Inactive"] == NSOrderedSame) {
            return @(AWSEC2DatafeedSubscriptionStateInactive);
        }
        return @(AWSEC2DatafeedSubscriptionStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2DatafeedSubscriptionStateActive:
                return @"Active";
            case AWSEC2DatafeedSubscriptionStateInactive:
                return @"Inactive";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2SpotFleetLaunchSpecification

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
             @"spotPrice" : @"SpotPrice",
             @"subnetId" : @"SubnetId",
             @"userData" : @"UserData",
             @"weightedCapacity" : @"WeightedCapacity",
             };
}

+ (NSValueTransformer *)blockDeviceMappingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2BlockDeviceMapping class]];
}

+ (NSValueTransformer *)iamInstanceProfileJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2IamInstanceProfileSpecification class]];
}

+ (NSValueTransformer *)instanceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"t1.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value caseInsensitiveCompare:@"m1.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value caseInsensitiveCompare:@"m1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value caseInsensitiveCompare:@"m1.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value caseInsensitiveCompare:@"m1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value caseInsensitiveCompare:@"m3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_large);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_10xlarge);
        }
        if ([value caseInsensitiveCompare:@"t2.nano"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_nano);
        }
        if ([value caseInsensitiveCompare:@"t2.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value caseInsensitiveCompare:@"t2.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value caseInsensitiveCompare:@"t2.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value caseInsensitiveCompare:@"t2.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_large);
        }
        if ([value caseInsensitiveCompare:@"m2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cr1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"hi1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"hs1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value caseInsensitiveCompare:@"c1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value caseInsensitiveCompare:@"c3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_large);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cg1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_8xlarge);
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
            case AWSEC2InstanceTypeM4_large:
                return @"m4.large";
            case AWSEC2InstanceTypeM4_xlarge:
                return @"m4.xlarge";
            case AWSEC2InstanceTypeM4_2xlarge:
                return @"m4.2xlarge";
            case AWSEC2InstanceTypeM4_4xlarge:
                return @"m4.4xlarge";
            case AWSEC2InstanceTypeM4_10xlarge:
                return @"m4.10xlarge";
            case AWSEC2InstanceTypeT2_nano:
                return @"t2.nano";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeT2_large:
                return @"t2.large";
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
            case AWSEC2InstanceTypeC4_large:
                return @"c4.large";
            case AWSEC2InstanceTypeC4_xlarge:
                return @"c4.xlarge";
            case AWSEC2InstanceTypeC4_2xlarge:
                return @"c4.2xlarge";
            case AWSEC2InstanceTypeC4_4xlarge:
                return @"c4.4xlarge";
            case AWSEC2InstanceTypeC4_8xlarge:
                return @"c4.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeG2_8xlarge:
                return @"g2.8xlarge";
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
            case AWSEC2InstanceTypeD2_xlarge:
                return @"d2.xlarge";
            case AWSEC2InstanceTypeD2_2xlarge:
                return @"d2.2xlarge";
            case AWSEC2InstanceTypeD2_4xlarge:
                return @"d2.4xlarge";
            case AWSEC2InstanceTypeD2_8xlarge:
                return @"d2.8xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)monitoringJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotFleetMonitoring class]];
}

+ (NSValueTransformer *)networkInterfacesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceNetworkInterfaceSpecification class]];
}

+ (NSValueTransformer *)placementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotPlacement class]];
}

+ (NSValueTransformer *)securityGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2GroupIdentifier class]];
}

@end

@implementation AWSEC2SpotFleetMonitoring

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSEC2SpotFleetRequestConfig

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTime" : @"CreateTime",
             @"spotFleetRequestConfig" : @"SpotFleetRequestConfig",
             @"spotFleetRequestId" : @"SpotFleetRequestId",
             @"spotFleetRequestState" : @"SpotFleetRequestState",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)spotFleetRequestConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotFleetRequestConfigData class]];
}

+ (NSValueTransformer *)spotFleetRequestStateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"submitted"] == NSOrderedSame) {
            return @(AWSEC2BatchStateSubmitted);
        }
        if ([value caseInsensitiveCompare:@"active"] == NSOrderedSame) {
            return @(AWSEC2BatchStateActive);
        }
        if ([value caseInsensitiveCompare:@"cancelled"] == NSOrderedSame) {
            return @(AWSEC2BatchStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSEC2BatchStateFailed);
        }
        if ([value caseInsensitiveCompare:@"cancelled_running"] == NSOrderedSame) {
            return @(AWSEC2BatchStateCancelledRunning);
        }
        if ([value caseInsensitiveCompare:@"cancelled_terminating"] == NSOrderedSame) {
            return @(AWSEC2BatchStateCancelledTerminating);
        }
        if ([value caseInsensitiveCompare:@"modifying"] == NSOrderedSame) {
            return @(AWSEC2BatchStateModifying);
        }
        return @(AWSEC2BatchStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2BatchStateSubmitted:
                return @"submitted";
            case AWSEC2BatchStateActive:
                return @"active";
            case AWSEC2BatchStateCancelled:
                return @"cancelled";
            case AWSEC2BatchStateFailed:
                return @"failed";
            case AWSEC2BatchStateCancelledRunning:
                return @"cancelled_running";
            case AWSEC2BatchStateCancelledTerminating:
                return @"cancelled_terminating";
            case AWSEC2BatchStateModifying:
                return @"modifying";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2SpotFleetRequestConfigData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allocationStrategy" : @"AllocationStrategy",
             @"clientToken" : @"ClientToken",
             @"excessCapacityTerminationPolicy" : @"ExcessCapacityTerminationPolicy",
             @"iamFleetRole" : @"IamFleetRole",
             @"launchSpecifications" : @"LaunchSpecifications",
             @"spotPrice" : @"SpotPrice",
             @"targetCapacity" : @"TargetCapacity",
             @"terminateInstancesWithExpiration" : @"TerminateInstancesWithExpiration",
             @"validFrom" : @"ValidFrom",
             @"validUntil" : @"ValidUntil",
             };
}

+ (NSValueTransformer *)allocationStrategyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"lowestPrice"] == NSOrderedSame) {
            return @(AWSEC2AllocationStrategyLowestPrice);
        }
        if ([value caseInsensitiveCompare:@"diversified"] == NSOrderedSame) {
            return @(AWSEC2AllocationStrategyDiversified);
        }
        return @(AWSEC2AllocationStrategyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2AllocationStrategyLowestPrice:
                return @"lowestPrice";
            case AWSEC2AllocationStrategyDiversified:
                return @"diversified";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)excessCapacityTerminationPolicyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"noTermination"] == NSOrderedSame) {
            return @(AWSEC2ExcessCapacityTerminationPolicyNoTermination);
        }
        if ([value caseInsensitiveCompare:@"default"] == NSOrderedSame) {
            return @(AWSEC2ExcessCapacityTerminationPolicyDefault);
        }
        return @(AWSEC2ExcessCapacityTerminationPolicyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2ExcessCapacityTerminationPolicyNoTermination:
                return @"noTermination";
            case AWSEC2ExcessCapacityTerminationPolicyDefault:
                return @"default";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)launchSpecificationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2SpotFleetLaunchSpecification class]];
}

+ (NSValueTransformer *)validFromJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)validUntilJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2SpotInstanceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actualBlockHourlyPrice" : @"ActualBlockHourlyPrice",
             @"availabilityZoneGroup" : @"AvailabilityZoneGroup",
             @"blockDurationMinutes" : @"BlockDurationMinutes",
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
             @"types" : @"Type",
             @"validFrom" : @"ValidFrom",
             @"validUntil" : @"ValidUntil",
             };
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)faultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotInstanceStateFault class]];
}

+ (NSValueTransformer *)launchSpecificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2LaunchSpecification class]];
}

+ (NSValueTransformer *)productDescriptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Linux/UNIX"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionLinuxUNIX);
        }
        if ([value caseInsensitiveCompare:@"Linux/UNIX (Amazon VPC)"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC);
        }
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionWindows);
        }
        if ([value caseInsensitiveCompare:@"Windows (Amazon VPC)"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"open"] == NSOrderedSame) {
            return @(AWSEC2SpotInstanceStateOpen);
        }
        if ([value caseInsensitiveCompare:@"active"] == NSOrderedSame) {
            return @(AWSEC2SpotInstanceStateActive);
        }
        if ([value caseInsensitiveCompare:@"closed"] == NSOrderedSame) {
            return @(AWSEC2SpotInstanceStateClosed);
        }
        if ([value caseInsensitiveCompare:@"cancelled"] == NSOrderedSame) {
            return @(AWSEC2SpotInstanceStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2SpotInstanceStatus class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"one-time"] == NSOrderedSame) {
            return @(AWSEC2SpotInstanceTypeOneTime);
        }
        if ([value caseInsensitiveCompare:@"persistent"] == NSOrderedSame) {
            return @(AWSEC2SpotInstanceTypePersistent);
        }
        return @(AWSEC2SpotInstanceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SpotInstanceTypeOneTime:
                return @"one-time";
            case AWSEC2SpotInstanceTypePersistent:
                return @"persistent";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)validFromJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)validUntilJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"t1.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT1_micro);
        }
        if ([value caseInsensitiveCompare:@"m1.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_small);
        }
        if ([value caseInsensitiveCompare:@"m1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_medium);
        }
        if ([value caseInsensitiveCompare:@"m1.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_large);
        }
        if ([value caseInsensitiveCompare:@"m1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_medium);
        }
        if ([value caseInsensitiveCompare:@"m3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_large);
        }
        if ([value caseInsensitiveCompare:@"m3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_large);
        }
        if ([value caseInsensitiveCompare:@"m4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"m4.10xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM4_10xlarge);
        }
        if ([value caseInsensitiveCompare:@"t2.nano"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_nano);
        }
        if ([value caseInsensitiveCompare:@"t2.micro"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_micro);
        }
        if ([value caseInsensitiveCompare:@"t2.small"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_small);
        }
        if ([value caseInsensitiveCompare:@"t2.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_medium);
        }
        if ([value caseInsensitiveCompare:@"t2.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeT2_large);
        }
        if ([value caseInsensitiveCompare:@"m2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"m2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeM2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cr1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCR1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"i2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeI2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"hi1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHI1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"hs1.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeHS1_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c1.medium"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_medium);
        }
        if ([value caseInsensitiveCompare:@"c1.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC1_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_large);
        }
        if ([value caseInsensitiveCompare:@"c3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_large);
        }
        if ([value caseInsensitiveCompare:@"c4.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"c4.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeC4_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"cc2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCC2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"g2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeG2_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"cg1.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeCG1_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.large"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_large);
        }
        if ([value caseInsensitiveCompare:@"r3.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"r3.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeR3_8xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.2xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_2xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.4xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_4xlarge);
        }
        if ([value caseInsensitiveCompare:@"d2.8xlarge"] == NSOrderedSame) {
            return @(AWSEC2InstanceTypeD2_8xlarge);
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
            case AWSEC2InstanceTypeM4_large:
                return @"m4.large";
            case AWSEC2InstanceTypeM4_xlarge:
                return @"m4.xlarge";
            case AWSEC2InstanceTypeM4_2xlarge:
                return @"m4.2xlarge";
            case AWSEC2InstanceTypeM4_4xlarge:
                return @"m4.4xlarge";
            case AWSEC2InstanceTypeM4_10xlarge:
                return @"m4.10xlarge";
            case AWSEC2InstanceTypeT2_nano:
                return @"t2.nano";
            case AWSEC2InstanceTypeT2_micro:
                return @"t2.micro";
            case AWSEC2InstanceTypeT2_small:
                return @"t2.small";
            case AWSEC2InstanceTypeT2_medium:
                return @"t2.medium";
            case AWSEC2InstanceTypeT2_large:
                return @"t2.large";
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
            case AWSEC2InstanceTypeC4_large:
                return @"c4.large";
            case AWSEC2InstanceTypeC4_xlarge:
                return @"c4.xlarge";
            case AWSEC2InstanceTypeC4_2xlarge:
                return @"c4.2xlarge";
            case AWSEC2InstanceTypeC4_4xlarge:
                return @"c4.4xlarge";
            case AWSEC2InstanceTypeC4_8xlarge:
                return @"c4.8xlarge";
            case AWSEC2InstanceTypeCC1_4xlarge:
                return @"cc1.4xlarge";
            case AWSEC2InstanceTypeCC2_8xlarge:
                return @"cc2.8xlarge";
            case AWSEC2InstanceTypeG2_2xlarge:
                return @"g2.2xlarge";
            case AWSEC2InstanceTypeG2_8xlarge:
                return @"g2.8xlarge";
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
            case AWSEC2InstanceTypeD2_xlarge:
                return @"d2.xlarge";
            case AWSEC2InstanceTypeD2_2xlarge:
                return @"d2.2xlarge";
            case AWSEC2InstanceTypeD2_4xlarge:
                return @"d2.4xlarge";
            case AWSEC2InstanceTypeD2_8xlarge:
                return @"d2.8xlarge";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)productDescriptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Linux/UNIX"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionLinuxUNIX);
        }
        if ([value caseInsensitiveCompare:@"Linux/UNIX (Amazon VPC)"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionLinuxUNIXAmazonVPC);
        }
        if ([value caseInsensitiveCompare:@"Windows"] == NSOrderedSame) {
            return @(AWSEC2RIProductDescriptionWindows);
        }
        if ([value caseInsensitiveCompare:@"Windows (Amazon VPC)"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

@end

@implementation AWSEC2StaleIpPermission

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fromPort" : @"FromPort",
             @"ipProtocol" : @"IpProtocol",
             @"ipRanges" : @"IpRanges",
             @"prefixListIds" : @"PrefixListIds",
             @"toPort" : @"ToPort",
             @"userIdGroupPairs" : @"UserIdGroupPairs",
             };
}

+ (NSValueTransformer *)userIdGroupPairsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2UserIdGroupPair class]];
}

@end

@implementation AWSEC2StaleSecurityGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             @"staleIpPermissions" : @"StaleIpPermissions",
             @"staleIpPermissionsEgress" : @"StaleIpPermissionsEgress",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)staleIpPermissionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2StaleIpPermission class]];
}

+ (NSValueTransformer *)staleIpPermissionsEgressJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2StaleIpPermission class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceStateChange class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceStateChange class]];
}

@end

@implementation AWSEC2Storage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3" : @"S3",
             };
}

+ (NSValueTransformer *)s3JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2S3Storage class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSEC2SubnetStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSEC2SubnetStateAvailable);
        }
        return @(AWSEC2SubnetStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2SubnetStatePending:
                return @"pending";
            case AWSEC2SubnetStateAvailable:
                return @"available";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"customer-gateway"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeCustomerGateway);
        }
        if ([value caseInsensitiveCompare:@"dhcp-options"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeDHCPOptions);
        }
        if ([value caseInsensitiveCompare:@"image"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeImage);
        }
        if ([value caseInsensitiveCompare:@"instance"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeInstance);
        }
        if ([value caseInsensitiveCompare:@"internet-gateway"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeInternetGateway);
        }
        if ([value caseInsensitiveCompare:@"network-acl"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeNetworkACL);
        }
        if ([value caseInsensitiveCompare:@"network-interface"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeNetworkInterface);
        }
        if ([value caseInsensitiveCompare:@"reserved-instances"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeReservedInstances);
        }
        if ([value caseInsensitiveCompare:@"route-table"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeRouteTable);
        }
        if ([value caseInsensitiveCompare:@"snapshot"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeSnapshot);
        }
        if ([value caseInsensitiveCompare:@"spot-instances-request"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeSpotInstancesRequest);
        }
        if ([value caseInsensitiveCompare:@"subnet"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeSubnet);
        }
        if ([value caseInsensitiveCompare:@"security-group"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeSecurityGroup);
        }
        if ([value caseInsensitiveCompare:@"volume"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeVolume);
        }
        if ([value caseInsensitiveCompare:@"vpc"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeVPC);
        }
        if ([value caseInsensitiveCompare:@"vpn-connection"] == NSOrderedSame) {
            return @(AWSEC2ResourceTypeVpnConnection);
        }
        if ([value caseInsensitiveCompare:@"vpn-gateway"] == NSOrderedSame) {
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceStateChange class]];
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2InstanceMonitoring class]];
}

@end

@implementation AWSEC2UnsuccessfulItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"error" : @"Error",
             @"resourceId" : @"ResourceId",
             };
}

+ (NSValueTransformer *)errorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2UnsuccessfulItemError class]];
}

@end

@implementation AWSEC2UnsuccessfulItemError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

@end

@implementation AWSEC2UserBucket

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3Key" : @"S3Key",
             };
}

@end

@implementation AWSEC2UserBucketDetails

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"s3Bucket" : @"S3Bucket",
             @"s3Key" : @"S3Key",
             };
}

@end

@implementation AWSEC2UserData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             };
}

@end

@implementation AWSEC2UserIdGroupPair

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupId" : @"GroupId",
             @"groupName" : @"GroupName",
             @"peeringStatus" : @"PeeringStatus",
             @"userId" : @"UserId",
             @"vpcId" : @"VpcId",
             @"vpcPeeringConnectionId" : @"VpcPeeringConnectionId",
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UP"] == NSOrderedSame) {
            return @(AWSEC2TelemetryStatusUp);
        }
        if ([value caseInsensitiveCompare:@"DOWN"] == NSOrderedSame) {
            return @(AWSEC2TelemetryStatusDown);
        }
        return @(AWSEC2TelemetryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TelemetryStatusUp:
                return @"UP";
            case AWSEC2TelemetryStatusDown:
                return @"DOWN";
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
             @"kmsKeyId" : @"KmsKeyId",
             @"size" : @"Size",
             @"snapshotId" : @"SnapshotId",
             @"state" : @"State",
             @"tags" : @"Tags",
             @"volumeId" : @"VolumeId",
             @"volumeType" : @"VolumeType",
             };
}

+ (NSValueTransformer *)attachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2VolumeAttachment class]];
}

+ (NSValueTransformer *)createTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"creating"] == NSOrderedSame) {
            return @(AWSEC2VolumeStateCreating);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSEC2VolumeStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"in-use"] == NSOrderedSame) {
            return @(AWSEC2VolumeStateInUse);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSEC2VolumeStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSEC2VolumeStateDeleted);
        }
        if ([value caseInsensitiveCompare:@"error"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

+ (NSValueTransformer *)volumeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"standard"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"io1"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeIO1);
        }
        if ([value caseInsensitiveCompare:@"gp2"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeGp2);
        }
        if ([value caseInsensitiveCompare:@"sc1"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeSc1);
        }
        if ([value caseInsensitiveCompare:@"st1"] == NSOrderedSame) {
            return @(AWSEC2VolumeTypeSt1);
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
            case AWSEC2VolumeTypeSc1:
                return @"sc1";
            case AWSEC2VolumeTypeSt1:
                return @"st1";
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"attaching"] == NSOrderedSame) {
            return @(AWSEC2VolumeAttachmentStateAttaching);
        }
        if ([value caseInsensitiveCompare:@"attached"] == NSOrderedSame) {
            return @(AWSEC2VolumeAttachmentStateAttached);
        }
        if ([value caseInsensitiveCompare:@"detaching"] == NSOrderedSame) {
            return @(AWSEC2VolumeAttachmentStateDetaching);
        }
        if ([value caseInsensitiveCompare:@"detached"] == NSOrderedSame) {
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"io-enabled"] == NSOrderedSame) {
            return @(AWSEC2VolumeStatusNameIoEnabled);
        }
        if ([value caseInsensitiveCompare:@"io-performance"] == NSOrderedSame) {
            return @(AWSEC2VolumeStatusNameIoPerformance);
        }
        return @(AWSEC2VolumeStatusNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VolumeStatusNameIoEnabled:
                return @"io-enabled";
            case AWSEC2VolumeStatusNameIoPerformance:
                return @"io-performance";
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)notBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2VolumeStatusDetails class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ok"] == NSOrderedSame) {
            return @(AWSEC2VolumeStatusInfoStatusOK);
        }
        if ([value caseInsensitiveCompare:@"impaired"] == NSOrderedSame) {
            return @(AWSEC2VolumeStatusInfoStatusImpaired);
        }
        if ([value caseInsensitiveCompare:@"insufficient-data"] == NSOrderedSame) {
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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2VolumeStatusAction class]];
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2VolumeStatusEvent class]];
}

+ (NSValueTransformer *)volumeStatusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VolumeStatusInfo class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"default"] == NSOrderedSame) {
            return @(AWSEC2TenancyDefault);
        }
        if ([value caseInsensitiveCompare:@"dedicated"] == NSOrderedSame) {
            return @(AWSEC2TenancyDedicated);
        }
        if ([value caseInsensitiveCompare:@"host"] == NSOrderedSame) {
            return @(AWSEC2TenancyHost);
        }
        return @(AWSEC2TenancyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2TenancyDefault:
                return @"default";
            case AWSEC2TenancyDedicated:
                return @"dedicated";
            case AWSEC2TenancyHost:
                return @"host";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSEC2VpcStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSEC2VpcStateAvailable);
        }
        return @(AWSEC2VpcStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VpcStatePending:
                return @"pending";
            case AWSEC2VpcStateAvailable:
                return @"available";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"attaching"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusAttaching);
        }
        if ([value caseInsensitiveCompare:@"attached"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusAttached);
        }
        if ([value caseInsensitiveCompare:@"detaching"] == NSOrderedSame) {
            return @(AWSEC2AttachmentStatusDetaching);
        }
        if ([value caseInsensitiveCompare:@"detached"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2VpcClassicLink

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"classicLinkEnabled" : @"ClassicLinkEnabled",
             @"tags" : @"Tags",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2VpcEndpoint

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationTimestamp" : @"CreationTimestamp",
             @"policyDocument" : @"PolicyDocument",
             @"routeTableIds" : @"RouteTableIds",
             @"serviceName" : @"ServiceName",
             @"state" : @"State",
             @"vpcEndpointId" : @"VpcEndpointId",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)creationTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSEC2StatePending);
        }
        if ([value caseInsensitiveCompare:@"Available"] == NSOrderedSame) {
            return @(AWSEC2StateAvailable);
        }
        if ([value caseInsensitiveCompare:@"Deleting"] == NSOrderedSame) {
            return @(AWSEC2StateDeleting);
        }
        if ([value caseInsensitiveCompare:@"Deleted"] == NSOrderedSame) {
            return @(AWSEC2StateDeleted);
        }
        return @(AWSEC2StateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2StatePending:
                return @"Pending";
            case AWSEC2StateAvailable:
                return @"Available";
            case AWSEC2StateDeleting:
                return @"Deleting";
            case AWSEC2StateDeleted:
                return @"Deleted";
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpcPeeringConnectionVpcInfo class]];
}

+ (NSValueTransformer *)expirationTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *str) {
        return [NSDate aws_dateFromString:str];
    } reverseBlock:^id(NSDate *date) {
return [date aws_stringValue:AWSDateISO8601DateFormat1];
    }];
}

+ (NSValueTransformer *)requesterVpcInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpcPeeringConnectionVpcInfo class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpcPeeringConnectionStateReason class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

@end

@implementation AWSEC2VpcPeeringConnectionOptionsDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowEgressFromLocalClassicLinkToRemoteVpc" : @"AllowEgressFromLocalClassicLinkToRemoteVpc",
             @"allowEgressFromLocalVpcToRemoteClassicLink" : @"AllowEgressFromLocalVpcToRemoteClassicLink",
             };
}

@end

@implementation AWSEC2VpcPeeringConnectionStateReason

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"code" : @"Code",
             @"message" : @"Message",
             };
}

+ (NSValueTransformer *)codeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"initiating-request"] == NSOrderedSame) {
            return @(AWSEC2VpcPeeringConnectionStateReasonCodeInitiatingRequest);
        }
        if ([value caseInsensitiveCompare:@"pending-acceptance"] == NSOrderedSame) {
            return @(AWSEC2VpcPeeringConnectionStateReasonCodePendingAcceptance);
        }
        if ([value caseInsensitiveCompare:@"active"] == NSOrderedSame) {
            return @(AWSEC2VpcPeeringConnectionStateReasonCodeActive);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
            return @(AWSEC2VpcPeeringConnectionStateReasonCodeDeleted);
        }
        if ([value caseInsensitiveCompare:@"rejected"] == NSOrderedSame) {
            return @(AWSEC2VpcPeeringConnectionStateReasonCodeRejected);
        }
        if ([value caseInsensitiveCompare:@"failed"] == NSOrderedSame) {
            return @(AWSEC2VpcPeeringConnectionStateReasonCodeFailed);
        }
        if ([value caseInsensitiveCompare:@"expired"] == NSOrderedSame) {
            return @(AWSEC2VpcPeeringConnectionStateReasonCodeExpired);
        }
        if ([value caseInsensitiveCompare:@"provisioning"] == NSOrderedSame) {
            return @(AWSEC2VpcPeeringConnectionStateReasonCodeProvisioning);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSEC2VpcPeeringConnectionStateReasonCodeDeleting);
        }
        return @(AWSEC2VpcPeeringConnectionStateReasonCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VpcPeeringConnectionStateReasonCodeInitiatingRequest:
                return @"initiating-request";
            case AWSEC2VpcPeeringConnectionStateReasonCodePendingAcceptance:
                return @"pending-acceptance";
            case AWSEC2VpcPeeringConnectionStateReasonCodeActive:
                return @"active";
            case AWSEC2VpcPeeringConnectionStateReasonCodeDeleted:
                return @"deleted";
            case AWSEC2VpcPeeringConnectionStateReasonCodeRejected:
                return @"rejected";
            case AWSEC2VpcPeeringConnectionStateReasonCodeFailed:
                return @"failed";
            case AWSEC2VpcPeeringConnectionStateReasonCodeExpired:
                return @"expired";
            case AWSEC2VpcPeeringConnectionStateReasonCodeProvisioning:
                return @"provisioning";
            case AWSEC2VpcPeeringConnectionStateReasonCodeDeleting:
                return @"deleting";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSEC2VpcPeeringConnectionVpcInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cidrBlock" : @"CidrBlock",
             @"ownerId" : @"OwnerId",
             @"peeringOptions" : @"PeeringOptions",
             @"vpcId" : @"VpcId",
             };
}

+ (NSValueTransformer *)peeringOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpcPeeringConnectionOptionsDescription class]];
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
             @"types" : @"Type",
             @"vgwTelemetry" : @"VgwTelemetry",
             @"vpnConnectionId" : @"VpnConnectionId",
             @"vpnGatewayId" : @"VpnGatewayId",
             };
}

+ (NSValueTransformer *)optionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSEC2VpnConnectionOptions class]];
}

+ (NSValueTransformer *)routesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2VpnStaticRoute class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSEC2VpnStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSEC2VpnStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSEC2VpnStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipsec.1"] == NSOrderedSame) {
            return @(AWSEC2GatewayTypeIpsec1);
        }
        return @(AWSEC2GatewayTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2GatewayTypeIpsec1:
                return @"ipsec.1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vgwTelemetryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2VgwTelemetry class]];
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
             @"types" : @"Type",
             @"vpcAttachments" : @"VpcAttachments",
             @"vpnGatewayId" : @"VpnGatewayId",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSEC2VpnStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSEC2VpnStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSEC2VpnStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2Tag class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ipsec.1"] == NSOrderedSame) {
            return @(AWSEC2GatewayTypeIpsec1);
        }
        return @(AWSEC2GatewayTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2GatewayTypeIpsec1:
                return @"ipsec.1";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)vpcAttachmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSEC2VpcAttachment class]];
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
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Static"] == NSOrderedSame) {
            return @(AWSEC2VpnStaticRouteSourceStatic);
        }
        return @(AWSEC2VpnStaticRouteSourceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSEC2VpnStaticRouteSourceStatic:
                return @"Static";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"pending"] == NSOrderedSame) {
            return @(AWSEC2VpnStatePending);
        }
        if ([value caseInsensitiveCompare:@"available"] == NSOrderedSame) {
            return @(AWSEC2VpnStateAvailable);
        }
        if ([value caseInsensitiveCompare:@"deleting"] == NSOrderedSame) {
            return @(AWSEC2VpnStateDeleting);
        }
        if ([value caseInsensitiveCompare:@"deleted"] == NSOrderedSame) {
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
            default:
                return nil;
        }
    }];
}

@end
