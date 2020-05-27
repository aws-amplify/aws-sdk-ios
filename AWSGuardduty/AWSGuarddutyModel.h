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

FOUNDATION_EXPORT NSString *const AWSGuarddutyErrorDomain;

typedef NS_ENUM(NSInteger, AWSGuarddutyErrorType) {
    AWSGuarddutyErrorUnknown,
    AWSGuarddutyErrorBadRequest,
    AWSGuarddutyErrorInternalServerError,
};

typedef NS_ENUM(NSInteger, AWSGuarddutyAdminStatus) {
    AWSGuarddutyAdminStatusUnknown,
    AWSGuarddutyAdminStatusEnabled,
    AWSGuarddutyAdminStatusDisableInProgress,
};

typedef NS_ENUM(NSInteger, AWSGuarddutyDestinationType) {
    AWSGuarddutyDestinationTypeUnknown,
    AWSGuarddutyDestinationTypeS3,
};

typedef NS_ENUM(NSInteger, AWSGuarddutyDetectorStatus) {
    AWSGuarddutyDetectorStatusUnknown,
    AWSGuarddutyDetectorStatusEnabled,
    AWSGuarddutyDetectorStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSGuarddutyFeedback) {
    AWSGuarddutyFeedbackUnknown,
    AWSGuarddutyFeedbackUseful,
    AWSGuarddutyFeedbackNotUseful,
};

typedef NS_ENUM(NSInteger, AWSGuarddutyFilterAction) {
    AWSGuarddutyFilterActionUnknown,
    AWSGuarddutyFilterActionNoop,
    AWSGuarddutyFilterActionArchive,
};

typedef NS_ENUM(NSInteger, AWSGuarddutyFindingPublishingFrequency) {
    AWSGuarddutyFindingPublishingFrequencyUnknown,
    AWSGuarddutyFindingPublishingFrequencyFifteenMinutes,
    AWSGuarddutyFindingPublishingFrequencyOneHour,
    AWSGuarddutyFindingPublishingFrequencySixHours,
};

typedef NS_ENUM(NSInteger, AWSGuarddutyFindingStatisticType) {
    AWSGuarddutyFindingStatisticTypeUnknown,
    AWSGuarddutyFindingStatisticTypeCountBySeverity,
};

typedef NS_ENUM(NSInteger, AWSGuarddutyIpSetFormat) {
    AWSGuarddutyIpSetFormatUnknown,
    AWSGuarddutyIpSetFormatTxt,
    AWSGuarddutyIpSetFormatStix,
    AWSGuarddutyIpSetFormatOtxCsv,
    AWSGuarddutyIpSetFormatAlienVault,
    AWSGuarddutyIpSetFormatProofPoint,
    AWSGuarddutyIpSetFormatFireEye,
};

typedef NS_ENUM(NSInteger, AWSGuarddutyIpSetStatus) {
    AWSGuarddutyIpSetStatusUnknown,
    AWSGuarddutyIpSetStatusInactive,
    AWSGuarddutyIpSetStatusActivating,
    AWSGuarddutyIpSetStatusActive,
    AWSGuarddutyIpSetStatusDeactivating,
    AWSGuarddutyIpSetStatusError,
    AWSGuarddutyIpSetStatusDeletePending,
    AWSGuarddutyIpSetStatusDeleted,
};

typedef NS_ENUM(NSInteger, AWSGuarddutyOrderBy) {
    AWSGuarddutyOrderByUnknown,
    AWSGuarddutyOrderByAsc,
    AWSGuarddutyOrderByDesc,
};

typedef NS_ENUM(NSInteger, AWSGuarddutyPublishingStatus) {
    AWSGuarddutyPublishingStatusUnknown,
    AWSGuarddutyPublishingStatusPendingVerification,
    AWSGuarddutyPublishingStatusPublishing,
    AWSGuarddutyPublishingStatusUnableToPublishFixDestinationProperty,
    AWSGuarddutyPublishingStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSGuarddutyThreatIntelSetFormat) {
    AWSGuarddutyThreatIntelSetFormatUnknown,
    AWSGuarddutyThreatIntelSetFormatTxt,
    AWSGuarddutyThreatIntelSetFormatStix,
    AWSGuarddutyThreatIntelSetFormatOtxCsv,
    AWSGuarddutyThreatIntelSetFormatAlienVault,
    AWSGuarddutyThreatIntelSetFormatProofPoint,
    AWSGuarddutyThreatIntelSetFormatFireEye,
};

typedef NS_ENUM(NSInteger, AWSGuarddutyThreatIntelSetStatus) {
    AWSGuarddutyThreatIntelSetStatusUnknown,
    AWSGuarddutyThreatIntelSetStatusInactive,
    AWSGuarddutyThreatIntelSetStatusActivating,
    AWSGuarddutyThreatIntelSetStatusActive,
    AWSGuarddutyThreatIntelSetStatusDeactivating,
    AWSGuarddutyThreatIntelSetStatusError,
    AWSGuarddutyThreatIntelSetStatusDeletePending,
    AWSGuarddutyThreatIntelSetStatusDeleted,
};

