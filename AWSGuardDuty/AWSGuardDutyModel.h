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

FOUNDATION_EXPORT NSString *const AWSGuardDutyErrorDomain;

typedef NS_ENUM(NSInteger, AWSGuardDutyErrorType) {
    AWSGuardDutyErrorUnknown,
    AWSGuardDutyErrorBadRequest,
    AWSGuardDutyErrorInternalServerError,
};

typedef NS_ENUM(NSInteger, AWSGuardDutyAdminStatus) {
    AWSGuardDutyAdminStatusUnknown,
    AWSGuardDutyAdminStatusEnabled,
    AWSGuardDutyAdminStatusDisableInProgress,
};

typedef NS_ENUM(NSInteger, AWSGuardDutyDestinationType) {
    AWSGuardDutyDestinationTypeUnknown,
    AWSGuardDutyDestinationTypeS3,
};

typedef NS_ENUM(NSInteger, AWSGuardDutyDetectorStatus) {
    AWSGuardDutyDetectorStatusUnknown,
    AWSGuardDutyDetectorStatusEnabled,
    AWSGuardDutyDetectorStatusDisabled,
};

typedef NS_ENUM(NSInteger, AWSGuardDutyFeedback) {
    AWSGuardDutyFeedbackUnknown,
    AWSGuardDutyFeedbackUseful,
    AWSGuardDutyFeedbackNotUseful,
};

typedef NS_ENUM(NSInteger, AWSGuardDutyFilterAction) {
    AWSGuardDutyFilterActionUnknown,
    AWSGuardDutyFilterActionNoop,
    AWSGuardDutyFilterActionArchive,
};

typedef NS_ENUM(NSInteger, AWSGuardDutyFindingPublishingFrequency) {
    AWSGuardDutyFindingPublishingFrequencyUnknown,
    AWSGuardDutyFindingPublishingFrequencyFifteenMinutes,
    AWSGuardDutyFindingPublishingFrequencyOneHour,
    AWSGuardDutyFindingPublishingFrequencySixHours,
};

typedef NS_ENUM(NSInteger, AWSGuardDutyFindingStatisticType) {
    AWSGuardDutyFindingStatisticTypeUnknown,
    AWSGuardDutyFindingStatisticTypeCountBySeverity,
};

typedef NS_ENUM(NSInteger, AWSGuardDutyIpSetFormat) {
    AWSGuardDutyIpSetFormatUnknown,
    AWSGuardDutyIpSetFormatTxt,
    AWSGuardDutyIpSetFormatStix,
    AWSGuardDutyIpSetFormatOtxCsv,
    AWSGuardDutyIpSetFormatAlienVault,
    AWSGuardDutyIpSetFormatProofPoint,
    AWSGuardDutyIpSetFormatFireEye,
};

typedef NS_ENUM(NSInteger, AWSGuardDutyIpSetStatus) {
    AWSGuardDutyIpSetStatusUnknown,
    AWSGuardDutyIpSetStatusInactive,
    AWSGuardDutyIpSetStatusActivating,
    AWSGuardDutyIpSetStatusActive,
    AWSGuardDutyIpSetStatusDeactivating,
    AWSGuardDutyIpSetStatusError,
    AWSGuardDutyIpSetStatusDeletePending,
    AWSGuardDutyIpSetStatusDeleted,
};

typedef NS_ENUM(NSInteger, AWSGuardDutyOrderBy) {
    AWSGuardDutyOrderByUnknown,
    AWSGuardDutyOrderByAsc,
    AWSGuardDutyOrderByDesc,
};

typedef NS_ENUM(NSInteger, AWSGuardDutyPublishingStatus) {
    AWSGuardDutyPublishingStatusUnknown,
    AWSGuardDutyPublishingStatusPendingVerification,
    AWSGuardDutyPublishingStatusPublishing,
    AWSGuardDutyPublishingStatusUnableToPublishFixDestinationProperty,
    AWSGuardDutyPublishingStatusStopped,
};

typedef NS_ENUM(NSInteger, AWSGuardDutyThreatIntelSetFormat) {
    AWSGuardDutyThreatIntelSetFormatUnknown,
    AWSGuardDutyThreatIntelSetFormatTxt,
    AWSGuardDutyThreatIntelSetFormatStix,
    AWSGuardDutyThreatIntelSetFormatOtxCsv,
    AWSGuardDutyThreatIntelSetFormatAlienVault,
    AWSGuardDutyThreatIntelSetFormatProofPoint,
    AWSGuardDutyThreatIntelSetFormatFireEye,
};

typedef NS_ENUM(NSInteger, AWSGuardDutyThreatIntelSetStatus) {
    AWSGuardDutyThreatIntelSetStatusUnknown,
    AWSGuardDutyThreatIntelSetStatusInactive,
    AWSGuardDutyThreatIntelSetStatusActivating,
    AWSGuardDutyThreatIntelSetStatusActive,
    AWSGuardDutyThreatIntelSetStatusDeactivating,
    AWSGuardDutyThreatIntelSetStatusError,
    AWSGuardDutyThreatIntelSetStatusDeletePending,
    AWSGuardDutyThreatIntelSetStatusDeleted,
};

