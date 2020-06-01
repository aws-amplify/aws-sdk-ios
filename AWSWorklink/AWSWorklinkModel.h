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

FOUNDATION_EXPORT NSString *const AWSWorklinkErrorDomain;

typedef NS_ENUM(NSInteger, AWSWorklinkErrorType) {
    AWSWorklinkErrorUnknown,
    AWSWorklinkErrorInternalServerError,
    AWSWorklinkErrorInvalidRequest,
    AWSWorklinkErrorResourceAlreadyExists,
    AWSWorklinkErrorResourceNotFound,
    AWSWorklinkErrorTooManyRequests,
    AWSWorklinkErrorUnauthorized,
};

typedef NS_ENUM(NSInteger, AWSWorklinkAuthorizationProviderType) {
    AWSWorklinkAuthorizationProviderTypeUnknown,
    AWSWorklinkAuthorizationProviderTypeSaml,
};

typedef NS_ENUM(NSInteger, AWSWorklinkDeviceStatus) {
    AWSWorklinkDeviceStatusUnknown,
    AWSWorklinkDeviceStatusActive,
    AWSWorklinkDeviceStatusSignedOut,
};

typedef NS_ENUM(NSInteger, AWSWorklinkDomainStatus) {
    AWSWorklinkDomainStatusUnknown,
    AWSWorklinkDomainStatusPendingValidation,
    AWSWorklinkDomainStatusAssociating,
    AWSWorklinkDomainStatusActive,
    AWSWorklinkDomainStatusInactive,
    AWSWorklinkDomainStatusDisassociating,
    AWSWorklinkDomainStatusDisassociated,
    AWSWorklinkDomainStatusFailedToAssociate,
    AWSWorklinkDomainStatusFailedToDisassociate,
};

typedef NS_ENUM(NSInteger, AWSWorklinkFleetStatus) {
    AWSWorklinkFleetStatusUnknown,
    AWSWorklinkFleetStatusCreating,
    AWSWorklinkFleetStatusActive,
    AWSWorklinkFleetStatusDeleting,
    AWSWorklinkFleetStatusDeleted,
    AWSWorklinkFleetStatusFailedToCreate,
    AWSWorklinkFleetStatusFailedToDelete,
};

typedef NS_ENUM(NSInteger, AWSWorklinkIdentityProviderType) {
    AWSWorklinkIdentityProviderTypeUnknown,
    AWSWorklinkIdentityProviderTypeSaml,
};

