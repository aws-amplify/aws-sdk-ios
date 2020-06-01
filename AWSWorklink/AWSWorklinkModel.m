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

#import "AWSWorklinkModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSWorklinkErrorDomain = @"com.amazonaws.AWSWorklinkErrorDomain";

@implementation AWSWorklinkAssociateDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acmCertificateArn" : @"AcmCertificateArn",
             @"displayName" : @"DisplayName",
             @"domainName" : @"DomainName",
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkAssociateDomainResponse

@end

@implementation AWSWorklinkAssociateWebsiteAuthorizationProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizationProviderType" : @"AuthorizationProviderType",
             @"domainName" : @"DomainName",
             @"fleetArn" : @"FleetArn",
             };
}

+ (NSValueTransformer *)authorizationProviderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAML"] == NSOrderedSame) {
            return @(AWSWorklinkAuthorizationProviderTypeSaml);
        }
        return @(AWSWorklinkAuthorizationProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorklinkAuthorizationProviderTypeSaml:
                return @"SAML";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorklinkAssociateWebsiteAuthorizationProviderResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizationProviderId" : @"AuthorizationProviderId",
             };
}

@end

@implementation AWSWorklinkAssociateWebsiteCertificateAuthorityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             @"displayName" : @"DisplayName",
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkAssociateWebsiteCertificateAuthorityResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"websiteCaId" : @"WebsiteCaId",
             };
}

@end

@implementation AWSWorklinkCreateFleetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"fleetName" : @"FleetName",
             @"optimizeForEndUserLocation" : @"OptimizeForEndUserLocation",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSWorklinkCreateFleetResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkDeleteFleetRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkDeleteFleetResponse

@end

@implementation AWSWorklinkDescribeAuditStreamConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkDescribeAuditStreamConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auditStreamArn" : @"AuditStreamArn",
             };
}

@end

@implementation AWSWorklinkDescribeCompanyNetworkConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkDescribeCompanyNetworkConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSWorklinkDescribeDevicePolicyConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkDescribeDevicePolicyConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceCaCertificate" : @"DeviceCaCertificate",
             };
}

@end

@implementation AWSWorklinkDescribeDeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceId" : @"DeviceId",
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkDescribeDeviceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"firstAccessedTime" : @"FirstAccessedTime",
             @"lastAccessedTime" : @"LastAccessedTime",
             @"manufacturer" : @"Manufacturer",
             @"model" : @"Model",
             @"operatingSystem" : @"OperatingSystem",
             @"operatingSystemVersion" : @"OperatingSystemVersion",
             @"patchLevel" : @"PatchLevel",
             @"status" : @"Status",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)firstAccessedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastAccessedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSWorklinkDeviceStatusActive);
        }
        if ([value caseInsensitiveCompare:@"SIGNED_OUT"] == NSOrderedSame) {
            return @(AWSWorklinkDeviceStatusSignedOut);
        }
        return @(AWSWorklinkDeviceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorklinkDeviceStatusActive:
                return @"ACTIVE";
            case AWSWorklinkDeviceStatusSignedOut:
                return @"SIGNED_OUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorklinkDescribeDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkDescribeDomainResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acmCertificateArn" : @"AcmCertificateArn",
             @"createdTime" : @"CreatedTime",
             @"displayName" : @"DisplayName",
             @"domainName" : @"DomainName",
             @"domainStatus" : @"DomainStatus",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)domainStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_VALIDATION"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusPendingValidation);
        }
        if ([value caseInsensitiveCompare:@"ASSOCIATING"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusAssociating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"DISASSOCIATING"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusDisassociating);
        }
        if ([value caseInsensitiveCompare:@"DISASSOCIATED"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusDisassociated);
        }
        if ([value caseInsensitiveCompare:@"FAILED_TO_ASSOCIATE"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusFailedToAssociate);
        }
        if ([value caseInsensitiveCompare:@"FAILED_TO_DISASSOCIATE"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusFailedToDisassociate);
        }
        return @(AWSWorklinkDomainStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorklinkDomainStatusPendingValidation:
                return @"PENDING_VALIDATION";
            case AWSWorklinkDomainStatusAssociating:
                return @"ASSOCIATING";
            case AWSWorklinkDomainStatusActive:
                return @"ACTIVE";
            case AWSWorklinkDomainStatusInactive:
                return @"INACTIVE";
            case AWSWorklinkDomainStatusDisassociating:
                return @"DISASSOCIATING";
            case AWSWorklinkDomainStatusDisassociated:
                return @"DISASSOCIATED";
            case AWSWorklinkDomainStatusFailedToAssociate:
                return @"FAILED_TO_ASSOCIATE";
            case AWSWorklinkDomainStatusFailedToDisassociate:
                return @"FAILED_TO_DISASSOCIATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorklinkDescribeFleetMetadataRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkDescribeFleetMetadataResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"companyCode" : @"CompanyCode",
             @"createdTime" : @"CreatedTime",
             @"displayName" : @"DisplayName",
             @"fleetName" : @"FleetName",
             @"fleetStatus" : @"FleetStatus",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"optimizeForEndUserLocation" : @"OptimizeForEndUserLocation",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)fleetStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSWorklinkFleetStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSWorklinkFleetStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSWorklinkFleetStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSWorklinkFleetStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED_TO_CREATE"] == NSOrderedSame) {
            return @(AWSWorklinkFleetStatusFailedToCreate);
        }
        if ([value caseInsensitiveCompare:@"FAILED_TO_DELETE"] == NSOrderedSame) {
            return @(AWSWorklinkFleetStatusFailedToDelete);
        }
        return @(AWSWorklinkFleetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorklinkFleetStatusCreating:
                return @"CREATING";
            case AWSWorklinkFleetStatusActive:
                return @"ACTIVE";
            case AWSWorklinkFleetStatusDeleting:
                return @"DELETING";
            case AWSWorklinkFleetStatusDeleted:
                return @"DELETED";
            case AWSWorklinkFleetStatusFailedToCreate:
                return @"FAILED_TO_CREATE";
            case AWSWorklinkFleetStatusFailedToDelete:
                return @"FAILED_TO_DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSWorklinkDescribeIdentityProviderConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkDescribeIdentityProviderConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityProviderSamlMetadata" : @"IdentityProviderSamlMetadata",
             @"identityProviderType" : @"IdentityProviderType",
             @"serviceProviderSamlMetadata" : @"ServiceProviderSamlMetadata",
             };
}

+ (NSValueTransformer *)identityProviderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAML"] == NSOrderedSame) {
            return @(AWSWorklinkIdentityProviderTypeSaml);
        }
        return @(AWSWorklinkIdentityProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorklinkIdentityProviderTypeSaml:
                return @"SAML";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorklinkDescribeWebsiteCertificateAuthorityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             @"websiteCaId" : @"WebsiteCaId",
             };
}

@end

@implementation AWSWorklinkDescribeWebsiteCertificateAuthorityResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             @"createdTime" : @"CreatedTime",
             @"displayName" : @"DisplayName",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSWorklinkDeviceSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceId" : @"DeviceId",
             @"deviceStatus" : @"DeviceStatus",
             };
}

+ (NSValueTransformer *)deviceStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSWorklinkDeviceStatusActive);
        }
        if ([value caseInsensitiveCompare:@"SIGNED_OUT"] == NSOrderedSame) {
            return @(AWSWorklinkDeviceStatusSignedOut);
        }
        return @(AWSWorklinkDeviceStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorklinkDeviceStatusActive:
                return @"ACTIVE";
            case AWSWorklinkDeviceStatusSignedOut:
                return @"SIGNED_OUT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorklinkDisassociateDomainRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkDisassociateDomainResponse

@end

@implementation AWSWorklinkDisassociateWebsiteAuthorizationProviderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizationProviderId" : @"AuthorizationProviderId",
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkDisassociateWebsiteAuthorizationProviderResponse

@end

@implementation AWSWorklinkDisassociateWebsiteCertificateAuthorityRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             @"websiteCaId" : @"WebsiteCaId",
             };
}