@class AWSGuardDutyAcceptInvitationRequest;
@class AWSGuardDutyAcceptInvitationResponse;
@class AWSGuardDutyAccessKeyDetails;
@class AWSGuardDutyAccountDetail;
@class AWSGuardDutyAction;
@class AWSGuardDutyAdminAccount;
@class AWSGuardDutyArchiveFindingsRequest;
@class AWSGuardDutyArchiveFindingsResponse;
@class AWSGuardDutyAwsApiCallAction;
@class AWSGuardDutyCity;
@class AWSGuardDutyCondition;
@class AWSGuardDutyCountry;
@class AWSGuardDutyCreateDetectorRequest;
@class AWSGuardDutyCreateDetectorResponse;
@class AWSGuardDutyCreateFilterRequest;
@class AWSGuardDutyCreateFilterResponse;
@class AWSGuardDutyCreateIPSetRequest;
@class AWSGuardDutyCreateIPSetResponse;
@class AWSGuardDutyCreateMembersRequest;
@class AWSGuardDutyCreateMembersResponse;
@class AWSGuardDutyCreatePublishingDestinationRequest;
@class AWSGuardDutyCreatePublishingDestinationResponse;
@class AWSGuardDutyCreateSampleFindingsRequest;
@class AWSGuardDutyCreateSampleFindingsResponse;
@class AWSGuardDutyCreateThreatIntelSetRequest;
@class AWSGuardDutyCreateThreatIntelSetResponse;
@class AWSGuardDutyDeclineInvitationsRequest;
@class AWSGuardDutyDeclineInvitationsResponse;
@class AWSGuardDutyDeleteDetectorRequest;
@class AWSGuardDutyDeleteDetectorResponse;
@class AWSGuardDutyDeleteFilterRequest;
@class AWSGuardDutyDeleteFilterResponse;
@class AWSGuardDutyDeleteIPSetRequest;
@class AWSGuardDutyDeleteIPSetResponse;
@class AWSGuardDutyDeleteInvitationsRequest;
@class AWSGuardDutyDeleteInvitationsResponse;
@class AWSGuardDutyDeleteMembersRequest;
@class AWSGuardDutyDeleteMembersResponse;
@class AWSGuardDutyDeletePublishingDestinationRequest;
@class AWSGuardDutyDeletePublishingDestinationResponse;
@class AWSGuardDutyDeleteThreatIntelSetRequest;
@class AWSGuardDutyDeleteThreatIntelSetResponse;
@class AWSGuardDutyDescribeOrganizationConfigurationRequest;
@class AWSGuardDutyDescribeOrganizationConfigurationResponse;
@class AWSGuardDutyDescribePublishingDestinationRequest;
@class AWSGuardDutyDescribePublishingDestinationResponse;
@class AWSGuardDutyDestination;
@class AWSGuardDutyDestinationProperties;
@class AWSGuardDutyDisableOrganizationAdminAccountRequest;
@class AWSGuardDutyDisableOrganizationAdminAccountResponse;
@class AWSGuardDutyDisassociateFromMasterAccountRequest;
@class AWSGuardDutyDisassociateFromMasterAccountResponse;
@class AWSGuardDutyDisassociateMembersRequest;
@class AWSGuardDutyDisassociateMembersResponse;
@class AWSGuardDutyDnsRequestAction;
@class AWSGuardDutyDomainDetails;
@class AWSGuardDutyEnableOrganizationAdminAccountRequest;
@class AWSGuardDutyEnableOrganizationAdminAccountResponse;
@class AWSGuardDutyEvidence;
@class AWSGuardDutyFinding;
@class AWSGuardDutyFindingCriteria;
@class AWSGuardDutyFindingStatistics;
@class AWSGuardDutyGeoLocation;
@class AWSGuardDutyGetDetectorRequest;
@class AWSGuardDutyGetDetectorResponse;
@class AWSGuardDutyGetFilterRequest;
@class AWSGuardDutyGetFilterResponse;
@class AWSGuardDutyGetFindingsRequest;
@class AWSGuardDutyGetFindingsResponse;
@class AWSGuardDutyGetFindingsStatisticsRequest;
@class AWSGuardDutyGetFindingsStatisticsResponse;
@class AWSGuardDutyGetIPSetRequest;
@class AWSGuardDutyGetIPSetResponse;
@class AWSGuardDutyGetInvitationsCountRequest;
@class AWSGuardDutyGetInvitationsCountResponse;
@class AWSGuardDutyGetMasterAccountRequest;
@class AWSGuardDutyGetMasterAccountResponse;
@class AWSGuardDutyGetMembersRequest;
@class AWSGuardDutyGetMembersResponse;
@class AWSGuardDutyGetThreatIntelSetRequest;
@class AWSGuardDutyGetThreatIntelSetResponse;
@class AWSGuardDutyIamInstanceProfile;
@class AWSGuardDutyInstanceDetails;
@class AWSGuardDutyInvitation;
@class AWSGuardDutyInviteMembersRequest;
@class AWSGuardDutyInviteMembersResponse;
@class AWSGuardDutyListDetectorsRequest;
@class AWSGuardDutyListDetectorsResponse;
@class AWSGuardDutyListFiltersRequest;
@class AWSGuardDutyListFiltersResponse;
@class AWSGuardDutyListFindingsRequest;
@class AWSGuardDutyListFindingsResponse;
@class AWSGuardDutyListIPSetsRequest;
@class AWSGuardDutyListIPSetsResponse;
@class AWSGuardDutyListInvitationsRequest;
@class AWSGuardDutyListInvitationsResponse;
@class AWSGuardDutyListMembersRequest;
@class AWSGuardDutyListMembersResponse;
@class AWSGuardDutyListOrganizationAdminAccountsRequest;
@class AWSGuardDutyListOrganizationAdminAccountsResponse;
@class AWSGuardDutyListPublishingDestinationsRequest;
@class AWSGuardDutyListPublishingDestinationsResponse;
@class AWSGuardDutyListTagsForResourceRequest;
@class AWSGuardDutyListTagsForResourceResponse;
@class AWSGuardDutyListThreatIntelSetsRequest;
@class AWSGuardDutyListThreatIntelSetsResponse;
@class AWSGuardDutyLocalIpDetails;
@class AWSGuardDutyLocalPortDetails;
@class AWSGuardDutyMaster;
@class AWSGuardDutyMember;
@class AWSGuardDutyNetworkConnectionAction;
@class AWSGuardDutyNetworkInterface;
@class AWSGuardDutyOrganization;
@class AWSGuardDutyPortProbeAction;
@class AWSGuardDutyPortProbeDetail;
@class AWSGuardDutyPrivateIpAddressDetails;
@class AWSGuardDutyProductCode;
@class AWSGuardDutyRemoteIpDetails;
@class AWSGuardDutyRemotePortDetails;
@class AWSGuardDutyResource;
@class AWSGuardDutySecurityGroup;
@class AWSGuardDutyService;
@class AWSGuardDutySortCriteria;
@class AWSGuardDutyStartMonitoringMembersRequest;
@class AWSGuardDutyStartMonitoringMembersResponse;
@class AWSGuardDutyStopMonitoringMembersRequest;
@class AWSGuardDutyStopMonitoringMembersResponse;
@class AWSGuardDutyTag;
@class AWSGuardDutyTagResourceRequest;
@class AWSGuardDutyTagResourceResponse;
@class AWSGuardDutyThreatIntelligenceDetail;
@class AWSGuardDutyUnarchiveFindingsRequest;
@class AWSGuardDutyUnarchiveFindingsResponse;
@class AWSGuardDutyUnprocessedAccount;
@class AWSGuardDutyUntagResourceRequest;
@class AWSGuardDutyUntagResourceResponse;
@class AWSGuardDutyUpdateDetectorRequest;
@class AWSGuardDutyUpdateDetectorResponse;
@class AWSGuardDutyUpdateFilterRequest;
@class AWSGuardDutyUpdateFilterResponse;
@class AWSGuardDutyUpdateFindingsFeedbackRequest;
@class AWSGuardDutyUpdateFindingsFeedbackResponse;
@class AWSGuardDutyUpdateIPSetRequest;
@class AWSGuardDutyUpdateIPSetResponse;
@class AWSGuardDutyUpdateOrganizationConfigurationRequest;
@class AWSGuardDutyUpdateOrganizationConfigurationResponse;
@class AWSGuardDutyUpdatePublishingDestinationRequest;
@class AWSGuardDutyUpdatePublishingDestinationResponse;
@class AWSGuardDutyUpdateThreatIntelSetRequest;
@class AWSGuardDutyUpdateThreatIntelSetResponse;

