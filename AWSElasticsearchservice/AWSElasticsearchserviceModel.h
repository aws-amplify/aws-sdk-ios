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

FOUNDATION_EXPORT NSString *const AWSElasticsearchserviceErrorDomain;

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceErrorType) {
    AWSElasticsearchserviceErrorUnknown,
    AWSElasticsearchserviceErrorAccessDenied,
    AWSElasticsearchserviceErrorBase,
    AWSElasticsearchserviceErrorConflict,
    AWSElasticsearchserviceErrorDisabledOperation,
    AWSElasticsearchserviceErrorInternal,
    AWSElasticsearchserviceErrorInvalidPaginationToken,
    AWSElasticsearchserviceErrorInvalidType,
    AWSElasticsearchserviceErrorLimitExceeded,
    AWSElasticsearchserviceErrorResourceAlreadyExists,
    AWSElasticsearchserviceErrorResourceNotFound,
    AWSElasticsearchserviceErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceDeploymentStatus) {
    AWSElasticsearchserviceDeploymentStatusUnknown,
    AWSElasticsearchserviceDeploymentStatusPendingUpdate,
    AWSElasticsearchserviceDeploymentStatusInProgress,
    AWSElasticsearchserviceDeploymentStatusCompleted,
    AWSElasticsearchserviceDeploymentStatusNotEligible,
    AWSElasticsearchserviceDeploymentStatusEligible,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceDescribePackagesFilterName) {
    AWSElasticsearchserviceDescribePackagesFilterNameUnknown,
    AWSElasticsearchserviceDescribePackagesFilterNamePackageID,
    AWSElasticsearchserviceDescribePackagesFilterNamePackageName,
    AWSElasticsearchserviceDescribePackagesFilterNamePackageStatus,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceDomainPackageStatus) {
    AWSElasticsearchserviceDomainPackageStatusUnknown,
    AWSElasticsearchserviceDomainPackageStatusAssociating,
    AWSElasticsearchserviceDomainPackageStatusAssociationFailed,
    AWSElasticsearchserviceDomainPackageStatusActive,
    AWSElasticsearchserviceDomainPackageStatusDissociating,
    AWSElasticsearchserviceDomainPackageStatusDissociationFailed,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceESPartitionInstanceType) {
    AWSElasticsearchserviceESPartitionInstanceTypeUnknown,
    AWSElasticsearchserviceESPartitionInstanceTypeM3MediumElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeM3LargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeM3XlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeM32xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeM4LargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeM4XlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeM42xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeM44xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeM410xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeM5LargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeM5XlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeM52xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeM54xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeM512xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR5LargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR5XlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR52xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR54xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR512xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeC5LargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeC5XlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeC52xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeC54xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeC59xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeC518xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1MediumElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeUltrawarm1LargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeT2MicroElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeT2SmallElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeT2MediumElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR3LargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR3XlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR32xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR34xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR38xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeI2XlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeI22xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeD2XlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeD22xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeD24xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeD28xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeC4LargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeC4XlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeC42xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeC44xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeC48xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR4LargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR4XlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR42xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR44xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR48xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeR416xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeI3LargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeI3XlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeI32xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeI34xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeI38xlargeElasticsearch,
    AWSElasticsearchserviceESPartitionInstanceTypeI316xlargeElasticsearch,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceESWarmPartitionInstanceType) {
    AWSElasticsearchserviceESWarmPartitionInstanceTypeUnknown,
    AWSElasticsearchserviceESWarmPartitionInstanceTypeUltrawarm1MediumElasticsearch,
    AWSElasticsearchserviceESWarmPartitionInstanceTypeUltrawarm1LargeElasticsearch,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCode) {
    AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeUnknown,
    AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodePendingAcceptance,
    AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeApproved,
    AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeRejecting,
    AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeRejected,
    AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeDeleting,
    AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCodeDeleted,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceLogType) {
    AWSElasticsearchserviceLogTypeUnknown,
    AWSElasticsearchserviceLogTypeIndexSlowLogs,
    AWSElasticsearchserviceLogTypeSearchSlowLogs,
    AWSElasticsearchserviceLogTypeEsApplicationLogs,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceOptionState) {
    AWSElasticsearchserviceOptionStateUnknown,
    AWSElasticsearchserviceOptionStateRequiresIndexDocuments,
    AWSElasticsearchserviceOptionStateProcessing,
    AWSElasticsearchserviceOptionStateActive,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCode) {
    AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeUnknown,
    AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodePendingAcceptance,
    AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeValidating,
    AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeValidationFailed,
    AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeProvisioning,
    AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeActive,
    AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeRejected,
    AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeDeleting,
    AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCodeDeleted,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchservicePackageStatus) {
    AWSElasticsearchservicePackageStatusUnknown,
    AWSElasticsearchservicePackageStatusCopying,
    AWSElasticsearchservicePackageStatusCopyFailed,
    AWSElasticsearchservicePackageStatusValidating,
    AWSElasticsearchservicePackageStatusValidationFailed,
    AWSElasticsearchservicePackageStatusAvailable,
    AWSElasticsearchservicePackageStatusDeleting,
    AWSElasticsearchservicePackageStatusDeleted,
    AWSElasticsearchservicePackageStatusDeleteFailed,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchservicePackageType) {
    AWSElasticsearchservicePackageTypeUnknown,
    AWSElasticsearchservicePackageTypeTxtDictionary,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceReservedElasticsearchInstancePaymentOption) {
    AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionUnknown,
    AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionAllUpfront,
    AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionPartialUpfront,
    AWSElasticsearchserviceReservedElasticsearchInstancePaymentOptionNoUpfront,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceTLSSecurityPolicy) {
    AWSElasticsearchserviceTLSSecurityPolicyUnknown,
    AWSElasticsearchserviceTLSSecurityPolicyPolicyMinTLS10201907,
    AWSElasticsearchserviceTLSSecurityPolicyPolicyMinTLS12201907,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceUpgradeStatus) {
    AWSElasticsearchserviceUpgradeStatusUnknown,
    AWSElasticsearchserviceUpgradeStatusInProgress,
    AWSElasticsearchserviceUpgradeStatusSucceeded,
    AWSElasticsearchserviceUpgradeStatusSucceededWithIssues,
    AWSElasticsearchserviceUpgradeStatusFailed,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceUpgradeStep) {
    AWSElasticsearchserviceUpgradeStepUnknown,
    AWSElasticsearchserviceUpgradeStepPreUpgradeCheck,
    AWSElasticsearchserviceUpgradeStepSnapshot,
    AWSElasticsearchserviceUpgradeStepUpgrade,
};

typedef NS_ENUM(NSInteger, AWSElasticsearchserviceVolumeType) {
    AWSElasticsearchserviceVolumeTypeUnknown,
    AWSElasticsearchserviceVolumeTypeStandard,
    AWSElasticsearchserviceVolumeTypeGp2,
    AWSElasticsearchserviceVolumeTypeIO1,
};

@class AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionRequest;
@class AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionResponse;
@class AWSElasticsearchserviceAccessPoliciesStatus;
@class AWSElasticsearchserviceAddTagsRequest;
@class AWSElasticsearchserviceAdditionalLimit;
@class AWSElasticsearchserviceAdvancedOptionsStatus;
@class AWSElasticsearchserviceAdvancedSecurityOptions;
@class AWSElasticsearchserviceAdvancedSecurityOptionsInput;
@class AWSElasticsearchserviceAdvancedSecurityOptionsStatus;
@class AWSElasticsearchserviceAssociatePackageRequest;
@class AWSElasticsearchserviceAssociatePackageResponse;
@class AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateRequest;
@class AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateResponse;
@class AWSElasticsearchserviceCognitoOptions;
@class AWSElasticsearchserviceCognitoOptionsStatus;
@class AWSElasticsearchserviceCompatibleVersionsMap;
@class AWSElasticsearchserviceCreateElasticsearchDomainRequest;
@class AWSElasticsearchserviceCreateElasticsearchDomainResponse;
@class AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionRequest;
@class AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionResponse;
@class AWSElasticsearchserviceCreatePackageRequest;
@class AWSElasticsearchserviceCreatePackageResponse;
@class AWSElasticsearchserviceDeleteElasticsearchDomainRequest;
@class AWSElasticsearchserviceDeleteElasticsearchDomainResponse;
@class AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionRequest;
@class AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionResponse;
@class AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionRequest;
@class AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionResponse;
@class AWSElasticsearchserviceDeletePackageRequest;
@class AWSElasticsearchserviceDeletePackageResponse;
@class AWSElasticsearchserviceDescribeElasticsearchDomainConfigRequest;
@class AWSElasticsearchserviceDescribeElasticsearchDomainConfigResponse;
@class AWSElasticsearchserviceDescribeElasticsearchDomainRequest;
@class AWSElasticsearchserviceDescribeElasticsearchDomainResponse;
@class AWSElasticsearchserviceDescribeElasticsearchDomainsRequest;
@class AWSElasticsearchserviceDescribeElasticsearchDomainsResponse;
@class AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsRequest;
@class AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsResponse;
@class AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsRequest;
@class AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsResponse;
@class AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsRequest;
@class AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsResponse;
@class AWSElasticsearchserviceDescribePackagesFilter;
@class AWSElasticsearchserviceDescribePackagesRequest;
@class AWSElasticsearchserviceDescribePackagesResponse;
@class AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsRequest;
@class AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsResponse;
@class AWSElasticsearchserviceDescribeReservedElasticsearchInstancesRequest;
@class AWSElasticsearchserviceDescribeReservedElasticsearchInstancesResponse;
@class AWSElasticsearchserviceDissociatePackageRequest;
@class AWSElasticsearchserviceDissociatePackageResponse;
@class AWSElasticsearchserviceDomainEndpointOptions;
@class AWSElasticsearchserviceDomainEndpointOptionsStatus;
@class AWSElasticsearchserviceDomainInfo;
@class AWSElasticsearchserviceDomainInformation;
@class AWSElasticsearchserviceDomainPackageDetails;
@class AWSElasticsearchserviceEBSOptions;
@class AWSElasticsearchserviceEBSOptionsStatus;
@class AWSElasticsearchserviceElasticsearchClusterConfig;
@class AWSElasticsearchserviceElasticsearchClusterConfigStatus;
@class AWSElasticsearchserviceElasticsearchDomainConfig;
@class AWSElasticsearchserviceElasticsearchDomainStatus;
@class AWSElasticsearchserviceElasticsearchVersionStatus;
@class AWSElasticsearchserviceEncryptionAtRestOptions;
@class AWSElasticsearchserviceEncryptionAtRestOptionsStatus;
@class AWSElasticsearchserviceErrorDetails;
@class AWSElasticsearchserviceFilter;
@class AWSElasticsearchserviceGetCompatibleElasticsearchVersionsRequest;
@class AWSElasticsearchserviceGetCompatibleElasticsearchVersionsResponse;
@class AWSElasticsearchserviceGetUpgradeHistoryRequest;
@class AWSElasticsearchserviceGetUpgradeHistoryResponse;
@class AWSElasticsearchserviceGetUpgradeStatusRequest;
@class AWSElasticsearchserviceGetUpgradeStatusResponse;
@class AWSElasticsearchserviceInboundCrossClusterSearchConnection;
@class AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatus;
@class AWSElasticsearchserviceInstanceCountLimits;
@class AWSElasticsearchserviceInstanceLimits;
@class AWSElasticsearchserviceLimits;
@class AWSElasticsearchserviceListDomainNamesResponse;
@class AWSElasticsearchserviceListDomainsForPackageRequest;
@class AWSElasticsearchserviceListDomainsForPackageResponse;
@class AWSElasticsearchserviceListElasticsearchInstanceTypesRequest;
@class AWSElasticsearchserviceListElasticsearchInstanceTypesResponse;
@class AWSElasticsearchserviceListElasticsearchVersionsRequest;
@class AWSElasticsearchserviceListElasticsearchVersionsResponse;
@class AWSElasticsearchserviceListPackagesForDomainRequest;
@class AWSElasticsearchserviceListPackagesForDomainResponse;
@class AWSElasticsearchserviceListTagsRequest;
@class AWSElasticsearchserviceListTagsResponse;
@class AWSElasticsearchserviceLogPublishingOption;
@class AWSElasticsearchserviceLogPublishingOptionsStatus;
@class AWSElasticsearchserviceMasterUserOptions;
@class AWSElasticsearchserviceNodeToNodeEncryptionOptions;
@class AWSElasticsearchserviceNodeToNodeEncryptionOptionsStatus;
@class AWSElasticsearchserviceOptionStatus;
@class AWSElasticsearchserviceOutboundCrossClusterSearchConnection;
@class AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatus;
@class AWSElasticsearchservicePackageDetails;
@class AWSElasticsearchservicePackageSource;
@class AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingRequest;
@class AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingResponse;
@class AWSElasticsearchserviceRecurringCharge;
@class AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionRequest;
@class AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionResponse;
@class AWSElasticsearchserviceRemoveTagsRequest;
@class AWSElasticsearchserviceReservedElasticsearchInstance;
@class AWSElasticsearchserviceReservedElasticsearchInstanceOffering;
@class AWSElasticsearchserviceServiceSoftwareOptions;
@class AWSElasticsearchserviceSnapshotOptions;
@class AWSElasticsearchserviceSnapshotOptionsStatus;
@class AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateRequest;
@class AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateResponse;
@class AWSElasticsearchserviceStorageType;
@class AWSElasticsearchserviceStorageTypeLimit;
@class AWSElasticsearchserviceTag;
@class AWSElasticsearchserviceUpdateElasticsearchDomainConfigRequest;
@class AWSElasticsearchserviceUpdateElasticsearchDomainConfigResponse;
@class AWSElasticsearchserviceUpgradeElasticsearchDomainRequest;
@class AWSElasticsearchserviceUpgradeElasticsearchDomainResponse;
@class AWSElasticsearchserviceUpgradeHistory;
@class AWSElasticsearchserviceUpgradeStepItem;
@class AWSElasticsearchserviceVPCDerivedInfo;
@class AWSElasticsearchserviceVPCDerivedInfoStatus;
@class AWSElasticsearchserviceVPCOptions;
@class AWSElasticsearchserviceZoneAwarenessConfig;