@class AWSGuarddutyAcceptInvitationRequest;
@class AWSGuarddutyAcceptInvitationResponse;
@class AWSGuarddutyAccessKeyDetails;
@class AWSGuarddutyAccountDetail;
@class AWSGuarddutyAction;
@class AWSGuarddutyAdminAccount;
@class AWSGuarddutyArchiveFindingsRequest;
@class AWSGuarddutyArchiveFindingsResponse;
@class AWSGuarddutyAwsApiCallAction;
@class AWSGuarddutyCity;
@class AWSGuarddutyCondition;
@class AWSGuarddutyCountry;
@class AWSGuarddutyCreateDetectorRequest;
@class AWSGuarddutyCreateDetectorResponse;
@class AWSGuarddutyCreateFilterRequest;
@class AWSGuarddutyCreateFilterResponse;
@class AWSGuarddutyCreateIPSetRequest;
@class AWSGuarddutyCreateIPSetResponse;
@class AWSGuarddutyCreateMembersRequest;
@class AWSGuarddutyCreateMembersResponse;
@class AWSGuarddutyCreatePublishingDestinationRequest;
@class AWSGuarddutyCreatePublishingDestinationResponse;
@class AWSGuarddutyCreateSampleFindingsRequest;
@class AWSGuarddutyCreateSampleFindingsResponse;
@class AWSGuarddutyCreateThreatIntelSetRequest;
@class AWSGuarddutyCreateThreatIntelSetResponse;
@class AWSGuarddutyDeclineInvitationsRequest;
@class AWSGuarddutyDeclineInvitationsResponse;
@class AWSGuarddutyDeleteDetectorRequest;
@class AWSGuarddutyDeleteDetectorResponse;
@class AWSGuarddutyDeleteFilterRequest;
@class AWSGuarddutyDeleteFilterResponse;
@class AWSGuarddutyDeleteIPSetRequest;
@class AWSGuarddutyDeleteIPSetResponse;
@class AWSGuarddutyDeleteInvitationsRequest;
@class AWSGuarddutyDeleteInvitationsResponse;
@class AWSGuarddutyDeleteMembersRequest;
@class AWSGuarddutyDeleteMembersResponse;
@class AWSGuarddutyDeletePublishingDestinationRequest;
@class AWSGuarddutyDeletePublishingDestinationResponse;
@class AWSGuarddutyDeleteThreatIntelSetRequest;
@class AWSGuarddutyDeleteThreatIntelSetResponse;
@class AWSGuarddutyDescribeOrganizationConfigurationRequest;
@class AWSGuarddutyDescribeOrganizationConfigurationResponse;
@class AWSGuarddutyDescribePublishingDestinationRequest;
@class AWSGuarddutyDescribePublishingDestinationResponse;
@class AWSGuarddutyDestination;
@class AWSGuarddutyDestinationProperties;
@class AWSGuarddutyDisableOrganizationAdminAccountRequest;
@class AWSGuarddutyDisableOrganizationAdminAccountResponse;
@class AWSGuarddutyDisassociateFromMasterAccountRequest;
@class AWSGuarddutyDisassociateFromMasterAccountResponse;
@class AWSGuarddutyDisassociateMembersRequest;
@class AWSGuarddutyDisassociateMembersResponse;
@class AWSGuarddutyDnsRequestAction;
@class AWSGuarddutyDomainDetails;
@class AWSGuarddutyEnableOrganizationAdminAccountRequest;
@class AWSGuarddutyEnableOrganizationAdminAccountResponse;
@class AWSGuarddutyEvidence;
@class AWSGuarddutyFinding;
@class AWSGuarddutyFindingCriteria;
@class AWSGuarddutyFindingStatistics;
@class AWSGuarddutyGeoLocation;
@class AWSGuarddutyGetDetectorRequest;
@class AWSGuarddutyGetDetectorResponse;
@class AWSGuarddutyGetFilterRequest;
@class AWSGuarddutyGetFilterResponse;
@class AWSGuarddutyGetFindingsRequest;
@class AWSGuarddutyGetFindingsResponse;
@class AWSGuarddutyGetFindingsStatisticsRequest;
@class AWSGuarddutyGetFindingsStatisticsResponse;
@class AWSGuarddutyGetIPSetRequest;
@class AWSGuarddutyGetIPSetResponse;
@class AWSGuarddutyGetInvitationsCountRequest;
@class AWSGuarddutyGetInvitationsCountResponse;
@class AWSGuarddutyGetMasterAccountRequest;
@class AWSGuarddutyGetMasterAccountResponse;
@class AWSGuarddutyGetMembersRequest;
@class AWSGuarddutyGetMembersResponse;
@class AWSGuarddutyGetThreatIntelSetRequest;
@class AWSGuarddutyGetThreatIntelSetResponse;
@class AWSGuarddutyIamInstanceProfile;
@class AWSGuarddutyInstanceDetails;
@class AWSGuarddutyInvitation;
@class AWSGuarddutyInviteMembersRequest;
@class AWSGuarddutyInviteMembersResponse;
@class AWSGuarddutyListDetectorsRequest;
@class AWSGuarddutyListDetectorsResponse;
@class AWSGuarddutyListFiltersRequest;
@class AWSGuarddutyListFiltersResponse;
@class AWSGuarddutyListFindingsRequest;
@class AWSGuarddutyListFindingsResponse;
@class AWSGuarddutyListIPSetsRequest;
@class AWSGuarddutyListIPSetsResponse;
@class AWSGuarddutyListInvitationsRequest;
@class AWSGuarddutyListInvitationsResponse;
@class AWSGuarddutyListMembersRequest;
@class AWSGuarddutyListMembersResponse;
@class AWSGuarddutyListOrganizationAdminAccountsRequest;
@class AWSGuarddutyListOrganizationAdminAccountsResponse;
@class AWSGuarddutyListPublishingDestinationsRequest;
@class AWSGuarddutyListPublishingDestinationsResponse;
@class AWSGuarddutyListTagsForResourceRequest;
@class AWSGuarddutyListTagsForResourceResponse;
@class AWSGuarddutyListThreatIntelSetsRequest;
@class AWSGuarddutyListThreatIntelSetsResponse;
@class AWSGuarddutyLocalIpDetails;
@class AWSGuarddutyLocalPortDetails;
@class AWSGuarddutyMaster;
@class AWSGuarddutyMember;
@class AWSGuarddutyNetworkConnectionAction;
@class AWSGuarddutyNetworkInterface;
@class AWSGuarddutyOrganization;
@class AWSGuarddutyPortProbeAction;
@class AWSGuarddutyPortProbeDetail;
@class AWSGuarddutyPrivateIpAddressDetails;
@class AWSGuarddutyProductCode;
@class AWSGuarddutyRemoteIpDetails;
@class AWSGuarddutyRemotePortDetails;
@class AWSGuarddutyResource;
@class AWSGuarddutySecurityGroup;
@class AWSGuarddutyService;
@class AWSGuarddutySortCriteria;
@class AWSGuarddutyStartMonitoringMembersRequest;
@class AWSGuarddutyStartMonitoringMembersResponse;
@class AWSGuarddutyStopMonitoringMembersRequest;
@class AWSGuarddutyStopMonitoringMembersResponse;
@class AWSGuarddutyTag;
@class AWSGuarddutyTagResourceRequest;
@class AWSGuarddutyTagResourceResponse;
@class AWSGuarddutyThreatIntelligenceDetail;
@class AWSGuarddutyUnarchiveFindingsRequest;
@class AWSGuarddutyUnarchiveFindingsResponse;
@class AWSGuarddutyUnprocessedAccount;
@class AWSGuarddutyUntagResourceRequest;
@class AWSGuarddutyUntagResourceResponse;
@class AWSGuarddutyUpdateDetectorRequest;
@class AWSGuarddutyUpdateDetectorResponse;
@class AWSGuarddutyUpdateFilterRequest;
@class AWSGuarddutyUpdateFilterResponse;
@class AWSGuarddutyUpdateFindingsFeedbackRequest;
@class AWSGuarddutyUpdateFindingsFeedbackResponse;
@class AWSGuarddutyUpdateIPSetRequest;
@class AWSGuarddutyUpdateIPSetResponse;
@class AWSGuarddutyUpdateOrganizationConfigurationRequest;
@class AWSGuarddutyUpdateOrganizationConfigurationResponse;
@class AWSGuarddutyUpdatePublishingDestinationRequest;
@class AWSGuarddutyUpdatePublishingDestinationResponse;
@class AWSGuarddutyUpdateThreatIntelSetRequest;
@class AWSGuarddutyUpdateThreatIntelSetResponse;

/**
 
 */
@interface AWSGuarddutyAcceptInvitationRequest : AWSRequest


/**
 <p>The unique ID of the detector of the GuardDuty member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The value that is used to validate the master account to the member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invitationId;

/**
 <p>The account ID of the master GuardDuty account whose invitation you're accepting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterId;

@end

/**
 
 */
@interface AWSGuarddutyAcceptInvitationResponse : AWSModel


@end

/**
 <p>Contains information about the access keys.</p>
 */
@interface AWSGuarddutyAccessKeyDetails : AWSModel


/**
 <p>The access key ID of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessKeyId;

/**
 <p>The principal ID of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable principalId;

/**
 <p>The name of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

/**
 <p>The type of the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userType;

@end

/**
 <p>Contains information about the account.</p>
 Required parameters: [AccountId, Email]
 */
@interface AWSGuarddutyAccountDetail : AWSModel


/**
 <p>The member account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The email address of the member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

@end

/**
 <p>Contains information about actions.</p>
 */
@interface AWSGuarddutyAction : AWSModel


/**
 <p>The GuardDuty finding activity type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionType;

/**
 <p>Information about the AWS_API_CALL action described in this finding.</p>
 */
@property (nonatomic, strong) AWSGuarddutyAwsApiCallAction * _Nullable awsApiCallAction;

/**
 <p>Information about the DNS_REQUEST action described in this finding.</p>
 */
@property (nonatomic, strong) AWSGuarddutyDnsRequestAction * _Nullable dnsRequestAction;

/**
 <p>Information about the NETWORK_CONNECTION action described in this finding.</p>
 */
@property (nonatomic, strong) AWSGuarddutyNetworkConnectionAction * _Nullable networkConnectionAction;

/**
 <p>Information about the PORT_PROBE action described in this finding.</p>
 */
@property (nonatomic, strong) AWSGuarddutyPortProbeAction * _Nullable portProbeAction;

@end

/**
 <p>The account within the organization specified as the GuardDuty delegated administrator.</p>
 */
@interface AWSGuarddutyAdminAccount : AWSModel


/**
 <p>The AWS account ID for the account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adminAccountId;

/**
 <p>Indicates whether the account is enabled as the delegated administrator.</p>
 */
@property (nonatomic, assign) AWSGuarddutyAdminStatus adminStatus;

@end

/**
 
 */
@interface AWSGuarddutyArchiveFindingsRequest : AWSRequest


/**
 <p>The ID of the detector that specifies the GuardDuty service whose findings you want to archive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The IDs of the findings that you want to archive.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable findingIds;

@end

/**
 
 */
@interface AWSGuarddutyArchiveFindingsResponse : AWSModel


@end

/**
 <p>Contains information about the API operation.</p>
 */
@interface AWSGuarddutyAwsApiCallAction : AWSModel


/**
 <p>The AWS API name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable api;

/**
 <p>The AWS API caller type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callerType;

/**
 <p>The domain information for the AWS API call.</p>
 */