/**
 
 */
@interface AWSGuardDutyAcceptInvitationRequest : AWSRequest


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
@interface AWSGuardDutyAcceptInvitationResponse : AWSModel


@end

/**
 <p>Contains information about the access keys.</p>
 */
@interface AWSGuardDutyAccessKeyDetails : AWSModel


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
@interface AWSGuardDutyAccountDetail : AWSModel


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
@interface AWSGuardDutyAction : AWSModel


/**
 <p>The GuardDuty finding activity type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionType;

/**
 <p>Information about the AWS_API_CALL action described in this finding.</p>
 */
@property (nonatomic, strong) AWSGuardDutyAwsApiCallAction * _Nullable awsApiCallAction;

/**
 <p>Information about the DNS_REQUEST action described in this finding.</p>
 */
@property (nonatomic, strong) AWSGuardDutyDnsRequestAction * _Nullable dnsRequestAction;

/**
 <p>Information about the NETWORK_CONNECTION action described in this finding.</p>
 */
@property (nonatomic, strong) AWSGuardDutyNetworkConnectionAction * _Nullable networkConnectionAction;

/**
 <p>Information about the PORT_PROBE action described in this finding.</p>
 */
@property (nonatomic, strong) AWSGuardDutyPortProbeAction * _Nullable portProbeAction;

@end

/**
 <p>The account within the organization specified as the GuardDuty delegated administrator.</p>
 */
@interface AWSGuardDutyAdminAccount : AWSModel


/**
 <p>The AWS account ID for the account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adminAccountId;

/**
 <p>Indicates whether the account is enabled as the delegated administrator.</p>
 */
@property (nonatomic, assign) AWSGuardDutyAdminStatus adminStatus;

@end

/**
 
 */
@interface AWSGuardDutyArchiveFindingsRequest : AWSRequest


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
@interface AWSGuardDutyArchiveFindingsResponse : AWSModel


@end

/**
 <p>Contains information about the API operation.</p>
 */
@interface AWSGuardDutyAwsApiCallAction : AWSModel


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
@property (nonatomic, strong) AWSGuardDutyDomainDetails * _Nullable domainDetails;

/**
 <p>The remote IP information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuardDutyRemoteIpDetails * _Nullable remoteIpDetails;

/**
 <p>The AWS service name whose API was invoked.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

@end

/**
 <p>Contains information about the city associated with the IP address.</p>
 */
@interface AWSGuardDutyCity : AWSModel


/**
 <p>The city name of the remote IP address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cityName;

@end

/**
 <p>Contains information about the condition.</p>
 */
@interface AWSGuardDutyCondition : AWSModel


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
@interface AWSGuardDutyCountry : AWSModel


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
@interface AWSGuardDutyCreateDetectorRequest : AWSRequest


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
@property (nonatomic, assign) AWSGuardDutyFindingPublishingFrequency findingPublishingFrequency;

/**
 <p>The tags to be added to a new detector resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGuardDutyCreateDetectorResponse : AWSModel


/**
 <p>The unique ID of the created detector.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuardDutyCreateFilterRequest : AWSRequest


/**
 <p>Specifies the action that is to be applied to the findings that match the filter.</p>
 */
@property (nonatomic, assign) AWSGuardDutyFilterAction action;

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
@property (nonatomic, strong) AWSGuardDutyFindingCriteria * _Nullable findingCriteria;

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
@interface AWSGuardDutyCreateFilterResponse : AWSModel


/**
 <p>The name of the successfully created filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGuardDutyCreateIPSetRequest : AWSRequest


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
@property (nonatomic, assign) AWSGuardDutyIpSetFormat format;

/**
 <p>The URI of the file that contains the IPSet. For example: .</p>
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
@interface AWSGuardDutyCreateIPSetResponse : AWSModel


/**
 <p>The ID of the IPSet resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipSetId;

@end

/**
 
 */
@interface AWSGuardDutyCreateMembersRequest : AWSRequest