/**
 <p>Container for the parameters to the <code><a>AcceptInboundCrossClusterSearchConnection</a></code> operation.</p>
 Required parameters: [CrossClusterSearchConnectionId]
 */
@interface AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionRequest : AWSRequest


/**
 <p>The id of the inbound connection that you want to accept.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crossClusterSearchConnectionId;

@end

/**
 <p>The result of a <code><a>AcceptInboundCrossClusterSearchConnection</a></code> operation. Contains details of accepted inbound connection.</p>
 */
@interface AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionResponse : AWSModel


/**
 <p>Specifies the <code><a>InboundCrossClusterSearchConnection</a></code> of accepted inbound connection. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceInboundCrossClusterSearchConnection * _Nullable crossClusterSearchConnection;

@end

/**
 <p>The configured access rules for the domain's document and search endpoints, and the current status of those rules.</p>
 Required parameters: [Options, Status]
 */
@interface AWSElasticsearchserviceAccessPoliciesStatus : AWSModel


/**
 <p>The access policy configured for the Elasticsearch domain. Access policies may be resource-based, IP-based, or IAM-based. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-access-policies" target="_blank"> Configuring Access Policies</a>for more information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable options;

/**
 <p>The status of the access policy for the Elasticsearch domain. See <code>OptionStatus</code> for the status information that's included. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOptionStatus * _Nullable status;

@end

/**
 <p>Container for the parameters to the <code><a>AddTags</a></code> operation. Specify the tags that you want to attach to the Elasticsearch domain.</p>
 Required parameters: [ARN, TagList]
 */
@interface AWSElasticsearchserviceAddTagsRequest : AWSRequest


/**
 <p> Specify the <code>ARN</code> for which you want to add the tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p> List of <code>Tag</code> that need to be added for the Elasticsearch domain. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceTag *> * _Nullable tagList;

@end

/**
 <p> List of limits that are specific to a given InstanceType and for each of it's <code><a>InstanceRole</a></code> . </p>
 */
@interface AWSElasticsearchserviceAdditionalLimit : AWSModel


/**
 <p> Name of Additional Limit is specific to a given InstanceType and for each of it's <code><a>InstanceRole</a></code> etc. <br/> Attributes and their details: <br/><ul><li>MaximumNumberOfDataNodesSupported</li> This attribute will be present in Master node only to specify how much data nodes upto which given <code><a>ESPartitionInstanceType</a></code> can support as master node. <li>MaximumNumberOfDataNodesWithoutMasterNode</li> This attribute will be present in Data node only to specify how much data nodes of given <code><a>ESPartitionInstanceType</a></code> upto which you don't need any master nodes to govern them. </ul></p>
 */
@property (nonatomic, strong) NSString * _Nullable limitName;

/**
 <p> Value for given <code><a>AdditionalLimit$LimitName</a></code> . </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable limitValues;

@end

/**
 <p> Status of the advanced options for the specified Elasticsearch domain. Currently, the following advanced options are available:</p><ul><li>Option to allow references to indices in an HTTP request body. Must be <code>false</code> when configuring access to individual sub-resources. By default, the value is <code>true</code>. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options" target="_blank">Configuration Advanced Options</a> for more information.</li><li>Option to specify the percentage of heap space that is allocated to field data. By default, this setting is unbounded.</li></ul><p>For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options">Configuring Advanced Options</a>.</p>
 Required parameters: [Options, Status]
 */
@interface AWSElasticsearchserviceAdvancedOptionsStatus : AWSModel


/**
 <p> Specifies the status of advanced options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable options;

/**
 <p> Specifies the status of <code>OptionStatus</code> for advanced options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOptionStatus * _Nullable status;

@end

/**
 <p>Specifies the advanced security configuration: whether advanced security is enabled, whether the internal database option is enabled.</p>
 */
@interface AWSElasticsearchserviceAdvancedSecurityOptions : AWSModel


/**
 <p>True if advanced security is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>True if the internal user database is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable internalUserDatabaseEnabled;

@end

/**
 <p>Specifies the advanced security configuration: whether advanced security is enabled, whether the internal database option is enabled, master username and password (if internal database is enabled), and master user ARN (if IAM is enabled).</p>
 */
@interface AWSElasticsearchserviceAdvancedSecurityOptionsInput : AWSModel


/**
 <p>True if advanced security is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>True if the internal user database is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable internalUserDatabaseEnabled;

/**
 <p>Credentials for the master user: username and password, ARN, or both.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceMasterUserOptions * _Nullable masterUserOptions;

@end

/**
 <p> Specifies the status of advanced security options for the specified Elasticsearch domain.</p>
 Required parameters: [Options, Status]
 */
@interface AWSElasticsearchserviceAdvancedSecurityOptionsStatus : AWSModel


/**
 <p> Specifies advanced security options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceAdvancedSecurityOptions * _Nullable options;

/**
 <p> Status of the advanced security options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOptionStatus * _Nullable status;

@end

/**
 <p> Container for request parameters to <code><a>AssociatePackage</a></code> operation. </p>
 Required parameters: [PackageID, DomainName]
 */
@interface AWSElasticsearchserviceAssociatePackageRequest : AWSRequest


/**
 <p>Name of the domain that you want to associate the package with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Internal ID of the package that you want to associate with a domain. Use <code>DescribePackages</code> to find this value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable packageID;

@end

/**
 <p> Container for response returned by <code><a>AssociatePackage</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceAssociatePackageResponse : AWSModel


/**
 <p><code>DomainPackageDetails</code></p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainPackageDetails * _Nullable domainPackageDetails;

@end

/**
 <p>Container for the parameters to the <code><a>CancelElasticsearchServiceSoftwareUpdate</a></code> operation. Specifies the name of the Elasticsearch domain that you wish to cancel a service software update on.</p>
 Required parameters: [DomainName]
 */
@interface AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateRequest : AWSRequest


/**
 <p>The name of the domain that you want to stop the latest service software update on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The result of a <code>CancelElasticsearchServiceSoftwareUpdate</code> operation. Contains the status of the update.</p>
 */
@interface AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateResponse : AWSModel


/**
 <p>The current status of the Elasticsearch service software update.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceServiceSoftwareOptions * _Nullable serviceSoftwareOptions;

@end

/**
 <p>Options to specify the Cognito user and identity pools for Kibana authentication. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html" target="_blank">Amazon Cognito Authentication for Kibana</a>.</p>
 */
@interface AWSElasticsearchserviceCognitoOptions : AWSModel


/**
 <p>Specifies the option to enable Cognito for Kibana authentication.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Specifies the Cognito identity pool ID for Kibana authentication.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identityPoolId;

/**
 <p>Specifies the role ARN that provides Elasticsearch permissions for accessing Cognito resources.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>Specifies the Cognito user pool ID for Kibana authentication.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Status of the Cognito options for the specified Elasticsearch domain.</p>
 Required parameters: [Options, Status]
 */
@interface AWSElasticsearchserviceCognitoOptionsStatus : AWSModel


/**
 <p>Specifies the Cognito options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceCognitoOptions * _Nullable options;

/**
 <p>Specifies the status of the Cognito options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOptionStatus * _Nullable status;

@end

/**
 <p> A map from an <code><a>ElasticsearchVersion</a></code> to a list of compatible <code><a>ElasticsearchVersion</a></code> s to which the domain can be upgraded. </p>
 */
@interface AWSElasticsearchserviceCompatibleVersionsMap : AWSModel


/**
 <p>The current version of Elasticsearch on which a domain is.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceVersion;

/**
 <p>List of supported elastic search versions. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable targetVersions;

@end

/**
 
 */
@interface AWSElasticsearchserviceCreateElasticsearchDomainRequest : AWSRequest