@class AWSWorklinkAssociateDomainRequest;
@class AWSWorklinkAssociateDomainResponse;
@class AWSWorklinkAssociateWebsiteAuthorizationProviderRequest;
@class AWSWorklinkAssociateWebsiteAuthorizationProviderResponse;
@class AWSWorklinkAssociateWebsiteCertificateAuthorityRequest;
@class AWSWorklinkAssociateWebsiteCertificateAuthorityResponse;
@class AWSWorklinkCreateFleetRequest;
@class AWSWorklinkCreateFleetResponse;
@class AWSWorklinkDeleteFleetRequest;
@class AWSWorklinkDeleteFleetResponse;
@class AWSWorklinkDescribeAuditStreamConfigurationRequest;
@class AWSWorklinkDescribeAuditStreamConfigurationResponse;
@class AWSWorklinkDescribeCompanyNetworkConfigurationRequest;
@class AWSWorklinkDescribeCompanyNetworkConfigurationResponse;
@class AWSWorklinkDescribeDevicePolicyConfigurationRequest;
@class AWSWorklinkDescribeDevicePolicyConfigurationResponse;
@class AWSWorklinkDescribeDeviceRequest;
@class AWSWorklinkDescribeDeviceResponse;
@class AWSWorklinkDescribeDomainRequest;
@class AWSWorklinkDescribeDomainResponse;
@class AWSWorklinkDescribeFleetMetadataRequest;
@class AWSWorklinkDescribeFleetMetadataResponse;
@class AWSWorklinkDescribeIdentityProviderConfigurationRequest;
@class AWSWorklinkDescribeIdentityProviderConfigurationResponse;
@class AWSWorklinkDescribeWebsiteCertificateAuthorityRequest;
@class AWSWorklinkDescribeWebsiteCertificateAuthorityResponse;
@class AWSWorklinkDeviceSummary;
@class AWSWorklinkDisassociateDomainRequest;
@class AWSWorklinkDisassociateDomainResponse;
@class AWSWorklinkDisassociateWebsiteAuthorizationProviderRequest;
@class AWSWorklinkDisassociateWebsiteAuthorizationProviderResponse;
@class AWSWorklinkDisassociateWebsiteCertificateAuthorityRequest;
@class AWSWorklinkDisassociateWebsiteCertificateAuthorityResponse;
@class AWSWorklinkDomainSummary;
@class AWSWorklinkFleetSummary;
@class AWSWorklinkListDevicesRequest;
@class AWSWorklinkListDevicesResponse;
@class AWSWorklinkListDomainsRequest;
@class AWSWorklinkListDomainsResponse;
@class AWSWorklinkListFleetsRequest;
@class AWSWorklinkListFleetsResponse;
@class AWSWorklinkListTagsForResourceRequest;
@class AWSWorklinkListTagsForResourceResponse;
@class AWSWorklinkListWebsiteAuthorizationProvidersRequest;
@class AWSWorklinkListWebsiteAuthorizationProvidersResponse;
@class AWSWorklinkListWebsiteCertificateAuthoritiesRequest;
@class AWSWorklinkListWebsiteCertificateAuthoritiesResponse;
@class AWSWorklinkRestoreDomainAccessRequest;
@class AWSWorklinkRestoreDomainAccessResponse;
@class AWSWorklinkRevokeDomainAccessRequest;
@class AWSWorklinkRevokeDomainAccessResponse;
@class AWSWorklinkSignOutUserRequest;
@class AWSWorklinkSignOutUserResponse;
@class AWSWorklinkTagResourceRequest;
@class AWSWorklinkTagResourceResponse;
@class AWSWorklinkUntagResourceRequest;
@class AWSWorklinkUntagResourceResponse;
@class AWSWorklinkUpdateAuditStreamConfigurationRequest;
@class AWSWorklinkUpdateAuditStreamConfigurationResponse;
@class AWSWorklinkUpdateCompanyNetworkConfigurationRequest;
@class AWSWorklinkUpdateCompanyNetworkConfigurationResponse;
@class AWSWorklinkUpdateDevicePolicyConfigurationRequest;
@class AWSWorklinkUpdateDevicePolicyConfigurationResponse;
@class AWSWorklinkUpdateDomainMetadataRequest;
@class AWSWorklinkUpdateDomainMetadataResponse;
@class AWSWorklinkUpdateFleetMetadataRequest;
@class AWSWorklinkUpdateFleetMetadataResponse;
@class AWSWorklinkUpdateIdentityProviderConfigurationRequest;
@class AWSWorklinkUpdateIdentityProviderConfigurationResponse;
@class AWSWorklinkWebsiteAuthorizationProviderSummary;
@class AWSWorklinkWebsiteCaSummary;

/**
 
 */
@interface AWSWorklinkAssociateDomainRequest : AWSRequest


/**
 <p>The ARN of an issued ACM certificate that is valid for the domain being associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable acmCertificateArn;

/**
 <p>The name to display.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The fully qualified domain name (FQDN).</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The Amazon Resource Name (ARN) of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkAssociateDomainResponse : AWSModel


@end

/**
 
 */
@interface AWSWorklinkAssociateWebsiteAuthorizationProviderRequest : AWSRequest


/**
 <p>The authorization provider type.</p>
 */
@property (nonatomic, assign) AWSWorklinkAuthorizationProviderType authorizationProviderType;

/**
 <p>The domain name of the authorization provider. This applies only to SAML-based authorization providers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkAssociateWebsiteAuthorizationProviderResponse : AWSModel


/**
 <p>A unique identifier for the authorization provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizationProviderId;

@end

/**
 
 */
@interface AWSWorklinkAssociateWebsiteCertificateAuthorityRequest : AWSRequest


/**
 <p>The root certificate of the CA.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 <p>The certificate name to display.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkAssociateWebsiteCertificateAuthorityResponse : AWSModel


/**
 <p>A unique identifier for the CA.</p>
 */
@property (nonatomic, strong) NSString * _Nullable websiteCaId;

@end

/**
 
 */
@interface AWSWorklinkCreateFleetRequest : AWSRequest