@end

@implementation AWSWorklinkDisassociateWebsiteCertificateAuthorityResponse

@end

@implementation AWSWorklinkDomainSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"CreatedTime",
             @"displayName" : @"DisplayName",
             @"domainName" : @"DomainName",
             @"domainStatus" : @"DomainStatus",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)domainStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PENDING_VALIDATION"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusPendingValidation);
        }
        if ([value caseInsensitiveCompare:@"ASSOCIATING"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusAssociating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusInactive);
        }
        if ([value caseInsensitiveCompare:@"DISASSOCIATING"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusDisassociating);
        }
        if ([value caseInsensitiveCompare:@"DISASSOCIATED"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusDisassociated);
        }
        if ([value caseInsensitiveCompare:@"FAILED_TO_ASSOCIATE"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusFailedToAssociate);
        }
        if ([value caseInsensitiveCompare:@"FAILED_TO_DISASSOCIATE"] == NSOrderedSame) {
            return @(AWSWorklinkDomainStatusFailedToDisassociate);
        }
        return @(AWSWorklinkDomainStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorklinkDomainStatusPendingValidation:
                return @"PENDING_VALIDATION";
            case AWSWorklinkDomainStatusAssociating:
                return @"ASSOCIATING";
            case AWSWorklinkDomainStatusActive:
                return @"ACTIVE";
            case AWSWorklinkDomainStatusInactive:
                return @"INACTIVE";
            case AWSWorklinkDomainStatusDisassociating:
                return @"DISASSOCIATING";
            case AWSWorklinkDomainStatusDisassociated:
                return @"DISASSOCIATED";
            case AWSWorklinkDomainStatusFailedToAssociate:
                return @"FAILED_TO_ASSOCIATE";
            case AWSWorklinkDomainStatusFailedToDisassociate:
                return @"FAILED_TO_DISASSOCIATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorklinkFleetSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"companyCode" : @"CompanyCode",
             @"createdTime" : @"CreatedTime",
             @"displayName" : @"DisplayName",
             @"fleetArn" : @"FleetArn",
             @"fleetName" : @"FleetName",
             @"fleetStatus" : @"FleetStatus",
             @"lastUpdatedTime" : @"LastUpdatedTime",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)fleetStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSWorklinkFleetStatusCreating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSWorklinkFleetStatusActive);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSWorklinkFleetStatusDeleting);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSWorklinkFleetStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"FAILED_TO_CREATE"] == NSOrderedSame) {
            return @(AWSWorklinkFleetStatusFailedToCreate);
        }
        if ([value caseInsensitiveCompare:@"FAILED_TO_DELETE"] == NSOrderedSame) {
            return @(AWSWorklinkFleetStatusFailedToDelete);
        }
        return @(AWSWorklinkFleetStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorklinkFleetStatusCreating:
                return @"CREATING";
            case AWSWorklinkFleetStatusActive:
                return @"ACTIVE";
            case AWSWorklinkFleetStatusDeleting:
                return @"DELETING";
            case AWSWorklinkFleetStatusDeleted:
                return @"DELETED";
            case AWSWorklinkFleetStatusFailedToCreate:
                return @"FAILED_TO_CREATE";
            case AWSWorklinkFleetStatusFailedToDelete:
                return @"FAILED_TO_DELETE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)lastUpdatedTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSWorklinkListDevicesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSWorklinkListDevicesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devices" : @"Devices",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)devicesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorklinkDeviceSummary class]];
}

@end

@implementation AWSWorklinkListDomainsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSWorklinkListDomainsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domains" : @"Domains",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)domainsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorklinkDomainSummary class]];
}

@end

@implementation AWSWorklinkListFleetsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSWorklinkListFleetsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetSummaryList" : @"FleetSummaryList",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)fleetSummaryListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorklinkFleetSummary class]];
}

@end