/**
 <p> IAM access policy as a JSON-formatted string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicies;

/**
 <p> Option to allow references to indices in an HTTP request body. Must be <code>false</code> when configuring access to individual sub-resources. By default, the value is <code>true</code>. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options" target="_blank">Configuration Advanced Options</a> for more information.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable advancedOptions;

/**
 <p>Specifies advanced security options.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceAdvancedSecurityOptionsInput * _Nullable advancedSecurityOptions;

/**
 <p>Options to specify the Cognito user and identity pools for Kibana authentication. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html" target="_blank">Amazon Cognito Authentication for Kibana</a>.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceCognitoOptions * _Nullable cognitoOptions;

/**
 <p>Options to specify configuration that will be applied to the domain endpoint.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainEndpointOptions * _Nullable domainEndpointOptions;

/**
 <p>The name of the Elasticsearch domain that you are creating. Domain names are unique across the domains owned by an account within an AWS region. Domain names must start with a lowercase letter and can contain the following characters: a-z (lowercase), 0-9, and - (hyphen).</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Options to enable, disable and specify the type and size of EBS storage volumes. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceEBSOptions * _Nullable EBSOptions;

/**
 <p>Configuration options for an Elasticsearch domain. Specifies the instance type and number of instances in the domain cluster. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceElasticsearchClusterConfig * _Nullable elasticsearchClusterConfig;

/**
 <p>String of format X.Y to specify version for the Elasticsearch domain eg. "1.5" or "2.3". For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomains" target="_blank">Creating Elasticsearch Domains</a> in the <i>Amazon Elasticsearch Service Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable elasticsearchVersion;

/**
 <p>Specifies the Encryption At Rest Options.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceEncryptionAtRestOptions * _Nullable encryptionAtRestOptions;

/**
 <p>Map of <code>LogType</code> and <code>LogPublishingOption</code>, each containing options to publish a given type of Elasticsearch log.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSElasticsearchserviceLogPublishingOption *> * _Nullable logPublishingOptions;

/**
 <p>Specifies the NodeToNodeEncryptionOptions.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceNodeToNodeEncryptionOptions * _Nullable nodeToNodeEncryptionOptions;

/**
 <p>Option to set time, in UTC format, of the daily automated snapshot. Default value is 0 hours. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceSnapshotOptions * _Nullable snapshotOptions;

/**
 <p>Options to specify the subnets and security groups for VPC endpoint. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-creating-vpc" target="_blank">Creating a VPC</a> in <i>VPC Endpoints for Amazon Elasticsearch Service Domains</i></p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceVPCOptions * _Nullable VPCOptions;

@end

/**
 <p>The result of a <code>CreateElasticsearchDomain</code> operation. Contains the status of the newly created Elasticsearch domain.</p>
 */
@interface AWSElasticsearchserviceCreateElasticsearchDomainResponse : AWSModel


/**
 <p>The status of the newly created Elasticsearch domain. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceElasticsearchDomainStatus * _Nullable domainStatus;

@end

/**
 <p>Container for the parameters to the <code><a>CreateOutboundCrossClusterSearchConnection</a></code> operation.</p>
 Required parameters: [SourceDomainInfo, DestinationDomainInfo, ConnectionAlias]
 */
@interface AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionRequest : AWSRequest


/**
 <p>Specifies the connection alias that will be used by the customer for this connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionAlias;

/**
 <p>Specifies the <code><a>DomainInformation</a></code> for the destination Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainInformation * _Nullable destinationDomainInfo;

/**
 <p>Specifies the <code><a>DomainInformation</a></code> for the source Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainInformation * _Nullable sourceDomainInfo;

@end

/**
 <p>The result of a <code><a>CreateOutboundCrossClusterSearchConnection</a></code> request. Contains the details of the newly created cross-cluster search connection.</p>
 */
@interface AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionResponse : AWSModel


/**
 <p>Specifies the connection alias provided during the create connection request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionAlias;

/**
 <p>Specifies the <code><a>OutboundCrossClusterSearchConnectionStatus</a></code> for the newly created connection.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatus * _Nullable connectionStatus;

/**
 <p>Unique id for the created outbound connection, which is used for subsequent operations on connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crossClusterSearchConnectionId;

/**
 <p>Specifies the <code><a>DomainInformation</a></code> for the destination Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainInformation * _Nullable destinationDomainInfo;

/**
 <p>Specifies the <code><a>DomainInformation</a></code> for the source Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainInformation * _Nullable sourceDomainInfo;

@end

/**
 <p> Container for request parameters to <code><a>CreatePackage</a></code> operation. </p>
 Required parameters: [PackageName, PackageType, PackageSource]
 */
@interface AWSElasticsearchserviceCreatePackageRequest : AWSRequest


/**
 <p>Description of the package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable packageDescription;

/**
 <p>Unique identifier for the package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable packageName;

/**
 <p>The customer S3 location <code>PackageSource</code> for importing the package.</p>
 */
@property (nonatomic, strong) AWSElasticsearchservicePackageSource * _Nullable packageSource;

/**
 <p>Type of package. Currently supports only TXT-DICTIONARY.</p>
 */
@property (nonatomic, assign) AWSElasticsearchservicePackageType packageType;

@end

/**
 <p> Container for response returned by <code><a>CreatePackage</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceCreatePackageResponse : AWSModel


/**
 <p>Information about the package <code>PackageDetails</code>.</p>
 */
@property (nonatomic, strong) AWSElasticsearchservicePackageDetails * _Nullable packageDetails;

@end

/**
 <p>Container for the parameters to the <code><a>DeleteElasticsearchDomain</a></code> operation. Specifies the name of the Elasticsearch domain that you want to delete.</p>
 Required parameters: [DomainName]
 */
@interface AWSElasticsearchserviceDeleteElasticsearchDomainRequest : AWSRequest


/**
 <p>The name of the Elasticsearch domain that you want to permanently delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The result of a <code>DeleteElasticsearchDomain</code> request. Contains the status of the pending deletion, or no status if the domain and all of its resources have been deleted.</p>
 */
@interface AWSElasticsearchserviceDeleteElasticsearchDomainResponse : AWSModel


/**
 <p>The status of the Elasticsearch domain being deleted.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceElasticsearchDomainStatus * _Nullable domainStatus;

@end

/**
 <p>Container for the parameters to the <code><a>DeleteInboundCrossClusterSearchConnection</a></code> operation.</p>
 Required parameters: [CrossClusterSearchConnectionId]
 */
@interface AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionRequest : AWSRequest


/**
 <p>The id of the inbound connection that you want to permanently delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crossClusterSearchConnectionId;

@end

/**
 <p>The result of a <code><a>DeleteInboundCrossClusterSearchConnection</a></code> operation. Contains details of deleted inbound connection.</p>
 */
@interface AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionResponse : AWSModel


/**
 <p>Specifies the <code><a>InboundCrossClusterSearchConnection</a></code> of deleted inbound connection. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceInboundCrossClusterSearchConnection * _Nullable crossClusterSearchConnection;

@end

/**
 <p>Container for the parameters to the <code><a>DeleteOutboundCrossClusterSearchConnection</a></code> operation.</p>
 Required parameters: [CrossClusterSearchConnectionId]
 */
@interface AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionRequest : AWSRequest


/**
 <p>The id of the outbound connection that you want to permanently delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crossClusterSearchConnectionId;

@end

/**
 <p>The result of a <code><a>DeleteOutboundCrossClusterSearchConnection</a></code> operation. Contains details of deleted outbound connection.</p>
 */
@interface AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionResponse : AWSModel


/**
 <p>Specifies the <code><a>OutboundCrossClusterSearchConnection</a></code> of deleted outbound connection. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOutboundCrossClusterSearchConnection * _Nullable crossClusterSearchConnection;

@end

/**
 <p> Container for request parameters to <code><a>DeletePackage</a></code> operation. </p>
 Required parameters: [PackageID]
 */
@interface AWSElasticsearchserviceDeletePackageRequest : AWSRequest


/**
 <p>Internal ID of the package that you want to delete. Use <code>DescribePackages</code> to find this value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable packageID;

@end

/**
 <p> Container for response parameters to <code><a>DeletePackage</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceDeletePackageResponse : AWSModel


/**
 <p><code>PackageDetails</code></p>
 */
@property (nonatomic, strong) AWSElasticsearchservicePackageDetails * _Nullable packageDetails;

@end

/**
 <p> Container for the parameters to the <code>DescribeElasticsearchDomainConfig</code> operation. Specifies the domain name for which you want configuration information.</p>
 Required parameters: [DomainName]
 */
@interface AWSElasticsearchserviceDescribeElasticsearchDomainConfigRequest : AWSRequest


/**
 <p>The Elasticsearch domain that you want to get information about.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The result of a <code>DescribeElasticsearchDomainConfig</code> request. Contains the configuration information of the requested domain.</p>
 Required parameters: [DomainConfig]
 */
@interface AWSElasticsearchserviceDescribeElasticsearchDomainConfigResponse : AWSModel


/**
 <p>The configuration information of the domain requested in the <code>DescribeElasticsearchDomainConfig</code> request.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceElasticsearchDomainConfig * _Nullable domainConfig;

@end

/**
 <p>Container for the parameters to the <code><a>DescribeElasticsearchDomain</a></code> operation.</p>
 Required parameters: [DomainName]
 */
@interface AWSElasticsearchserviceDescribeElasticsearchDomainRequest : AWSRequest


/**
 <p>The name of the Elasticsearch domain for which you want information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The result of a <code>DescribeElasticsearchDomain</code> request. Contains the status of the domain specified in the request.</p>
 Required parameters: [DomainStatus]
 */
@interface AWSElasticsearchserviceDescribeElasticsearchDomainResponse : AWSModel


/**
 <p>The current status of the Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceElasticsearchDomainStatus * _Nullable domainStatus;

@end

/**
 <p>Container for the parameters to the <code><a>DescribeElasticsearchDomains</a></code> operation. By default, the API returns the status of all Elasticsearch domains.</p>
 Required parameters: [DomainNames]
 */
@interface AWSElasticsearchserviceDescribeElasticsearchDomainsRequest : AWSRequest


/**
 <p>The Elasticsearch domains for which you want information.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable domainNames;

@end

/**
 <p>The result of a <code>DescribeElasticsearchDomains</code> request. Contains the status of the specified domains or all domains owned by the account.</p>
 Required parameters: [DomainStatusList]
 */
@interface AWSElasticsearchserviceDescribeElasticsearchDomainsResponse : AWSModel


/**
 <p>The status of the domains requested in the <code>DescribeElasticsearchDomains</code> request.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceElasticsearchDomainStatus *> * _Nullable domainStatusList;

@end

/**
 <p> Container for the parameters to <code><a>DescribeElasticsearchInstanceTypeLimits</a></code> operation. </p>
 Required parameters: [InstanceType, ElasticsearchVersion]
 */
@interface AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsRequest : AWSRequest