@property (nonatomic, strong) AWSGuarddutyDomainDetails * _Nullable domainDetails;

/**
 <p>The remote IP information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuarddutyRemoteIpDetails * _Nullable remoteIpDetails;

/**
 <p>The AWS service name whose API was invoked.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

@end

/**
 <p>Contains information about the city associated with the IP address.</p>
 */
@interface AWSGuarddutyCity : AWSModel


/**
 <p>The city name of the remote IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cityName;

@end

/**
 <p>Contains information about the condition.</p>
 */
@interface AWSGuarddutyCondition : AWSModel


/**
 <p>Represents the <i>equal</i> condition to be applied to a single field when querying for findings.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eq;

/**
 <p>Represents an <i>equal</i><b/> condition to be applied to a single field when querying for findings.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable equals;

/**
 <p>Represents a <i>greater than</i> condition to be applied to a single field when querying for findings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable greaterThan;

/**
 <p>Represents a <i>greater than or equal</i> condition to be applied to a single field when querying for findings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable greaterThanOrEqual;

/**
 <p>Represents a <i>greater than</i> condition to be applied to a single field when querying for findings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable gt;

/**
 <p>Represents a <i>greater than or equal</i> condition to be applied to a single field when querying for findings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable gte;

/**
 <p>Represents a <i>less than</i> condition to be applied to a single field when querying for findings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lessThan;

/**
 <p>Represents a <i>less than or equal</i> condition to be applied to a single field when querying for findings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lessThanOrEqual;

/**
 <p>Represents a <i>less than</i> condition to be applied to a single field when querying for findings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lt;

/**
 <p>Represents a <i>less than or equal</i> condition to be applied to a single field when querying for findings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lte;

/**
 <p>Represents the <i>not equal</i> condition to be applied to a single field when querying for findings.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable neq;

/**
 <p>Represents a <i>not equal</i><b/> condition to be applied to a single field when querying for findings.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable notEquals;

@end

/**
 <p>Contains information about the country where the remote IP address is located.</p>
 */
@interface AWSGuarddutyCountry : AWSModel


/**
 <p>The country code of the remote IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable countryCode;

/**
 <p>The country name of the remote IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable countryName;

@end

/**
 
 */
@interface AWSGuarddutyCreateDetectorRequest : AWSRequest


/**
 <p>The idempotency token for the create request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>A Boolean value that specifies whether the detector is to be enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enable;

/**
 <p>An enum value that specifies how frequently updated findings are exported.</p>
 */
@property (nonatomic, assign) AWSGuarddutyFindingPublishingFrequency findingPublishingFrequency;

/**
 <p>The tags to be added to a new detector resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGuarddutyCreateDetectorResponse : AWSModel


/**
 <p>The unique ID of the created detector.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyCreateFilterRequest : AWSRequest


/**
 <p>Specifies the action that is to be applied to the findings that match the filter.</p>
 */
@property (nonatomic, assign) AWSGuarddutyFilterAction action;

/**
 <p>The idempotency token for the create request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The description of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The unique ID of the detector of the GuardDuty account that you want to create a filter for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>Represents the criteria to be used in the filter for querying findings.</p><p>You can only use the following attributes to query findings:</p><ul><li><p>accountId</p></li><li><p>region</p></li><li><p>confidence</p></li><li><p>id</p></li><li><p>resource.accessKeyDetails.accessKeyId</p></li><li><p>resource.accessKeyDetails.principalId</p></li><li><p>resource.accessKeyDetails.userName</p></li><li><p>resource.accessKeyDetails.userType</p></li><li><p>resource.instanceDetails.iamInstanceProfile.id</p></li><li><p>resource.instanceDetails.imageId</p></li><li><p>resource.instanceDetails.instanceId</p></li><li><p>resource.instanceDetails.outpostArn</p></li><li><p>resource.instanceDetails.networkInterfaces.ipv6Addresses</p></li><li><p>resource.instanceDetails.networkInterfaces.privateIpAddresses.privateIpAddress</p></li><li><p>resource.instanceDetails.networkInterfaces.publicDnsName</p></li><li><p>resource.instanceDetails.networkInterfaces.publicIp</p></li><li><p>resource.instanceDetails.networkInterfaces.securityGroups.groupId</p></li><li><p>resource.instanceDetails.networkInterfaces.securityGroups.groupName</p></li><li><p>resource.instanceDetails.networkInterfaces.subnetId</p></li><li><p>resource.instanceDetails.networkInterfaces.vpcId</p></li><li><p>resource.instanceDetails.tags.key</p></li><li><p>resource.instanceDetails.tags.value</p></li><li><p>resource.resourceType</p></li><li><p>service.action.actionType</p></li><li><p>service.action.awsApiCallAction.api</p></li><li><p>service.action.awsApiCallAction.callerType</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.city.cityName</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.country.countryName</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.ipAddressV4</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.organization.asn</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.organization.asnOrg</p></li><li><p>service.action.awsApiCallAction.serviceName</p></li><li><p>service.action.dnsRequestAction.domain</p></li><li><p>service.action.networkConnectionAction.blocked</p></li><li><p>service.action.networkConnectionAction.connectionDirection</p></li><li><p>service.action.networkConnectionAction.localPortDetails.port</p></li><li><p>service.action.networkConnectionAction.protocol</p></li><li><p>service.action.networkConnectionAction.localIpDetails.ipAddressV4</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.city.cityName</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.country.countryName</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.ipAddressV4</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.organization.asn</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.organization.asnOrg</p></li><li><p>service.action.networkConnectionAction.remotePortDetails.port</p></li><li><p>service.additionalInfo.threatListName</p></li><li><p>service.archived</p><p>When this attribute is set to TRUE, only archived findings are listed. When it's set to FALSE, only unarchived findings are listed. When this attribute is not set, all existing findings are listed.</p></li><li><p>service.resourceRole</p></li><li><p>severity</p></li><li><p>type</p></li><li><p>updatedAt</p><p>Type: ISO 8601 string format: YYYY-MM-DDTHH:MM:SS.SSSZ or YYYY-MM-DDTHH:MM:SSZ depending on whether the value contains milliseconds.</p></li></ul>
 */
@property (nonatomic, strong) AWSGuarddutyFindingCriteria * _Nullable findingCriteria;

/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specifies the position of the filter in the list of current filters. Also specifies the order in which this filter is applied to the findings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rank;

/**
 <p>The tags to be added to a new filter resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGuarddutyCreateFilterResponse : AWSModel


/**
 <p>The name of the successfully created filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGuarddutyCreateIPSetRequest : AWSRequest


/**
 <p>A Boolean value that indicates whether GuardDuty is to start using the uploaded IPSet.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable activate;

/**
 <p>The idempotency token for the create request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The unique ID of the detector of the GuardDuty account that you want to create an IPSet for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The format of the file that contains the IPSet.</p>
 */
@property (nonatomic, assign) AWSGuarddutyIpSetFormat format;

/**
 <p>The URI of the file that contains the IPSet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The user-friendly name to identify the IPSet.</p><p> Allowed characters are alphanumerics, spaces, hyphens (-), and underscores (_).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags to be added to a new IP set resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGuarddutyCreateIPSetResponse : AWSModel


/**
 <p>The ID of the IPSet resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipSetId;

@end

/**
 
 */
@interface AWSGuarddutyCreateMembersRequest : AWSRequest


/**
 <p>A list of account ID and email address pairs of the accounts that you want to associate with the master GuardDuty account.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyAccountDetail *> * _Nullable accountDetails;

/**
 <p>The unique ID of the detector of the GuardDuty account that you want to associate member accounts with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyCreateMembersResponse : AWSModel


/**
 <p>A list of objects that include the <code>accountIds</code> of the unprocessed accounts and a result string that explains why each was unprocessed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSGuarddutyCreatePublishingDestinationRequest : AWSRequest


/**
 <p>The idempotency token for the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The properties of the publishing destination, including the ARNs for the destination and the KMS key used for encryption.</p>
 */
@property (nonatomic, strong) AWSGuarddutyDestinationProperties * _Nullable destinationProperties;

/**
 <p>The type of resource for the publishing destination. Currently only Amazon S3 buckets are supported.</p>
 */