/**
 <p>A list of account ID and email address pairs of the accounts that you want to associate with the master GuardDuty account.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyAccountDetail *> * _Nullable accountDetails;

/**
 <p>The unique ID of the detector of the GuardDuty account that you want to associate member accounts with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuardDutyCreateMembersResponse : AWSModel


/**
 <p>A list of objects that include the <code>accountIds</code> of the unprocessed accounts and a result string that explains why each was unprocessed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSGuardDutyCreatePublishingDestinationRequest : AWSRequest


/**
 <p>The idempotency token for the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientToken;

/**
 <p>The properties of the publishing destination, including the ARNs for the destination and the KMS key used for encryption.</p>
 */
@property (nonatomic, strong) AWSGuardDutyDestinationProperties * _Nullable destinationProperties;

/**
 <p>The type of resource for the publishing destination. Currently only Amazon S3 buckets are supported.</p>
 */
@property (nonatomic, assign) AWSGuardDutyDestinationType destinationType;

/**
 <p>The ID of the GuardDuty detector associated with the publishing destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuardDutyCreatePublishingDestinationResponse : AWSModel


/**
 <p>The ID of the publishing destination that is created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationId;

@end

/**
 
 */
@interface AWSGuardDutyCreateSampleFindingsRequest : AWSRequest


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
@interface AWSGuardDutyCreateSampleFindingsResponse : AWSModel


@end

/**
 
 */
@interface AWSGuardDutyCreateThreatIntelSetRequest : AWSRequest


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
@property (nonatomic, assign) AWSGuardDutyThreatIntelSetFormat format;

/**
 <p>The URI of the file that contains the ThreatIntelSet. For example: .</p>
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
@interface AWSGuardDutyCreateThreatIntelSetResponse : AWSModel


/**
 <p>The ID of the ThreatIntelSet resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable threatIntelSetId;

@end

/**
 
 */
@interface AWSGuardDutyDeclineInvitationsRequest : AWSRequest


/**
 <p>A list of account IDs of the AWS accounts that sent invitations to the current member account that you want to decline invitations from.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

@end

/**
 
 */
@interface AWSGuardDutyDeclineInvitationsResponse : AWSModel


/**
 <p>A list of objects that contain the unprocessed account and a result string that explains why it was unprocessed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSGuardDutyDeleteDetectorRequest : AWSRequest


/**
 <p>The unique ID of the detector that you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuardDutyDeleteDetectorResponse : AWSModel


@end

/**
 
 */
@interface AWSGuardDutyDeleteFilterRequest : AWSRequest


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
@interface AWSGuardDutyDeleteFilterResponse : AWSModel


@end

/**
 
 */
@interface AWSGuardDutyDeleteIPSetRequest : AWSRequest


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
@interface AWSGuardDutyDeleteIPSetResponse : AWSModel


@end

/**
 
 */
@interface AWSGuardDutyDeleteInvitationsRequest : AWSRequest


/**
 <p>A list of account IDs of the AWS accounts that sent invitations to the current member account that you want to delete invitations from.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountIds;

@end

/**
 
 */
@interface AWSGuardDutyDeleteInvitationsResponse : AWSModel


/**
 <p>A list of objects that contain the unprocessed account and a result string that explains why it was unprocessed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSGuardDutyDeleteMembersRequest : AWSRequest


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
@interface AWSGuardDutyDeleteMembersResponse : AWSModel


/**
 <p>The accounts that could not be processed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSGuardDutyDeletePublishingDestinationRequest : AWSRequest


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
@interface AWSGuardDutyDeletePublishingDestinationResponse : AWSModel


@end

/**
 
 */
@interface AWSGuardDutyDeleteThreatIntelSetRequest : AWSRequest


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
@interface AWSGuardDutyDeleteThreatIntelSetResponse : AWSModel


@end

/**
 
 */
@interface AWSGuardDutyDescribeOrganizationConfigurationRequest : AWSRequest


/**
 <p>The ID of the detector to retrieve information about the delegated administrator from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuardDutyDescribeOrganizationConfigurationResponse : AWSModel


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
@interface AWSGuardDutyDescribePublishingDestinationRequest : AWSRequest


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
@interface AWSGuardDutyDescribePublishingDestinationResponse : AWSModel


/**
 <p>The ID of the publishing destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationId;

/**
 <p>A <code>DestinationProperties</code> object that includes the <code>DestinationArn</code> and <code>KmsKeyArn</code> of the publishing destination.</p>
 */
@property (nonatomic, strong) AWSGuardDutyDestinationProperties * _Nullable destinationProperties;

/**
 <p>The type of publishing destination. Currently, only Amazon S3 buckets are supported.</p>
 */
@property (nonatomic, assign) AWSGuardDutyDestinationType destinationType;

/**
 <p>The time, in epoch millisecond format, at which GuardDuty was first unable to publish findings to the destination.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable publishingFailureStartTimestamp;

/**
 <p>The status of the publishing destination.</p>
 */
@property (nonatomic, assign) AWSGuardDutyPublishingStatus status;

@end

/**
 <p>Contains information about the publishing destination, including the ID, type, and status.</p>
 Required parameters: [DestinationId, DestinationType, Status]
 */
@interface AWSGuardDutyDestination : AWSModel


/**
 <p>The unique ID of the publishing destination.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationId;

/**
 <p>The type of resource used for the publishing destination. Currently, only Amazon S3 buckets are supported.</p>
 */
@property (nonatomic, assign) AWSGuardDutyDestinationType destinationType;

/**
 <p>The status of the publishing destination.</p>
 */
@property (nonatomic, assign) AWSGuardDutyPublishingStatus status;

@end

/**
 <p>Contains the Amazon Resource Name (ARN) of the resource to publish to, such as an S3 bucket, and the ARN of the KMS key to use to encrypt published findings.</p>
 */
@interface AWSGuardDutyDestinationProperties : AWSModel


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
@interface AWSGuardDutyDisableOrganizationAdminAccountRequest : AWSRequest


/**
 <p>The AWS Account ID for the organizations account to be disabled as a GuardDuty delegated administrator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adminAccountId;

@end

/**
 
 */