/**
 <p> DomainName represents the name of the Domain that we are trying to modify. This should be present only if we are querying for Elasticsearch <code><a>Limits</a></code> for existing domain. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p> Version of Elasticsearch for which <code><a>Limits</a></code> are needed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable elasticsearchVersion;

/**
 <p> The instance type for an Elasticsearch cluster for which Elasticsearch <code><a>Limits</a></code> are needed. </p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceESPartitionInstanceType instanceType;

@end

/**
 <p> Container for the parameters received from <code><a>DescribeElasticsearchInstanceTypeLimits</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsResponse : AWSModel


/**
 <p> Map of Role of the Instance and Limits that are applicable. Role performed by given Instance in Elasticsearch can be one of the following: <ul><li>data: If the given InstanceType is used as data node</li><li>master: If the given InstanceType is used as master node</li><li>ultra_warm: If the given InstanceType is used as warm node</li></ul></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSElasticsearchserviceLimits *> * _Nullable limitsByRole;

@end

/**
 <p>Container for the parameters to the <code><a>DescribeInboundCrossClusterSearchConnections</a></code> operation.</p>
 */
@interface AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsRequest : AWSRequest


/**
 <p> A list of filters used to match properties for inbound cross-cluster search connection. Available <code><a>Filter</a></code> names for this operation are: <ul><li>cross-cluster-search-connection-id</li><li>source-domain-info.domain-name</li><li>source-domain-info.owner-id</li><li>source-domain-info.region</li><li>destination-domain-info.domain-name</li></ul></p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceFilter *> * _Nullable filters;

/**
 <p>Set this value to limit the number of results returned. If not specified, defaults to 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> NextToken is sent in case the earlier API call results contain the NextToken. It is used for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The result of a <code><a>DescribeInboundCrossClusterSearchConnections</a></code> request. Contains the list of connections matching the filter criteria.</p>
 */
@interface AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsResponse : AWSModel


/**
 <p>Consists of list of <code><a>InboundCrossClusterSearchConnection</a></code> matching the specified filter criteria.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceInboundCrossClusterSearchConnection *> * _Nullable crossClusterSearchConnections;

/**
 <p>If more results are available and NextToken is present, make the next request to the same API with the received NextToken to paginate the remaining results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Container for the parameters to the <code><a>DescribeOutboundCrossClusterSearchConnections</a></code> operation.</p>
 */
@interface AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsRequest : AWSRequest


/**
 <p> A list of filters used to match properties for outbound cross-cluster search connection. Available <code><a>Filter</a></code> names for this operation are: <ul><li>cross-cluster-search-connection-id</li><li>destination-domain-info.domain-name</li><li>destination-domain-info.owner-id</li><li>destination-domain-info.region</li><li>source-domain-info.domain-name</li></ul></p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceFilter *> * _Nullable filters;

/**
 <p>Set this value to limit the number of results returned. If not specified, defaults to 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> NextToken is sent in case the earlier API call results contain the NextToken. It is used for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>The result of a <code><a>DescribeOutboundCrossClusterSearchConnections</a></code> request. Contains the list of connections matching the filter criteria.</p>
 */
@interface AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsResponse : AWSModel


/**
 <p>Consists of list of <code><a>OutboundCrossClusterSearchConnection</a></code> matching the specified filter criteria.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceOutboundCrossClusterSearchConnection *> * _Nullable crossClusterSearchConnections;

/**
 <p>If more results are available and NextToken is present, make the next request to the same API with the received NextToken to paginate the remaining results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Filter to apply in <code>DescribePackage</code> response.</p>
 */
@interface AWSElasticsearchserviceDescribePackagesFilter : AWSModel


/**
 <p>Any field from <code>PackageDetails</code>.</p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceDescribePackagesFilterName name;

/**
 <p>A list of values for the specified field.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable value;

@end

/**
 <p> Container for request parameters to <code><a>DescribePackage</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceDescribePackagesRequest : AWSRequest


/**
 <p>Only returns packages that match the <code>DescribePackagesFilterList</code> values.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceDescribePackagesFilter *> * _Nullable filters;

/**
 <p>Limits results to a maximum number of packages.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Used for pagination. Only necessary if a previous API call includes a non-null NextToken value. If provided, returns results for the next page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> Container for response returned by <code><a>DescribePackages</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceDescribePackagesResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>List of <code>PackageDetails</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchservicePackageDetails *> * _Nullable packageDetailsList;

@end

/**
 <p>Container for parameters to <code>DescribeReservedElasticsearchInstanceOfferings</code></p>
 */
@interface AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsRequest : AWSRequest


/**
 <p>Set this value to limit the number of results returned. If not specified, defaults to 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>NextToken should be sent in case if earlier API call produced result containing NextToken. It is used for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The offering identifier filter value. Use this parameter to show only the available offering that matches the specified reservation identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedElasticsearchInstanceOfferingId;

@end

/**
 <p>Container for results from <code>DescribeReservedElasticsearchInstanceOfferings</code></p>
 */
@interface AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsResponse : AWSModel


/**
 <p>Provides an identifier to allow retrieval of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>List of reserved Elasticsearch instance offerings</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceReservedElasticsearchInstanceOffering *> * _Nullable reservedElasticsearchInstanceOfferings;

@end

/**
 <p>Container for parameters to <code>DescribeReservedElasticsearchInstances</code></p>
 */
@interface AWSElasticsearchserviceDescribeReservedElasticsearchInstancesRequest : AWSRequest


/**
 <p>Set this value to limit the number of results returned. If not specified, defaults to 100.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>NextToken should be sent in case if earlier API call produced result containing NextToken. It is used for pagination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The reserved instance identifier filter value. Use this parameter to show only the reservation that matches the specified reserved Elasticsearch instance ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedElasticsearchInstanceId;

@end

/**
 <p>Container for results from <code>DescribeReservedElasticsearchInstances</code></p>
 */
@interface AWSElasticsearchserviceDescribeReservedElasticsearchInstancesResponse : AWSModel


/**
 <p>Provides an identifier to allow retrieval of paginated results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>List of reserved Elasticsearch instances.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceReservedElasticsearchInstance *> * _Nullable reservedElasticsearchInstances;

@end

/**
 <p> Container for request parameters to <code><a>DissociatePackage</a></code> operation. </p>
 Required parameters: [PackageID, DomainName]
 */
@interface AWSElasticsearchserviceDissociatePackageRequest : AWSRequest


/**
 <p>Name of the domain that you want to associate the package with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Internal ID of the package that you want to associate with a domain. Use <code>DescribePackages</code> to find this value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable packageID;

@end

/**
 <p> Container for response returned by <code><a>DissociatePackage</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceDissociatePackageResponse : AWSModel


/**
 <p><code>DomainPackageDetails</code></p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainPackageDetails * _Nullable domainPackageDetails;

@end

/**
 <p>Options to configure endpoint for the Elasticsearch domain.</p>
 */
@interface AWSElasticsearchserviceDomainEndpointOptions : AWSModel


/**
 <p>Specify if only HTTPS endpoint should be enabled for the Elasticsearch domain.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enforceHTTPS;

/**
 <p>Specify the TLS security policy that needs to be applied to the HTTPS endpoint of Elasticsearch domain. <br/> It can be one of the following values: <ul><li><b>Policy-Min-TLS-1-0-2019-07: </b> TLS security policy which supports TLSv1.0 and higher.</li><li><b>Policy-Min-TLS-1-2-2019-07: </b> TLS security policy which supports only TLSv1.2</li></ul></p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceTLSSecurityPolicy TLSSecurityPolicy;

@end

/**
 <p>The configured endpoint options for the domain and their current status.</p>
 Required parameters: [Options, Status]
 */
@interface AWSElasticsearchserviceDomainEndpointOptionsStatus : AWSModel


/**
 <p>Options to configure endpoint for the Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainEndpointOptions * _Nullable options;

/**
 <p>The status of the endpoint options for the Elasticsearch domain. See <code>OptionStatus</code> for the status information that's included. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOptionStatus * _Nullable status;

@end

/**
 
 */
@interface AWSElasticsearchserviceDomainInfo : AWSModel


/**
 <p> Specifies the <code>DomainName</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 
 */
@interface AWSElasticsearchserviceDomainInformation : AWSModel


/**
 <p>The name of an Elasticsearch domain. Domain names are unique across the domains owned by an account within an AWS region. Domain names start with a letter or number and can contain the following characters: a-z (lowercase), 0-9, and - (hyphen).</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable ownerId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable region;

@end

/**
 <p>Information on a package that is associated with a domain.</p>
 */
@interface AWSElasticsearchserviceDomainPackageDetails : AWSModel


/**
 <p>Name of the domain you've associated a package with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>State of the association. Values are ASSOCIATING/ASSOCIATION_FAILED/ACTIVE/DISSOCIATING/DISSOCIATION_FAILED.</p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceDomainPackageStatus domainPackageStatus;

/**
 <p>Additional information if the package is in an error state. Null otherwise.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceErrorDetails * _Nullable errorDetails;

/**
 <p>Timestamp of the most-recent update to the association status.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdated;

/**
 <p>Internal ID of the package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable packageID;

/**
 <p>User specified name of the package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable packageName;

/**
 <p>Currently supports only TXT-DICTIONARY.</p>
 */
@property (nonatomic, assign) AWSElasticsearchservicePackageType packageType;

/**
 <p>The relative path on Amazon ES nodes, which can be used as synonym_path when the package is synonym file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable referencePath;

@end

/**
 <p>Options to enable, disable, and specify the properties of EBS storage volumes. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-ebs" target="_blank"> Configuring EBS-based Storage</a>.</p>
 */
@interface AWSElasticsearchserviceEBSOptions : AWSModel


/**
 <p>Specifies whether EBS-based storage is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable EBSEnabled;

/**
 <p>Specifies the IOPD for a Provisioned IOPS EBS volume (SSD).</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable iops;

/**
 <p> Integer to specify the size of an EBS volume.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable volumeSize;

/**
 <p> Specifies the volume type for EBS-based storage.</p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceVolumeType volumeType;

@end

/**
 <p> Status of the EBS options for the specified Elasticsearch domain.</p>
 Required parameters: [Options, Status]
 */
@interface AWSElasticsearchserviceEBSOptionsStatus : AWSModel


/**
 <p> Specifies the EBS options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceEBSOptions * _Nullable options;

/**
 <p> Specifies the status of the EBS options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOptionStatus * _Nullable status;

@end

/**
 <p>Specifies the configuration for the domain cluster, such as the type and number of instances.</p>
 */
@interface AWSElasticsearchserviceElasticsearchClusterConfig : AWSModel