@property (nonatomic, assign) AWSGuarddutyDestinationType destinationType;

/**
 <p>The ID of the GuardDuty detector associated with the publishing destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyCreatePublishingDestinationResponse : AWSModel


/**
 <p>The ID of the publishing destination that is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationId;

@end

/**
 
 */
@interface AWSGuarddutyCreateSampleFindingsRequest : AWSRequest


/**
 <p>The ID of the detector to create sample findings for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The types of sample findings to generate.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable findingTypes;

@end

/**
 
 */
@interface AWSGuarddutyCreateSampleFindingsResponse : AWSModel


@end

/**
 
 */
@interface AWSGuarddutyCreateThreatIntelSetRequest : AWSRequest


/**
 <p>A Boolean value that indicates whether GuardDuty is to start using the uploaded ThreatIntelSet.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable activate;

/**
 <p>The idempotency token for the create request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The unique ID of the detector of the GuardDuty account that you want to create a threatIntelSet for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The format of the file that contains the ThreatIntelSet.</p>
 */
@property (nonatomic, assign) AWSGuarddutyThreatIntelSetFormat format;

/**
 <p>The URI of the file that contains the ThreatIntelSet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>A user-friendly ThreatIntelSet name displayed in all findings that are generated by activity that involves IP addresses included in this ThreatIntelSet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The tags to be added to a new threat list resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGuarddutyCreateThreatIntelSetResponse : AWSModel


/**
 <p>The ID of the ThreatIntelSet resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable threatIntelSetId;

@end

/**
 
 */
@interface AWSGuarddutyDeclineInvitationsRequest : AWSRequest


/**
 <p>A list of account IDs of the AWS accounts that sent invitations to the current member account that you want to decline invitations from.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

@end

/**
 
 */
@interface AWSGuarddutyDeclineInvitationsResponse : AWSModel


/**
 <p>A list of objects that contain the unprocessed account and a result string that explains why it was unprocessed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSGuarddutyDeleteDetectorRequest : AWSRequest


/**
 <p>The unique ID of the detector that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyDeleteDetectorResponse : AWSModel


@end

/**
 
 */
@interface AWSGuarddutyDeleteFilterRequest : AWSRequest


/**
 <p>The unique ID of the detector that the filter is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The name of the filter that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterName;

@end

/**
 
 */
@interface AWSGuarddutyDeleteFilterResponse : AWSModel


@end

/**
 
 */
@interface AWSGuarddutyDeleteIPSetRequest : AWSRequest


/**
 <p>The unique ID of the detector associated with the IPSet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The unique ID of the IPSet to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipSetId;

@end

/**
 
 */
@interface AWSGuarddutyDeleteIPSetResponse : AWSModel


@end

/**
 
 */
@interface AWSGuarddutyDeleteInvitationsRequest : AWSRequest


/**
 <p>A list of account IDs of the AWS accounts that sent invitations to the current member account that you want to delete invitations from.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

@end

/**
 
 */
@interface AWSGuarddutyDeleteInvitationsResponse : AWSModel


/**
 <p>A list of objects that contain the unprocessed account and a result string that explains why it was unprocessed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSGuarddutyDeleteMembersRequest : AWSRequest


/**
 <p>A list of account IDs of the GuardDuty member accounts that you want to delete.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

/**
 <p>The unique ID of the detector of the GuardDuty account whose members you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyDeleteMembersResponse : AWSModel


/**
 <p>The accounts that could not be processed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSGuarddutyDeletePublishingDestinationRequest : AWSRequest


/**
 <p>The ID of the publishing destination to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationId;

/**
 <p>The unique ID of the detector associated with the publishing destination to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyDeletePublishingDestinationResponse : AWSModel


@end

/**
 
 */
@interface AWSGuarddutyDeleteThreatIntelSetRequest : AWSRequest


/**
 <p>The unique ID of the detector that the threatIntelSet is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The unique ID of the threatIntelSet that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable threatIntelSetId;

@end

/**
 
 */
@interface AWSGuarddutyDeleteThreatIntelSetResponse : AWSModel


@end

/**
 
 */
@interface AWSGuarddutyDescribeOrganizationConfigurationRequest : AWSRequest


/**
 <p>The ID of the detector to retrieve information about the delegated administrator from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyDescribeOrganizationConfigurationResponse : AWSModel


/**
 <p>Indicates whether GuardDuty is automatically enabled for accounts added to the organization.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoEnable;

/**
 <p>Indicates whether the maximum number of allowed member accounts are already associated with the delegated administrator master account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable memberAccountLimitReached;

@end

/**
 
 */
@interface AWSGuarddutyDescribePublishingDestinationRequest : AWSRequest


/**
 <p>The ID of the publishing destination to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationId;

/**
 <p>The unique ID of the detector associated with the publishing destination to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyDescribePublishingDestinationResponse : AWSModel


/**
 <p>The ID of the publishing destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationId;

/**
 <p>A <code>DestinationProperties</code> object that includes the <code>DestinationArn</code> and <code>KmsKeyArn</code> of the publishing destination.</p>
 */
@property (nonatomic, strong) AWSGuarddutyDestinationProperties * _Nullable destinationProperties;

/**
 <p>The type of publishing destination. Currently, only Amazon S3 buckets are supported.</p>
 */
@property (nonatomic, assign) AWSGuarddutyDestinationType destinationType;

/**
 <p>The time, in epoch millisecond format, at which GuardDuty was first unable to publish findings to the destination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publishingFailureStartTimestamp;

/**
 <p>The status of the publishing destination.</p>
 */
@property (nonatomic, assign) AWSGuarddutyPublishingStatus status;

@end

/**
 <p>Contains information about the publishing destination, including the ID, type, and status.</p>
 Required parameters: [DestinationId, DestinationType, Status]
 */
@interface AWSGuarddutyDestination : AWSModel


/**
 <p>The unique ID of the publishing destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationId;

/**
 <p>The type of resource used for the publishing destination. Currently, only Amazon S3 buckets are supported.</p>
 */
@property (nonatomic, assign) AWSGuarddutyDestinationType destinationType;

/**
 <p>The status of the publishing destination.</p>
 */
@property (nonatomic, assign) AWSGuarddutyPublishingStatus status;

@end

/**
 <p>Contains the Amazon Resource Name (ARN) of the resource to publish to, such as an S3 bucket, and the ARN of the KMS key to use to encrypt published findings.</p>
 */
@interface AWSGuarddutyDestinationProperties : AWSModel


/**
 <p>The ARN of the resource to publish to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationArn;

/**
 <p>The ARN of the KMS key to use for encryption.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyArn;

@end

/**
 
 */
@interface AWSGuarddutyDisableOrganizationAdminAccountRequest : AWSRequest


/**
 <p>The AWS Account ID for the organizations account to be disabled as a GuardDuty delegated administrator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adminAccountId;

@end

/**
 
 */
@interface AWSGuarddutyDisableOrganizationAdminAccountResponse : AWSModel


@end

/**
 
 */
@interface AWSGuarddutyDisassociateFromMasterAccountRequest : AWSRequest


/**
 <p>The unique ID of the detector of the GuardDuty member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyDisassociateFromMasterAccountResponse : AWSModel


@end

/**
 
 */
@interface AWSGuarddutyDisassociateMembersRequest : AWSRequest


/**
 <p>A list of account IDs of the GuardDuty member accounts that you want to disassociate from the master account.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

/**
 <p>The unique ID of the detector of the GuardDuty account whose members you want to disassociate from the master account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyDisassociateMembersResponse : AWSModel


/**
 <p>A list of objects that contain the unprocessed account and a result string that explains why it was unprocessed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 <p>Contains information about the DNS_REQUEST action described in this finding.</p>
 */
@interface AWSGuarddutyDnsRequestAction : AWSModel


/**
 <p>The domain information for the API request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

@end

/**
 <p>Contains information about the domain.</p>
 */
@interface AWSGuarddutyDomainDetails : AWSModel


/**
 <p>The domain information for the AWS API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

@end

/**
 
 */
@interface AWSGuarddutyEnableOrganizationAdminAccountRequest : AWSRequest


/**
 <p>The AWS Account ID for the organization account to be enabled as a GuardDuty delegated administrator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adminAccountId;

@end

/**
 
 */