@interface AWSGuardDutyDisableOrganizationAdminAccountResponse : AWSModel


@end

/**
 
 */
@interface AWSGuardDutyDisassociateFromMasterAccountRequest : AWSRequest


/**
 <p>The unique ID of the detector of the GuardDuty member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuardDutyDisassociateFromMasterAccountResponse : AWSModel


@end

/**
 
 */
@interface AWSGuardDutyDisassociateMembersRequest : AWSRequest


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
@interface AWSGuardDutyDisassociateMembersResponse : AWSModel


/**
 <p>A list of objects that contain the unprocessed account and a result string that explains why it was unprocessed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 <p>Contains information about the DNS_REQUEST action described in this finding.</p>
 */
@interface AWSGuardDutyDnsRequestAction : AWSModel


/**
 <p>The domain information for the API request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

@end

/**
 <p>Contains information about the domain.</p>
 */
@interface AWSGuardDutyDomainDetails : AWSModel


/**
 <p>The domain information for the AWS API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

@end

/**
 
 */
@interface AWSGuardDutyEnableOrganizationAdminAccountRequest : AWSRequest


/**
 <p>The AWS Account ID for the organization account to be enabled as a GuardDuty delegated administrator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable adminAccountId;

@end

/**
 
 */
@interface AWSGuardDutyEnableOrganizationAdminAccountResponse : AWSModel


@end

/**
 <p>Contains information about the reason that the finding was generated.</p>
 */
@interface AWSGuardDutyEvidence : AWSModel


/**
 <p>A list of threat intelligence details related to the evidence.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyThreatIntelligenceDetail *> * _Nullable threatIntelligenceDetails;

@end

/**
 <p>Contains information about the finding, which is generated when abnormal or suspicious activity is detected.</p>
 Required parameters: [AccountId, Arn, CreatedAt, Id, Region, Resource, SchemaVersion, Severity, Type, UpdatedAt]
 */
@interface AWSGuardDutyFinding : AWSModel


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
@property (nonatomic, strong) AWSGuardDutyResource * _Nullable resource;

/**
 <p>The version of the schema used for the finding.</p>
 */
@property (nonatomic, strong) NSString * _Nullable schemaVersion;

/**
 <p>Contains additional information about the generated finding.</p>
 */
@property (nonatomic, strong) AWSGuardDutyService * _Nullable service;

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
@interface AWSGuardDutyFindingCriteria : AWSModel


/**
 <p>Represents a map of finding properties that match specified conditions and values when querying findings.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, AWSGuardDutyCondition *> * _Nullable criterion;

@end

/**
 <p>Contains information about finding statistics.</p>
 */
@interface AWSGuardDutyFindingStatistics : AWSModel


/**
 <p>Represents a map of severity to count statistics for a set of findings.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable countBySeverity;

@end

/**
 <p>Contains information about the location of the remote IP address.</p>
 */
@interface AWSGuardDutyGeoLocation : AWSModel


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
@interface AWSGuardDutyGetDetectorRequest : AWSRequest


/**
 <p>The unique ID of the detector that you want to get.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuardDutyGetDetectorResponse : AWSModel


/**
 <p>The timestamp of when the detector was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createdAt;

/**
 <p>The publishing frequency of the finding.</p>
 */
@property (nonatomic, assign) AWSGuardDutyFindingPublishingFrequency findingPublishingFrequency;

/**
 <p>The GuardDuty service role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceRole;

/**
 <p>The detector status.</p>
 */
@property (nonatomic, assign) AWSGuardDutyDetectorStatus status;

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
@interface AWSGuardDutyGetFilterRequest : AWSRequest


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
@interface AWSGuardDutyGetFilterResponse : AWSModel


/**
 <p>Specifies the action that is to be applied to the findings that match the filter.</p>
 */
@property (nonatomic, assign) AWSGuardDutyFilterAction action;

/**
 <p>The description of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Represents the criteria to be used in the filter for querying findings.</p>
 */
@property (nonatomic, strong) AWSGuardDutyFindingCriteria * _Nullable findingCriteria;

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
@interface AWSGuardDutyGetFindingsRequest : AWSRequest


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
@property (nonatomic, strong) AWSGuardDutySortCriteria * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSGuardDutyGetFindingsResponse : AWSModel


/**
 <p>A list of findings.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyFinding *> * _Nullable findings;

@end

/**
 
 */
@interface AWSGuardDutyGetFindingsStatisticsRequest : AWSRequest


/**
 <p>The ID of the detector that specifies the GuardDuty service whose findings' statistics you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>Represents the criteria that is used for querying findings.</p>
 */
@property (nonatomic, strong) AWSGuardDutyFindingCriteria * _Nullable findingCriteria;

/**
 <p>The types of finding statistics to retrieve.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable findingStatisticTypes;

@end

/**
 
 */
@interface AWSGuardDutyGetFindingsStatisticsResponse : AWSModel


/**
 <p>The finding statistics object.</p>
 */
@property (nonatomic, strong) AWSGuardDutyFindingStatistics * _Nullable findingStatistics;

@end

/**
 
 */
@interface AWSGuardDutyGetIPSetRequest : AWSRequest


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
@interface AWSGuardDutyGetIPSetResponse : AWSModel


/**
 <p>The format of the file that contains the IPSet.</p>
 */
@property (nonatomic, assign) AWSGuardDutyIpSetFormat format;

/**
 <p>The URI of the file that contains the IPSet. For example: .</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The user-friendly name for the IPSet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of IPSet file that was uploaded.</p>
 */
@property (nonatomic, assign) AWSGuardDutyIpSetStatus status;

/**
 <p>The tags of the IPSet resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGuardDutyGetInvitationsCountRequest : AWSRequest


@end

/**
 
 */
@interface AWSGuardDutyGetInvitationsCountResponse : AWSModel


/**
 <p>The number of received invitations.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable invitationsCount;

@end

/**
 
 */