/**
 <p>Total number of dedicated master nodes, active and on standby, for the cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dedicatedMasterCount;

/**
 <p>A boolean value to indicate whether a dedicated master node is enabled. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-dedicatedmasternodes" target="_blank">About Dedicated Master Nodes</a> for more information.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable dedicatedMasterEnabled;

/**
 <p>The instance type for a dedicated master node.</p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceESPartitionInstanceType dedicatedMasterType;

/**
 <p>The number of instances in the specified domain cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>The instance type for an Elasticsearch cluster. UltraWarm instance types are not supported for data instances.</p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceESPartitionInstanceType instanceType;

/**
 <p>The number of warm nodes in the cluster.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable warmCount;

/**
 <p>True to enable warm storage.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable warmEnabled;

/**
 <p>The instance type for the Elasticsearch cluster's warm nodes.</p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceESWarmPartitionInstanceType warmType;

/**
 <p>Specifies the zone awareness configuration for a domain when zone awareness is enabled.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceZoneAwarenessConfig * _Nullable zoneAwarenessConfig;

/**
 <p>A boolean value to indicate whether zone awareness is enabled. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-managedomains.html#es-managedomains-zoneawareness" target="_blank">About Zone Awareness</a> for more information.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable zoneAwarenessEnabled;

@end

/**
 <p> Specifies the configuration status for the specified Elasticsearch domain.</p>
 Required parameters: [Options, Status]
 */
@interface AWSElasticsearchserviceElasticsearchClusterConfigStatus : AWSModel


/**
 <p> Specifies the cluster configuration for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceElasticsearchClusterConfig * _Nullable options;

/**
 <p> Specifies the status of the configuration for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOptionStatus * _Nullable status;

@end

/**
 <p>The configuration of an Elasticsearch domain.</p>
 */
@interface AWSElasticsearchserviceElasticsearchDomainConfig : AWSModel


/**
 <p>IAM access policy as a JSON-formatted string.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceAccessPoliciesStatus * _Nullable accessPolicies;

/**
 <p>Specifies the <code>AdvancedOptions</code> for the domain. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options" target="_blank">Configuring Advanced Options</a> for more information.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceAdvancedOptionsStatus * _Nullable advancedOptions;

/**
 <p>Specifies <code>AdvancedSecurityOptions</code> for the domain. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceAdvancedSecurityOptionsStatus * _Nullable advancedSecurityOptions;

/**
 <p>The <code>CognitoOptions</code> for the specified domain. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html" target="_blank">Amazon Cognito Authentication for Kibana</a>.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceCognitoOptionsStatus * _Nullable cognitoOptions;

/**
 <p>Specifies the <code>DomainEndpointOptions</code> for the Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainEndpointOptionsStatus * _Nullable domainEndpointOptions;

/**
 <p>Specifies the <code>EBSOptions</code> for the Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceEBSOptionsStatus * _Nullable EBSOptions;

/**
 <p>Specifies the <code>ElasticsearchClusterConfig</code> for the Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceElasticsearchClusterConfigStatus * _Nullable elasticsearchClusterConfig;

/**
 <p>String of format X.Y to specify version for the Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceElasticsearchVersionStatus * _Nullable elasticsearchVersion;

/**
 <p>Specifies the <code>EncryptionAtRestOptions</code> for the Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceEncryptionAtRestOptionsStatus * _Nullable encryptionAtRestOptions;

/**
 <p>Log publishing options for the given domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceLogPublishingOptionsStatus * _Nullable logPublishingOptions;

/**
 <p>Specifies the <code>NodeToNodeEncryptionOptions</code> for the Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceNodeToNodeEncryptionOptionsStatus * _Nullable nodeToNodeEncryptionOptions;

/**
 <p>Specifies the <code>SnapshotOptions</code> for the Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceSnapshotOptionsStatus * _Nullable snapshotOptions;

/**
 <p>The <code>VPCOptions</code> for the specified domain. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html" target="_blank">VPC Endpoints for Amazon Elasticsearch Service Domains</a>.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceVPCDerivedInfoStatus * _Nullable VPCOptions;

@end

/**
 <p>The current status of an Elasticsearch domain.</p>
 Required parameters: [DomainId, DomainName, ARN, ElasticsearchClusterConfig]
 */
@interface AWSElasticsearchserviceElasticsearchDomainStatus : AWSModel


/**
 <p>The Amazon resource name (ARN) of an Elasticsearch domain. See <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/index.html?Using_Identifiers.html" target="_blank">Identifiers for IAM Entities</a> in <i>Using AWS Identity and Access Management</i> for more information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p> IAM access policy as a JSON-formatted string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicies;

/**
 <p>Specifies the status of the <code>AdvancedOptions</code></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable advancedOptions;

/**
 <p>The current status of the Elasticsearch domain's advanced security options.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceAdvancedSecurityOptions * _Nullable advancedSecurityOptions;

/**
 <p>The <code>CognitoOptions</code> for the specified domain. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html" target="_blank">Amazon Cognito Authentication for Kibana</a>.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceCognitoOptions * _Nullable cognitoOptions;

/**
 <p>The domain creation status. <code>True</code> if the creation of an Elasticsearch domain is complete. <code>False</code> if domain creation is still in progress.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable created;

/**
 <p>The domain deletion status. <code>True</code> if a delete request has been received for the domain but resource cleanup is still in progress. <code>False</code> if the domain has not been deleted. Once domain deletion is complete, the status of the domain is no longer returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deleted;

/**
 <p>The current status of the Elasticsearch domain's endpoint options.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainEndpointOptions * _Nullable domainEndpointOptions;

/**
 <p>The unique identifier for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainId;

/**
 <p>The name of an Elasticsearch domain. Domain names are unique across the domains owned by an account within an AWS region. Domain names start with a letter or number and can contain the following characters: a-z (lowercase), 0-9, and - (hyphen).</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>The <code>EBSOptions</code> for the specified domain. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-ebs" target="_blank">Configuring EBS-based Storage</a> for more information.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceEBSOptions * _Nullable EBSOptions;

/**
 <p>The type and number of instances in the domain cluster.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceElasticsearchClusterConfig * _Nullable elasticsearchClusterConfig;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable elasticsearchVersion;

/**
 <p> Specifies the status of the <code>EncryptionAtRestOptions</code>.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceEncryptionAtRestOptions * _Nullable encryptionAtRestOptions;

/**
 <p>The Elasticsearch domain endpoint that you use to submit index and search requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable endpoint;

/**
 <p>Map containing the Elasticsearch domain endpoints used to submit index and search requests. Example <code>key, value</code>: <code>'vpc','vpc-endpoint-h2dsd34efgyghrtguk5gt6j2foh4.us-east-1.es.amazonaws.com'</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable endpoints;

/**
 <p>Log publishing options for the given domain.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSElasticsearchserviceLogPublishingOption *> * _Nullable logPublishingOptions;

/**
 <p>Specifies the status of the <code>NodeToNodeEncryptionOptions</code>.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceNodeToNodeEncryptionOptions * _Nullable nodeToNodeEncryptionOptions;

/**
 <p>The status of the Elasticsearch domain configuration. <code>True</code> if Amazon Elasticsearch Service is processing configuration changes. <code>False</code> if the configuration is active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable processing;

/**
 <p>The current status of the Elasticsearch domain's service software.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceServiceSoftwareOptions * _Nullable serviceSoftwareOptions;

/**
 <p>Specifies the status of the <code>SnapshotOptions</code></p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceSnapshotOptions * _Nullable snapshotOptions;

/**
 <p>The status of an Elasticsearch domain version upgrade. <code>True</code> if Amazon Elasticsearch Service is undergoing a version upgrade. <code>False</code> if the configuration is active.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable upgradeProcessing;

/**
 <p>The <code>VPCOptions</code> for the specified domain. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html" target="_blank">VPC Endpoints for Amazon Elasticsearch Service Domains</a>.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceVPCDerivedInfo * _Nullable VPCOptions;

@end

/**
 <p> Status of the Elasticsearch version options for the specified Elasticsearch domain.</p>
 Required parameters: [Options, Status]
 */
@interface AWSElasticsearchserviceElasticsearchVersionStatus : AWSModel


/**
 <p> Specifies the Elasticsearch version for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable options;

/**
 <p> Specifies the status of the Elasticsearch version options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOptionStatus * _Nullable status;

@end

/**
 <p>Specifies the Encryption At Rest Options.</p>
 */
@interface AWSElasticsearchserviceEncryptionAtRestOptions : AWSModel


/**
 <p>Specifies the option to enable Encryption At Rest.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p> Specifies the KMS Key ID for Encryption At Rest options.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

@end

/**
 <p> Status of the Encryption At Rest options for the specified Elasticsearch domain.</p>
 Required parameters: [Options, Status]
 */
@interface AWSElasticsearchserviceEncryptionAtRestOptionsStatus : AWSModel


/**
 <p> Specifies the Encryption At Rest options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceEncryptionAtRestOptions * _Nullable options;

/**
 <p> Specifies the status of the Encryption At Rest options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOptionStatus * _Nullable status;

@end

/**
 
 */
@interface AWSElasticsearchserviceErrorDetails : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable errorMessage;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable errorType;

@end

/**
 <p> A filter used to limit results when describing inbound or outbound cross-cluster search connections. Multiple values can be specified per filter. A cross-cluster search connection must match at least one of the specified values for it to be returned from an operation. </p>
 */
@interface AWSElasticsearchserviceFilter : AWSModel


/**
 <p> Specifies the name of the filter. </p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p> Contains one or more values for the filter. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable values;

@end

/**
 <p> Container for request parameters to <code><a>GetCompatibleElasticsearchVersions</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceGetCompatibleElasticsearchVersionsRequest : AWSRequest


/**
 <p>The name of an Elasticsearch domain. Domain names are unique across the domains owned by an account within an AWS region. Domain names start with a letter or number and can contain the following characters: a-z (lowercase), 0-9, and - (hyphen).</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p> Container for response returned by <code><a>GetCompatibleElasticsearchVersions</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceGetCompatibleElasticsearchVersionsResponse : AWSModel


/**
 <p> A map of compatible Elasticsearch versions returned as part of the <code><a>GetCompatibleElasticsearchVersions</a></code> operation. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceCompatibleVersionsMap *> * _Nullable compatibleElasticsearchVersions;

@end

/**
 <p> Container for request parameters to <code><a>GetUpgradeHistory</a></code> operation. </p>
 Required parameters: [DomainName]
 */
@interface AWSElasticsearchserviceGetUpgradeHistoryRequest : AWSRequest


/**
 <p>The name of an Elasticsearch domain. Domain names are unique across the domains owned by an account within an AWS region. Domain names start with a letter or number and can contain the following characters: a-z (lowercase), 0-9, and - (hyphen).</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p> Set this value to limit the number of results returned. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> Paginated APIs accepts NextToken input to returns next page results and provides a NextToken output in the response which can be used by the client to retrieve more results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> Container for response returned by <code><a>GetUpgradeHistory</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceGetUpgradeHistoryResponse : AWSModel


/**
 <p>Pagination token that needs to be supplied to the next call to get the next page of results</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p> A list of <code><a>UpgradeHistory</a></code> objects corresponding to each Upgrade or Upgrade Eligibility Check performed on a domain returned as part of <code><a>GetUpgradeHistoryResponse</a></code> object. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceUpgradeHistory *> * _Nullable upgradeHistories;

@end

/**
 <p> Container for request parameters to <code><a>GetUpgradeStatus</a></code> operation. </p>
 Required parameters: [DomainName]
 */