@interface AWSGuarddutyEnableOrganizationAdminAccountResponse : AWSModel


@end

/**
 <p>Contains information about the reason that the finding was generated.</p>
 */
@interface AWSGuarddutyEvidence : AWSModel


/**
 <p>A list of threat intelligence details related to the evidence.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyThreatIntelligenceDetail *> * _Nullable threatIntelligenceDetails;

@end

/**
 <p>Contains information about the finding, which is generated when abnormal or suspicious activity is detected.</p>
 Required parameters: [AccountId, Arn, CreatedAt, Id, Region, Resource, SchemaVersion, Severity, Type, UpdatedAt]
 */
@interface AWSGuarddutyFinding : AWSModel


/**
 <p>The ID of the account in which the finding was generated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The ARN of the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The confidence score for the finding.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable confidence;

/**
 <p>The time and date when the finding was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdAt;

/**
 <p>The description of the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The ID of the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The partition associated with the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable partition;

/**
 <p>The Region where the finding was generated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>Contains information about the AWS resource associated with the activity that prompted GuardDuty to generate a finding.</p>
 */
@property (nonatomic, strong) AWSGuarddutyResource * _Nullable resource;

/**
 <p>The version of the schema used for the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>Contains additional information about the generated finding.</p>
 */
@property (nonatomic, strong) AWSGuarddutyService * _Nullable service;

/**
 <p>The severity of the finding.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable severity;

/**
 <p>The title of the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable title;

/**
 <p>The type of finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable types;

/**
 <p>The time and date when the finding was last updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable updatedAt;

@end

/**
 <p>Contains information about the criteria used for querying findings.</p>
 */
@interface AWSGuarddutyFindingCriteria : AWSModel


/**
 <p>Represents a map of finding properties that match specified conditions and values when querying findings.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSGuarddutyCondition *> * _Nullable criterion;

@end

/**
 <p>Contains information about finding statistics.</p>
 */
@interface AWSGuarddutyFindingStatistics : AWSModel


/**
 <p>Represents a map of severity to count statistics for a set of findings.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable countBySeverity;

@end

/**
 <p>Contains information about the location of the remote IP address.</p>
 */
@interface AWSGuarddutyGeoLocation : AWSModel


/**
 <p>The latitude information of the remote IP address.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lat;

/**
 <p>The longitude information of the remote IP address.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable lon;

@end

/**
 
 */
@interface AWSGuarddutyGetDetectorRequest : AWSRequest


/**
 <p>The unique ID of the detector that you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyGetDetectorResponse : AWSModel


/**
 <p>The timestamp of when the detector was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdAt;

/**
 <p>The publishing frequency of the finding.</p>
 */
@property (nonatomic, assign) AWSGuarddutyFindingPublishingFrequency findingPublishingFrequency;

/**
 <p>The GuardDuty service role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>The detector status.</p>
 */
@property (nonatomic, assign) AWSGuarddutyDetectorStatus status;

/**
 <p>The tags of the detector resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The last-updated timestamp for the detector.</p>
 */
@property (nonatomic, strong) NSString * _Nullable updatedAt;

@end

/**
 
 */
@interface AWSGuarddutyGetFilterRequest : AWSRequest


/**
 <p>The unique ID of the detector that the filter is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The name of the filter you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterName;

@end

/**
 
 */
@interface AWSGuarddutyGetFilterResponse : AWSModel


/**
 <p>Specifies the action that is to be applied to the findings that match the filter.</p>
 */
@property (nonatomic, assign) AWSGuarddutyFilterAction action;

/**
 <p>The description of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Represents the criteria to be used in the filter for querying findings.</p>
 */
@property (nonatomic, strong) AWSGuarddutyFindingCriteria * _Nullable findingCriteria;

/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specifies the position of the filter in the list of current filters. Also specifies the order in which this filter is applied to the findings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rank;

/**
 <p>The tags of the filter resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGuarddutyGetFindingsRequest : AWSRequest


/**
 <p>The ID of the detector that specifies the GuardDuty service whose findings you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The IDs of the findings that you want to retrieve.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable findingIds;

/**
 <p>Represents the criteria used for sorting findings.</p>
 */
@property (nonatomic, strong) AWSGuarddutySortCriteria * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSGuarddutyGetFindingsResponse : AWSModel


/**
 <p>A list of findings.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyFinding *> * _Nullable findings;

@end

/**
 
 */
@interface AWSGuarddutyGetFindingsStatisticsRequest : AWSRequest


/**
 <p>The ID of the detector that specifies the GuardDuty service whose findings' statistics you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>Represents the criteria that is used for querying findings.</p>
 */
@property (nonatomic, strong) AWSGuarddutyFindingCriteria * _Nullable findingCriteria;

/**
 <p>The types of finding statistics to retrieve.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable findingStatisticTypes;

@end

/**
 
 */
@interface AWSGuarddutyGetFindingsStatisticsResponse : AWSModel


/**
 <p>The finding statistics object.</p>
 */
@property (nonatomic, strong) AWSGuarddutyFindingStatistics * _Nullable findingStatistics;

@end

/**
 
 */
@interface AWSGuarddutyGetIPSetRequest : AWSRequest


/**
 <p>The unique ID of the detector that the IPSet is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The unique ID of the IPSet to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipSetId;

@end

/**
 
 */
@interface AWSGuarddutyGetIPSetResponse : AWSModel


/**
 <p>The format of the file that contains the IPSet.</p>
 */
@property (nonatomic, assign) AWSGuarddutyIpSetFormat format;

/**
 <p>The URI of the file that contains the IPSet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The user-friendly name for the IPSet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of IPSet file that was uploaded.</p>
 */
@property (nonatomic, assign) AWSGuarddutyIpSetStatus status;

/**
 <p>The tags of the IPSet resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGuarddutyGetInvitationsCountRequest : AWSRequest


@end

/**
 
 */
@interface AWSGuarddutyGetInvitationsCountResponse : AWSModel


/**
 <p>The number of received invitations.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable invitationsCount;

@end

/**
 
 */
@interface AWSGuarddutyGetMasterAccountRequest : AWSRequest


/**
 <p>The unique ID of the detector of the GuardDuty member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyGetMasterAccountResponse : AWSModel


/**
 <p>The master account details.</p>
 */
@property (nonatomic, strong) AWSGuarddutyMaster * _Nullable master;

@end

/**
 
 */
@interface AWSGuarddutyGetMembersRequest : AWSRequest


/**
 <p>A list of account IDs of the GuardDuty member accounts that you want to describe.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

/**
 <p>The unique ID of the detector of the GuardDuty account whose members you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyGetMembersResponse : AWSModel


/**
 <p>A list of members.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyMember *> * _Nullable members;

/**
 <p>A list of objects that contain the unprocessed account and a result string that explains why it was unprocessed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSGuarddutyGetThreatIntelSetRequest : AWSRequest


/**
 <p>The unique ID of the detector that the threatIntelSet is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The unique ID of the threatIntelSet that you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable threatIntelSetId;

@end

/**
 
 */
@interface AWSGuarddutyGetThreatIntelSetResponse : AWSModel


/**
 <p>The format of the threatIntelSet.</p>
 */
@property (nonatomic, assign) AWSGuarddutyThreatIntelSetFormat format;

/**
 <p>The URI of the file that contains the ThreatIntelSet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>A user-friendly ThreatIntelSet name displayed in all findings that are generated by activity that involves IP addresses included in this ThreatIntelSet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of threatIntelSet file uploaded.</p>
 */
@property (nonatomic, assign) AWSGuarddutyThreatIntelSetStatus status;

/**
 <p>The tags of the threat list resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Contains information about the EC2 instance profile.</p>
 */
@interface AWSGuarddutyIamInstanceProfile : AWSModel


/**
 <p>The profile ARN of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The profile ID of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

@end

/**
 <p>Contains information about the details of an instance.</p>
 */
@interface AWSGuarddutyInstanceDetails : AWSModel


/**
 <p>The Availability Zone of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The profile information of the EC2 instance.</p>
 */
@property (nonatomic, strong) AWSGuarddutyIamInstanceProfile * _Nullable iamInstanceProfile;