@interface AWSGuardDutyGetMasterAccountRequest : AWSRequest


/**
 <p>The unique ID of the detector of the GuardDuty member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuardDutyGetMasterAccountResponse : AWSModel


/**
 <p>The master account details.</p>
 */
@property (nonatomic, strong) AWSGuardDutyMaster * _Nullable master;

@end

/**
 
 */
@interface AWSGuardDutyGetMembersRequest : AWSRequest


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
@interface AWSGuardDutyGetMembersResponse : AWSModel


/**
 <p>A list of members.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyMember *> * _Nullable members;

/**
 <p>A list of objects that contain the unprocessed account and a result string that explains why it was unprocessed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSGuardDutyGetThreatIntelSetRequest : AWSRequest


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
@interface AWSGuardDutyGetThreatIntelSetResponse : AWSModel


/**
 <p>The format of the threatIntelSet.</p>
 */
@property (nonatomic, assign) AWSGuardDutyThreatIntelSetFormat format;

/**
 <p>The URI of the file that contains the ThreatIntelSet. For example: .</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>A user-friendly ThreatIntelSet name displayed in all findings that are generated by activity that involves IP addresses included in this ThreatIntelSet.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of threatIntelSet file uploaded.</p>
 */
@property (nonatomic, assign) AWSGuardDutyThreatIntelSetStatus status;

/**
 <p>The tags of the threat list resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 <p>Contains information about the EC2 instance profile.</p>
 */
@interface AWSGuardDutyIamInstanceProfile : AWSModel


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
@interface AWSGuardDutyInstanceDetails : AWSModel


/**
 <p>The Availability Zone of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSString * _Nullable availabilityZone;

/**
 <p>The profile information of the EC2 instance.</p>
 */
@property (nonatomic, strong) AWSGuardDutyIamInstanceProfile * _Nullable iamInstanceProfile;

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
@property (nonatomic, strong) NSArray<AWSGuardDutyNetworkInterface *> * _Nullable networkInterfaces;

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
@property (nonatomic, strong) NSArray<AWSGuardDutyProductCode *> * _Nullable productCodes;

/**
 <p>The tags of the EC2 instance.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyTag *> * _Nullable tags;

@end

/**
 <p>Contains information about the invitation to become a member account.</p>
 */
@interface AWSGuardDutyInvitation : AWSModel


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
@interface AWSGuardDutyInviteMembersRequest : AWSRequest


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
@interface AWSGuardDutyInviteMembersResponse : AWSModel


/**
 <p>A list of objects that contain the unprocessed account and a result string that explains why it was unprocessed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSGuardDutyListDetectorsRequest : AWSRequest


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
@interface AWSGuardDutyListDetectorsResponse : AWSModel


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
@interface AWSGuardDutyListFiltersRequest : AWSRequest


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
@interface AWSGuardDutyListFiltersResponse : AWSModel


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
@interface AWSGuardDutyListFindingsRequest : AWSRequest


/**
 <p>The ID of the detector that specifies the GuardDuty service whose findings you want to list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>Represents the criteria used for querying findings. Valid values include:</p><ul><li><p>JSON field name</p></li><li><p>accountId</p></li><li><p>region</p></li><li><p>confidence</p></li><li><p>id</p></li><li><p>resource.accessKeyDetails.accessKeyId</p></li><li><p>resource.accessKeyDetails.principalId</p></li><li><p>resource.accessKeyDetails.userName</p></li><li><p>resource.accessKeyDetails.userType</p></li><li><p>resource.instanceDetails.iamInstanceProfile.id</p></li><li><p>resource.instanceDetails.imageId</p></li><li><p>resource.instanceDetails.instanceId</p></li><li><p>resource.instanceDetails.outpostArn</p></li><li><p>resource.instanceDetails.networkInterfaces.ipv6Addresses</p></li><li><p>resource.instanceDetails.networkInterfaces.privateIpAddresses.privateIpAddress</p></li><li><p>resource.instanceDetails.networkInterfaces.publicDnsName</p></li><li><p>resource.instanceDetails.networkInterfaces.publicIp</p></li><li><p>resource.instanceDetails.networkInterfaces.securityGroups.groupId</p></li><li><p>resource.instanceDetails.networkInterfaces.securityGroups.groupName</p></li><li><p>resource.instanceDetails.networkInterfaces.subnetId</p></li><li><p>resource.instanceDetails.networkInterfaces.vpcId</p></li><li><p>resource.instanceDetails.tags.key</p></li><li><p>resource.instanceDetails.tags.value</p></li><li><p>resource.resourceType</p></li><li><p>service.action.actionType</p></li><li><p>service.action.awsApiCallAction.api</p></li><li><p>service.action.awsApiCallAction.callerType</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.city.cityName</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.country.countryName</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.ipAddressV4</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.organization.asn</p></li><li><p>service.action.awsApiCallAction.remoteIpDetails.organization.asnOrg</p></li><li><p>service.action.awsApiCallAction.serviceName</p></li><li><p>service.action.dnsRequestAction.domain</p></li><li><p>service.action.networkConnectionAction.blocked</p></li><li><p>service.action.networkConnectionAction.connectionDirection</p></li><li><p>service.action.networkConnectionAction.localPortDetails.port</p></li><li><p>service.action.networkConnectionAction.protocol</p></li><li><p>service.action.networkConnectionAction.localIpDetails.ipAddressV4</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.city.cityName</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.country.countryName</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.ipAddressV4</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.organization.asn</p></li><li><p>service.action.networkConnectionAction.remoteIpDetails.organization.asnOrg</p></li><li><p>service.action.networkConnectionAction.remotePortDetails.port</p></li><li><p>service.additionalInfo.threatListName</p></li><li><p>service.archived</p><p>When this attribute is set to 'true', only archived findings are listed. When it's set to 'false', only unarchived findings are listed. When this attribute is not set, all existing findings are listed.</p></li><li><p>service.resourceRole</p></li><li><p>severity</p></li><li><p>type</p></li><li><p>updatedAt</p><p>Type: Timestamp in Unix Epoch millisecond format: 1486685375000</p></li></ul>
 */