@interface AWSElasticsearchserviceGetUpgradeStatusRequest : AWSRequest


/**
 <p>The name of an Elasticsearch domain. Domain names are unique across the domains owned by an account within an AWS region. Domain names start with a letter or number and can contain the following characters: a-z (lowercase), 0-9, and - (hyphen).</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p> Container for response returned by <code><a>GetUpgradeStatus</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceGetUpgradeStatusResponse : AWSModel


/**
 <p> One of 4 statuses that a step can go through returned as part of the <code><a>GetUpgradeStatusResponse</a></code> object. The status can take one of the following values: <ul><li>In Progress</li><li>Succeeded</li><li>Succeeded with Issues</li><li>Failed</li></ul></p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceUpgradeStatus stepStatus;

/**
 <p>A string that describes the update briefly</p>
 */
@property (nonatomic, strong) NSString * _Nullable upgradeName;

/**
 <p> Represents one of 3 steps that an Upgrade or Upgrade Eligibility Check does through: <ul><li>PreUpgradeCheck</li><li>Snapshot</li><li>Upgrade</li></ul></p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceUpgradeStep upgradeStep;

@end

/**
 <p>Specifies details of an inbound connection.</p>
 */
@interface AWSElasticsearchserviceInboundCrossClusterSearchConnection : AWSModel


/**
 <p>Specifies the <code><a>InboundCrossClusterSearchConnectionStatus</a></code> for the outbound connection.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatus * _Nullable connectionStatus;

/**
 <p>Specifies the connection id for the inbound cross-cluster search connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crossClusterSearchConnectionId;

/**
 <p>Specifies the <code><a>DomainInformation</a></code> for the destination Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainInformation * _Nullable destinationDomainInfo;

/**
 <p>Specifies the <code><a>DomainInformation</a></code> for the source Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainInformation * _Nullable sourceDomainInfo;

@end

/**
 <p>Specifies the coonection status of an inbound cross-cluster search connection.</p>
 */
@interface AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatus : AWSModel


/**
 <p>Specifies verbose information for the inbound connection status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The state code for inbound connection. This can be one of the following:</p><ul><li>PENDING_ACCEPTANCE: Inbound connection is not yet accepted by destination domain owner.</li><li>APPROVED: Inbound connection is pending acceptance by destination domain owner.</li><li>REJECTING: Inbound connection rejection is in process.</li><li>REJECTED: Inbound connection is rejected.</li><li>DELETING: Inbound connection deletion is in progress.</li><li>DELETED: Inbound connection is deleted and cannot be used further.</li></ul>
 */
@property (nonatomic, assign) AWSElasticsearchserviceInboundCrossClusterSearchConnectionStatusCode statusCode;

@end

/**
 <p> InstanceCountLimits represents the limits on number of instances that be created in Amazon Elasticsearch for given InstanceType. </p>
 */
@interface AWSElasticsearchserviceInstanceCountLimits : AWSModel


/**
 <p> Maximum number of Instances that can be instantiated for given InstanceType. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maximumInstanceCount;

/**
 <p> Minimum number of Instances that can be instantiated for given InstanceType. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimumInstanceCount;

@end

/**
 <p>InstanceLimits represents the list of instance related attributes that are available for given InstanceType. </p>
 */
@interface AWSElasticsearchserviceInstanceLimits : AWSModel


/**
 <p> InstanceCountLimits represents the limits on number of instances that be created in Amazon Elasticsearch for given InstanceType. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceInstanceCountLimits * _Nullable instanceCountLimits;

@end

/**
 <p> Limits for given InstanceType and for each of it's role. <br/> Limits contains following <code><a>StorageTypes,</a></code><code><a>InstanceLimits</a></code> and <code><a>AdditionalLimits</a></code></p>
 */
@interface AWSElasticsearchserviceLimits : AWSModel


/**
 <p> List of additional limits that are specific to a given InstanceType and for each of it's <code><a>InstanceRole</a></code> . </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceAdditionalLimit *> * _Nullable additionalLimits;

/**
 <p>InstanceLimits represents the list of instance related attributes that are available for given InstanceType. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceInstanceLimits * _Nullable instanceLimits;

/**
 <p>StorageType represents the list of storage related types and attributes that are available for given InstanceType. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceStorageType *> * _Nullable storageTypes;

@end

/**
 <p>The result of a <code>ListDomainNames</code> operation. Contains the names of all Elasticsearch domains owned by this account.</p>
 */
@interface AWSElasticsearchserviceListDomainNamesResponse : AWSModel


/**
 <p>List of Elasticsearch domain names.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceDomainInfo *> * _Nullable domainNames;

@end

/**
 <p> Container for request parameters to <code><a>ListDomainsForPackage</a></code> operation. </p>
 Required parameters: [PackageID]
 */
@interface AWSElasticsearchserviceListDomainsForPackageRequest : AWSRequest


/**
 <p>Limits results to a maximum number of domains.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Used for pagination. Only necessary if a previous API call includes a non-null NextToken value. If provided, returns results for the next page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The package for which to list domains.</p>
 */
@property (nonatomic, strong) NSString * _Nullable packageID;

@end

/**
 <p> Container for response parameters to <code><a>ListDomainsForPackage</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceListDomainsForPackageResponse : AWSModel


/**
 <p>List of <code>DomainPackageDetails</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceDomainPackageDetails *> * _Nullable domainPackageDetailsList;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> Container for the parameters to the <code><a>ListElasticsearchInstanceTypes</a></code> operation. </p>
 Required parameters: [ElasticsearchVersion]
 */
@interface AWSElasticsearchserviceListElasticsearchInstanceTypesRequest : AWSRequest


/**
 <p>DomainName represents the name of the Domain that we are trying to modify. This should be present only if we are querying for list of available Elasticsearch instance types when modifying existing domain. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Version of Elasticsearch for which list of supported elasticsearch instance types are needed. </p>
 */
@property (nonatomic, strong) NSString * _Nullable elasticsearchVersion;

/**
 <p> Set this value to limit the number of results returned. Value provided must be greater than 30 else it wont be honored. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>NextToken should be sent in case if earlier API call produced result containing NextToken. It is used for pagination. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> Container for the parameters returned by <code><a>ListElasticsearchInstanceTypes</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceListElasticsearchInstanceTypesResponse : AWSModel


/**
 <p> List of instance types supported by Amazon Elasticsearch service for given <code><a>ElasticsearchVersion</a></code></p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable elasticsearchInstanceTypes;

/**
 <p>In case if there are more results available NextToken would be present, make further request to the same API with received NextToken to paginate remaining results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> Container for the parameters to the <code><a>ListElasticsearchVersions</a></code> operation. <p> Use <code><a>MaxResults</a></code> to control the maximum number of results to retrieve in a single call. </p><p> Use <code><a>NextToken</a></code> in response to retrieve more results. If the received response does not contain a NextToken, then there are no more results to retrieve. </p></p>
 */
@interface AWSElasticsearchserviceListElasticsearchVersionsRequest : AWSRequest


/**
 <p> Set this value to limit the number of results returned. Value provided must be greater than 10 else it wont be honored. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p> Paginated APIs accepts NextToken input to returns next page results and provides a NextToken output in the response which can be used by the client to retrieve more results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> Container for the parameters for response received from <code><a>ListElasticsearchVersions</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceListElasticsearchVersionsResponse : AWSModel


/**
 <p>List of supported elastic search versions. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable elasticsearchVersions;

/**
 <p> Paginated APIs accepts NextToken input to returns next page results and provides a NextToken output in the response which can be used by the client to retrieve more results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> Container for request parameters to <code><a>ListPackagesForDomain</a></code> operation. </p>
 Required parameters: [DomainName]
 */
@interface AWSElasticsearchserviceListPackagesForDomainRequest : AWSRequest


/**
 <p>The name of the domain for which you want to list associated packages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Limits results to a maximum number of packages.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Used for pagination. Only necessary if a previous API call includes a non-null NextToken value. If provided, returns results for the next page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p> Container for response parameters to <code><a>ListPackagesForDomain</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceListPackagesForDomainResponse : AWSModel


/**
 <p>List of <code>DomainPackageDetails</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceDomainPackageDetails *> * _Nullable domainPackageDetailsList;

/**
 <p>Pagination token that needs to be supplied to the next call to get the next page of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Container for the parameters to the <code><a>ListTags</a></code> operation. Specify the <code>ARN</code> for the Elasticsearch domain to which the tags are attached that you want to view are attached.</p>
 Required parameters: [ARN]
 */
@interface AWSElasticsearchserviceListTagsRequest : AWSRequest


/**
 <p> Specify the <code>ARN</code> for the Elasticsearch domain to which the tags are attached that you want to view.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

@end

/**
 <p>The result of a <code>ListTags</code> operation. Contains tags for all requested Elasticsearch domains.</p>
 */
@interface AWSElasticsearchserviceListTagsResponse : AWSModel


/**
 <p> List of <code>Tag</code> for the requested Elasticsearch domain.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceTag *> * _Nullable tagList;

@end

/**
 <p>Log Publishing option that is set for given domain. <br/>Attributes and their details: <ul><li>CloudWatchLogsLogGroupArn: ARN of the Cloudwatch log group to which log needs to be published.</li><li>Enabled: Whether the log publishing for given log type is enabled or not</li></ul></p>
 */
@interface AWSElasticsearchserviceLogPublishingOption : AWSModel


/**
 <p>ARN of the Cloudwatch log group to which log needs to be published.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudWatchLogsLogGroupArn;

/**
 <p> Specifies whether given log publishing option is enabled or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>The configured log publishing options for the domain and their current status.</p>
 */
@interface AWSElasticsearchserviceLogPublishingOptionsStatus : AWSModel


/**
 <p>The log publishing options configured for the Elasticsearch domain.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSElasticsearchserviceLogPublishingOption *> * _Nullable options;

/**
 <p>The status of the log publishing options for the Elasticsearch domain. See <code>OptionStatus</code> for the status information that's included. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOptionStatus * _Nullable status;

@end

/**
 <p>Credentials for the master user: username and password, ARN, or both.</p>
 */
@interface AWSElasticsearchserviceMasterUserOptions : AWSModel


/**
 <p>ARN for the master user (if IAM is enabled).</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserARN;

/**
 <p>The master user's username, which is stored in the Amazon Elasticsearch Service domain's internal database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserName;

/**
 <p>The master user's password, which is stored in the Amazon Elasticsearch Service domain's internal database.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterUserPassword;

@end

/**
 <p>Specifies the node-to-node encryption options.</p>
 */
@interface AWSElasticsearchserviceNodeToNodeEncryptionOptions : AWSModel


/**
 <p>Specify true to enable node-to-node encryption.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>Status of the node-to-node encryption options for the specified Elasticsearch domain.</p>
 Required parameters: [Options, Status]
 */
@interface AWSElasticsearchserviceNodeToNodeEncryptionOptionsStatus : AWSModel


/**
 <p>Specifies the node-to-node encryption options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceNodeToNodeEncryptionOptions * _Nullable options;

/**
 <p>Specifies the status of the node-to-node encryption options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOptionStatus * _Nullable status;

@end

/**
 <p>Provides the current status of the entity.</p>
 Required parameters: [CreationDate, UpdateDate, State]
 */