/**
 <p>The image description of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageDescription;

/**
 <p>The image ID of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageId;

/**
 <p>The ID of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceId;

/**
 <p>The state of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceState;

/**
 <p>The type of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceType;

/**
 <p>The launch time of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable launchTime;

/**
 <p>The elastic network interface information of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyNetworkInterface *> * _Nullable networkInterfaces;

/**
 <p>The Amazon Resource Name (ARN) of the AWS Outpost. Only applicable to AWS Outposts instances.</p>
 */
@property (nonatomic, strong) NSString * _Nullable outpostArn;

/**
 <p>The platform of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable platform;

/**
 <p>The product code of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyProductCode *> * _Nullable productCodes;

/**
 <p>The tags of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyTag *> * _Nullable tags;

@end

/**
 <p>Contains information about the invitation to become a member account.</p>
 */
@interface AWSGuarddutyInvitation : AWSModel


/**
 <p>The ID of the account that the invitation was sent from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The ID of the invitation. This value is used to validate the inviter account to the member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invitationId;

/**
 <p>The timestamp when the invitation was sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invitedAt;

/**
 <p>The status of the relationship between the inviter and invitee accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationshipStatus;

@end

/**
 
 */
@interface AWSGuarddutyInviteMembersRequest : AWSRequest


/**
 <p>A list of account IDs of the accounts that you want to invite to GuardDuty as members.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

/**
 <p>The unique ID of the detector of the GuardDuty account that you want to invite members with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>A Boolean value that specifies whether you want to disable email notification to the accounts that you’re inviting to GuardDuty as members.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable disableEmailNotification;

/**
 <p>The invitation message that you want to send to the accounts that you’re inviting to GuardDuty as members.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 
 */
@interface AWSGuarddutyInviteMembersResponse : AWSModel


/**
 <p>A list of objects that contain the unprocessed account and a result string that explains why it was unprocessed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSGuarddutyListDetectorsRequest : AWSRequest


/**
 <p>You can use this parameter to indicate the maximum number of items that you want in the response. The default value is 50. The maximum value is 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the list action. For subsequent calls to the action, fill nextToken in the request with the value of NextToken from the previous response to continue listing data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListDetectorsResponse : AWSModel


/**
 <p>A list of detector IDs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable detectorIds;

/**
 <p>The pagination parameter to be used on the next list operation to retrieve more items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListFiltersRequest : AWSRequest


/**
 <p>The unique ID of the detector that the filter is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>You can use this parameter to indicate the maximum number of items that you want in the response. The default value is 50. The maximum value is 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the list action. For subsequent calls to the action, fill nextToken in the request with the value of NextToken from the previous response to continue listing data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListFiltersResponse : AWSModel


/**
 <p>A list of filter names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterNames;

/**
 <p>The pagination parameter to be used on the next list operation to retrieve more items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListFindingsRequest : AWSRequest


/**
 <p>The ID of the detector that specifies the GuardDuty service whose findings you want to list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>Represents the criteria used for querying findings. Valid values include:</p><ul><li><p>JSON field name</p></li><li><p>accountId</p></li><li><p>region</p></li><li><p>confidence</p></li><li><p>id</p></li><li><p>resource.accessKeyDetails.accessKeyId</p></li><li><p>resource.accessKeyDetails.principalId</p></li><li><p>resource.accessKeyDetails.userName</p></li><li><p>resource.accessKeyDetails.userType</p></li><li><p>resource.instanceDetails.iamInstanceProfile.id</p></li><li><p>resource.instanceDetails.imageId</p></li><li><p>resource.instanceDetails.instanceId</p></li><li><p>resource.instanceDetails.outpostArn</p></li><li><p>resource.instanceDetails.networkInterfaces.ipv6Addresses</p></li><li><p>resource.instanceDetails.networkInterfaces.privateIpAddresses.privateIpAddress</p></li><li><p>resource.instanceDetails.networkInterfaces.publicDnsName</p></li><li><p>resource.instanceDetails.networkInterfaces.publicIp</p></li><li><p>resource.instanceDetails.networkInterfaces.securityGroups.groupId</p></li><li><p>resource.instanceDetails.networkInterfaces.securityGroups.groupName</p></li><li><p>resource.instanceDetails.networkInterfaces.subnetId</p></li><li><p>resource.instanceDetails.networkInterfaces.vpcId</p></li><li><p>resource.instanceDetails.tags.key</p></li><li><p>resource.instanceDetails.tags.value</p></li><li><p>resource.resourceType</p></li><li><p>service.action.actionType</p></li><li><p>service.action.awsApiCallAction.api</p></li><li><p>service.action.awsApiCallAction.callerType</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.city.cityName</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.country.countryName</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.ipAddressV4</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.organization.asn</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.organization.asnOrg</p></li><li><p>service.action.awsApiCallAction.serviceName</p></li><li><p>service.action.dnsRequestAction.domain</p></li><li><p>service.action.networkConnectionAction.blocked</p></li><li><p>service.action.networkConnectionAction.connectionDirection</p></li><li><p>service.action.networkConnectionAction.localPortDetails.port</p></li><li><p>service.action.networkConnectionAction.protocol</p></li><li><p>service.action.networkConnectionAction.localIpDetails.ipAddressV4</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.city.cityName</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.country.countryName</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.ipAddressV4</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.organization.asn</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.organization.asnOrg</p></li><li><p>service.action.networkConnectionAction.remotePortDetails.port</p></li><li><p>service.additionalInfo.threatListName</p></li><li><p>service.archived</p><p>When this attribute is set to 'true', only archived findings are listed. When it's set to 'false', only unarchived findings are listed. When this attribute is not set, all existing findings are listed.</p></li><li><p>service.resourceRole</p></li><li><p>severity</p></li><li><p>type</p></li><li><p>updatedAt</p><p>Type: Timestamp in Unix Epoch millisecond format: 1486685375000</p></li></ul>
 */
@property (nonatomic, strong) AWSGuarddutyFindingCriteria * _Nullable findingCriteria;

/**
 <p>You can use this parameter to indicate the maximum number of items you want in the response. The default value is 50. The maximum value is 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the list action. For subsequent calls to the action, fill nextToken in the request with the value of NextToken from the previous response to continue listing data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Represents the criteria used for sorting findings.</p>
 */
@property (nonatomic, strong) AWSGuarddutySortCriteria * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSGuarddutyListFindingsResponse : AWSModel


/**
 <p>The IDs of the findings that you're listing.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable findingIds;

/**
 <p>The pagination parameter to be used on the next list operation to retrieve more items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListIPSetsRequest : AWSRequest


/**
 <p>The unique ID of the detector that the IPSet is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>You can use this parameter to indicate the maximum number of items you want in the response. The default value is 50. The maximum value is 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the list action. For subsequent calls to the action, fill nextToken in the request with the value of NextToken from the previous response to continue listing data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListIPSetsResponse : AWSModel


/**
 <p>The IDs of the IPSet resources.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ipSetIds;

/**
 <p>The pagination parameter to be used on the next list operation to retrieve more items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListInvitationsRequest : AWSRequest


/**
 <p>You can use this parameter to indicate the maximum number of items that you want in the response. The default value is 50. The maximum value is 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the list action. For subsequent calls to the action, fill nextToken in the request with the value of NextToken from the previous response to continue listing data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListInvitationsResponse : AWSModel


/**
 <p>A list of invitation descriptions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyInvitation *> * _Nullable invitations;

/**
 <p>The pagination parameter to be used on the next list operation to retrieve more items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListMembersRequest : AWSRequest


/**
 <p>The unique ID of the detector the member is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>You can use this parameter to indicate the maximum number of items you want in the response. The default value is 50. The maximum value is 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>You can use this parameter when paginating results. Set the value of this parameter to null on your first call to the list action. For subsequent calls to the action, fill nextToken in the request with the value of NextToken from the previous response to continue listing data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specifies what member accounts the response includes based on their relationship status with the master account. The default value is "true". If set to "false" the response includes all existing member accounts (including members who haven't been invited yet or have been disassociated).</p>
 */
@property (nonatomic, strong) NSString * _Nullable onlyAssociated;

@end

/**
 
 */
@interface AWSGuarddutyListMembersResponse : AWSModel