@property (nonatomic, strong) AWSGuardDutyFindingCriteria * _Nullable findingCriteria;

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
@property (nonatomic, strong) AWSGuardDutySortCriteria * _Nullable sortCriteria;

@end

/**
 
 */
@interface AWSGuardDutyListFindingsResponse : AWSModel


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
@interface AWSGuardDutyListIPSetsRequest : AWSRequest


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
@interface AWSGuardDutyListIPSetsResponse : AWSModel


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
@interface AWSGuardDutyListInvitationsRequest : AWSRequest


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
@interface AWSGuardDutyListInvitationsResponse : AWSModel


/**
 <p>A list of invitation descriptions.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyInvitation *> * _Nullable invitations;

/**
 <p>The pagination parameter to be used on the next list operation to retrieve more items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuardDutyListMembersRequest : AWSRequest


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
@interface AWSGuardDutyListMembersResponse : AWSModel


/**
 <p>A list of members.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyMember *> * _Nullable members;

/**
 <p>The pagination parameter to be used on the next list operation to retrieve more items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuardDutyListOrganizationAdminAccountsRequest : AWSRequest


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
@interface AWSGuardDutyListOrganizationAdminAccountsResponse : AWSModel


/**
 <p>An AdminAccounts object that includes a list of accounts configured as GuardDuty delegated administrators.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyAdminAccount *> * _Nullable adminAccounts;

/**
 <p>The pagination parameter to be used on the next list operation to retrieve more items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuardDutyListPublishingDestinationsRequest : AWSRequest


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
@interface AWSGuardDutyListPublishingDestinationsResponse : AWSModel


/**
 <p>A <code>Destinations</code> object that includes information about each publishing destination returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyDestination *> * _Nullable destinations;

/**
 <p>A token to use for paginating results that are returned in the response. Set the value of this parameter to null for the first request to a list action. For subsequent calls, use the <code>NextToken</code> value returned from the previous request to continue listing results after the first page.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSGuardDutyListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for the given GuardDuty resource. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSGuardDutyListTagsForResourceResponse : AWSModel


/**
 <p>The tags associated with the resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSGuardDutyListThreatIntelSetsRequest : AWSRequest


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
@interface AWSGuardDutyListThreatIntelSetsResponse : AWSModel


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
@interface AWSGuardDutyLocalIpDetails : AWSModel


/**
 <p>The IPv4 local address of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddressV4;

@end

/**
 <p>Contains information about the port for the local connection.</p>
 */
@interface AWSGuardDutyLocalPortDetails : AWSModel


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
@interface AWSGuardDutyMaster : AWSModel


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
@interface AWSGuardDutyMember : AWSModel


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
@interface AWSGuardDutyNetworkConnectionAction : AWSModel


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
@property (nonatomic, strong) AWSGuardDutyLocalIpDetails * _Nullable localIpDetails;

/**
 <p>The local port information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuardDutyLocalPortDetails * _Nullable localPortDetails;

/**
 <p>The network connection protocol.</p>
 */
@property (nonatomic, strong) NSString * _Nullable protocols;

/**
 <p>The remote IP information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuardDutyRemoteIpDetails * _Nullable remoteIpDetails;

/**
 <p>The remote port information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuardDutyRemotePortDetails * _Nullable remotePortDetails;

@end

/**
 <p>Contains information about the elastic network interface of the EC2 instance.</p>
 */
@interface AWSGuardDutyNetworkInterface : AWSModel


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
@property (nonatomic, strong) NSArray<AWSGuardDutyPrivateIpAddressDetails *> * _Nullable privateIpAddresses;

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
@property (nonatomic, strong) NSArray<AWSGuardDutySecurityGroup *> * _Nullable securityGroups;

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
@interface AWSGuardDutyOrganization : AWSModel


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
@interface AWSGuardDutyPortProbeAction : AWSModel


/**
 <p>Indicates whether EC2 blocked the port probe to the instance, such as with an ACL.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable blocked;

/**
 <p>A list of objects related to port probe details.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyPortProbeDetail *> * _Nullable portProbeDetails;

@end

/**
 <p>Contains information about the port probe details.</p>
 */
@interface AWSGuardDutyPortProbeDetail : AWSModel


/**
 <p>The local IP information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuardDutyLocalIpDetails * _Nullable localIpDetails;

/**
 <p>The local port information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuardDutyLocalPortDetails * _Nullable localPortDetails;

/**
 <p>The remote IP information of the connection.</p>
 */
@property (nonatomic, strong) AWSGuardDutyRemoteIpDetails * _Nullable remoteIpDetails;

@end

/**
 <p>Contains other private IP address information of the EC2 instance.</p>
 */
@interface AWSGuardDutyPrivateIpAddressDetails : AWSModel


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
@interface AWSGuardDutyProductCode : AWSModel


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
@interface AWSGuardDutyRemoteIpDetails : AWSModel


/**
 <p>The city information of the remote IP address.</p>
 */
@property (nonatomic, strong) AWSGuardDutyCity * _Nullable city;

/**
 <p>The country code of the remote IP address.</p>
 */
@property (nonatomic, strong) AWSGuardDutyCountry * _Nullable country;

/**
 <p>The location information of the remote IP address.</p>
 */
@property (nonatomic, strong) AWSGuardDutyGeoLocation * _Nullable geoLocation;

/**
 <p>The IPv4 remote address of the connection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddressV4;

/**
 <p>The ISP organization information of the remote IP address.</p>
 */
@property (nonatomic, strong) AWSGuardDutyOrganization * _Nullable organization;

@end

/**
 <p>Contains information about the remote port.</p>
 */
@interface AWSGuardDutyRemotePortDetails : AWSModel


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
@interface AWSGuardDutyResource : AWSModel


/**
 <p>The IAM access key details (IAM user information) of a user that engaged in the activity that prompted GuardDuty to generate a finding.</p>
 */