@interface AWSElasticsearchserviceOptionStatus : AWSModel


/**
 <p>Timestamp which tells the creation date for the entity.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>Indicates whether the Elasticsearch domain is being deleted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable pendingDeletion;

/**
 <p>Provides the <code>OptionState</code> for the Elasticsearch domain.</p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceOptionState state;

/**
 <p>Timestamp which tells the last updated time for the entity.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateDate;

/**
 <p>Specifies the latest version for the entity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable updateVersion;

@end

/**
 <p>Specifies details of an outbound connection.</p>
 */
@interface AWSElasticsearchserviceOutboundCrossClusterSearchConnection : AWSModel


/**
 <p>Specifies the connection alias for the outbound cross-cluster search connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionAlias;

/**
 <p>Specifies the <code><a>OutboundCrossClusterSearchConnectionStatus</a></code> for the outbound connection.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatus * _Nullable connectionStatus;

/**
 <p>Specifies the connection id for the outbound cross-cluster search connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crossClusterSearchConnectionId;

/**
 <p>Specifies the <code><a>DomainInformation</a></code> for the destination Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainInformation * _Nullable destinationDomainInfo;

/**
 <p>Specifies the <code><a>DomainInformation</a></code> for the source Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainInformation * _Nullable sourceDomainInfo;

@end

/**
 <p>Specifies the connection status of an outbound cross-cluster search connection.</p>
 */
@interface AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatus : AWSModel


/**
 <p>Specifies verbose information for the outbound connection status.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The state code for outbound connection. This can be one of the following:</p><ul><li>VALIDATING: The outbound connection request is being validated.</li><li>VALIDATION_FAILED: Validation failed for the connection request.</li><li>PENDING_ACCEPTANCE: Outbound connection request is validated and is not yet accepted by destination domain owner.</li><li>PROVISIONING: Outbound connection request is in process.</li><li>ACTIVE: Outbound connection is active and ready to use.</li><li>REJECTED: Outbound connection request is rejected by destination domain owner.</li><li>DELETING: Outbound connection deletion is in progress.</li><li>DELETED: Outbound connection is deleted and cannot be used further.</li></ul>
 */
@property (nonatomic, assign) AWSElasticsearchserviceOutboundCrossClusterSearchConnectionStatusCode statusCode;

@end

/**
 <p>Basic information about a package.</p>
 */
@interface AWSElasticsearchservicePackageDetails : AWSModel


/**
 <p>Timestamp which tells creation date of the package.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createdAt;

/**
 <p>Additional information if the package is in an error state. Null otherwise.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceErrorDetails * _Nullable errorDetails;

/**
 <p>User-specified description of the package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable packageDescription;

/**
 <p>Internal ID of the package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable packageID;

/**
 <p>User specified name of the package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable packageName;

/**
 <p>Current state of the package. Values are COPYING/COPY_FAILED/AVAILABLE/DELETING/DELETE_FAILED</p>
 */
@property (nonatomic, assign) AWSElasticsearchservicePackageStatus packageStatus;

/**
 <p>Currently supports only TXT-DICTIONARY.</p>
 */
@property (nonatomic, assign) AWSElasticsearchservicePackageType packageType;

@end

/**
 <p>The S3 location for importing the package specified as <code>S3BucketName</code> and <code>S3Key</code></p>
 */
@interface AWSElasticsearchservicePackageSource : AWSModel


/**
 <p>Name of the bucket containing the package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3BucketName;

/**
 <p>Key (file name) of the package.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Key;

@end

/**
 <p>Container for parameters to <code>PurchaseReservedElasticsearchInstanceOffering</code></p>
 Required parameters: [ReservedElasticsearchInstanceOfferingId, ReservationName]
 */
@interface AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingRequest : AWSRequest


/**
 <p>The number of Elasticsearch instances to reserve.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable instanceCount;

/**
 <p>A customer-specified identifier to track this reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservationName;

/**
 <p>The ID of the reserved Elasticsearch instance offering to purchase.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedElasticsearchInstanceOfferingId;

@end

/**
 <p>Represents the output of a <code>PurchaseReservedElasticsearchInstanceOffering</code> operation.</p>
 */
@interface AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingResponse : AWSModel


/**
 <p>The customer-specified identifier used to track this reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservationName;

/**
 <p>Details of the reserved Elasticsearch instance which was purchased.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedElasticsearchInstanceId;

@end

/**
 <p>Contains the specific price and frequency of a recurring charges for a reserved Elasticsearch instance, or for a reserved Elasticsearch instance offering.</p>
 */
@interface AWSElasticsearchserviceRecurringCharge : AWSModel


/**
 <p>The monetary amount of the recurring charge.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable recurringChargeAmount;

/**
 <p>The frequency of the recurring charge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable recurringChargeFrequency;

@end

/**
 <p>Container for the parameters to the <code><a>RejectInboundCrossClusterSearchConnection</a></code> operation.</p>
 Required parameters: [CrossClusterSearchConnectionId]
 */
@interface AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionRequest : AWSRequest


/**
 <p>The id of the inbound connection that you want to reject.</p>
 */
@property (nonatomic, strong) NSString * _Nullable crossClusterSearchConnectionId;

@end

/**
 <p>The result of a <code><a>RejectInboundCrossClusterSearchConnection</a></code> operation. Contains details of rejected inbound connection.</p>
 */
@interface AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionResponse : AWSModel


/**
 <p>Specifies the <code><a>InboundCrossClusterSearchConnection</a></code> of rejected inbound connection. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceInboundCrossClusterSearchConnection * _Nullable crossClusterSearchConnection;

@end

/**
 <p>Container for the parameters to the <code><a>RemoveTags</a></code> operation. Specify the <code>ARN</code> for the Elasticsearch domain from which you want to remove the specified <code>TagKey</code>.</p>
 Required parameters: [ARN, TagKeys]
 */
@interface AWSElasticsearchserviceRemoveTagsRequest : AWSRequest


/**
 <p>Specifies the <code>ARN</code> for the Elasticsearch domain from which you want to delete the specified tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ARN;

/**
 <p>Specifies the <code>TagKey</code> list which you want to remove from the Elasticsearch domain.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 <p>Details of a reserved Elasticsearch instance.</p>
 */
@interface AWSElasticsearchserviceReservedElasticsearchInstance : AWSModel


/**
 <p>The currency code for the reserved Elasticsearch instance offering.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 <p>The duration, in seconds, for which the Elasticsearch instance is reserved.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The number of Elasticsearch instances that have been reserved.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable elasticsearchInstanceCount;

/**
 <p>The Elasticsearch instance type offered by the reserved instance offering.</p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceESPartitionInstanceType elasticsearchInstanceType;

/**
 <p>The upfront fixed charge you will paid to purchase the specific reserved Elasticsearch instance offering. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 <p>The payment option as defined in the reserved Elasticsearch instance offering.</p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceReservedElasticsearchInstancePaymentOption paymentOption;

/**
 <p>The charge to your account regardless of whether you are creating any domains using the instance offering.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceRecurringCharge *> * _Nullable recurringCharges;

/**
 <p>The customer-specified identifier to track this reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservationName;

/**
 <p>The unique identifier for the reservation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedElasticsearchInstanceId;

/**
 <p>The offering identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedElasticsearchInstanceOfferingId;

/**
 <p>The time the reservation started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTime;

/**
 <p>The state of the reserved Elasticsearch instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable state;

/**
 <p>The rate you are charged for each hour for the domain that is using this reserved instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 <p>Details of a reserved Elasticsearch instance offering.</p>
 */
@interface AWSElasticsearchserviceReservedElasticsearchInstanceOffering : AWSModel


/**
 <p>The currency code for the reserved Elasticsearch instance offering.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currencyCode;

/**
 <p>The duration, in seconds, for which the offering will reserve the Elasticsearch instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable duration;

/**
 <p>The Elasticsearch instance type offered by the reserved instance offering.</p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceESPartitionInstanceType elasticsearchInstanceType;

/**
 <p>The upfront fixed charge you will pay to purchase the specific reserved Elasticsearch instance offering. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable fixedPrice;

/**
 <p>Payment option for the reserved Elasticsearch instance offering</p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceReservedElasticsearchInstancePaymentOption paymentOption;

/**
 <p>The charge to your account regardless of whether you are creating any domains using the instance offering.</p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceRecurringCharge *> * _Nullable recurringCharges;

/**
 <p>The Elasticsearch reserved instance offering identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reservedElasticsearchInstanceOfferingId;

/**
 <p>The rate you are charged for each hour the domain that is using the offering is running.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable usagePrice;

@end

/**
 <p>The current options of an Elasticsearch domain service software options.</p>
 */
@interface AWSElasticsearchserviceServiceSoftwareOptions : AWSModel


/**
 <p>Timestamp, in Epoch time, until which you can manually request a service software update. After this date, we automatically update your service software.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable automatedUpdateDate;

/**
 <p><code>True</code> if you are able to cancel your service software version update. <code>False</code> if you are not able to cancel your service software version. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable cancellable;

/**
 <p>The current service software version that is present on the domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable currentVersion;

/**
 <p>The description of the <code>UpdateStatus</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The new service software version if one is available.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestVersion;

/**
 <p><code>True</code> if a service software is never automatically updated. <code>False</code> if a service software is automatically updated after <code>AutomatedUpdateDate</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable optionalDeployment;

/**
 <p><code>True</code> if you are able to update you service software version. <code>False</code> if you are not able to update your service software version. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable updateAvailable;

/**
 <p>The status of your service software update. This field can take the following values: <code>ELIGIBLE</code>, <code>PENDING_UPDATE</code>, <code>IN_PROGRESS</code>, <code>COMPLETED</code>, and <code>NOT_ELIGIBLE</code>.</p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceDeploymentStatus updateStatus;

@end

/**
 <p>Specifies the time, in UTC format, when the service takes a daily automated snapshot of the specified Elasticsearch domain. Default value is <code>0</code> hours.</p>
 */
@interface AWSElasticsearchserviceSnapshotOptions : AWSModel


/**
 <p>Specifies the time, in UTC format, when the service takes a daily automated snapshot of the specified Elasticsearch domain. Default value is <code>0</code> hours.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable automatedSnapshotStartHour;

@end

/**
 <p>Status of a daily automated snapshot.</p>
 Required parameters: [Options, Status]
 */
@interface AWSElasticsearchserviceSnapshotOptionsStatus : AWSModel


/**
 <p>Specifies the daily snapshot options specified for the Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceSnapshotOptions * _Nullable options;

/**
 <p>Specifies the status of a daily automated snapshot.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOptionStatus * _Nullable status;

@end

/**
 <p>Container for the parameters to the <code><a>StartElasticsearchServiceSoftwareUpdate</a></code> operation. Specifies the name of the Elasticsearch domain that you wish to schedule a service software update on.</p>
 Required parameters: [DomainName]
 */