@implementation AWSWorklinkListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSWorklinkListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSWorklinkListWebsiteAuthorizationProvidersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSWorklinkListWebsiteAuthorizationProvidersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"websiteAuthorizationProviders" : @"WebsiteAuthorizationProviders",
             };
}

+ (NSValueTransformer *)websiteAuthorizationProvidersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorklinkWebsiteAuthorizationProviderSummary class]];
}

@end

@implementation AWSWorklinkListWebsiteCertificateAuthoritiesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSWorklinkListWebsiteCertificateAuthoritiesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"websiteCertificateAuthorities" : @"WebsiteCertificateAuthorities",
             };
}

+ (NSValueTransformer *)websiteCertificateAuthoritiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSWorklinkWebsiteCaSummary class]];
}

@end

@implementation AWSWorklinkRestoreDomainAccessRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkRestoreDomainAccessResponse

@end

@implementation AWSWorklinkRevokeDomainAccessRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainName" : @"DomainName",
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkRevokeDomainAccessResponse

@end

@implementation AWSWorklinkSignOutUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             @"username" : @"Username",
             };
}

@end

@implementation AWSWorklinkSignOutUserResponse

@end

@implementation AWSWorklinkTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSWorklinkTagResourceResponse

@end

@implementation AWSWorklinkUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSWorklinkUntagResourceResponse

@end

@implementation AWSWorklinkUpdateAuditStreamConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"auditStreamArn" : @"AuditStreamArn",
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkUpdateAuditStreamConfigurationResponse

@end

@implementation AWSWorklinkUpdateCompanyNetworkConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             @"securityGroupIds" : @"SecurityGroupIds",
             @"subnetIds" : @"SubnetIds",
             @"vpcId" : @"VpcId",
             };
}

@end

@implementation AWSWorklinkUpdateCompanyNetworkConfigurationResponse

@end

@implementation AWSWorklinkUpdateDevicePolicyConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceCaCertificate" : @"DeviceCaCertificate",
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkUpdateDevicePolicyConfigurationResponse

@end

@implementation AWSWorklinkUpdateDomainMetadataRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"domainName" : @"DomainName",
             @"fleetArn" : @"FleetArn",
             };
}

@end

@implementation AWSWorklinkUpdateDomainMetadataResponse

@end

@implementation AWSWorklinkUpdateFleetMetadataRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"displayName" : @"DisplayName",
             @"fleetArn" : @"FleetArn",
             @"optimizeForEndUserLocation" : @"OptimizeForEndUserLocation",
             };
}

@end

@implementation AWSWorklinkUpdateFleetMetadataResponse

@end

@implementation AWSWorklinkUpdateIdentityProviderConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fleetArn" : @"FleetArn",
             @"identityProviderSamlMetadata" : @"IdentityProviderSamlMetadata",
             @"identityProviderType" : @"IdentityProviderType",
             };
}

+ (NSValueTransformer *)identityProviderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAML"] == NSOrderedSame) {
            return @(AWSWorklinkIdentityProviderTypeSaml);
        }
        return @(AWSWorklinkIdentityProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorklinkIdentityProviderTypeSaml:
                return @"SAML";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSWorklinkUpdateIdentityProviderConfigurationResponse

@end

@implementation AWSWorklinkWebsiteAuthorizationProviderSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorizationProviderId" : @"AuthorizationProviderId",
             @"authorizationProviderType" : @"AuthorizationProviderType",
             @"createdTime" : @"CreatedTime",
             @"domainName" : @"DomainName",
             };
}

+ (NSValueTransformer *)authorizationProviderTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAML"] == NSOrderedSame) {
            return @(AWSWorklinkAuthorizationProviderTypeSaml);
        }
        return @(AWSWorklinkAuthorizationProviderTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSWorklinkAuthorizationProviderTypeSaml:
                return @"SAML";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSWorklinkWebsiteCaSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTime" : @"CreatedTime",
             @"displayName" : @"DisplayName",
             @"websiteCaId" : @"WebsiteCaId",
             };
}

+ (NSValueTransformer *)createdTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end