@property (nonatomic, strong) AWSGuardDutyAccessKeyDetails * _Nullable accessKeyDetails;

/**
 <p>The information about the EC2 instance associated with the activity that prompted GuardDuty to generate a finding.</p>
 */
@property (nonatomic, strong) AWSGuardDutyInstanceDetails * _Nullable instanceDetails;

/**
 <p>The type of AWS resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceType;

@end

/**
 <p>Contains information about the security groups associated with the EC2 instance.</p>
 */
@interface AWSGuardDutySecurityGroup : AWSModel


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
@interface AWSGuardDutyService : AWSModel


/**
 <p>Information about the activity that is described in a finding.</p>
 */
@property (nonatomic, strong) AWSGuardDutyAction * _Nullable action;

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
@property (nonatomic, strong) AWSGuardDutyEvidence * _Nullable evidence;

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
@interface AWSGuardDutySortCriteria : AWSModel


/**
 <p>Represents the finding attribute (for example, accountId) to sort findings by.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The order by which the sorted findings are to be displayed.</p>
 */
@property (nonatomic, assign) AWSGuardDutyOrderBy orderBy;

@end

/**
 
 */
@interface AWSGuardDutyStartMonitoringMembersRequest : AWSRequest


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
@interface AWSGuardDutyStartMonitoringMembersResponse : AWSModel


/**
 <p>A list of objects that contain the unprocessed account and a result string that explains why it was unprocessed.</p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 
 */
@interface AWSGuardDutyStopMonitoringMembersRequest : AWSRequest


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
@interface AWSGuardDutyStopMonitoringMembersResponse : AWSModel


/**
 <p>A list of objects that contain an accountId for each account that could not be processed, and a result string that indicates why the account was not processed. </p>
 */
@property (nonatomic, strong) NSArray<AWSGuardDutyUnprocessedAccount *> * _Nullable unprocessedAccounts;

@end

/**
 <p>Contains information about a tag associated with the EC2 instance.</p>
 */
@interface AWSGuardDutyTag : AWSModel


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
@interface AWSGuardDutyTagResourceRequest : AWSRequest


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
@interface AWSGuardDutyTagResourceResponse : AWSModel


@end

/**
 <p>An instance of a threat intelligence detail that constitutes evidence for the finding.</p>
 */
@interface AWSGuardDutyThreatIntelligenceDetail : AWSModel


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
@interface AWSGuardDutyUnarchiveFindingsRequest : AWSRequest


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
@interface AWSGuardDutyUnarchiveFindingsResponse : AWSModel


@end

/**
 <p>Contains information about the accounts that weren't processed.</p>
 Required parameters: [AccountId, Result]
 */
@interface AWSGuardDutyUnprocessedAccount : AWSModel


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
@interface AWSGuardDutyUntagResourceRequest : AWSRequest


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
@interface AWSGuardDutyUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSGuardDutyUpdateDetectorRequest : AWSRequest


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
@property (nonatomic, assign) AWSGuardDutyFindingPublishingFrequency findingPublishingFrequency;

@end

/**
 
 */
@interface AWSGuardDutyUpdateDetectorResponse : AWSModel


@end

/**
 
 */
@interface AWSGuardDutyUpdateFilterRequest : AWSRequest


/**
 <p>Specifies the action that is to be applied to the findings that match the filter.</p>
 */
@property (nonatomic, assign) AWSGuardDutyFilterAction action;

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
@property (nonatomic, strong) AWSGuardDutyFindingCriteria * _Nullable findingCriteria;

/**
 <p>Specifies the position of the filter in the list of current filters. Also specifies the order in which this filter is applied to the findings.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable rank;

@end

/**
 
 */
@interface AWSGuardDutyUpdateFilterResponse : AWSModel


/**
 <p>The name of the filter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGuardDutyUpdateFindingsFeedbackRequest : AWSRequest


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
@property (nonatomic, assign) AWSGuardDutyFeedback feedback;

/**
 <p>The IDs of the findings that you want to mark as useful or not useful.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable findingIds;

@end

/**
 
 */
@interface AWSGuardDutyUpdateFindingsFeedbackResponse : AWSModel


@end

/**
 
 */
@interface AWSGuardDutyUpdateIPSetRequest : AWSRequest


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
 <p>The updated URI of the file that contains the IPSet. For example: .</p>
 */
@property (nonatomic, strong) NSString * _Nullable location;

/**
 <p>The unique ID that specifies the IPSet that you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 
 */
@interface AWSGuardDutyUpdateIPSetResponse : AWSModel


@end

/**
 
 */
@interface AWSGuardDutyUpdateOrganizationConfigurationRequest : AWSRequest


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
@interface AWSGuardDutyUpdateOrganizationConfigurationResponse : AWSModel


@end

/**
 
 */
@interface AWSGuardDutyUpdatePublishingDestinationRequest : AWSRequest


/**
 <p>The ID of the publishing destination to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destinationId;

/**
 <p>A <code>DestinationProperties</code> object that includes the <code>DestinationArn</code> and <code>KmsKeyArn</code> of the publishing destination.</p>
 */
@property (nonatomic, strong) AWSGuardDutyDestinationProperties * _Nullable destinationProperties;

/**
 <p>The ID of the detector associated with the publishing destinations to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

@end

/**
 
 */
@interface AWSGuardDutyUpdatePublishingDestinationResponse : AWSModel


@end

/**
 
 */
@interface AWSGuardDutyUpdateThreatIntelSetRequest : AWSRequest


/**
 <p>The updated Boolean value that specifies whether the ThreateIntelSet is active or not.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable activate;

/**
 <p>The detectorID that specifies the GuardDuty service whose ThreatIntelSet you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detectorId;

/**
 <p>The updated URI of the file that contains the ThreateIntelSet. For example: .</p>
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
@interface AWSGuardDutyUpdateThreatIntelSetResponse : AWSModel


@end

NS_ASSUME_NONNULL_END