@interface AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateRequest : AWSRequest


/**
 <p>The name of the domain that you want to update to the latest service software.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

@end

/**
 <p>The result of a <code>StartElasticsearchServiceSoftwareUpdate</code> operation. Contains the status of the update.</p>
 */
@interface AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateResponse : AWSModel


/**
 <p>The current status of the Elasticsearch service software update.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceServiceSoftwareOptions * _Nullable serviceSoftwareOptions;

@end

/**
 <p>StorageTypes represents the list of storage related types and their attributes that are available for given InstanceType. </p>
 */
@interface AWSElasticsearchserviceStorageType : AWSModel


/**
 <p> SubType of the given storage type. List of available sub-storage options: For "instance" storageType we wont have any storageSubType, in case of "ebs" storageType we will have following valid storageSubTypes <ol><li>standard</li><li>gp2</li><li>io1</li></ol> Refer <code><a>VolumeType</a></code> for more information regarding above EBS storage options. </p>
 */
@property (nonatomic, strong) NSString * _Nullable storageSubTypeName;

/**
 <p>List of limits that are applicable for given storage type. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceStorageTypeLimit *> * _Nullable storageTypeLimits;

/**
 <p> Type of the storage. List of available storage options: <ol><li>instance</li> Inbuilt storage available for the given Instance <li>ebs</li> Elastic block storage that would be attached to the given Instance </ol></p>
 */
@property (nonatomic, strong) NSString * _Nullable storageTypeName;

@end

/**
 <p>Limits that are applicable for given storage type. </p>
 */
@interface AWSElasticsearchserviceStorageTypeLimit : AWSModel


/**
 <p> Name of storage limits that are applicable for given storage type. If <code><a>StorageType</a></code> is ebs, following storage options are applicable <ol><li>MinimumVolumeSize</li> Minimum amount of volume size that is applicable for given storage type.It can be empty if it is not applicable. <li>MaximumVolumeSize</li> Maximum amount of volume size that is applicable for given storage type.It can be empty if it is not applicable. <li>MaximumIops</li> Maximum amount of Iops that is applicable for given storage type.It can be empty if it is not applicable. <li>MinimumIops</li> Minimum amount of Iops that is applicable for given storage type.It can be empty if it is not applicable. </ol></p>
 */
@property (nonatomic, strong) NSString * _Nullable limitName;

/**
 <p> Values for the <code><a>StorageTypeLimit$LimitName</a></code> . </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable limitValues;

@end

/**
 <p>Specifies a key value pair for a resource tag.</p>
 Required parameters: [Key, Value]
 */
@interface AWSElasticsearchserviceTag : AWSModel


/**
 <p>Specifies the <code>TagKey</code>, the name of the tag. Tag keys must be unique for the Elasticsearch domain to which they are attached.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>Specifies the <code>TagValue</code>, the value assigned to the corresponding tag key. Tag values can be null and do not have to be unique in a tag set. For example, you can have a key value pair in a tag set of <code>project : Trinity</code> and <code>cost-center : Trinity</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 <p>Container for the parameters to the <code><a>UpdateElasticsearchDomain</a></code> operation. Specifies the type and number of instances in the domain cluster.</p>
 Required parameters: [DomainName]
 */
@interface AWSElasticsearchserviceUpdateElasticsearchDomainConfigRequest : AWSRequest


/**
 <p>IAM access policy as a JSON-formatted string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessPolicies;

/**
 <p>Modifies the advanced option to allow references to indices in an HTTP request body. Must be <code>false</code> when configuring access to individual sub-resources. By default, the value is <code>true</code>. See <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-createupdatedomains.html#es-createdomain-configure-advanced-options" target="_blank">Configuration Advanced Options</a> for more information.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable advancedOptions;

/**
 <p>Specifies advanced security options.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceAdvancedSecurityOptionsInput * _Nullable advancedSecurityOptions;

/**
 <p>Options to specify the Cognito user and identity pools for Kibana authentication. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html" target="_blank">Amazon Cognito Authentication for Kibana</a>.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceCognitoOptions * _Nullable cognitoOptions;

/**
 <p>Options to specify configuration that will be applied to the domain endpoint.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceDomainEndpointOptions * _Nullable domainEndpointOptions;

/**
 <p>The name of the Elasticsearch domain that you are updating. </p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p>Specify the type and size of the EBS volume that you want to use. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceEBSOptions * _Nullable EBSOptions;

/**
 <p>The type and number of instances to instantiate for the domain cluster.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceElasticsearchClusterConfig * _Nullable elasticsearchClusterConfig;

/**
 <p>Map of <code>LogType</code> and <code>LogPublishingOption</code>, each containing options to publish a given type of Elasticsearch log.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSElasticsearchserviceLogPublishingOption *> * _Nullable logPublishingOptions;

/**
 <p>Option to set the time, in UTC format, for the daily automated snapshot. Default value is <code>0</code> hours. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceSnapshotOptions * _Nullable snapshotOptions;

/**
 <p>Options to specify the subnets and security groups for VPC endpoint. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html#es-creating-vpc" target="_blank">Creating a VPC</a> in <i>VPC Endpoints for Amazon Elasticsearch Service Domains</i></p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceVPCOptions * _Nullable VPCOptions;

@end

/**
 <p>The result of an <code>UpdateElasticsearchDomain</code> request. Contains the status of the Elasticsearch domain being updated.</p>
 Required parameters: [DomainConfig]
 */
@interface AWSElasticsearchserviceUpdateElasticsearchDomainConfigResponse : AWSModel


/**
 <p>The status of the updated Elasticsearch domain. </p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceElasticsearchDomainConfig * _Nullable domainConfig;

@end

/**
 <p> Container for request parameters to <code><a>UpgradeElasticsearchDomain</a></code> operation. </p>
 Required parameters: [DomainName, TargetVersion]
 */
@interface AWSElasticsearchserviceUpgradeElasticsearchDomainRequest : AWSRequest


/**
 <p>The name of an Elasticsearch domain. Domain names are unique across the domains owned by an account within an AWS region. Domain names start with a letter or number and can contain the following characters: a-z (lowercase), 0-9, and - (hyphen).</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p> This flag, when set to True, indicates that an Upgrade Eligibility Check needs to be performed. This will not actually perform the Upgrade. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performCheckOnly;

/**
 <p>The version of Elasticsearch that you intend to upgrade the domain to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetVersion;

@end

/**
 <p> Container for response returned by <code><a>UpgradeElasticsearchDomain</a></code> operation. </p>
 */
@interface AWSElasticsearchserviceUpgradeElasticsearchDomainResponse : AWSModel


/**
 <p>The name of an Elasticsearch domain. Domain names are unique across the domains owned by an account within an AWS region. Domain names start with a letter or number and can contain the following characters: a-z (lowercase), 0-9, and - (hyphen).</p>
 */
@property (nonatomic, strong) NSString * _Nullable domainName;

/**
 <p> This flag, when set to True, indicates that an Upgrade Eligibility Check needs to be performed. This will not actually perform the Upgrade. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable performCheckOnly;

/**
 <p>The version of Elasticsearch that you intend to upgrade the domain to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable targetVersion;

@end

/**
 <p>History of the last 10 Upgrades and Upgrade Eligibility Checks.</p>
 */
@interface AWSElasticsearchserviceUpgradeHistory : AWSModel


/**
 <p>UTC Timestamp at which the Upgrade API call was made in "yyyy-MM-ddTHH:mm:ssZ" format.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startTimestamp;

/**
 <p> A list of <code><a>UpgradeStepItem</a></code> s representing information about each step performed as pard of a specific Upgrade or Upgrade Eligibility Check. </p>
 */
@property (nonatomic, strong) NSArray<AWSElasticsearchserviceUpgradeStepItem *> * _Nullable stepsList;

/**
 <p>A string that describes the update briefly</p>
 */
@property (nonatomic, strong) NSString * _Nullable upgradeName;

/**
 <p> The overall status of the update. The status can take one of the following values: <ul><li>In Progress</li><li>Succeeded</li><li>Succeeded with Issues</li><li>Failed</li></ul></p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceUpgradeStatus upgradeStatus;

@end

/**
 <p>Represents a single step of the Upgrade or Upgrade Eligibility Check workflow.</p>
 */
@interface AWSElasticsearchserviceUpgradeStepItem : AWSModel


/**
 <p>A list of strings containing detailed information about the errors encountered in a particular step.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable issues;

/**
 <p>The Floating point value representing progress percentage of a particular step.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable progressPercent;

/**
 <p> Represents one of 3 steps that an Upgrade or Upgrade Eligibility Check does through: <ul><li>PreUpgradeCheck</li><li>Snapshot</li><li>Upgrade</li></ul></p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceUpgradeStep upgradeStep;

/**
 <p> The status of a particular step during an upgrade. The status can take one of the following values: <ul><li>In Progress</li><li>Succeeded</li><li>Succeeded with Issues</li><li>Failed</li></ul></p>
 */
@property (nonatomic, assign) AWSElasticsearchserviceUpgradeStatus upgradeStepStatus;

@end

/**
 <p>Options to specify the subnets and security groups for VPC endpoint. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html" target="_blank"> VPC Endpoints for Amazon Elasticsearch Service Domains</a>.</p>
 */
@interface AWSElasticsearchserviceVPCDerivedInfo : AWSModel


/**
 <p>The availability zones for the Elasticsearch domain. Exists only if the domain was created with VPCOptions.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable availabilityZones;

/**
 <p>Specifies the security groups for VPC endpoint.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>Specifies the subnets for VPC endpoint.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

/**
 <p>The VPC Id for the Elasticsearch domain. Exists only if the domain was created with VPCOptions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable VPCId;

@end

/**
 <p> Status of the VPC options for the specified Elasticsearch domain.</p>
 Required parameters: [Options, Status]
 */
@interface AWSElasticsearchserviceVPCDerivedInfoStatus : AWSModel


/**
 <p> Specifies the VPC options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceVPCDerivedInfo * _Nullable options;

/**
 <p> Specifies the status of the VPC options for the specified Elasticsearch domain.</p>
 */
@property (nonatomic, strong) AWSElasticsearchserviceOptionStatus * _Nullable status;

@end

/**
 <p>Options to specify the subnets and security groups for VPC endpoint. For more information, see <a href="http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-vpc.html" target="_blank"> VPC Endpoints for Amazon Elasticsearch Service Domains</a>.</p>
 */
@interface AWSElasticsearchserviceVPCOptions : AWSModel


/**
 <p>Specifies the security groups for VPC endpoint.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable securityGroupIds;

/**
 <p>Specifies the subnets for VPC endpoint.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subnetIds;

@end

/**
 <p>Specifies the zone awareness configuration for the domain cluster, such as the number of availability zones.</p>
 */
@interface AWSElasticsearchserviceZoneAwarenessConfig : AWSModel


/**
 <p>An integer value to indicate the number of availability zones for a domain when zone awareness is enabled. This should be equal to number of subnets if VPC endpoints is enabled</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable availabilityZoneCount;

@end

NS_ASSUME_NONNULL_END