/**
 <p>The fleet name to display.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>A unique name for the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetName;

/**
 <p>The option to optimize for better performance by routing traffic through the closest AWS Region to users, which may be outside of your home Region.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable optimizeForEndUserLocation;

/**
 <p> The tags to add to the resource. A tag is a key-value pair.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSWorklinkCreateFleetResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkDeleteFleetRequest : AWSRequest


/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkDeleteFleetResponse : AWSModel


@end

/**
 
 */
@interface AWSWorklinkDescribeAuditStreamConfigurationRequest : AWSRequest


/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkDescribeAuditStreamConfigurationResponse : AWSModel


/**
 <p>The ARN of the Amazon Kinesis data stream that will receive the audit events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable auditStreamArn;

@end

/**
 
 */
@interface AWSWorklinkDescribeCompanyNetworkConfigurationRequest : AWSRequest


/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkDescribeCompanyNetworkConfigurationResponse : AWSModel


/**
 <p>The security groups associated with access to the provided subnets.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The subnets used for X-ENI connections from Amazon WorkLink rendering containers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The VPC with connectivity to associated websites.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 
 */
@interface AWSWorklinkDescribeDevicePolicyConfigurationRequest : AWSRequest


/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkDescribeDevicePolicyConfigurationResponse : AWSModel


/**
 <p>The certificate chain, including intermediate certificates and the root certificate authority certificate used to issue device certificates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceCaCertificate;

@end

/**
 
 */
@interface AWSWorklinkDescribeDeviceRequest : AWSRequest


/**
 <p>A unique identifier for a registered user's device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkDescribeDeviceResponse : AWSModel


/**
 <p>The date that the device first signed in to Amazon WorkLink.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable firstAccessedTime;

/**
 <p>The date that the device last accessed Amazon WorkLink.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAccessedTime;

/**
 <p>The manufacturer of the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable manufacturer;

/**
 <p>The model of the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable model;

/**
 <p>The operating system of the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operatingSystem;

/**
 <p>The operating system version of the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable operatingSystemVersion;

/**
 <p>The operating system patch level of the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable patchLevel;

/**
 <p>The current state of the device.</p>
 */
@property (nonatomic, assign) AWSWorklinkDeviceStatus status;

/**
 <p>The user name associated with the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSWorklinkDescribeDomainRequest : AWSRequest


/**
 <p>The name of the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkDescribeDomainResponse : AWSModel


/**
 <p>The ARN of an issued ACM certificate that is valid for the domain being associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable acmCertificateArn;

/**
 <p>The time that the domain was added.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The name to display.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The name of the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The current state for the domain.</p>
 */
@property (nonatomic, assign) AWSWorklinkDomainStatus domainStatus;

@end

/**
 
 */
@interface AWSWorklinkDescribeFleetMetadataRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkDescribeFleetMetadataResponse : AWSModel


/**
 <p>The identifier used by users to sign in to the Amazon WorkLink app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable companyCode;

/**
 <p>The time that the fleet was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The name to display.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The name of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetName;

/**
 <p>The current state of the fleet.</p>
 */
@property (nonatomic, assign) AWSWorklinkFleetStatus fleetStatus;

/**
 <p>The time that the fleet was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The option to optimize for better performance by routing traffic through the closest AWS Region to users, which may be outside of your home Region.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable optimizeForEndUserLocation;

/**
 <p>The tags attached to the resource. A tag is a key-value pair.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSWorklinkDescribeIdentityProviderConfigurationRequest : AWSRequest


/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkDescribeIdentityProviderConfigurationResponse : AWSModel


/**
 <p>The SAML metadata document provided by the user’s identity provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityProviderSamlMetadata;

/**
 <p>The type of identity provider.</p>
 */
@property (nonatomic, assign) AWSWorklinkIdentityProviderType identityProviderType;

/**
 <p>The SAML metadata document uploaded to the user’s identity provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceProviderSamlMetadata;

@end

/**
 
 */
@interface AWSWorklinkDescribeWebsiteCertificateAuthorityRequest : AWSRequest


/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

/**
 <p>A unique identifier for the certificate authority.</p>
 */
@property (nonatomic, strong) NSString * _Nullable websiteCaId;

@end

/**
 
 */
@interface AWSWorklinkDescribeWebsiteCertificateAuthorityResponse : AWSModel


/**
 <p>The root certificate of the certificate authority.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

/**
 <p>The time that the certificate authority was added.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The certificate name to display.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

@end

/**
 <p>The summary of devices.</p>
 */
@interface AWSWorklinkDeviceSummary : AWSModel