/**
 <p>A list of members.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyMember *> * _Nullable members;

/**
 <p>The pagination parameter to be used on the next list operation to retrieve more items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListOrganizationAdminAccountsRequest : AWSRequest


/**
 <p>The maximum number of results to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to use for paginating results that are returned in the response. Set the value of this parameter to null for the first request to a list action. For subsequent calls, use the <code>NextToken</code> value returned from the previous request to continue listing results after the first page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListOrganizationAdminAccountsResponse : AWSModel


/**
 <p>An AdminAccounts object that includes a list of accounts configured as GuardDuty delegated administrators.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyAdminAccount *> * _Nullable adminAccounts;

/**
 <p>The pagination parameter to be used on the next list operation to retrieve more items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListPublishingDestinationsRequest : AWSRequest


/**
 <p>The ID of the detector to retrieve publishing destinations for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The maximum number of results to return in the response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A token to use for paginating results that are returned in the response. Set the value of this parameter to null for the first request to a list action. For subsequent calls, use the <code>NextToken</code> value returned from the previous request to continue listing results after the first page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListPublishingDestinationsResponse : AWSModel


/**
 <p>A <code>Destinations</code> object that includes information about each publishing destination returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyDestination *> * _Nullable destinations;

/**
 <p>A token to use for paginating results that are returned in the response. Set the value of this parameter to null for the first request to a list action. For subsequent calls, use the <code>NextToken</code> value returned from the previous request to continue listing results after the first page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for the given GuardDuty resource. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSGuarddutyListTagsForResourceResponse : AWSModel


/**
 <p>The tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGuarddutyListThreatIntelSetsRequest : AWSRequest


/**
 <p>The unique ID of the detector that the threatIntelSet is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>You can use this parameter to indicate the maximum number of items that you want in the response. The default value is 50. The maximum value is 50.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>You can use this parameter to paginate results in the response. Set the value of this parameter to null on your first call to the list action. For subsequent calls to the action, fill nextToken in the request with the value of NextToken from the previous response to continue listing data.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuarddutyListThreatIntelSetsResponse : AWSModel


/**
 <p>The pagination parameter to be used on the next list operation to retrieve more items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The IDs of the ThreatIntelSet resources.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable threatIntelSetIds;

@end

/**
 <p>Contains information about the local IP address of the connection.</p>
 */
@interface AWSGuarddutyLocalIpDetails : AWSModel


/**
 <p>The IPv4 local address of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddressV4;

@end

/**
 <p>Contains information about the port for the local connection.</p>
 */
@interface AWSGuarddutyLocalPortDetails : AWSModel


/**
 <p>The port number of the local connection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The port name of the local connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portName;

@end

/**
 <p>Contains information about the master account and invitation.</p>
 */
@interface AWSGuarddutyMaster : AWSModel


/**
 <p>The ID of the account used as the master account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The value used to validate the master account to the member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invitationId;

/**
 <p>The timestamp when the invitation was sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invitedAt;

/**
 <p>The status of the relationship between the master and member accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationshipStatus;

@end

/**
 <p>Contains information about the member account. </p>
 Required parameters: [AccountId, MasterId, Email, RelationshipStatus, UpdatedAt]
 */
@interface AWSGuarddutyMember : AWSModel


/**
 <p>The ID of the member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The detector ID of the member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The email address of the member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The timestamp when the invitation was sent.</p>
 */
@property (nonatomic, strong) NSString * _Nullable invitedAt;

/**
 <p>The master account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterId;

/**
 <p>The status of the relationship between the member and the master.</p>
 */
@property (nonatomic, strong) NSString * _Nullable relationshipStatus;

/**
 <p>The last-updated timestamp of the member.</p>
 */
@property (nonatomic, strong) NSString * _Nullable updatedAt;

@end

/**
 <p>Contains information about the NETWORK_CONNECTION action described in the finding.</p>
 */
@interface AWSGuarddutyNetworkConnectionAction : AWSModel


/**
 <p>Indicates whether EC2 blocked the network connection to your instance.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable blocked;

/**
 <p>The network connection direction.</p>
 */
@property (nonatomic, strong) NSString * _Nullable connectionDirection;

/**
 <p>The local IP information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuarddutyLocalIpDetails * _Nullable localIpDetails;

/**
 <p>The local port information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuarddutyLocalPortDetails * _Nullable localPortDetails;

/**
 <p>The network connection protocol.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protocols;

/**
 <p>The remote IP information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuarddutyRemoteIpDetails * _Nullable remoteIpDetails;

/**
 <p>The remote port information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuarddutyRemotePortDetails * _Nullable remotePortDetails;

@end

/**
 <p>Contains information about the elastic network interface of the EC2 instance.</p>
 */
@interface AWSGuarddutyNetworkInterface : AWSModel


/**
 <p>A list of IPv6 addresses for the EC2 instance.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable ipv6Addresses;

/**
 <p>The ID of the network interface.</p>
 */
@property (nonatomic, strong) NSString * _Nullable networkInterfaceId;

/**
 <p>The private DNS name of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateDnsName;

/**
 <p>The private IP address of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

/**
 <p>Other private IP address information of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyPrivateIpAddressDetails *> * _Nullable privateIpAddresses;

/**
 <p>The public DNS name of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicDnsName;

/**
 <p>The public IP address of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable publicIp;

/**
 <p>The security groups associated with the EC2 instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutySecurityGroup *> * _Nullable securityGroups;

/**
 <p>The subnet ID of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subnetId;

/**
 <p>The VPC ID of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable vpcId;

@end

/**
 <p>Contains information about the ISP organization of the remote IP address.</p>
 */
@interface AWSGuarddutyOrganization : AWSModel


/**
 <p>The Autonomous System Number (ASN) of the internet provider of the remote IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable asn;

/**
 <p>The organization that registered this ASN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable asnOrg;

/**
 <p>The ISP information for the internet provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable isp;

/**
 <p>The name of the internet provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable org;

@end

/**
 <p>Contains information about the PORT_PROBE action described in the finding.</p>
 */
@interface AWSGuarddutyPortProbeAction : AWSModel


/**
 <p>Indicates whether EC2 blocked the port probe to the instance, such as with an ACL.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable blocked;

/**
 <p>A list of objects related to port probe details.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyPortProbeDetail *> * _Nullable portProbeDetails;

@end

/**
 <p>Contains information about the port probe details.</p>
 */
@interface AWSGuarddutyPortProbeDetail : AWSModel


/**
 <p>The local IP information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuarddutyLocalIpDetails * _Nullable localIpDetails;

/**
 <p>The local port information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuarddutyLocalPortDetails * _Nullable localPortDetails;

/**
 <p>The remote IP information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuarddutyRemoteIpDetails * _Nullable remoteIpDetails;

@end

/**
 <p>Contains other private IP address information of the EC2 instance.</p>
 */
@interface AWSGuarddutyPrivateIpAddressDetails : AWSModel


/**
 <p>The private DNS name of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateDnsName;

/**
 <p>The private IP address of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable privateIpAddress;

@end

/**
 <p>Contains information about the product code for the EC2 instance.</p>
 */
@interface AWSGuarddutyProductCode : AWSModel


/**
 <p>The product code information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>The product code type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable productType;

@end

/**
 <p>Contains information about the remote IP address of the connection.</p>
 */
@interface AWSGuarddutyRemoteIpDetails : AWSModel


/**
 <p>The city information of the remote IP address.</p>
 */
@property (nonatomic, strong) AWSGuarddutyCity * _Nullable city;

/**
 <p>The country code of the remote IP address.</p>
 */
@property (nonatomic, strong) AWSGuarddutyCountry * _Nullable country;

/**
 <p>The location information of the remote IP address.</p>
 */
@property (nonatomic, strong) AWSGuarddutyGeoLocation * _Nullable geoLocation;

/**
 <p>The IPv4 remote address of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddressV4;

/**
 <p>The ISP organization information of the remote IP address.</p>
 */
@property (nonatomic, strong) AWSGuarddutyOrganization * _Nullable organization;

@end

/**
 <p>Contains information about the remote port.</p>
 */
@interface AWSGuarddutyRemotePortDetails : AWSModel


/**
 <p>The port number of the remote connection.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable port;

/**
 <p>The port name of the remote connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable portName;

@end

/**
 <p>Contains information about the AWS resource associated with the activity that prompted GuardDuty to generate a finding.</p>
 */
@interface AWSGuarddutyResource : AWSModel