/**
 <p>The ID of the device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>The status of the device.</p>
 */
@property (nonatomic, assign) AWSWorklinkDeviceStatus deviceStatus;

@end

/**
 
 */
@interface AWSWorklinkDisassociateDomainRequest : AWSRequest


/**
 <p>The name of the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkDisassociateDomainResponse : AWSModel


@end

/**
 
 */
@interface AWSWorklinkDisassociateWebsiteAuthorizationProviderRequest : AWSRequest


/**
 <p>A unique identifier for the authorization provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizationProviderId;

/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkDisassociateWebsiteAuthorizationProviderResponse : AWSModel


@end

/**
 
 */
@interface AWSWorklinkDisassociateWebsiteCertificateAuthorityRequest : AWSRequest


/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

/**
 <p>A unique identifier for the CA.</p>
 */
@property (nonatomic, strong) NSString * _Nullable websiteCaId;

@end

/**
 
 */
@interface AWSWorklinkDisassociateWebsiteCertificateAuthorityResponse : AWSModel


@end

/**
 <p>The summary of the domain.</p>
 Required parameters: [DomainName, CreatedTime, DomainStatus]
 */
@interface AWSWorklinkDomainSummary : AWSModel


/**
 <p>The time that the domain was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The name to display.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The name of the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The status of the domain.</p>
 */
@property (nonatomic, assign) AWSWorklinkDomainStatus domainStatus;

@end

/**
 <p>The summary of the fleet.</p>
 */
@interface AWSWorklinkFleetSummary : AWSModel


/**
 <p>The identifier used by users to sign into the Amazon WorkLink app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable companyCode;

/**
 <p>The time when the fleet was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The name of the fleet to display.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The Amazon Resource Name (ARN) of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

/**
 <p>The name of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetName;

/**
 <p>The status of the fleet.</p>
 */
@property (nonatomic, assign) AWSWorklinkFleetStatus fleetStatus;

/**
 <p>The time when the fleet was last updated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTime;

/**
 <p>The tags attached to the resource. A tag is a key-value pair.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSWorklinkListDevicesRequest : AWSRequest


/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

/**
 <p>The maximum number of results to be included in the next page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token used to retrieve the next page of results for this operation. If this value is null, it retrieves the first page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSWorklinkListDevicesResponse : AWSModel


/**
 <p>Information about the devices.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorklinkDeviceSummary *> * _Nullable devices;

/**
 <p>The pagination token used to retrieve the next page of results for this operation. If there are no more pages, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSWorklinkListDomainsRequest : AWSRequest


/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

/**
 <p>The maximum number of results to be included in the next page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token used to retrieve the next page of results for this operation. If this value is null, it retrieves the first page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSWorklinkListDomainsResponse : AWSModel


/**
 <p>Information about the domains.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorklinkDomainSummary *> * _Nullable domains;

/**
 <p>The pagination token used to retrieve the next page of results for this operation. If there are no more pages, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSWorklinkListFleetsRequest : AWSRequest


/**
 <p>The maximum number of results to be included in the next page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token used to retrieve the next page of results for this operation. If this value is null, it retrieves the first page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSWorklinkListFleetsResponse : AWSModel


/**
 <p>The summary list of the fleets.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorklinkFleetSummary *> * _Nullable fleetSummaryList;

/**
 <p>The pagination token used to retrieve the next page of results for this operation. If there are no more pages, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSWorklinkListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSWorklinkListTagsForResourceResponse : AWSModel


/**
 <p>The tags attached to the resource. A tag is a key-value pair.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSWorklinkListWebsiteAuthorizationProvidersRequest : AWSRequest


/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

/**
 <p>The maximum number of results to be included in the next page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token to use to retrieve the next page of results for this operation. If this value is null, it retrieves the first page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSWorklinkListWebsiteAuthorizationProvidersResponse : AWSModel


/**
 <p>The pagination token to use to retrieve the next page of results for this operation. If this value is null, it retrieves the first page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The website authorization providers.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorklinkWebsiteAuthorizationProviderSummary *> * _Nullable websiteAuthorizationProviders;

@end

/**
 
 */
@interface AWSWorklinkListWebsiteCertificateAuthoritiesRequest : AWSRequest


/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

/**
 <p>The maximum number of results to be included in the next page.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token used to retrieve the next page of results for this operation. If this value is null, it retrieves the first page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSWorklinkListWebsiteCertificateAuthoritiesResponse : AWSModel


/**
 <p>The pagination token used to retrieve the next page of results for this operation. If there are no more pages, this value is null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Information about the certificates.</p>
 */
@property (nonatomic, strong) NSArray<AWSWorklinkWebsiteCaSummary *> * _Nullable websiteCertificateAuthorities;

@end

/**
 
 */
@interface AWSWorklinkRestoreDomainAccessRequest : AWSRequest


/**
 <p>The name of the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkRestoreDomainAccessResponse : AWSModel


@end

/**
 
 */
@interface AWSWorklinkRevokeDomainAccessRequest : AWSRequest


/**
 <p>The name of the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkRevokeDomainAccessResponse : AWSModel


@end

/**
 
 */
@interface AWSWorklinkSignOutUserRequest : AWSRequest


/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

/**
 <p>The name of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSWorklinkSignOutUserResponse : AWSModel


@end

/**
 
 */
@interface AWSWorklinkTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags to add to the resource. A tag is a key-value pair.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSWorklinkTagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSWorklinkUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The list of tag keys to remove from the resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSWorklinkUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSWorklinkUpdateAuditStreamConfigurationRequest : AWSRequest


/**
 <p>The ARN of the Amazon Kinesis data stream that receives the audit events.</p>
 */
@property (nonatomic, strong) NSString * _Nullable auditStreamArn;

/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkUpdateAuditStreamConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSWorklinkUpdateCompanyNetworkConfigurationRequest : AWSRequest


/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

/**
 <p>The security groups associated with access to the provided subnets.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>The subnets used for X-ENI connections from Amazon WorkLink rendering containers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The VPC with connectivity to associated websites.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 
 */
@interface AWSWorklinkUpdateCompanyNetworkConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSWorklinkUpdateDevicePolicyConfigurationRequest : AWSRequest


/**
 <p>The certificate chain, including intermediate certificates and the root certificate authority certificate used to issue device certificates.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceCaCertificate;

/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkUpdateDevicePolicyConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSWorklinkUpdateDomainMetadataRequest : AWSRequest


/**
 <p>The name to display.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The name of the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

@end

/**
 
 */
@interface AWSWorklinkUpdateDomainMetadataResponse : AWSModel


@end

/**
 
 */
@interface AWSWorklinkUpdateFleetMetadataRequest : AWSRequest


/**
 <p>The fleet name to display. The existing DisplayName is unset if null is passed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

/**
 <p>The option to optimize for better performance by routing traffic through the closest AWS Region to users, which may be outside of your home Region.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable optimizeForEndUserLocation;

@end

/**
 
 */
@interface AWSWorklinkUpdateFleetMetadataResponse : AWSModel


@end

/**
 
 */
@interface AWSWorklinkUpdateIdentityProviderConfigurationRequest : AWSRequest


/**
 <p>The ARN of the fleet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fleetArn;

/**
 <p>The SAML metadata document provided by the customer’s identity provider. The existing IdentityProviderSamlMetadata is unset if null is passed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityProviderSamlMetadata;

/**
 <p>The type of identity provider.</p>
 */
@property (nonatomic, assign) AWSWorklinkIdentityProviderType identityProviderType;

@end

/**
 
 */
@interface AWSWorklinkUpdateIdentityProviderConfigurationResponse : AWSModel


@end

/**
 <p>The summary of the website authorization provider.</p>
 Required parameters: [AuthorizationProviderType]
 */
@interface AWSWorklinkWebsiteAuthorizationProviderSummary : AWSModel


/**
 <p>A unique identifier for the authorization provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authorizationProviderId;

/**
 <p>The authorization provider type.</p>
 */
@property (nonatomic, assign) AWSWorklinkAuthorizationProviderType authorizationProviderType;

/**
 <p>The time of creation.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The domain name of the authorization provider. This applies only to SAML-based authorization providers.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The summary of the certificate authority (CA).</p>
 */
@interface AWSWorklinkWebsiteCaSummary : AWSModel


/**
 <p>The time when the CA was added.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdTime;

/**
 <p>The name to display.</p>
 */
@property (nonatomic, strong) NSString * _Nullable displayName;

/**
 <p>A unique identifier for the CA.</p>
 */
@property (nonatomic, strong) NSString * _Nullable websiteCaId;

@end

NS_ASSUME_NONNULL_END