/**
 <p>The IAM access key details (IAM user information) of a user that engaged in the activity that prompted GuardDuty to generate a finding.</p>
 */
@property (nonatomic, strong) AWSGuarddutyAccessKeyDetails * _Nullable accessKeyDetails;

/**
 <p>The information about the EC2 instance associated with the activity that prompted GuardDuty to generate a finding.</p>
 */
@property (nonatomic, strong) AWSGuarddutyInstanceDetails * _Nullable instanceDetails;

/**
 <p>The type of AWS resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

@end

/**
 <p>Contains information about the security groups associated with the EC2 instance.</p>
 */
@interface AWSGuarddutySecurityGroup : AWSModel


/**
 <p>The security group ID of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The security group name of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

@end

/**
 <p>Contains additional information about the generated finding.</p>
 */
@interface AWSGuarddutyService : AWSModel


/**
 <p>Information about the activity that is described in a finding.</p>
 */
@property (nonatomic, strong) AWSGuarddutyAction * _Nullable action;

/**
 <p>Indicates whether this finding is archived.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable archived;

/**
 <p>The total count of the occurrences of this finding type.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable count;

/**
 <p>The detector ID for the GuardDuty service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The first-seen timestamp of the activity that prompted GuardDuty to generate this finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventFirstSeen;

/**
 <p>The last-seen timestamp of the activity that prompted GuardDuty to generate this finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventLastSeen;

/**
 <p>An evidence object associated with the service.</p>
 */
@property (nonatomic, strong) AWSGuarddutyEvidence * _Nullable evidence;

/**
 <p>The resource role information for this finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceRole;

/**
 <p>The name of the AWS service (GuardDuty) that generated a finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

/**
 <p>Feedback that was submitted about the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userFeedback;

@end

/**
 <p>Contains information about the criteria used for sorting findings.</p>
 */
@interface AWSGuarddutySortCriteria : AWSModel


/**
 <p>Represents the finding attribute (for example, accountId) to sort findings by.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The order by which the sorted findings are to be displayed.</p>
 */
@property (nonatomic, assign) AWSGuarddutyOrderBy orderBy;

@end

/**
 
 */
@interface AWSGuarddutyStartMonitoringMembersRequest : AWSRequest


/**
 <p>A list of account IDs of the GuardDuty member accounts to start monitoring.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

/**
 <p>The unique ID of the detector of the GuardDuty master account associated with the member accounts to monitor.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyStartMonitoringMembersResponse : AWSModel


/**
 <p>A list of objects that contain the unprocessed account and a result string that explains why it was unprocessed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSGuarddutyStopMonitoringMembersRequest : AWSRequest


/**
 <p>A list of account IDs for the member accounts to stop monitoring.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

/**
 <p>The unique ID of the detector associated with the GuardDuty master account that is monitoring member accounts.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyStopMonitoringMembersResponse : AWSModel


/**
 <p>A list of objects that contain an accountId for each account that could not be processed, and a result string that indicates why the account was not processed. </p>
 */
@property (nonatomic, strong) NSArray<AWSGuarddutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 <p>Contains information about a tag associated with the EC2 instance.</p>
 */
@interface AWSGuarddutyTag : AWSModel


/**
 <p>The EC2 instance tag key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The EC2 instance tag value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSGuarddutyTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for the GuardDuty resource to apply a tag to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags to be added to a resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGuarddutyTagResourceResponse : AWSModel


@end

/**
 <p>An instance of a threat intelligence detail that constitutes evidence for the finding.</p>
 */
@interface AWSGuarddutyThreatIntelligenceDetail : AWSModel


/**
 <p>The name of the threat intelligence list that triggered the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable threatListName;

/**
 <p>A list of names of the threats in the threat intelligence list that triggered the finding.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable threatNames;

@end

/**
 
 */
@interface AWSGuarddutyUnarchiveFindingsRequest : AWSRequest


/**
 <p>The ID of the detector associated with the findings to unarchive.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The IDs of the findings to unarchive.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable findingIds;

@end

/**
 
 */
@interface AWSGuarddutyUnarchiveFindingsResponse : AWSModel


@end

/**
 <p>Contains information about the accounts that weren't processed.</p>
 Required parameters: [AccountId, Result]
 */
@interface AWSGuarddutyUnprocessedAccount : AWSModel


/**
 <p>The AWS account ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>A reason why the account hasn't been processed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable result;

@end

/**
 
 */
@interface AWSGuarddutyUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for the resource to remove tags from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tag keys to remove from the resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSGuarddutyUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSGuarddutyUpdateDetectorRequest : AWSRequest


/**
 <p>The unique ID of the detector to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>Specifies whether the detector is enabled or not enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enable;

/**
 <p>An enum value that specifies how frequently findings are exported, such as to CloudWatch Events.</p>
 */
@property (nonatomic, assign) AWSGuarddutyFindingPublishingFrequency findingPublishingFrequency;

@end

/**
 
 */
@interface AWSGuarddutyUpdateDetectorResponse : AWSModel


@end

/**
 
 */
@interface AWSGuarddutyUpdateFilterRequest : AWSRequest


/**
 <p>Specifies the action that is to be applied to the findings that match the filter.</p>
 */
@property (nonatomic, assign) AWSGuarddutyFilterAction action;

/**
 <p>The description of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The unique ID of the detector that specifies the GuardDuty service where you want to update a filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterName;

/**
 <p>Represents the criteria to be used in the filter for querying findings.</p>
 */
@property (nonatomic, strong) AWSGuarddutyFindingCriteria * _Nullable findingCriteria;

/**
 <p>Specifies the position of the filter in the list of current filters. Also specifies the order in which this filter is applied to the findings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rank;

@end

/**
 
 */
@interface AWSGuarddutyUpdateFilterResponse : AWSModel


/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGuarddutyUpdateFindingsFeedbackRequest : AWSRequest


/**
 <p>Additional feedback about the GuardDuty findings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable comments;

/**
 <p>The ID of the detector associated with the findings to update feedback for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The feedback for the finding.</p>
 */
@property (nonatomic, assign) AWSGuarddutyFeedback feedback;

/**
 <p>The IDs of the findings that you want to mark as useful or not useful.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable findingIds;

@end

/**
 
 */
@interface AWSGuarddutyUpdateFindingsFeedbackResponse : AWSModel


@end

/**
 
 */
@interface AWSGuarddutyUpdateIPSetRequest : AWSRequest


/**
 <p>The updated Boolean value that specifies whether the IPSet is active or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable activate;

/**
 <p>The detectorID that specifies the GuardDuty service whose IPSet you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The unique ID that specifies the IPSet that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipSetId;

/**
 <p>The updated URI of the file that contains the IPSet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The unique ID that specifies the IPSet that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGuarddutyUpdateIPSetResponse : AWSModel


@end

/**
 
 */
@interface AWSGuarddutyUpdateOrganizationConfigurationRequest : AWSRequest


/**
 <p>Indicates whether to automatically enable member accounts in the organization.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable autoEnable;

/**
 <p>The ID of the detector to update the delegated administrator for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyUpdateOrganizationConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSGuarddutyUpdatePublishingDestinationRequest : AWSRequest


/**
 <p>The ID of the publishing destination to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationId;

/**
 <p>A <code>DestinationProperties</code> object that includes the <code>DestinationArn</code> and <code>KmsKeyArn</code> of the publishing destination.</p>
 */
@property (nonatomic, strong) AWSGuarddutyDestinationProperties * _Nullable destinationProperties;

/**
 <p>The ID of the detector associated with the publishing destinations to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuarddutyUpdatePublishingDestinationResponse : AWSModel


@end

/**
 
 */
@interface AWSGuarddutyUpdateThreatIntelSetRequest : AWSRequest


/**
 <p>The updated Boolean value that specifies whether the ThreateIntelSet is active or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable activate;

/**
 <p>The detectorID that specifies the GuardDuty service whose ThreatIntelSet you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The updated URI of the file that contains the ThreateIntelSet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The unique ID that specifies the ThreatIntelSet that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique ID that specifies the ThreatIntelSet that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable threatIntelSetId;

@end

/**
 
 */
@interface AWSGuarddutyUpdateThreatIntelSetResponse : AWSModel


@end

NS_ASSUME_NONNULL_END
