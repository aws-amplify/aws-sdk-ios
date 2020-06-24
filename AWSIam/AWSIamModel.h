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

FOUNDATION_EXPORT NSString *const AWSIamErrorDomain;

typedef NS_ENUM(NSInteger, AWSIamErrorType) {
    AWSIamErrorUnknown,
    AWSIamErrorConcurrentModification,
    AWSIamErrorCredentialReportExpired,
    AWSIamErrorCredentialReportNotPresent,
    AWSIamErrorCredentialReportNotReady,
    AWSIamErrorDeleteConflict,
    AWSIamErrorDuplicateCertificate,
    AWSIamErrorDuplicateSSHPublicKey,
    AWSIamErrorEntityAlreadyExists,
    AWSIamErrorEntityTemporarilyUnmodifiable,
    AWSIamErrorInvalidAuthenticationCode,
    AWSIamErrorInvalidCertificate,
    AWSIamErrorInvalidInput,
    AWSIamErrorInvalidPublicKey,
    AWSIamErrorInvalidUserType,
    AWSIamErrorKeyPairMismatch,
    AWSIamErrorLimitExceeded,
    AWSIamErrorMalformedCertificate,
    AWSIamErrorMalformedPolicyDocument,
    AWSIamErrorNoSuchEntity,
    AWSIamErrorPasswordPolicyViolation,
    AWSIamErrorPolicyEvaluation,
    AWSIamErrorPolicyNotAttachable,
    AWSIamErrorReportGenerationLimitExceeded,
    AWSIamErrorServiceFailure,
    AWSIamErrorServiceNotSupported,
    AWSIamErrorUnmodifiableEntity,
    AWSIamErrorUnrecognizedPublicKeyEncoding,
};

typedef NS_ENUM(NSInteger, AWSIamAccessAdvisorUsageGranularityType) {
    AWSIamAccessAdvisorUsageGranularityTypeUnknown,
    AWSIamAccessAdvisorUsageGranularityTypeServiceLevel,
    AWSIamAccessAdvisorUsageGranularityTypeActionLevel,
};

typedef NS_ENUM(NSInteger, AWSIamContextKeyTypeEnum) {
    AWSIamContextKeyTypeEnumUnknown,
    AWSIamContextKeyTypeEnumString,
    AWSIamContextKeyTypeEnumStringList,
    AWSIamContextKeyTypeEnumNumeric,
    AWSIamContextKeyTypeEnumNumericList,
    AWSIamContextKeyTypeEnumBoolean,
    AWSIamContextKeyTypeEnumBooleanList,
    AWSIamContextKeyTypeEnumIp,
    AWSIamContextKeyTypeEnumIpList,
    AWSIamContextKeyTypeEnumBinary,
    AWSIamContextKeyTypeEnumBinaryList,
    AWSIamContextKeyTypeEnumDate,
    AWSIamContextKeyTypeEnumDateList,
};

typedef NS_ENUM(NSInteger, AWSIamDeletionTaskStatusType) {
    AWSIamDeletionTaskStatusTypeUnknown,
    AWSIamDeletionTaskStatusTypeSucceeded,
    AWSIamDeletionTaskStatusTypeInProgress,
    AWSIamDeletionTaskStatusTypeFailed,
    AWSIamDeletionTaskStatusTypeNotStarted,
};

typedef NS_ENUM(NSInteger, AWSIamEntityType) {
    AWSIamEntityTypeUnknown,
    AWSIamEntityTypeUser,
    AWSIamEntityTypeRole,
    AWSIamEntityTypeGroup,
    AWSIamEntityTypeLocalManagedPolicy,
    AWSIamEntityTypeAWSManagedPolicy,
};

typedef NS_ENUM(NSInteger, AWSIamPermissionsBoundaryAttachmentType) {
    AWSIamPermissionsBoundaryAttachmentTypeUnknown,
    AWSIamPermissionsBoundaryAttachmentTypePermissionsBoundaryPolicy,
};

typedef NS_ENUM(NSInteger, AWSIamPolicyEvaluationDecisionType) {
    AWSIamPolicyEvaluationDecisionTypeUnknown,
    AWSIamPolicyEvaluationDecisionTypeAllowed,
    AWSIamPolicyEvaluationDecisionTypeExplicitDeny,
    AWSIamPolicyEvaluationDecisionTypeImplicitDeny,
};

typedef NS_ENUM(NSInteger, AWSIamPolicySourceType) {
    AWSIamPolicySourceTypeUnknown,
    AWSIamPolicySourceTypeUser,
    AWSIamPolicySourceTypeGroup,
    AWSIamPolicySourceTypeRole,
    AWSIamPolicySourceTypeAwsManaged,
    AWSIamPolicySourceTypeUserManaged,
    AWSIamPolicySourceTypeResource,
    AWSIamPolicySourceTypeNone,
};

typedef NS_ENUM(NSInteger, AWSIamPolicyUsageType) {
    AWSIamPolicyUsageTypeUnknown,
    AWSIamPolicyUsageTypePermissionsPolicy,
    AWSIamPolicyUsageTypePermissionsBoundary,
};

typedef NS_ENUM(NSInteger, AWSIamReportFormatType) {
    AWSIamReportFormatTypeUnknown,
    AWSIamReportFormatTypeTextCsv,
};

typedef NS_ENUM(NSInteger, AWSIamReportStateType) {
    AWSIamReportStateTypeUnknown,
    AWSIamReportStateTypeStarted,
    AWSIamReportStateTypeInprogress,
    AWSIamReportStateTypeComplete,
};

typedef NS_ENUM(NSInteger, AWSIamassignmentStatusType) {
    AWSIamassignmentStatusTypeUnknown,
    AWSIamassignmentStatusTypeAssigned,
    AWSIamassignmentStatusTypeUnassigned,
    AWSIamassignmentStatusTypeAny,
};

typedef NS_ENUM(NSInteger, AWSIamencodingType) {
    AWSIamencodingTypeUnknown,
    AWSIamencodingTypeSsh,
    AWSIamencodingTypePem,
};

typedef NS_ENUM(NSInteger, AWSIamglobalEndpointTokenVersion) {
    AWSIamglobalEndpointTokenVersionUnknown,
    AWSIamglobalEndpointTokenVersionV1Token,
    AWSIamglobalEndpointTokenVersionV2Token,
};

typedef NS_ENUM(NSInteger, AWSIamjobStatusType) {
    AWSIamjobStatusTypeUnknown,
    AWSIamjobStatusTypeInProgress,
    AWSIamjobStatusTypeCompleted,
    AWSIamjobStatusTypeFailed,
};

typedef NS_ENUM(NSInteger, AWSIampolicyOwnerEntityType) {
    AWSIampolicyOwnerEntityTypeUnknown,
    AWSIampolicyOwnerEntityTypeUser,
    AWSIampolicyOwnerEntityTypeRole,
    AWSIampolicyOwnerEntityTypeGroup,
};

typedef NS_ENUM(NSInteger, AWSIampolicyScopeType) {
    AWSIampolicyScopeTypeUnknown,
    AWSIampolicyScopeTypeAll,
    AWSIampolicyScopeTypeAws,
    AWSIampolicyScopeTypeLocal,
};

typedef NS_ENUM(NSInteger, AWSIampolicyType) {
    AWSIampolicyTypeUnknown,
    AWSIampolicyTypeInline,
    AWSIampolicyTypeManaged,
};

typedef NS_ENUM(NSInteger, AWSIamsortKeyType) {
    AWSIamsortKeyTypeUnknown,
    AWSIamsortKeyTypeServiceNamespaceAscending,
    AWSIamsortKeyTypeServiceNamespaceDescending,
    AWSIamsortKeyTypeLastAuthenticatedTimeAscending,
    AWSIamsortKeyTypeLastAuthenticatedTimeDescending,
};

typedef NS_ENUM(NSInteger, AWSIamstatusType) {
    AWSIamstatusTypeUnknown,
    AWSIamstatusTypeActive,
    AWSIamstatusTypeInactive,
};

typedef NS_ENUM(NSInteger, AWSIamsummaryKeyType) {
    AWSIamsummaryKeyTypeUnknown,
    AWSIamsummaryKeyTypeUsers,
    AWSIamsummaryKeyTypeUsersQuota,
    AWSIamsummaryKeyTypeGroups,
    AWSIamsummaryKeyTypeGroupsQuota,
    AWSIamsummaryKeyTypeServerCertificates,
    AWSIamsummaryKeyTypeServerCertificatesQuota,
    AWSIamsummaryKeyTypeUserPolicySizeQuota,
    AWSIamsummaryKeyTypeGroupPolicySizeQuota,
    AWSIamsummaryKeyTypeGroupsPerUserQuota,
    AWSIamsummaryKeyTypeSigningCertificatesPerUserQuota,
    AWSIamsummaryKeyTypeAccessKeysPerUserQuota,
    AWSIamsummaryKeyTypeMFADevices,
    AWSIamsummaryKeyTypeMFADevicesInUse,
    AWSIamsummaryKeyTypeAccountMFAEnabled,
    AWSIamsummaryKeyTypeAccountAccessKeysPresent,
    AWSIamsummaryKeyTypeAccountSigningCertificatesPresent,
    AWSIamsummaryKeyTypeAttachedPoliciesPerGroupQuota,
    AWSIamsummaryKeyTypeAttachedPoliciesPerRoleQuota,
    AWSIamsummaryKeyTypeAttachedPoliciesPerUserQuota,
    AWSIamsummaryKeyTypePolicies,
    AWSIamsummaryKeyTypePoliciesQuota,
    AWSIamsummaryKeyTypePolicySizeQuota,
    AWSIamsummaryKeyTypePolicyVersionsInUse,
    AWSIamsummaryKeyTypePolicyVersionsInUseQuota,
    AWSIamsummaryKeyTypeVersionsPerPolicyQuota,
    AWSIamsummaryKeyTypeGlobalEndpointTokenVersion,
};

@class AWSIamAccessDetail;
@class AWSIamAccessKey;
@class AWSIamAccessKeyLastUsed;
@class AWSIamAccessKeyMetadata;
@class AWSIamAddClientIDToOpenIDConnectProviderRequest;
@class AWSIamAddRoleToInstanceProfileRequest;
@class AWSIamAddUserToGroupRequest;
@class AWSIamAttachGroupPolicyRequest;
@class AWSIamAttachRolePolicyRequest;
@class AWSIamAttachUserPolicyRequest;
@class AWSIamAttachedPermissionsBoundary;
@class AWSIamAttachedPolicy;
@class AWSIamChangePasswordRequest;
@class AWSIamContextEntry;
@class AWSIamCreateAccessKeyRequest;
@class AWSIamCreateAccessKeyResponse;
@class AWSIamCreateAccountAliasRequest;
@class AWSIamCreateGroupRequest;
@class AWSIamCreateGroupResponse;
@class AWSIamCreateInstanceProfileRequest;
@class AWSIamCreateInstanceProfileResponse;
@class AWSIamCreateLoginProfileRequest;
@class AWSIamCreateLoginProfileResponse;
@class AWSIamCreateOpenIDConnectProviderRequest;
@class AWSIamCreateOpenIDConnectProviderResponse;
@class AWSIamCreatePolicyRequest;
@class AWSIamCreatePolicyResponse;
@class AWSIamCreatePolicyVersionRequest;
@class AWSIamCreatePolicyVersionResponse;
@class AWSIamCreateRoleRequest;
@class AWSIamCreateRoleResponse;
@class AWSIamCreateSAMLProviderRequest;
@class AWSIamCreateSAMLProviderResponse;
@class AWSIamCreateServiceLinkedRoleRequest;
@class AWSIamCreateServiceLinkedRoleResponse;
@class AWSIamCreateServiceSpecificCredentialRequest;
@class AWSIamCreateServiceSpecificCredentialResponse;
@class AWSIamCreateUserRequest;
@class AWSIamCreateUserResponse;
@class AWSIamCreateVirtualMFADeviceRequest;
@class AWSIamCreateVirtualMFADeviceResponse;
@class AWSIamDeactivateMFADeviceRequest;
@class AWSIamDeleteAccessKeyRequest;
@class AWSIamDeleteAccountAliasRequest;
@class AWSIamDeleteGroupPolicyRequest;
@class AWSIamDeleteGroupRequest;
@class AWSIamDeleteInstanceProfileRequest;
@class AWSIamDeleteLoginProfileRequest;
@class AWSIamDeleteOpenIDConnectProviderRequest;
@class AWSIamDeletePolicyRequest;
@class AWSIamDeletePolicyVersionRequest;
@class AWSIamDeleteRolePermissionsBoundaryRequest;
@class AWSIamDeleteRolePolicyRequest;
@class AWSIamDeleteRoleRequest;
@class AWSIamDeleteSAMLProviderRequest;
@class AWSIamDeleteSSHPublicKeyRequest;
@class AWSIamDeleteServerCertificateRequest;
@class AWSIamDeleteServiceLinkedRoleRequest;
@class AWSIamDeleteServiceLinkedRoleResponse;
@class AWSIamDeleteServiceSpecificCredentialRequest;
@class AWSIamDeleteSigningCertificateRequest;
@class AWSIamDeleteUserPermissionsBoundaryRequest;
@class AWSIamDeleteUserPolicyRequest;
@class AWSIamDeleteUserRequest;
@class AWSIamDeleteVirtualMFADeviceRequest;
@class AWSIamDeletionTaskFailureReasonType;
@class AWSIamDetachGroupPolicyRequest;
@class AWSIamDetachRolePolicyRequest;
@class AWSIamDetachUserPolicyRequest;
@class AWSIamEnableMFADeviceRequest;
@class AWSIamEntityDetails;
@class AWSIamEntityInfo;
@class AWSIamErrorDetails;
@class AWSIamEvaluationResult;
@class AWSIamGenerateCredentialReportResponse;
@class AWSIamGenerateOrganizationsAccessReportRequest;
@class AWSIamGenerateOrganizationsAccessReportResponse;
@class AWSIamGenerateServiceLastAccessedDetailsRequest;
@class AWSIamGenerateServiceLastAccessedDetailsResponse;
@class AWSIamGetAccessKeyLastUsedRequest;
@class AWSIamGetAccessKeyLastUsedResponse;
@class AWSIamGetAccountAuthorizationDetailsRequest;
@class AWSIamGetAccountAuthorizationDetailsResponse;
@class AWSIamGetAccountPasswordPolicyResponse;
@class AWSIamGetAccountSummaryResponse;
@class AWSIamGetContextKeysForCustomPolicyRequest;
@class AWSIamGetContextKeysForPolicyResponse;
@class AWSIamGetContextKeysForPrincipalPolicyRequest;
@class AWSIamGetCredentialReportResponse;
@class AWSIamGetGroupPolicyRequest;
@class AWSIamGetGroupPolicyResponse;
@class AWSIamGetGroupRequest;
@class AWSIamGetGroupResponse;
@class AWSIamGetInstanceProfileRequest;
@class AWSIamGetInstanceProfileResponse;
@class AWSIamGetLoginProfileRequest;
@class AWSIamGetLoginProfileResponse;
@class AWSIamGetOpenIDConnectProviderRequest;
@class AWSIamGetOpenIDConnectProviderResponse;
@class AWSIamGetOrganizationsAccessReportRequest;
@class AWSIamGetOrganizationsAccessReportResponse;
@class AWSIamGetPolicyRequest;
@class AWSIamGetPolicyResponse;
@class AWSIamGetPolicyVersionRequest;
@class AWSIamGetPolicyVersionResponse;
@class AWSIamGetRolePolicyRequest;
@class AWSIamGetRolePolicyResponse;
@class AWSIamGetRoleRequest;
@class AWSIamGetRoleResponse;
@class AWSIamGetSAMLProviderRequest;
@class AWSIamGetSAMLProviderResponse;
@class AWSIamGetSSHPublicKeyRequest;
@class AWSIamGetSSHPublicKeyResponse;
@class AWSIamGetServerCertificateRequest;
@class AWSIamGetServerCertificateResponse;
@class AWSIamGetServiceLastAccessedDetailsRequest;
@class AWSIamGetServiceLastAccessedDetailsResponse;
@class AWSIamGetServiceLastAccessedDetailsWithEntitiesRequest;
@class AWSIamGetServiceLastAccessedDetailsWithEntitiesResponse;
@class AWSIamGetServiceLinkedRoleDeletionStatusRequest;
@class AWSIamGetServiceLinkedRoleDeletionStatusResponse;
@class AWSIamGetUserPolicyRequest;
@class AWSIamGetUserPolicyResponse;
@class AWSIamGetUserRequest;
@class AWSIamGetUserResponse;
@class AWSIamGroup;
@class AWSIamGroupDetail;
@class AWSIamInstanceProfile;
@class AWSIamListAccessKeysRequest;
@class AWSIamListAccessKeysResponse;
@class AWSIamListAccountAliasesRequest;
@class AWSIamListAccountAliasesResponse;
@class AWSIamListAttachedGroupPoliciesRequest;
@class AWSIamListAttachedGroupPoliciesResponse;
@class AWSIamListAttachedRolePoliciesRequest;
@class AWSIamListAttachedRolePoliciesResponse;
@class AWSIamListAttachedUserPoliciesRequest;
@class AWSIamListAttachedUserPoliciesResponse;
@class AWSIamListEntitiesForPolicyRequest;
@class AWSIamListEntitiesForPolicyResponse;
@class AWSIamListGroupPoliciesRequest;
@class AWSIamListGroupPoliciesResponse;
@class AWSIamListGroupsForUserRequest;
@class AWSIamListGroupsForUserResponse;
@class AWSIamListGroupsRequest;
@class AWSIamListGroupsResponse;
@class AWSIamListInstanceProfilesForRoleRequest;
@class AWSIamListInstanceProfilesForRoleResponse;
@class AWSIamListInstanceProfilesRequest;
@class AWSIamListInstanceProfilesResponse;
@class AWSIamListMFADevicesRequest;
@class AWSIamListMFADevicesResponse;
@class AWSIamListOpenIDConnectProvidersRequest;
@class AWSIamListOpenIDConnectProvidersResponse;
@class AWSIamListPoliciesGrantingServiceAccessEntry;
@class AWSIamListPoliciesGrantingServiceAccessRequest;
@class AWSIamListPoliciesGrantingServiceAccessResponse;
@class AWSIamListPoliciesRequest;
@class AWSIamListPoliciesResponse;
@class AWSIamListPolicyVersionsRequest;
@class AWSIamListPolicyVersionsResponse;
@class AWSIamListRolePoliciesRequest;
@class AWSIamListRolePoliciesResponse;
@class AWSIamListRoleTagsRequest;
@class AWSIamListRoleTagsResponse;
@class AWSIamListRolesRequest;
@class AWSIamListRolesResponse;
@class AWSIamListSAMLProvidersRequest;
@class AWSIamListSAMLProvidersResponse;
@class AWSIamListSSHPublicKeysRequest;
@class AWSIamListSSHPublicKeysResponse;
@class AWSIamListServerCertificatesRequest;
@class AWSIamListServerCertificatesResponse;
@class AWSIamListServiceSpecificCredentialsRequest;
@class AWSIamListServiceSpecificCredentialsResponse;
@class AWSIamListSigningCertificatesRequest;
@class AWSIamListSigningCertificatesResponse;
@class AWSIamListUserPoliciesRequest;
@class AWSIamListUserPoliciesResponse;
@class AWSIamListUserTagsRequest;
@class AWSIamListUserTagsResponse;
@class AWSIamListUsersRequest;
@class AWSIamListUsersResponse;
@class AWSIamListVirtualMFADevicesRequest;
@class AWSIamListVirtualMFADevicesResponse;
@class AWSIamLoginProfile;
@class AWSIamMFADevice;
@class AWSIamManagedPolicyDetail;
@class AWSIamOpenIDConnectProviderListEntry;
@class AWSIamOrganizationsDecisionDetail;
@class AWSIamPasswordPolicy;
@class AWSIamPermissionsBoundaryDecisionDetail;
@class AWSIamPolicy;
@class AWSIamPolicyDetail;
@class AWSIamPolicyGrantingServiceAccess;
@class AWSIamPolicyGroup;
@class AWSIamPolicyRole;
@class AWSIamPolicyUser;
@class AWSIamPolicyVersion;
@class AWSIamPosition;
@class AWSIamPutGroupPolicyRequest;
@class AWSIamPutRolePermissionsBoundaryRequest;
@class AWSIamPutRolePolicyRequest;
@class AWSIamPutUserPermissionsBoundaryRequest;
@class AWSIamPutUserPolicyRequest;
@class AWSIamRemoveClientIDFromOpenIDConnectProviderRequest;
@class AWSIamRemoveRoleFromInstanceProfileRequest;
@class AWSIamRemoveUserFromGroupRequest;
@class AWSIamResetServiceSpecificCredentialRequest;
@class AWSIamResetServiceSpecificCredentialResponse;
@class AWSIamResourceSpecificResult;
@class AWSIamResyncMFADeviceRequest;
@class AWSIamRole;
@class AWSIamRoleDetail;
@class AWSIamRoleLastUsed;
@class AWSIamRoleUsageType;
@class AWSIamSAMLProviderListEntry;
@class AWSIamSSHPublicKey;
@class AWSIamSSHPublicKeyMetadata;
@class AWSIamServerCertificate;
@class AWSIamServerCertificateMetadata;
@class AWSIamServiceLastAccessed;
@class AWSIamServiceSpecificCredential;
@class AWSIamServiceSpecificCredentialMetadata;
@class AWSIamSetDefaultPolicyVersionRequest;
@class AWSIamSetSecurityTokenServicePreferencesRequest;
@class AWSIamSigningCertificate;
@class AWSIamSimulateCustomPolicyRequest;
@class AWSIamSimulatePolicyResponse;
@class AWSIamSimulatePrincipalPolicyRequest;
@class AWSIamStatement;
@class AWSIamTag;
@class AWSIamTagRoleRequest;
@class AWSIamTagUserRequest;
@class AWSIamTrackedActionLastAccessed;
@class AWSIamUntagRoleRequest;
@class AWSIamUntagUserRequest;
@class AWSIamUpdateAccessKeyRequest;
@class AWSIamUpdateAccountPasswordPolicyRequest;
@class AWSIamUpdateAssumeRolePolicyRequest;
@class AWSIamUpdateGroupRequest;
@class AWSIamUpdateLoginProfileRequest;
@class AWSIamUpdateOpenIDConnectProviderThumbprintRequest;
@class AWSIamUpdateRoleDescriptionRequest;
@class AWSIamUpdateRoleDescriptionResponse;
@class AWSIamUpdateRoleRequest;
@class AWSIamUpdateRoleResponse;
@class AWSIamUpdateSAMLProviderRequest;
@class AWSIamUpdateSAMLProviderResponse;
@class AWSIamUpdateSSHPublicKeyRequest;
@class AWSIamUpdateServerCertificateRequest;
@class AWSIamUpdateServiceSpecificCredentialRequest;
@class AWSIamUpdateSigningCertificateRequest;
@class AWSIamUpdateUserRequest;
@class AWSIamUploadSSHPublicKeyRequest;
@class AWSIamUploadSSHPublicKeyResponse;
@class AWSIamUploadServerCertificateRequest;
@class AWSIamUploadServerCertificateResponse;
@class AWSIamUploadSigningCertificateRequest;
@class AWSIamUploadSigningCertificateResponse;
@class AWSIamUser;
@class AWSIamUserDetail;
@class AWSIamVirtualMFADevice;

/**
 <p>An object that contains details about when a principal in the reported AWS Organizations entity last attempted to access an AWS service. A principal can be an IAM user, an IAM role, or the AWS account root user within the reported Organizations entity.</p><p>This data type is a response element in the <a>GetOrganizationsAccessReport</a> operation.</p>
 Required parameters: [ServiceName, ServiceNamespace]
 */
@interface AWSIamAccessDetail : AWSModel


/**
 <p>The path of the Organizations entity (root, organizational unit, or account) from which an authenticated principal last attempted to access the service. AWS does not report unauthenticated requests.</p><p>This field is null if no principals (IAM users, IAM roles, or root users) in the reported Organizations entity attempted to access the service within the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting period</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityPath;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when an authenticated principal most recently attempted to access the service. AWS does not report unauthenticated requests.</p><p>This field is null if no principals in the reported Organizations entity attempted to access the service within the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting period</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAuthenticatedTime;

/**
 <p>The Region where the last service access attempt occurred.</p><p>This field is null if no principals in the reported Organizations entity attempted to access the service within the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting period</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The name of the service in which access was attempted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

/**
 <p>The namespace of the service in which access was attempted.</p><p>To learn the service namespace of a service, go to <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html">Actions, Resources, and Condition Keys for AWS Services</a> in the <i>IAM User Guide</i>. Choose the name of the service to view details for that service. In the first paragraph, find the service prefix. For example, <code>(service prefix: a4b)</code>. For more information about service namespaces, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceNamespace;

/**
 <p>The number of accounts with authenticated principals (root users, IAM users, and IAM roles) that attempted to access the service in the reporting period.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalAuthenticatedEntities;

@end

/**
 <p>Contains information about an AWS access key.</p><p> This data type is used as a response element in the <a>CreateAccessKey</a> and <a>ListAccessKeys</a> operations. </p><note><p>The <code>SecretAccessKey</code> value is returned only in response to <a>CreateAccessKey</a>. You can get a secret access key only when you first create an access key; you cannot recover the secret access key later. If you lose a secret access key, you must create a new access key.</p></note>
 Required parameters: [UserName, AccessKeyId, Status, SecretAccessKey]
 */
@interface AWSIamAccessKey : AWSModel


/**
 <p>The ID for this access key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessKeyId;

/**
 <p>The date when the access key was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The secret key used to sign requests.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretAccessKey;

/**
 <p>The status of the access key. <code>Active</code> means that the key is valid for API calls, while <code>Inactive</code> means it is not. </p>
 */
@property (nonatomic, assign) AWSIamstatusType status;

/**
 <p>The name of the IAM user that the access key is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains information about the last time an AWS access key was used since IAM began tracking this information on April 22, 2015.</p><p>This data type is used as a response element in the <a>GetAccessKeyLastUsed</a> operation.</p>
 Required parameters: [LastUsedDate, ServiceName, Region]
 */
@interface AWSIamAccessKeyLastUsed : AWSModel


/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the access key was most recently used. This field is null in the following situations:</p><ul><li><p>The user does not have an access key.</p></li><li><p>An access key exists but has not been used since IAM began tracking this information.</p></li><li><p>There is no sign-in data associated with the user.</p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUsedDate;

/**
 <p>The AWS Region where this access key was most recently used. The value for this field is "N/A" in the following situations:</p><ul><li><p>The user does not have an access key.</p></li><li><p>An access key exists but has not been used since IAM began tracking this information.</p></li><li><p>There is no sign-in data associated with the user.</p></li></ul><p>For more information about AWS Regions, see <a href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and Endpoints</a> in the Amazon Web Services General Reference.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The name of the AWS service with which this access key was most recently used. The value of this field is "N/A" in the following situations:</p><ul><li><p>The user does not have an access key.</p></li><li><p>An access key exists but has not been used since IAM started tracking this information.</p></li><li><p>There is no sign-in data associated with the user.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

@end

/**
 <p>Contains information about an AWS access key, without its secret key.</p><p>This data type is used as a response element in the <a>ListAccessKeys</a> operation.</p>
 */
@interface AWSIamAccessKeyMetadata : AWSModel


/**
 <p>The ID for this access key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessKeyId;

/**
 <p>The date when the access key was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The status of the access key. <code>Active</code> means that the key is valid for API calls; <code>Inactive</code> means it is not.</p>
 */
@property (nonatomic, assign) AWSIamstatusType status;

/**
 <p>The name of the IAM user that the key is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamAddClientIDToOpenIDConnectProviderRequest : AWSRequest


/**
 <p>The client ID (also known as audience) to add to the IAM OpenID Connect provider resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientID;

/**
 <p>The Amazon Resource Name (ARN) of the IAM OpenID Connect (OIDC) provider resource to add the client ID to. You can get a list of OIDC provider ARNs by using the <a>ListOpenIDConnectProviders</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable openIDConnectProviderArn;

@end

/**
 
 */
@interface AWSIamAddRoleToInstanceProfileRequest : AWSRequest


/**
 <p>The name of the instance profile to update.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceProfileName;

/**
 <p>The name of the role to add.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamAddUserToGroupRequest : AWSRequest


/**
 <p>The name of the group to update.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The name of the user to add.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamAttachGroupPolicyRequest : AWSRequest


/**
 <p>The name (friendly name, not ARN) of the group to attach the policy to.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The Amazon Resource Name (ARN) of the IAM policy you want to attach.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

@end

/**
 
 */
@interface AWSIamAttachRolePolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the IAM policy you want to attach.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The name (friendly name, not ARN) of the role to attach the policy to.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamAttachUserPolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the IAM policy you want to attach.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The name (friendly name, not ARN) of the IAM user to attach the policy to.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains information about an attached permissions boundary.</p><p>An attached permissions boundary is a managed policy that has been attached to a user or role to set the permissions boundary.</p><p>For more information about permissions boundaries, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.</p>
 */
@interface AWSIamAttachedPermissionsBoundary : AWSModel


/**
 <p> The ARN of the policy used to set the permissions boundary for the user or role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable permissionsBoundaryArn;

/**
 <p> The permissions boundary usage type that indicates what type of IAM resource is used as the permissions boundary for an entity. This data type can only have a value of <code>Policy</code>.</p>
 */
@property (nonatomic, assign) AWSIamPermissionsBoundaryAttachmentType permissionsBoundaryType;

@end

/**
 <p>Contains information about an attached policy.</p><p>An attached policy is a managed policy that has been attached to a user, group, or role. This data type is used as a response element in the <a>ListAttachedGroupPolicies</a>, <a>ListAttachedRolePolicies</a>, <a>ListAttachedUserPolicies</a>, and <a>GetAccountAuthorizationDetails</a> operations. </p><p>For more information about managed policies, refer to <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed Policies and Inline Policies</a> in the <i>IAM User Guide</i>. </p>
 */
@interface AWSIamAttachedPolicy : AWSModel


/**
 <p>The Amazon Resource Name (ARN). ARNs are unique identifiers for AWS resources.</p><p>For more information about ARNs, go to <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The friendly name of the attached policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSIamChangePasswordRequest : AWSRequest


/**
 <p>The new password. The new password must conform to the AWS account's password policy, if one exists.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used to validate this parameter is a string of characters. That string can include almost any printable ASCII character from the space (<code>\u0020</code>) through the end of the ASCII character range (<code>\u00FF</code>). You can also include the tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>) characters. Any of these characters are valid in a password. However, many tools, such as the AWS Management Console, might restrict the ability to type certain characters because they have special meaning within that tool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestPassword;

/**
 <p>The IAM user's current password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable oldPassword;

@end

/**
 <p>Contains information about a condition context key. It includes the name of the key and specifies the value (or values, if the context key supports multiple values) to use in the simulation. This information is used when evaluating the <code>Condition</code> elements of the input policies.</p><p>This data type is used as an input parameter to <a>SimulateCustomPolicy</a> and <a>SimulatePrincipalPolicy</a>.</p>
 */
@interface AWSIamContextEntry : AWSModel


/**
 <p>The full name of a condition context key, including the service prefix. For example, <code>aws:SourceIp</code> or <code>s3:VersionId</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contextKeyName;

/**
 <p>The data type of the value (or values) specified in the <code>ContextKeyValues</code> parameter.</p>
 */
@property (nonatomic, assign) AWSIamContextKeyTypeEnum contextKeyType;

/**
 <p>The value (or values, if the condition context key supports multiple values) to provide to the simulation when the key is referenced by a <code>Condition</code> element in an input policy.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable contextKeyValues;

@end

/**
 
 */
@interface AWSIamCreateAccessKeyRequest : AWSRequest


/**
 <p>The name of the IAM user that the new key will belong to.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>CreateAccessKey</a> request. </p>
 Required parameters: [AccessKey]
 */
@interface AWSIamCreateAccessKeyResponse : AWSModel


/**
 <p>A structure with details about the access key.</p>
 */
@property (nonatomic, strong) AWSIamAccessKey * _Nullable accessKey;

@end

/**
 
 */
@interface AWSIamCreateAccountAliasRequest : AWSRequest


/**
 <p>The account alias to create.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of lowercase letters, digits, and dashes. You cannot start or finish with a dash, nor can you have two dashes in a row.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountAlias;

@end

/**
 
 */
@interface AWSIamCreateGroupRequest : AWSRequest


/**
 <p>The name of the group to create. Do not include the path in this value.</p><p>IAM user, group, role, and policy names must be unique within the account. Names are not distinguished by case. For example, you cannot create resources named both "MyResource" and "myresource".</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p> The path to the group. For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p><p>This parameter is optional. If it is not included, it defaults to a slash (/).</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>Contains the response to a successful <a>CreateGroup</a> request. </p>
 Required parameters: [Group]
 */
@interface AWSIamCreateGroupResponse : AWSModel


/**
 <p>A structure containing details about the new group.</p>
 */
@property (nonatomic, strong) AWSIamGroup * _Nullable group;

@end

/**
 
 */
@interface AWSIamCreateInstanceProfileRequest : AWSRequest


/**
 <p>The name of the instance profile to create.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceProfileName;

/**
 <p> The path to the instance profile. For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p><p>This parameter is optional. If it is not included, it defaults to a slash (/).</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>Contains the response to a successful <a>CreateInstanceProfile</a> request. </p>
 Required parameters: [InstanceProfile]
 */
@interface AWSIamCreateInstanceProfileResponse : AWSModel


/**
 <p>A structure containing details about the new instance profile.</p>
 */
@property (nonatomic, strong) AWSIamInstanceProfile * _Nullable instanceProfile;

@end

/**
 
 */
@interface AWSIamCreateLoginProfileRequest : AWSRequest


/**
 <p>The new password for the user.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used to validate this parameter is a string of characters. That string can include almost any printable ASCII character from the space (<code>\u0020</code>) through the end of the ASCII character range (<code>\u00FF</code>). You can also include the tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>) characters. Any of these characters are valid in a password. However, many tools, such as the AWS Management Console, might restrict the ability to type certain characters because they have special meaning within that tool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>Specifies whether the user is required to set a new password on next sign-in.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable passwordResetRequired;

/**
 <p>The name of the IAM user to create a password for. The user must already exist.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>CreateLoginProfile</a> request. </p>
 Required parameters: [LoginProfile]
 */
@interface AWSIamCreateLoginProfileResponse : AWSModel


/**
 <p>A structure containing the user name and password create date.</p>
 */
@property (nonatomic, strong) AWSIamLoginProfile * _Nullable loginProfile;

@end

/**
 
 */
@interface AWSIamCreateOpenIDConnectProviderRequest : AWSRequest


/**
 <p>A list of client IDs (also known as audiences). When a mobile or web app registers with an OpenID Connect provider, they establish a value that identifies the application. (This is the value that's sent as the <code>client_id</code> parameter on OAuth requests.)</p><p>You can register multiple client IDs with the same provider. For example, you might have multiple applications that use the same OIDC provider. You cannot register more than 100 client IDs with a single IAM OIDC provider.</p><p>There is no defined format for a client ID. The <code>CreateOpenIDConnectProviderRequest</code> operation accepts client IDs up to 255 characters long.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable clientIDList;

/**
 <p>A list of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificates. Typically this list includes only one entry. However, IAM lets you have up to five thumbprints for an OIDC provider. This lets you maintain multiple thumbprints if the identity provider is rotating certificates.</p><p>The server certificate thumbprint is the hex-encoded SHA-1 hash value of the X.509 certificate used by the domain where the OpenID Connect provider makes its keys available. It is always a 40-character string.</p><p>You must provide at least one thumbprint when creating an IAM OIDC provider. For example, assume that the OIDC provider is <code>server.example.com</code> and the provider stores its keys at https://keys.server.example.com/openid-connect. In that case, the thumbprint string would be the hex-encoded SHA-1 hash value of the certificate used by https://keys.server.example.com.</p><p>For more information about obtaining the OIDC provider's thumbprint, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/identity-providers-oidc-obtain-thumbprint.html">Obtaining the Thumbprint for an OpenID Connect Provider</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable thumbprintList;

/**
 <p>The URL of the identity provider. The URL must begin with <code>https://</code> and should correspond to the <code>iss</code> claim in the provider's OpenID Connect ID tokens. Per the OIDC standard, path components are allowed but query parameters are not. Typically the URL consists of only a hostname, like <code>https://server.example.org</code> or <code>https://example.com</code>.</p><p>You cannot register the same provider multiple times in a single AWS account. If you try to submit a URL that has already been used for an OpenID Connect provider in the AWS account, you will get an error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 <p>Contains the response to a successful <a>CreateOpenIDConnectProvider</a> request. </p>
 */
@interface AWSIamCreateOpenIDConnectProviderResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the new IAM OpenID Connect provider that is created. For more information, see <a>OpenIDConnectProviderListEntry</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable openIDConnectProviderArn;

@end

/**
 
 */
@interface AWSIamCreatePolicyRequest : AWSRequest


/**
 <p>A friendly description of the policy.</p><p>Typically used to store information about the permissions defined in the policy. For example, "Grants access to production DynamoDB tables."</p><p>The policy description is immutable. After a value is assigned, it cannot be changed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The path for the policy.</p><p>For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p><p>This parameter is optional. If it is not included, it defaults to a slash (/).</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The JSON policy document that you want to use as the content for the new policy.</p><p>You must provide policies in JSON format in IAM. However, for AWS CloudFormation templates formatted in YAML, you can provide the policy in JSON or YAML format. AWS CloudFormation always converts a YAML policy to JSON format before submitting it to IAM.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The friendly name of the policy.</p><p>IAM user, group, role, and policy names must be unique within the account. Names are not distinguished by case. For example, you cannot create resources named both "MyResource" and "myresource".</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Contains the response to a successful <a>CreatePolicy</a> request. </p>
 */
@interface AWSIamCreatePolicyResponse : AWSModel


/**
 <p>A structure containing details about the new policy.</p>
 */
@property (nonatomic, strong) AWSIamPolicy * _Nullable policy;

@end

/**
 
 */
@interface AWSIamCreatePolicyVersionRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the IAM policy to which you want to add a new version.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The JSON policy document that you want to use as the content for this new version of the policy.</p><p>You must provide policies in JSON format in IAM. However, for AWS CloudFormation templates formatted in YAML, you can provide the policy in JSON or YAML format. AWS CloudFormation always converts a YAML policy to JSON format before submitting it to IAM.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>Specifies whether to set this version as the policy's default version.</p><p>When this parameter is <code>true</code>, the new policy version becomes the operative version. That is, it becomes the version that is in effect for the IAM users, groups, and roles that the policy is attached to.</p><p>For more information about managed policy versions, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning for Managed Policies</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable setAsDefault;

@end

/**
 <p>Contains the response to a successful <a>CreatePolicyVersion</a> request. </p>
 */
@interface AWSIamCreatePolicyVersionResponse : AWSModel


/**
 <p>A structure containing details about the new policy version.</p>
 */
@property (nonatomic, strong) AWSIamPolicyVersion * _Nullable policyVersion;

@end

/**
 
 */
@interface AWSIamCreateRoleRequest : AWSRequest


/**
 <p>The trust relationship policy document that grants an entity permission to assume the role.</p><p>In IAM, you must provide a JSON policy that has been converted to a string. However, for AWS CloudFormation templates formatted in YAML, you can provide the policy in JSON or YAML format. AWS CloudFormation always converts a YAML policy to JSON format before submitting it to IAM.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul><p> Upon success, the response includes the same trust policy in JSON format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assumeRolePolicyDocument;

/**
 <p>A description of the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours.</p><p>Anyone who assumes the role from the AWS CLI or API can use the <code>DurationSeconds</code> API parameter or the <code>duration-seconds</code> CLI parameter to request a longer session. The <code>MaxSessionDuration</code> setting determines the maximum duration that can be requested using the <code>DurationSeconds</code> parameter. If users don't specify a value for the <code>DurationSeconds</code> parameter, their security credentials are valid for one hour by default. This applies when you use the <code>AssumeRole*</code> API operations or the <code>assume-role*</code> CLI operations but does not apply when you use those operations to create a console URL. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html">Using IAM Roles</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSessionDuration;

/**
 <p> The path to the role. For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p><p>This parameter is optional. If it is not included, it defaults to a slash (/).</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The ARN of the policy that is used to set the permissions boundary for the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable permissionsBoundary;

/**
 <p>The name of the role to create.</p><p>IAM user, group, role, and policy names must be unique within the account. Names are not distinguished by case. For example, you cannot create resources named both "MyResource" and "myresource".</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

/**
 <p>A list of tags that you want to attach to the newly created role. Each tag consists of a key name and an associated value. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM Identities</a> in the <i>IAM User Guide</i>.</p><note><p>If any one of the tags is invalid or if you exceed the allowed number of tags per role, then the entire request fails and the role is not created.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSIamTag *> * _Nullable tags;

@end

/**
 <p>Contains the response to a successful <a>CreateRole</a> request. </p>
 Required parameters: [Role]
 */
@interface AWSIamCreateRoleResponse : AWSModel


/**
 <p>A structure containing details about the new role.</p>
 */
@property (nonatomic, strong) AWSIamRole * _Nullable role;

@end

/**
 
 */
@interface AWSIamCreateSAMLProviderRequest : AWSRequest


/**
 <p>The name of the provider to create.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>An XML document generated by an identity provider (IdP) that supports SAML 2.0. The document includes the issuer's name, expiration information, and keys that can be used to validate the SAML authentication response (assertions) that are received from the IdP. You must generate the metadata document using the identity management software that is used as your organization's IdP.</p><p>For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html">About SAML 2.0-based Federation</a> in the <i>IAM User Guide</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable SAMLMetadataDocument;

@end

/**
 <p>Contains the response to a successful <a>CreateSAMLProvider</a> request. </p>
 */
@interface AWSIamCreateSAMLProviderResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the new SAML provider resource in IAM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SAMLProviderArn;

@end

/**
 
 */
@interface AWSIamCreateServiceLinkedRoleRequest : AWSRequest


/**
 <p>The service principal for the AWS service to which this role is attached. You use a string similar to a URL but without the http:// in front. For example: <code>elasticbeanstalk.amazonaws.com</code>. </p><p>Service principals are unique and case-sensitive. To find the exact service principal for your service-linked role, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-services-that-work-with-iam.html">AWS Services That Work with IAM</a> in the <i>IAM User Guide</i>. Look for the services that have <b>Yes </b>in the <b>Service-Linked Role</b> column. Choose the <b>Yes</b> link to view the service-linked role documentation for that service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable AWSServiceName;

/**
 <p/><p>A string that you provide, which is combined with the service-provided prefix to form the complete role name. If you make multiple requests for the same service, then you must supply a different <code>CustomSuffix</code> for each request. Otherwise the request fails with a duplicate role name error. For example, you could add <code>-1</code> or <code>-debug</code> to the suffix.</p><p>Some services do not support the <code>CustomSuffix</code> parameter. If you provide an optional suffix and the operation fails, try the operation again without the suffix.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customSuffix;

/**
 <p>The description of the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

@end

/**
 
 */
@interface AWSIamCreateServiceLinkedRoleResponse : AWSModel


/**
 <p>A <a>Role</a> object that contains details about the newly created role.</p>
 */
@property (nonatomic, strong) AWSIamRole * _Nullable role;

@end

/**
 
 */
@interface AWSIamCreateServiceSpecificCredentialRequest : AWSRequest


/**
 <p>The name of the AWS service that is to be associated with the credentials. The service you specify here is the only service that can be accessed using these credentials.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

/**
 <p>The name of the IAM user that is to be associated with the credentials. The new service-specific credentials have the same permissions as the associated user except that they can be used only to access the specified service.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamCreateServiceSpecificCredentialResponse : AWSModel


/**
 <p>A structure that contains information about the newly created service-specific credential.</p><important><p>This is the only time that the password for this credential set is available. It cannot be recovered later. Instead, you must reset the password with <a>ResetServiceSpecificCredential</a>.</p></important>
 */
@property (nonatomic, strong) AWSIamServiceSpecificCredential * _Nullable serviceSpecificCredential;

@end

/**
 
 */
@interface AWSIamCreateUserRequest : AWSRequest


/**
 <p> The path for the user name. For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p><p>This parameter is optional. If it is not included, it defaults to a slash (/).</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The ARN of the policy that is used to set the permissions boundary for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable permissionsBoundary;

/**
 <p>A list of tags that you want to attach to the newly created user. Each tag consists of a key name and an associated value. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM Identities</a> in the <i>IAM User Guide</i>.</p><note><p>If any one of the tags is invalid or if you exceed the allowed number of tags per user, then the entire request fails and the user is not created.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSIamTag *> * _Nullable tags;

/**
 <p>The name of the user to create.</p><p>IAM user, group, role, and policy names must be unique within the account. Names are not distinguished by case. For example, you cannot create resources named both "MyResource" and "myresource".</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>CreateUser</a> request. </p>
 */
@interface AWSIamCreateUserResponse : AWSModel


/**
 <p>A structure with details about the new IAM user.</p>
 */
@property (nonatomic, strong) AWSIamUser * _Nullable user;

@end

/**
 
 */
@interface AWSIamCreateVirtualMFADeviceRequest : AWSRequest


/**
 <p> The path for the virtual MFA device. For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p><p>This parameter is optional. If it is not included, it defaults to a slash (/).</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The name of the virtual MFA device. Use with path to uniquely identify a virtual MFA device.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable virtualMFADeviceName;

@end

/**
 <p>Contains the response to a successful <a>CreateVirtualMFADevice</a> request. </p>
 Required parameters: [VirtualMFADevice]
 */
@interface AWSIamCreateVirtualMFADeviceResponse : AWSModel


/**
 <p>A structure containing details about the new virtual MFA device.</p>
 */
@property (nonatomic, strong) AWSIamVirtualMFADevice * _Nullable virtualMFADevice;

@end

/**
 
 */
@interface AWSIamDeactivateMFADeviceRequest : AWSRequest


/**
 <p>The serial number that uniquely identifies the MFA device. For virtual MFA devices, the serial number is the device ARN.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@:/-</p>
 */
@property (nonatomic, strong) NSString * _Nullable serialNumber;

/**
 <p>The name of the user whose MFA device you want to deactivate.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamDeleteAccessKeyRequest : AWSRequest


/**
 <p>The access key ID for the access key ID and secret access key you want to delete.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that can consist of any upper or lowercased letter or digit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessKeyId;

/**
 <p>The name of the user whose access key pair you want to delete.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamDeleteAccountAliasRequest : AWSRequest


/**
 <p>The name of the account alias to delete.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of lowercase letters, digits, and dashes. You cannot start or finish with a dash, nor can you have two dashes in a row.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountAlias;

@end

/**
 
 */
@interface AWSIamDeleteGroupPolicyRequest : AWSRequest


/**
 <p>The name (friendly name, not ARN) identifying the group that the policy is embedded in.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The name identifying the policy document to delete.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSIamDeleteGroupRequest : AWSRequest


/**
 <p>The name of the IAM group to delete.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

@end

/**
 
 */
@interface AWSIamDeleteInstanceProfileRequest : AWSRequest


/**
 <p>The name of the instance profile to delete.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceProfileName;

@end

/**
 
 */
@interface AWSIamDeleteLoginProfileRequest : AWSRequest


/**
 <p>The name of the user whose password you want to delete.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamDeleteOpenIDConnectProviderRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the IAM OpenID Connect provider resource object to delete. You can get a list of OpenID Connect provider resource ARNs by using the <a>ListOpenIDConnectProviders</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable openIDConnectProviderArn;

@end

/**
 
 */
@interface AWSIamDeletePolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the IAM policy you want to delete.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

@end

/**
 
 */
@interface AWSIamDeletePolicyVersionRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the IAM policy from which you want to delete a version.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The policy version to delete.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that consists of the lowercase letter 'v' followed by one or two digits, and optionally followed by a period '.' and a string of letters and digits.</p><p>For more information about managed policy versions, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning for Managed Policies</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSIamDeleteRolePermissionsBoundaryRequest : AWSRequest


/**
 <p>The name (friendly name, not ARN) of the IAM role from which you want to remove the permissions boundary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamDeleteRolePolicyRequest : AWSRequest


/**
 <p>The name of the inline policy to delete from the specified IAM role.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The name (friendly name, not ARN) identifying the role that the policy is embedded in.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamDeleteRoleRequest : AWSRequest


/**
 <p>The name of the role to delete.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamDeleteSAMLProviderRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the SAML provider to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SAMLProviderArn;

@end

/**
 
 */
@interface AWSIamDeleteSSHPublicKeyRequest : AWSRequest


/**
 <p>The unique identifier for the SSH public key.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that can consist of any upper or lowercased letter or digit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSHPublicKeyId;

/**
 <p>The name of the IAM user associated with the SSH public key.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamDeleteServerCertificateRequest : AWSRequest


/**
 <p>The name of the server certificate you want to delete.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverCertificateName;

@end

/**
 
 */
@interface AWSIamDeleteServiceLinkedRoleRequest : AWSRequest


/**
 <p>The name of the service-linked role to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamDeleteServiceLinkedRoleResponse : AWSModel


/**
 <p>The deletion task identifier that you can use to check the status of the deletion. This identifier is returned in the format <code>task/aws-service-role/&lt;service-principal-name&gt;/&lt;role-name&gt;/&lt;task-uuid&gt;</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deletionTaskId;

@end

/**
 
 */
@interface AWSIamDeleteServiceSpecificCredentialRequest : AWSRequest


/**
 <p>The unique identifier of the service-specific credential. You can get this value by calling <a>ListServiceSpecificCredentials</a>.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that can consist of any upper or lowercased letter or digit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceSpecificCredentialId;

/**
 <p>The name of the IAM user associated with the service-specific credential. If this value is not specified, then the operation assumes the user whose credentials are used to call the operation.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamDeleteSigningCertificateRequest : AWSRequest


/**
 <p>The ID of the signing certificate to delete.</p><p>The format of this parameter, as described by its <a href="http://wikipedia.org/wiki/regex">regex</a> pattern, is a string of characters that can be upper- or lower-cased letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The name of the user the signing certificate belongs to.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamDeleteUserPermissionsBoundaryRequest : AWSRequest


/**
 <p>The name (friendly name, not ARN) of the IAM user from which you want to remove the permissions boundary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamDeleteUserPolicyRequest : AWSRequest


/**
 <p>The name identifying the policy document to delete.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The name (friendly name, not ARN) identifying the user that the policy is embedded in.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamDeleteUserRequest : AWSRequest


/**
 <p>The name of the user to delete.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamDeleteVirtualMFADeviceRequest : AWSRequest


/**
 <p>The serial number that uniquely identifies the MFA device. For virtual MFA devices, the serial number is the same as the ARN.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@:/-</p>
 */
@property (nonatomic, strong) NSString * _Nullable serialNumber;

@end

/**
 <p>The reason that the service-linked role deletion failed.</p><p>This data type is used as a response element in the <a>GetServiceLinkedRoleDeletionStatus</a> operation.</p>
 */
@interface AWSIamDeletionTaskFailureReasonType : AWSModel


/**
 <p>A short description of the reason that the service-linked role deletion failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable reason;

/**
 <p>A list of objects that contains details about the service-linked role deletion failure, if that information is returned by the service. If the service-linked role has active sessions or if any resources that were used by the role have not been deleted from the linked service, the role can't be deleted. This parameter includes a list of the resources that are associated with the role and the Region in which the resources are being used.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamRoleUsageType *> * _Nullable roleUsageList;

@end

/**
 
 */
@interface AWSIamDetachGroupPolicyRequest : AWSRequest


/**
 <p>The name (friendly name, not ARN) of the IAM group to detach the policy from.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The Amazon Resource Name (ARN) of the IAM policy you want to detach.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

@end

/**
 
 */
@interface AWSIamDetachRolePolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the IAM policy you want to detach.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The name (friendly name, not ARN) of the IAM role to detach the policy from.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamDetachUserPolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the IAM policy you want to detach.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The name (friendly name, not ARN) of the IAM user to detach the policy from.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamEnableMFADeviceRequest : AWSRequest


/**
 <p>An authentication code emitted by the device. </p><p>The format for this parameter is a string of six digits.</p><important><p>Submit your request immediately after generating the authentication codes. If you generate the codes and then wait too long to submit the request, the MFA device successfully associates with the user but the MFA device becomes out of sync. This happens because time-based one-time passwords (TOTP) expire after a short period of time. If this happens, you can <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_sync.html">resync the device</a>.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable authenticationCode1;

/**
 <p>A subsequent authentication code emitted by the device.</p><p>The format for this parameter is a string of six digits.</p><important><p>Submit your request immediately after generating the authentication codes. If you generate the codes and then wait too long to submit the request, the MFA device successfully associates with the user but the MFA device becomes out of sync. This happens because time-based one-time passwords (TOTP) expire after a short period of time. If this happens, you can <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_sync.html">resync the device</a>.</p></important>
 */
@property (nonatomic, strong) NSString * _Nullable authenticationCode2;

/**
 <p>The serial number that uniquely identifies the MFA device. For virtual MFA devices, the serial number is the device ARN.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@:/-</p>
 */
@property (nonatomic, strong) NSString * _Nullable serialNumber;

/**
 <p>The name of the IAM user for whom you want to enable the MFA device.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>An object that contains details about when the IAM entities (users or roles) were last used in an attempt to access the specified AWS service.</p><p>This data type is a response element in the <a>GetServiceLastAccessedDetailsWithEntities</a> operation.</p>
 Required parameters: [EntityInfo]
 */
@interface AWSIamEntityDetails : AWSModel


/**
 <p>The <code>EntityInfo</code> object that contains details about the entity (user or role).</p>
 */
@property (nonatomic, strong) AWSIamEntityInfo * _Nullable entityInfo;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the authenticated entity last attempted to access AWS. AWS does not report unauthenticated requests.</p><p>This field is null if no IAM entities attempted to access the service within the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting period</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAuthenticated;

@end

/**
 <p>Contains details about the specified entity (user or role).</p><p>This data type is an element of the <a>EntityDetails</a> object.</p>
 Required parameters: [Arn, Name, Type, Id]
 */
@interface AWSIamEntityInfo : AWSModel


/**
 <p>The Amazon Resource Name (ARN). ARNs are unique identifiers for AWS resources.</p><p>For more information about ARNs, go to <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The identifier of the entity (user or role).</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the entity (user or role).</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The path to the entity (user or role). For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The type of entity (user or role).</p>
 */
@property (nonatomic, assign) AWSIampolicyOwnerEntityType types;

@end

/**
 <p>Contains information about the reason that the operation failed.</p><p>This data type is used as a response element in the <a>GetOrganizationsAccessReport</a>, <a>GetServiceLastAccessedDetails</a>, and <a>GetServiceLastAccessedDetailsWithEntities</a> operations.</p>
 Required parameters: [Message, Code]
 */
@interface AWSIamErrorDetails : AWSModel


/**
 <p>The error code associated with the operation failure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 <p>Detailed information about the reason that the operation failed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Contains the results of a simulation.</p><p>This data type is used by the return parameter of <code><a>SimulateCustomPolicy</a></code> and <code><a>SimulatePrincipalPolicy</a></code>.</p>
 Required parameters: [EvalActionName, EvalDecision]
 */
@interface AWSIamEvaluationResult : AWSModel


/**
 <p>The name of the API operation tested on the indicated resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evalActionName;

/**
 <p>The result of the simulation.</p>
 */
@property (nonatomic, assign) AWSIamPolicyEvaluationDecisionType evalDecision;

/**
 <p>Additional details about the results of the cross-account evaluation decision. This parameter is populated for only cross-account simulations. It contains a brief summary of how each policy type contributes to the final evaluation decision.</p><p>If the simulation evaluates policies within the same account and includes a resource ARN, then the parameter is present but the response is empty. If the simulation evaluates policies within the same account and specifies all resources (<code>*</code>), then the parameter is not returned.</p><p>When you make a cross-account request, AWS evaluates the request in the trusting account and the trusted account. The request is allowed only if both evaluations return <code>true</code>. For more information about how policies are evaluated, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics">Evaluating Policies Within a Single Account</a>.</p><p>If an AWS Organizations SCP included in the evaluation denies access, the simulation ends. In this case, policy evaluation does not proceed any further and this parameter is not returned.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable evalDecisionDetails;

/**
 <p>The ARN of the resource that the indicated API operation was tested on.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evalResourceName;

/**
 <p>A list of the statements in the input policies that determine the result for this scenario. Remember that even if multiple statements allow the operation on the resource, if only one statement denies that operation, then the explicit deny overrides any allow. In addition, the deny statement is the only entry included in the result.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamStatement *> * _Nullable matchedStatements;

/**
 <p>A list of context keys that are required by the included input policies but that were not provided by one of the input parameters. This list is used when the resource in a simulation is "*", either explicitly, or when the <code>ResourceArns</code> parameter blank. If you include a list of resources, then any missing context values are instead included under the <code>ResourceSpecificResults</code> section. To discover the context keys used by a set of policies, you can call <a>GetContextKeysForCustomPolicy</a> or <a>GetContextKeysForPrincipalPolicy</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable missingContextValues;

/**
 <p>A structure that details how Organizations and its service control policies affect the results of the simulation. Only applies if the simulated user's account is part of an organization.</p>
 */
@property (nonatomic, strong) AWSIamOrganizationsDecisionDetail * _Nullable organizationsDecisionDetail;

/**
 <p>Contains information about the effect that a permissions boundary has on a policy simulation when the boundary is applied to an IAM entity.</p>
 */
@property (nonatomic, strong) AWSIamPermissionsBoundaryDecisionDetail * _Nullable permissionsBoundaryDecisionDetail;

/**
 <p>The individual results of the simulation of the API operation specified in EvalActionName on each resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamResourceSpecificResult *> * _Nullable resourceSpecificResults;

@end

/**
 <p>Contains the response to a successful <a>GenerateCredentialReport</a> request. </p>
 */
@interface AWSIamGenerateCredentialReportResponse : AWSModel


/**
 <p>Information about the credential report.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Information about the state of the credential report.</p>
 */
@property (nonatomic, assign) AWSIamReportStateType state;

@end

/**
 
 */
@interface AWSIamGenerateOrganizationsAccessReportRequest : AWSRequest


/**
 <p>The path of the AWS Organizations entity (root, OU, or account). You can build an entity path using the known structure of your organization. For example, assume that your account ID is <code>123456789012</code> and its parent OU ID is <code>ou-rge0-awsabcde</code>. The organization root ID is <code>r-f6g7h8i9j0example</code> and your organization ID is <code>o-a1b2c3d4e5</code>. Your entity path is <code>o-a1b2c3d4e5/r-f6g7h8i9j0example/ou-rge0-awsabcde/123456789012</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityPath;

/**
 <p>The identifier of the AWS Organizations service control policy (SCP). This parameter is optional.</p><p>This ID is used to generate information about when an account principal that is limited by the SCP attempted to access an AWS service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationsPolicyId;

@end

/**
 
 */
@interface AWSIamGenerateOrganizationsAccessReportResponse : AWSModel


/**
 <p>The job identifier that you can use in the <a>GetOrganizationsAccessReport</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSIamGenerateServiceLastAccessedDetailsRequest : AWSRequest


/**
 <p>The ARN of the IAM resource (user, group, role, or managed policy) used to generate information about when the resource was last used in an attempt to access an AWS service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The level of detail that you want to generate. You can specify whether you want to generate information about the last attempt to access services or actions. If you specify service-level granularity, this operation generates only service data. If you specify action-level granularity, it generates service and action data. If you don't include this optional parameter, the operation generates service data.</p>
 */
@property (nonatomic, assign) AWSIamAccessAdvisorUsageGranularityType granularity;

@end

/**
 
 */
@interface AWSIamGenerateServiceLastAccessedDetailsResponse : AWSModel


/**
 <p>The <code>JobId</code> that you can use in the <a>GetServiceLastAccessedDetails</a> or <a>GetServiceLastAccessedDetailsWithEntities</a> operations. The <code>JobId</code> returned by <code>GenerateServiceLastAccessedDetail</code> must be used by the same role within a session, or by the same user when used to call <code>GetServiceLastAccessedDetail</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

@end

/**
 
 */
@interface AWSIamGetAccessKeyLastUsedRequest : AWSRequest


/**
 <p>The identifier of an access key.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that can consist of any upper or lowercased letter or digit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessKeyId;

@end

/**
 <p>Contains the response to a successful <a>GetAccessKeyLastUsed</a> request. It is also returned as a member of the <a>AccessKeyMetaData</a> structure returned by the <a>ListAccessKeys</a> action.</p>
 */
@interface AWSIamGetAccessKeyLastUsedResponse : AWSModel


/**
 <p>Contains information about the last time the access key was used.</p>
 */
@property (nonatomic, strong) AWSIamAccessKeyLastUsed * _Nullable accessKeyLastUsed;

/**
 <p>The name of the AWS IAM user that owns this access key.</p><p/>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamGetAccountAuthorizationDetailsRequest : AWSRequest


/**
 <p>A list of entity types used to filter the results. Only the entities that match the types you specify are included in the output. Use the value <code>LocalManagedPolicy</code> to include customer managed policies.</p><p>The format for this parameter is a comma-separated (if more than one) list of strings. Each string value in the list must be one of the valid values listed below.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filter;

/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 <p>Contains the response to a successful <a>GetAccountAuthorizationDetails</a> request. </p>
 */
@interface AWSIamGetAccountAuthorizationDetailsResponse : AWSModel


/**
 <p>A list containing information about IAM groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamGroupDetail *> * _Nullable groupDetailList;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list containing information about managed policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamManagedPolicyDetail *> * _Nullable policies;

/**
 <p>A list containing information about IAM roles.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamRoleDetail *> * _Nullable roleDetailList;

/**
 <p>A list containing information about IAM users.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamUserDetail *> * _Nullable userDetailList;

@end

/**
 <p>Contains the response to a successful <a>GetAccountPasswordPolicy</a> request. </p>
 Required parameters: [PasswordPolicy]
 */
@interface AWSIamGetAccountPasswordPolicyResponse : AWSModel


/**
 <p>A structure that contains details about the account's password policy.</p>
 */
@property (nonatomic, strong) AWSIamPasswordPolicy * _Nullable passwordPolicy;

@end

/**
 <p>Contains the response to a successful <a>GetAccountSummary</a> request. </p>
 */
@interface AWSIamGetAccountSummaryResponse : AWSModel


/**
 <p>A set of key–value pairs containing information about IAM entity usage and IAM quotas.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> * _Nullable summaryMap;

@end

/**
 
 */
@interface AWSIamGetContextKeysForCustomPolicyRequest : AWSRequest


/**
 <p>A list of policies for which you want the list of context keys referenced in those policies. Each document is specified as a string containing the complete, valid JSON text of an IAM policy.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyInputList;

@end

/**
 <p>Contains the response to a successful <a>GetContextKeysForPrincipalPolicy</a> or <a>GetContextKeysForCustomPolicy</a> request. </p>
 */
@interface AWSIamGetContextKeysForPolicyResponse : AWSModel


/**
 <p>The list of context keys that are referenced in the input policies.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable contextKeyNames;

@end

/**
 
 */
@interface AWSIamGetContextKeysForPrincipalPolicyRequest : AWSRequest


/**
 <p>An optional list of additional policies for which you want the list of context keys that are referenced.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyInputList;

/**
 <p>The ARN of a user, group, or role whose policies contain the context keys that you want listed. If you specify a user, the list includes context keys that are found in all policies that are attached to the user. The list also includes all groups that the user is a member of. If you pick a group or a role, then it includes only those context keys that are found in policies attached to that entity. Note that all parameters are shown in unencoded form here for clarity, but must be URL encoded to be included as a part of a real HTML request.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policySourceArn;

@end

/**
 <p>Contains the response to a successful <a>GetCredentialReport</a> request. </p>
 */
@interface AWSIamGetCredentialReportResponse : AWSModel


/**
 <p>Contains the credential report. The report is Base64-encoded.</p>
 */
@property (nonatomic, strong) NSData * _Nullable content;

/**
 <p> The date and time when the credential report was created, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable generatedTime;

/**
 <p>The format (MIME type) of the credential report.</p>
 */
@property (nonatomic, assign) AWSIamReportFormatType reportFormat;

@end

/**
 
 */
@interface AWSIamGetGroupPolicyRequest : AWSRequest


/**
 <p>The name of the group the policy is associated with.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The name of the policy document to get.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Contains the response to a successful <a>GetGroupPolicy</a> request. </p>
 Required parameters: [GroupName, PolicyName, PolicyDocument]
 */
@interface AWSIamGetGroupPolicyResponse : AWSModel


/**
 <p>The group the policy is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The policy document.</p><p>IAM stores policies in JSON format. However, resources that were created using AWS CloudFormation templates can be formatted in YAML. AWS CloudFormation always converts a YAML policy to JSON format before submitting it to IAM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSIamGetGroupRequest : AWSRequest


/**
 <p>The name of the group.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 <p>Contains the response to a successful <a>GetGroup</a> request. </p>
 Required parameters: [Group, Users]
 */
@interface AWSIamGetGroupResponse : AWSModel


/**
 <p>A structure that contains details about the group.</p>
 */
@property (nonatomic, strong) AWSIamGroup * _Nullable group;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of users in the group.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamUser *> * _Nullable users;

@end

/**
 
 */
@interface AWSIamGetInstanceProfileRequest : AWSRequest


/**
 <p>The name of the instance profile to get information about.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceProfileName;

@end

/**
 <p>Contains the response to a successful <a>GetInstanceProfile</a> request. </p>
 Required parameters: [InstanceProfile]
 */
@interface AWSIamGetInstanceProfileResponse : AWSModel


/**
 <p>A structure containing details about the instance profile.</p>
 */
@property (nonatomic, strong) AWSIamInstanceProfile * _Nullable instanceProfile;

@end

/**
 
 */
@interface AWSIamGetLoginProfileRequest : AWSRequest


/**
 <p>The name of the user whose login profile you want to retrieve.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>GetLoginProfile</a> request. </p>
 Required parameters: [LoginProfile]
 */
@interface AWSIamGetLoginProfileResponse : AWSModel


/**
 <p>A structure containing the user name and password create date for the user.</p>
 */
@property (nonatomic, strong) AWSIamLoginProfile * _Nullable loginProfile;

@end

/**
 
 */
@interface AWSIamGetOpenIDConnectProviderRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the OIDC provider resource object in IAM to get information for. You can get a list of OIDC provider resource ARNs by using the <a>ListOpenIDConnectProviders</a> operation.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable openIDConnectProviderArn;

@end

/**
 <p>Contains the response to a successful <a>GetOpenIDConnectProvider</a> request. </p>
 */
@interface AWSIamGetOpenIDConnectProviderResponse : AWSModel


/**
 <p>A list of client IDs (also known as audiences) that are associated with the specified IAM OIDC provider resource object. For more information, see <a>CreateOpenIDConnectProvider</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable clientIDList;

/**
 <p>The date and time when the IAM OIDC provider resource object was created in the AWS account.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>A list of certificate thumbprints that are associated with the specified IAM OIDC provider resource object. For more information, see <a>CreateOpenIDConnectProvider</a>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable thumbprintList;

/**
 <p>The URL that the IAM OIDC provider resource object is associated with. For more information, see <a>CreateOpenIDConnectProvider</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable url;

@end

/**
 
 */
@interface AWSIamGetOrganizationsAccessReportRequest : AWSRequest


/**
 <p>The identifier of the request generated by the <a>GenerateOrganizationsAccessReport</a> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The key that is used to sort the results. If you choose the namespace key, the results are returned in alphabetical order. If you choose the time key, the results are sorted numerically by the date and time.</p>
 */
@property (nonatomic, assign) AWSIamsortKeyType sortKey;

@end

/**
 
 */
@interface AWSIamGetOrganizationsAccessReportResponse : AWSModel


/**
 <p>An object that contains details about the most recent attempt to access the service.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamAccessDetail *> * _Nullable accessDetails;

/**
 <p>Contains information about the reason that the operation failed.</p><p>This data type is used as a response element in the <a>GetOrganizationsAccessReport</a>, <a>GetServiceLastAccessedDetails</a>, and <a>GetServiceLastAccessedDetailsWithEntities</a> operations.</p>
 */
@property (nonatomic, strong) AWSIamErrorDetails * _Nullable errorDetails;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the generated report job was completed or failed.</p><p>This field is null if the job is still in progress, as indicated by a job status value of <code>IN_PROGRESS</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable jobCompletionDate;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the report job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable jobCreationDate;

/**
 <p>The status of the job.</p>
 */
@property (nonatomic, assign) AWSIamjobStatusType jobStatus;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The number of services that the applicable SCPs allow account principals to access.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfServicesAccessible;

/**
 <p>The number of services that account principals are allowed but did not attempt to access.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numberOfServicesNotAccessed;

@end

/**
 
 */
@interface AWSIamGetPolicyRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the managed policy that you want information about.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

@end

/**
 <p>Contains the response to a successful <a>GetPolicy</a> request. </p>
 */
@interface AWSIamGetPolicyResponse : AWSModel


/**
 <p>A structure containing details about the policy.</p>
 */
@property (nonatomic, strong) AWSIamPolicy * _Nullable policy;

@end

/**
 
 */
@interface AWSIamGetPolicyVersionRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the managed policy that you want information about.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>Identifies the policy version to retrieve.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that consists of the lowercase letter 'v' followed by one or two digits, and optionally followed by a period '.' and a string of letters and digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>Contains the response to a successful <a>GetPolicyVersion</a> request. </p>
 */
@interface AWSIamGetPolicyVersionResponse : AWSModel


/**
 <p>A structure containing details about the policy version.</p>
 */
@property (nonatomic, strong) AWSIamPolicyVersion * _Nullable policyVersion;

@end

/**
 
 */
@interface AWSIamGetRolePolicyRequest : AWSRequest


/**
 <p>The name of the policy document to get.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The name of the role associated with the policy.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 <p>Contains the response to a successful <a>GetRolePolicy</a> request. </p>
 Required parameters: [RoleName, PolicyName, PolicyDocument]
 */
@interface AWSIamGetRolePolicyResponse : AWSModel


/**
 <p>The policy document.</p><p>IAM stores policies in JSON format. However, resources that were created using AWS CloudFormation templates can be formatted in YAML. AWS CloudFormation always converts a YAML policy to JSON format before submitting it to IAM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The role the policy is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamGetRoleRequest : AWSRequest


/**
 <p>The name of the IAM role to get information about.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 <p>Contains the response to a successful <a>GetRole</a> request. </p>
 Required parameters: [Role]
 */
@interface AWSIamGetRoleResponse : AWSModel


/**
 <p>A structure containing details about the IAM role.</p>
 */
@property (nonatomic, strong) AWSIamRole * _Nullable role;

@end

/**
 
 */
@interface AWSIamGetSAMLProviderRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the SAML provider resource object in IAM to get information about.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SAMLProviderArn;

@end

/**
 <p>Contains the response to a successful <a>GetSAMLProvider</a> request. </p>
 */
@interface AWSIamGetSAMLProviderResponse : AWSModel


/**
 <p>The date and time when the SAML provider was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The XML metadata document that includes information about an identity provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SAMLMetadataDocument;

/**
 <p>The expiration date and time for the SAML provider.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validUntil;

@end

/**
 
 */
@interface AWSIamGetSSHPublicKeyRequest : AWSRequest


/**
 <p>Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use <code>SSH</code>. To retrieve the public key in PEM format, use <code>PEM</code>.</p>
 */
@property (nonatomic, assign) AWSIamencodingType encoding;

/**
 <p>The unique identifier for the SSH public key.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that can consist of any upper or lowercased letter or digit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSHPublicKeyId;

/**
 <p>The name of the IAM user associated with the SSH public key.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>GetSSHPublicKey</a> request.</p>
 */
@interface AWSIamGetSSHPublicKeyResponse : AWSModel


/**
 <p>A structure containing details about the SSH public key.</p>
 */
@property (nonatomic, strong) AWSIamSSHPublicKey * _Nullable SSHPublicKey;

@end

/**
 
 */
@interface AWSIamGetServerCertificateRequest : AWSRequest


/**
 <p>The name of the server certificate you want to retrieve information about.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverCertificateName;

@end

/**
 <p>Contains the response to a successful <a>GetServerCertificate</a> request. </p>
 Required parameters: [ServerCertificate]
 */
@interface AWSIamGetServerCertificateResponse : AWSModel


/**
 <p>A structure containing details about the server certificate.</p>
 */
@property (nonatomic, strong) AWSIamServerCertificate * _Nullable serverCertificate;

@end

/**
 
 */
@interface AWSIamGetServiceLastAccessedDetailsRequest : AWSRequest


/**
 <p>The ID of the request generated by the <a>GenerateServiceLastAccessedDetails</a> operation. The <code>JobId</code> returned by <code>GenerateServiceLastAccessedDetail</code> must be used by the same role within a session, or by the same user when used to call <code>GetServiceLastAccessedDetail</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 
 */
@interface AWSIamGetServiceLastAccessedDetailsResponse : AWSModel


/**
 <p>An object that contains details about the reason the operation failed.</p>
 */
@property (nonatomic, strong) AWSIamErrorDetails * _Nullable error;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the generated report job was completed or failed.</p><p>This field is null if the job is still in progress, as indicated by a job status value of <code>IN_PROGRESS</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable jobCompletionDate;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the report job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable jobCreationDate;

/**
 <p>The status of the job.</p>
 */
@property (nonatomic, assign) AWSIamjobStatusType jobStatus;

/**
 <p>The type of job. Service jobs return information about when each service was last accessed. Action jobs also include information about when tracked actions within the service were last accessed.</p>
 */
@property (nonatomic, assign) AWSIamAccessAdvisorUsageGranularityType jobType;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> A <code>ServiceLastAccessed</code> object that contains details about the most recent attempt to access the service.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamServiceLastAccessed *> * _Nullable servicesLastAccessed;

@end

/**
 
 */
@interface AWSIamGetServiceLastAccessedDetailsWithEntitiesRequest : AWSRequest


/**
 <p>The ID of the request generated by the <code>GenerateServiceLastAccessedDetails</code> operation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The service namespace for an AWS service. Provide the service namespace to learn when the IAM entity last attempted to access the specified service.</p><p>To learn the service namespace for a service, go to <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html">Actions, Resources, and Condition Keys for AWS Services</a> in the <i>IAM User Guide</i>. Choose the name of the service to view details for that service. In the first paragraph, find the service prefix. For example, <code>(service prefix: a4b)</code>. For more information about service namespaces, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceNamespace;

@end

/**
 
 */
@interface AWSIamGetServiceLastAccessedDetailsWithEntitiesResponse : AWSModel


/**
 <p>An <code>EntityDetailsList</code> object that contains details about when an IAM entity (user or role) used group or policy permissions in an attempt to access the specified AWS service.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamEntityDetails *> * _Nullable entityDetailsList;

/**
 <p>An object that contains details about the reason the operation failed.</p>
 */
@property (nonatomic, strong) AWSIamErrorDetails * _Nullable error;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the generated report job was completed or failed.</p><p>This field is null if the job is still in progress, as indicated by a job status value of <code>IN_PROGRESS</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable jobCompletionDate;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the report job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable jobCreationDate;

/**
 <p>The status of the job.</p>
 */
@property (nonatomic, assign) AWSIamjobStatusType jobStatus;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSIamGetServiceLinkedRoleDeletionStatusRequest : AWSRequest


/**
 <p>The deletion task identifier. This identifier is returned by the <a>DeleteServiceLinkedRole</a> operation in the format <code>task/aws-service-role/&lt;service-principal-name&gt;/&lt;role-name&gt;/&lt;task-uuid&gt;</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deletionTaskId;

@end

/**
 
 */
@interface AWSIamGetServiceLinkedRoleDeletionStatusResponse : AWSModel


/**
 <p>An object that contains details about the reason the deletion failed.</p>
 */
@property (nonatomic, strong) AWSIamDeletionTaskFailureReasonType * _Nullable reason;

/**
 <p>The status of the deletion.</p>
 */
@property (nonatomic, assign) AWSIamDeletionTaskStatusType status;

@end

/**
 
 */
@interface AWSIamGetUserPolicyRequest : AWSRequest


/**
 <p>The name of the policy document to get.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The name of the user who the policy is associated with.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>GetUserPolicy</a> request. </p>
 Required parameters: [UserName, PolicyName, PolicyDocument]
 */
@interface AWSIamGetUserPolicyResponse : AWSModel


/**
 <p>The policy document.</p><p>IAM stores policies in JSON format. However, resources that were created using AWS CloudFormation templates can be formatted in YAML. AWS CloudFormation always converts a YAML policy to JSON format before submitting it to IAM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The user the policy is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamGetUserRequest : AWSRequest


/**
 <p>The name of the user to get information about.</p><p>This parameter is optional. If it is not included, it defaults to the user making the request. This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>GetUser</a> request. </p>
 Required parameters: [User]
 */
@interface AWSIamGetUserResponse : AWSModel


/**
 <p>A structure containing details about the IAM user.</p><important><p>Due to a service issue, password last used data does not include password use from May 3, 2018 22:50 PDT to May 23, 2018 14:08 PDT. This affects <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_finding-unused.html">last sign-in</a> dates shown in the IAM console and password last used dates in the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_getting-report.html">IAM credential report</a>, and returned by this GetUser API. If users signed in during the affected time, the password last used date that is returned is the date the user last signed in before May 3, 2018. For users that signed in after May 23, 2018 14:08 PDT, the returned password last used date is accurate.</p><p>You can use password last used information to identify unused credentials for deletion. For example, you might delete users who did not sign in to AWS in the last 90 days. In cases like this, we recommend that you adjust your evaluation window to include dates after May 23, 2018. Alternatively, if your users use access keys to access AWS programmatically you can refer to access key last used information because it is accurate for all dates. </p></important>
 */
@property (nonatomic, strong) AWSIamUser * _Nullable user;

@end

/**
 <p>Contains information about an IAM group entity.</p><p>This data type is used as a response element in the following operations:</p><ul><li><p><a>CreateGroup</a></p></li><li><p><a>GetGroup</a></p></li><li><p><a>ListGroups</a></p></li></ul>
 Required parameters: [Path, GroupName, GroupId, Arn, CreateDate]
 */
@interface AWSIamGroup : AWSModel


/**
 <p> The Amazon Resource Name (ARN) specifying the group. For more information about ARNs and how to use them in policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the group was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p> The stable and unique string identifying the group. For more information about IDs, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The friendly name that identifies the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The path to the group. For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>Contains information about an IAM group, including all of the group's policies.</p><p>This data type is used as a response element in the <a>GetAccountAuthorizationDetails</a> operation.</p>
 */
@interface AWSIamGroupDetail : AWSModel


/**
 <p>The Amazon Resource Name (ARN). ARNs are unique identifiers for AWS resources.</p><p>For more information about ARNs, go to <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>A list of the managed policies attached to the group.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamAttachedPolicy *> * _Nullable attachedManagedPolicies;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the group was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The stable and unique string identifying the group. For more information about IDs, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The friendly name that identifies the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>A list of the inline policies embedded in the group.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamPolicyDetail *> * _Nullable groupPolicyList;

/**
 <p>The path to the group. For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

@end

/**
 <p>Contains information about an instance profile.</p><p>This data type is used as a response element in the following operations:</p><ul><li><p><a>CreateInstanceProfile</a></p></li><li><p><a>GetInstanceProfile</a></p></li><li><p><a>ListInstanceProfiles</a></p></li><li><p><a>ListInstanceProfilesForRole</a></p></li></ul>
 Required parameters: [Path, InstanceProfileName, InstanceProfileId, Arn, CreateDate, Roles]
 */
@interface AWSIamInstanceProfile : AWSModel


/**
 <p> The Amazon Resource Name (ARN) specifying the instance profile. For more information about ARNs and how to use them in policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date when the instance profile was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p> The stable and unique string identifying the instance profile. For more information about IDs, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceProfileId;

/**
 <p>The name identifying the instance profile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceProfileName;

/**
 <p> The path to the instance profile. For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The role associated with the instance profile.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamRole *> * _Nullable roles;

@end

/**
 
 */
@interface AWSIamListAccessKeysRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The name of the user.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>ListAccessKeys</a> request. </p>
 Required parameters: [AccessKeyMetadata]
 */
@interface AWSIamListAccessKeysResponse : AWSModel


/**
 <p>A list of objects containing metadata about the access keys.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamAccessKeyMetadata *> * _Nullable accessKeyMetadata;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSIamListAccountAliasesRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 <p>Contains the response to a successful <a>ListAccountAliases</a> request. </p>
 Required parameters: [AccountAliases]
 */
@interface AWSIamListAccountAliasesResponse : AWSModel


/**
 <p>A list of aliases associated with the account. AWS supports only one alias per account.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable accountAliases;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSIamListAttachedGroupPoliciesRequest : AWSRequest


/**
 <p>The name (friendly name, not ARN) of the group to list attached policies for.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The path prefix for filtering the results. This parameter is optional. If it is not included, it defaults to a slash (/), listing all policies.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathPrefix;

@end

/**
 <p>Contains the response to a successful <a>ListAttachedGroupPolicies</a> request. </p>
 */
@interface AWSIamListAttachedGroupPoliciesResponse : AWSModel


/**
 <p>A list of the attached policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamAttachedPolicy *> * _Nullable attachedPolicies;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSIamListAttachedRolePoliciesRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The path prefix for filtering the results. This parameter is optional. If it is not included, it defaults to a slash (/), listing all policies.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathPrefix;

/**
 <p>The name (friendly name, not ARN) of the role to list attached policies for.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 <p>Contains the response to a successful <a>ListAttachedRolePolicies</a> request. </p>
 */
@interface AWSIamListAttachedRolePoliciesResponse : AWSModel


/**
 <p>A list of the attached policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamAttachedPolicy *> * _Nullable attachedPolicies;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSIamListAttachedUserPoliciesRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The path prefix for filtering the results. This parameter is optional. If it is not included, it defaults to a slash (/), listing all policies.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathPrefix;

/**
 <p>The name (friendly name, not ARN) of the user to list attached policies for.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>ListAttachedUserPolicies</a> request. </p>
 */
@interface AWSIamListAttachedUserPoliciesResponse : AWSModel


/**
 <p>A list of the attached policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamAttachedPolicy *> * _Nullable attachedPolicies;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSIamListEntitiesForPolicyRequest : AWSRequest


/**
 <p>The entity type to use for filtering the results.</p><p>For example, when <code>EntityFilter</code> is <code>Role</code>, only the roles that are attached to the specified policy are returned. This parameter is optional. If it is not included, all attached entities (users, groups, and roles) are returned. The argument for this parameter must be one of the valid values listed below.</p>
 */
@property (nonatomic, assign) AWSIamEntityType entityFilter;

/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The path prefix for filtering the results. This parameter is optional. If it is not included, it defaults to a slash (/), listing all entities.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathPrefix;

/**
 <p>The Amazon Resource Name (ARN) of the IAM policy for which you want the versions.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The policy usage method to use for filtering the results.</p><p>To list only permissions policies, set <code>PolicyUsageFilter</code> to <code>PermissionsPolicy</code>. To list only the policies used to set permissions boundaries, set the value to <code>PermissionsBoundary</code>.</p><p>This parameter is optional. If it is not included, all policies are returned. </p>
 */
@property (nonatomic, assign) AWSIamPolicyUsageType policyUsageFilter;

@end

/**
 <p>Contains the response to a successful <a>ListEntitiesForPolicy</a> request. </p>
 */
@interface AWSIamListEntitiesForPolicyResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of IAM groups that the policy is attached to.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamPolicyGroup *> * _Nullable policyGroups;

/**
 <p>A list of IAM roles that the policy is attached to.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamPolicyRole *> * _Nullable policyRoles;

/**
 <p>A list of IAM users that the policy is attached to.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamPolicyUser *> * _Nullable policyUsers;

@end

/**
 
 */
@interface AWSIamListGroupPoliciesRequest : AWSRequest


/**
 <p>The name of the group to list policies for.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 <p>Contains the response to a successful <a>ListGroupPolicies</a> request. </p>
 Required parameters: [PolicyNames]
 */
@interface AWSIamListGroupPoliciesResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of policy names.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNames;

@end

/**
 
 */
@interface AWSIamListGroupsForUserRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The name of the user to list groups for.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>ListGroupsForUser</a> request. </p>
 Required parameters: [Groups]
 */
@interface AWSIamListGroupsForUserResponse : AWSModel


/**
 <p>A list of groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamGroup *> * _Nullable groups;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSIamListGroupsRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p> The path prefix for filtering the results. For example, the prefix <code>/division_abc/subdivision_xyz/</code> gets all groups whose path starts with <code>/division_abc/subdivision_xyz/</code>.</p><p>This parameter is optional. If it is not included, it defaults to a slash (/), listing all groups. This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathPrefix;

@end

/**
 <p>Contains the response to a successful <a>ListGroups</a> request. </p>
 Required parameters: [Groups]
 */
@interface AWSIamListGroupsResponse : AWSModel


/**
 <p>A list of groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamGroup *> * _Nullable groups;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSIamListInstanceProfilesForRoleRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The name of the role to list instance profiles for.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 <p>Contains the response to a successful <a>ListInstanceProfilesForRole</a> request. </p>
 Required parameters: [InstanceProfiles]
 */
@interface AWSIamListInstanceProfilesForRoleResponse : AWSModel


/**
 <p>A list of instance profiles.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamInstanceProfile *> * _Nullable instanceProfiles;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSIamListInstanceProfilesRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p> The path prefix for filtering the results. For example, the prefix <code>/application_abc/component_xyz/</code> gets all instance profiles whose path starts with <code>/application_abc/component_xyz/</code>.</p><p>This parameter is optional. If it is not included, it defaults to a slash (/), listing all instance profiles. This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathPrefix;

@end

/**
 <p>Contains the response to a successful <a>ListInstanceProfiles</a> request. </p>
 Required parameters: [InstanceProfiles]
 */
@interface AWSIamListInstanceProfilesResponse : AWSModel


/**
 <p>A list of instance profiles.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamInstanceProfile *> * _Nullable instanceProfiles;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSIamListMFADevicesRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The name of the user whose MFA devices you want to list.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>ListMFADevices</a> request. </p>
 Required parameters: [MFADevices]
 */
@interface AWSIamListMFADevicesResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>A list of MFA devices.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamMFADevice *> * _Nullable MFADevices;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSIamListOpenIDConnectProvidersRequest : AWSRequest


@end

/**
 <p>Contains the response to a successful <a>ListOpenIDConnectProviders</a> request. </p>
 */
@interface AWSIamListOpenIDConnectProvidersResponse : AWSModel


/**
 <p>The list of IAM OIDC provider resource objects defined in the AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamOpenIDConnectProviderListEntry *> * _Nullable openIDConnectProviderList;

@end

/**
 <p>Contains details about the permissions policies that are attached to the specified identity (user, group, or role).</p><p>This data type is used as a response element in the <a>ListPoliciesGrantingServiceAccess</a> operation.</p>
 */
@interface AWSIamListPoliciesGrantingServiceAccessEntry : AWSModel


/**
 <p>The <code>PoliciesGrantingServiceAccess</code> object that contains details about the policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamPolicyGrantingServiceAccess *> * _Nullable policies;

/**
 <p>The namespace of the service that was accessed.</p><p>To learn the service namespace of a service, go to <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html">Actions, Resources, and Condition Keys for AWS Services</a> in the <i>IAM User Guide</i>. Choose the name of the service to view details for that service. In the first paragraph, find the service prefix. For example, <code>(service prefix: a4b)</code>. For more information about service namespaces, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceNamespace;

@end

/**
 
 */
@interface AWSIamListPoliciesGrantingServiceAccessRequest : AWSRequest


/**
 <p>The ARN of the IAM identity (user, group, or role) whose policies you want to list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The service namespace for the AWS services whose policies you want to list.</p><p>To learn the service namespace for a service, go to <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html">Actions, Resources, and Condition Keys for AWS Services</a> in the <i>IAM User Guide</i>. Choose the name of the service to view details for that service. In the first paragraph, find the service prefix. For example, <code>(service prefix: a4b)</code>. For more information about service namespaces, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable serviceNamespaces;

@end

/**
 
 */
@interface AWSIamListPoliciesGrantingServiceAccessResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A <code>ListPoliciesGrantingServiceAccess</code> object that contains details about the permissions policies attached to the specified identity (user, group, or role).</p>
 */
@property (nonatomic, strong) NSArray<AWSIamListPoliciesGrantingServiceAccessEntry *> * _Nullable policiesGrantingServiceAccess;

@end

/**
 
 */
@interface AWSIamListPoliciesRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>A flag to filter the results to only the attached policies.</p><p>When <code>OnlyAttached</code> is <code>true</code>, the returned list contains only the policies that are attached to an IAM user, group, or role. When <code>OnlyAttached</code> is <code>false</code>, or when the parameter is not included, all policies are returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable onlyAttached;

/**
 <p>The path prefix for filtering the results. This parameter is optional. If it is not included, it defaults to a slash (/), listing all policies. This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathPrefix;

/**
 <p>The policy usage method to use for filtering the results.</p><p>To list only permissions policies, set <code>PolicyUsageFilter</code> to <code>PermissionsPolicy</code>. To list only the policies used to set permissions boundaries, set the value to <code>PermissionsBoundary</code>.</p><p>This parameter is optional. If it is not included, all policies are returned. </p>
 */
@property (nonatomic, assign) AWSIamPolicyUsageType policyUsageFilter;

/**
 <p>The scope to use for filtering the results.</p><p>To list only AWS managed policies, set <code>Scope</code> to <code>AWS</code>. To list only the customer managed policies in your AWS account, set <code>Scope</code> to <code>Local</code>.</p><p>This parameter is optional. If it is not included, or if it is set to <code>All</code>, all policies are returned.</p>
 */
@property (nonatomic, assign) AWSIampolicyScopeType scope;

@end

/**
 <p>Contains the response to a successful <a>ListPolicies</a> request. </p>
 */
@interface AWSIamListPoliciesResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamPolicy *> * _Nullable policies;

@end

/**
 
 */
@interface AWSIamListPolicyVersionsRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The Amazon Resource Name (ARN) of the IAM policy for which you want the versions.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

@end

/**
 <p>Contains the response to a successful <a>ListPolicyVersions</a> request. </p>
 */
@interface AWSIamListPolicyVersionsResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of policy versions.</p><p>For more information about managed policy versions, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning for Managed Policies</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamPolicyVersion *> * _Nullable versions;

@end

/**
 
 */
@interface AWSIamListRolePoliciesRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The name of the role to list policies for.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 <p>Contains the response to a successful <a>ListRolePolicies</a> request. </p>
 Required parameters: [PolicyNames]
 */
@interface AWSIamListRolePoliciesResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of policy names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNames;

@end

/**
 
 */
@interface AWSIamListRoleTagsRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>(Optional) Use this only when paginating results to indicate the maximum number of items that you want in the response. If additional items exist beyond the maximum that you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, it defaults to 100. Note that IAM might return fewer results, even when more results are available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The name of the IAM role for which you want to see the list of tags.</p><p>This parameter accepts (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamListRoleTagsResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can use the <code>Marker</code> request parameter to make a subsequent pagination request that retrieves more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when more results are available. Check <code>IsTruncated</code> after every call to ensure that you receive all of your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The list of tags currently that is attached to the role. Each tag consists of a key name and an associated value. If no tags are attached to the specified role, the response contains an empty list.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSIamListRolesRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p> The path prefix for filtering the results. For example, the prefix <code>/application_abc/component_xyz/</code> gets all roles whose path starts with <code>/application_abc/component_xyz/</code>.</p><p>This parameter is optional. If it is not included, it defaults to a slash (/), listing all roles. This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathPrefix;

@end

/**
 <p>Contains the response to a successful <a>ListRoles</a> request. </p>
 Required parameters: [Roles]
 */
@interface AWSIamListRolesResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of roles.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamRole *> * _Nullable roles;

@end

/**
 
 */
@interface AWSIamListSAMLProvidersRequest : AWSRequest


@end

/**
 <p>Contains the response to a successful <a>ListSAMLProviders</a> request. </p>
 */
@interface AWSIamListSAMLProvidersResponse : AWSModel


/**
 <p>The list of SAML provider resource objects defined in IAM for this AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamSAMLProviderListEntry *> * _Nullable SAMLProviderList;

@end

/**
 
 */
@interface AWSIamListSSHPublicKeysRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The name of the IAM user to list SSH public keys for. If none is specified, the <code>UserName</code> field is determined implicitly based on the AWS access key used to sign the request.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>ListSSHPublicKeys</a> request.</p>
 */
@interface AWSIamListSSHPublicKeysResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of the SSH public keys assigned to IAM user.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamSSHPublicKeyMetadata *> * _Nullable SSHPublicKeys;

@end

/**
 
 */
@interface AWSIamListServerCertificatesRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p> The path prefix for filtering the results. For example: <code>/company/servercerts</code> would get all server certificates for which the path starts with <code>/company/servercerts</code>.</p><p>This parameter is optional. If it is not included, it defaults to a slash (/), listing all server certificates. This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathPrefix;

@end

/**
 <p>Contains the response to a successful <a>ListServerCertificates</a> request. </p>
 Required parameters: [ServerCertificateMetadataList]
 */
@interface AWSIamListServerCertificatesResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of server certificates.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamServerCertificateMetadata *> * _Nullable serverCertificateMetadataList;

@end

/**
 
 */
@interface AWSIamListServiceSpecificCredentialsRequest : AWSRequest


/**
 <p>Filters the returned results to only those for the specified AWS service. If not specified, then AWS returns service-specific credentials for all services.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

/**
 <p>The name of the user whose service-specific credentials you want information about. If this value is not specified, then the operation assumes the user whose credentials are used to call the operation.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamListServiceSpecificCredentialsResponse : AWSModel


/**
 <p>A list of structures that each contain details about a service-specific credential.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamServiceSpecificCredentialMetadata *> * _Nullable serviceSpecificCredentials;

@end

/**
 
 */
@interface AWSIamListSigningCertificatesRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The name of the IAM user whose signing certificates you want to examine.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>ListSigningCertificates</a> request. </p>
 Required parameters: [Certificates]
 */
@interface AWSIamListSigningCertificatesResponse : AWSModel


/**
 <p>A list of the user's signing certificate information.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamSigningCertificate *> * _Nullable certificates;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSIamListUserPoliciesRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The name of the user to list policies for.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>ListUserPolicies</a> request. </p>
 Required parameters: [PolicyNames]
 */
@interface AWSIamListUserPoliciesResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of policy names.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyNames;

@end

/**
 
 */
@interface AWSIamListUserTagsRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>(Optional) Use this only when paginating results to indicate the maximum number of items that you want in the response. If additional items exist beyond the maximum that you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, it defaults to 100. Note that IAM might return fewer results, even when more results are available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The name of the IAM user whose tags you want to see.</p><p>This parameter accepts (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamListUserTagsResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can use the <code>Marker</code> request parameter to make a subsequent pagination request that retrieves more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when more results are available. Check <code>IsTruncated</code> after every call to ensure that you receive all of your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>The list of tags that are currently attached to the user. Each tag consists of a key name and an associated value. If no tags are attached to the specified user, the response contains an empty list.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSIamListUsersRequest : AWSRequest


/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p> The path prefix for filtering the results. For example: <code>/division_abc/subdivision_xyz/</code>, which would get all user names whose path starts with <code>/division_abc/subdivision_xyz/</code>.</p><p>This parameter is optional. If it is not included, it defaults to a slash (/), listing all user names. This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pathPrefix;

@end

/**
 <p>Contains the response to a successful <a>ListUsers</a> request. </p>
 Required parameters: [Users]
 */
@interface AWSIamListUsersResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>A list of users.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamUser *> * _Nullable users;

@end

/**
 
 */
@interface AWSIamListVirtualMFADevicesRequest : AWSRequest


/**
 <p> The status (<code>Unassigned</code> or <code>Assigned</code>) of the devices to list. If you do not specify an <code>AssignmentStatus</code>, the operation defaults to <code>Any</code>, which lists both assigned and unassigned virtual MFA devices.,</p>
 */
@property (nonatomic, assign) AWSIamassignmentStatusType assignmentStatus;

/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

@end

/**
 <p>Contains the response to a successful <a>ListVirtualMFADevices</a> request. </p>
 Required parameters: [VirtualMFADevices]
 */
@interface AWSIamListVirtualMFADevicesResponse : AWSModel


/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p> The list of virtual MFA devices in the current account that match the <code>AssignmentStatus</code> value that was passed in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamVirtualMFADevice *> * _Nullable virtualMFADevices;

@end

/**
 <p>Contains the user name and password create date for a user.</p><p> This data type is used as a response element in the <a>CreateLoginProfile</a> and <a>GetLoginProfile</a> operations. </p>
 Required parameters: [UserName, CreateDate]
 */
@interface AWSIamLoginProfile : AWSModel


/**
 <p>The date when the password for the user was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>Specifies whether the user is required to set a new password on next sign-in.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable passwordResetRequired;

/**
 <p>The name of the user, which can be used for signing in to the AWS Management Console.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains information about an MFA device.</p><p>This data type is used as a response element in the <a>ListMFADevices</a> operation.</p>
 Required parameters: [UserName, SerialNumber, EnableDate]
 */
@interface AWSIamMFADevice : AWSModel


/**
 <p>The date when the MFA device was enabled for the user.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable enableDate;

/**
 <p>The serial number that uniquely identifies the MFA device. For virtual MFA devices, the serial number is the device ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serialNumber;

/**
 <p>The user with whom the MFA device is associated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains information about a managed policy, including the policy's ARN, versions, and the number of principal entities (users, groups, and roles) that the policy is attached to.</p><p>This data type is used as a response element in the <a>GetAccountAuthorizationDetails</a> operation.</p><p>For more information about managed policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed Policies and Inline Policies</a> in the <i>IAM User Guide</i>. </p>
 */
@interface AWSIamManagedPolicyDetail : AWSModel


/**
 <p>The Amazon Resource Name (ARN). ARNs are unique identifiers for AWS resources.</p><p>For more information about ARNs, go to <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The number of principal entities (users, groups, and roles) that the policy is attached to.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable attachmentCount;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the policy was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The identifier for the version of the policy that is set as the default (operative) version.</p><p>For more information about policy versions, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning for Managed Policies</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultVersionId;

/**
 <p>A friendly description of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Specifies whether the policy can be attached to an IAM user, group, or role.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isAttachable;

/**
 <p>The path to the policy.</p><p>For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The number of entities (users and roles) for which the policy is used as the permissions boundary. </p><p>For more information about permissions boundaries, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable permissionsBoundaryUsageCount;

/**
 <p>The stable and unique string identifying the policy.</p><p>For more information about IDs, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

/**
 <p>The friendly name (not ARN) identifying the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>A list containing information about the versions of the policy.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamPolicyVersion *> * _Nullable policyVersionList;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the policy was last updated.</p><p>When a policy has only one version, this field contains the date and time when the policy was created. When a policy has more than one version, this field contains the date and time when the most recent policy version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateDate;

@end

/**
 <p>Contains the Amazon Resource Name (ARN) for an IAM OpenID Connect provider.</p>
 */
@interface AWSIamOpenIDConnectProviderListEntry : AWSModel


/**
 <p>The Amazon Resource Name (ARN). ARNs are unique identifiers for AWS resources.</p><p>For more information about ARNs, go to <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

@end

/**
 <p>Contains information about the effect that Organizations has on a policy simulation.</p>
 */
@interface AWSIamOrganizationsDecisionDetail : AWSModel


/**
 <p>Specifies whether the simulated operation is allowed by the Organizations service control policies that impact the simulated user's account.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowedByOrganizations;

@end

/**
 <p>Contains information about the account password policy.</p><p> This data type is used as a response element in the <a>GetAccountPasswordPolicy</a> operation. </p>
 */
@interface AWSIamPasswordPolicy : AWSModel


/**
 <p>Specifies whether IAM users are allowed to change their own password.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowUsersToChangePassword;

/**
 <p>Indicates whether passwords in the account expire. Returns true if <code>MaxPasswordAge</code> contains a value greater than 0. Returns false if MaxPasswordAge is 0 or not present.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expirePasswords;

/**
 <p>Specifies whether IAM users are prevented from setting a new password after their password has expired.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hardExpiry;

/**
 <p>The number of days that an IAM user password is valid.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxPasswordAge;

/**
 <p>Minimum length to require for IAM user passwords.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimumPasswordLength;

/**
 <p>Specifies the number of previous passwords that IAM users are prevented from reusing.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable passwordReusePrevention;

/**
 <p>Specifies whether to require lowercase characters for IAM user passwords.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireLowercaseCharacters;

/**
 <p>Specifies whether to require numbers for IAM user passwords.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireNumbers;

/**
 <p>Specifies whether to require symbols for IAM user passwords.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireSymbols;

/**
 <p>Specifies whether to require uppercase characters for IAM user passwords.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireUppercaseCharacters;

@end

/**
 <p>Contains information about the effect that a permissions boundary has on a policy simulation when the boundary is applied to an IAM entity.</p>
 */
@interface AWSIamPermissionsBoundaryDecisionDetail : AWSModel


/**
 <p>Specifies whether an action is allowed by a permissions boundary that is applied to an IAM entity (user or role). A value of <code>true</code> means that the permissions boundary does not deny the action. This means that the policy includes an <code>Allow</code> statement that matches the request. In this case, if an identity-based policy also allows the action, the request is allowed. A value of <code>false</code> means that either the requested action is not allowed (implicitly denied) or that the action is explicitly denied by the permissions boundary. In both of these cases, the action is not allowed, regardless of the identity-based policy.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowedByPermissionsBoundary;

@end

/**
 <p>Contains information about a managed policy.</p><p>This data type is used as a response element in the <a>CreatePolicy</a>, <a>GetPolicy</a>, and <a>ListPolicies</a> operations. </p><p>For more information about managed policies, refer to <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed Policies and Inline Policies</a> in the <i>IAM User Guide</i>. </p>
 */
@interface AWSIamPolicy : AWSModel


/**
 <p>The Amazon Resource Name (ARN). ARNs are unique identifiers for AWS resources.</p><p>For more information about ARNs, go to <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The number of entities (users, groups, and roles) that the policy is attached to.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable attachmentCount;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the policy was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The identifier for the version of the policy that is set as the default version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultVersionId;

/**
 <p>A friendly description of the policy.</p><p>This element is included in the response to the <a>GetPolicy</a> operation. It is not included in the response to the <a>ListPolicies</a> operation. </p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Specifies whether the policy can be attached to an IAM user, group, or role.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isAttachable;

/**
 <p>The path to the policy.</p><p>For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The number of entities (users and roles) for which the policy is used to set the permissions boundary. </p><p>For more information about permissions boundaries, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable permissionsBoundaryUsageCount;

/**
 <p>The stable and unique string identifying the policy.</p><p>For more information about IDs, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

/**
 <p>The friendly name (not ARN) identifying the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the policy was last updated.</p><p>When a policy has only one version, this field contains the date and time when the policy was created. When a policy has more than one version, this field contains the date and time when the most recent policy version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateDate;

@end

/**
 <p>Contains information about an IAM policy, including the policy document.</p><p>This data type is used as a response element in the <a>GetAccountAuthorizationDetails</a> operation.</p>
 */
@interface AWSIamPolicyDetail : AWSModel


/**
 <p>The policy document.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The name of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 <p>Contains details about the permissions policies that are attached to the specified identity (user, group, or role).</p><p>This data type is an element of the <a>ListPoliciesGrantingServiceAccessEntry</a> object.</p>
 Required parameters: [PolicyName, PolicyType]
 */
@interface AWSIamPolicyGrantingServiceAccess : AWSModel


/**
 <p>The name of the entity (user or role) to which the inline policy is attached.</p><p>This field is null for managed policies. For more information about these policy types, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html">Managed Policies and Inline Policies</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable entityName;

/**
 <p>The type of entity (user or role) that used the policy to access the service to which the inline policy is attached.</p><p>This field is null for managed policies. For more information about these policy types, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html">Managed Policies and Inline Policies</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSIampolicyOwnerEntityType entityType;

/**
 <p>The Amazon Resource Name (ARN). ARNs are unique identifiers for AWS resources.</p><p>For more information about ARNs, go to <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The policy name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The policy type. For more information about these policy types, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html">Managed Policies and Inline Policies</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSIampolicyType policyType;

@end

/**
 <p>Contains information about a group that a managed policy is attached to.</p><p>This data type is used as a response element in the <a>ListEntitiesForPolicy</a> operation. </p><p>For more information about managed policies, refer to <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed Policies and Inline Policies</a> in the <i>IAM User Guide</i>. </p>
 */
@interface AWSIamPolicyGroup : AWSModel


/**
 <p>The stable and unique string identifying the group. For more information about IDs, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupId;

/**
 <p>The name (friendly name, not ARN) identifying the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

@end

/**
 <p>Contains information about a role that a managed policy is attached to.</p><p>This data type is used as a response element in the <a>ListEntitiesForPolicy</a> operation. </p><p>For more information about managed policies, refer to <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed Policies and Inline Policies</a> in the <i>IAM User Guide</i>. </p>
 */
@interface AWSIamPolicyRole : AWSModel


/**
 <p>The stable and unique string identifying the role. For more information about IDs, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleId;

/**
 <p>The name (friendly name, not ARN) identifying the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 <p>Contains information about a user that a managed policy is attached to.</p><p>This data type is used as a response element in the <a>ListEntitiesForPolicy</a> operation. </p><p>For more information about managed policies, refer to <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed Policies and Inline Policies</a> in the <i>IAM User Guide</i>. </p>
 */
@interface AWSIamPolicyUser : AWSModel


/**
 <p>The stable and unique string identifying the user. For more information about IDs, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

/**
 <p>The name (friendly name, not ARN) identifying the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains information about a version of a managed policy.</p><p>This data type is used as a response element in the <a>CreatePolicyVersion</a>, <a>GetPolicyVersion</a>, <a>ListPolicyVersions</a>, and <a>GetAccountAuthorizationDetails</a> operations. </p><p>For more information about managed policies, refer to <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed Policies and Inline Policies</a> in the <i>IAM User Guide</i>. </p>
 */
@interface AWSIamPolicyVersion : AWSModel


/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the policy version was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The policy document.</p><p>The policy document is returned in the response to the <a>GetPolicyVersion</a> and <a>GetAccountAuthorizationDetails</a> operations. It is not returned in the response to the <a>CreatePolicyVersion</a> or <a>ListPolicyVersions</a> operations. </p><p>The policy document returned in this structure is URL-encoded compliant with <a href="https://tools.ietf.org/html/rfc3986">RFC 3986</a>. You can use a URL decoding method to convert the policy back to plain JSON text. For example, if you use Java, you can use the <code>decode</code> method of the <code>java.net.URLDecoder</code> utility class in the Java SDK. Other languages and SDKs provide similar functionality.</p>
 */
@property (nonatomic, strong) NSString * _Nullable document;

/**
 <p>Specifies whether the policy version is set as the policy's default version.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isDefaultVersion;

/**
 <p>The identifier for the policy version.</p><p>Policy version identifiers always begin with <code>v</code> (always lowercase). When a policy is created, the first policy version is <code>v1</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 <p>Contains the row and column of a location of a <code>Statement</code> element in a policy document.</p><p>This data type is used as a member of the <code><a>Statement</a></code> type.</p>
 */
@interface AWSIamPosition : AWSModel


/**
 <p>The column in the line containing the specified position in the document.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable column;

/**
 <p>The line containing the specified position in the document.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable line;

@end

/**
 
 */
@interface AWSIamPutGroupPolicyRequest : AWSRequest


/**
 <p>The name of the group to associate the policy with.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The policy document.</p><p>You must provide policies in JSON format in IAM. However, for AWS CloudFormation templates formatted in YAML, you can provide the policy in JSON or YAML format. AWS CloudFormation always converts a YAML policy to JSON format before submitting it to IAM.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The name of the policy document.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

@end

/**
 
 */
@interface AWSIamPutRolePermissionsBoundaryRequest : AWSRequest


/**
 <p>The ARN of the policy that is used to set the permissions boundary for the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable permissionsBoundary;

/**
 <p>The name (friendly name, not ARN) of the IAM role for which you want to set the permissions boundary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamPutRolePolicyRequest : AWSRequest


/**
 <p>The policy document.</p><p>You must provide policies in JSON format in IAM. However, for AWS CloudFormation templates formatted in YAML, you can provide the policy in JSON or YAML format. AWS CloudFormation always converts a YAML policy to JSON format before submitting it to IAM.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The name of the policy document.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The name of the role to associate the policy with.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamPutUserPermissionsBoundaryRequest : AWSRequest


/**
 <p>The ARN of the policy that is used to set the permissions boundary for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable permissionsBoundary;

/**
 <p>The name (friendly name, not ARN) of the IAM user for which you want to set the permissions boundary.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamPutUserPolicyRequest : AWSRequest


/**
 <p>The policy document.</p><p>You must provide policies in JSON format in IAM. However, for AWS CloudFormation templates formatted in YAML, you can provide the policy in JSON or YAML format. AWS CloudFormation always converts a YAML policy to JSON format before submitting it to IAM.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The name of the policy document.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyName;

/**
 <p>The name of the user to associate the policy with.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamRemoveClientIDFromOpenIDConnectProviderRequest : AWSRequest


/**
 <p>The client ID (also known as audience) to remove from the IAM OIDC provider resource. For more information about client IDs, see <a>CreateOpenIDConnectProvider</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientID;

/**
 <p>The Amazon Resource Name (ARN) of the IAM OIDC provider resource to remove the client ID from. You can get a list of OIDC provider ARNs by using the <a>ListOpenIDConnectProviders</a> operation.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable openIDConnectProviderArn;

@end

/**
 
 */
@interface AWSIamRemoveRoleFromInstanceProfileRequest : AWSRequest


/**
 <p>The name of the instance profile to update.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable instanceProfileName;

/**
 <p>The name of the role to remove.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamRemoveUserFromGroupRequest : AWSRequest


/**
 <p>The name of the group to update.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The name of the user to remove.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamResetServiceSpecificCredentialRequest : AWSRequest


/**
 <p>The unique identifier of the service-specific credential.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that can consist of any upper or lowercased letter or digit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceSpecificCredentialId;

/**
 <p>The name of the IAM user associated with the service-specific credential. If this value is not specified, then the operation assumes the user whose credentials are used to call the operation.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamResetServiceSpecificCredentialResponse : AWSModel


/**
 <p>A structure with details about the updated service-specific credential, including the new password.</p><important><p>This is the <b>only</b> time that you can access the password. You cannot recover the password later, but you can reset it again.</p></important>
 */
@property (nonatomic, strong) AWSIamServiceSpecificCredential * _Nullable serviceSpecificCredential;

@end

/**
 <p>Contains the result of the simulation of a single API operation call on a single resource.</p><p>This data type is used by a member of the <a>EvaluationResult</a> data type.</p>
 Required parameters: [EvalResourceName, EvalResourceDecision]
 */
@interface AWSIamResourceSpecificResult : AWSModel


/**
 <p>Additional details about the results of the evaluation decision on a single resource. This parameter is returned only for cross-account simulations. This parameter explains how each policy type contributes to the resource-specific evaluation decision.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable evalDecisionDetails;

/**
 <p>The result of the simulation of the simulated API operation on the resource specified in <code>EvalResourceName</code>.</p>
 */
@property (nonatomic, assign) AWSIamPolicyEvaluationDecisionType evalResourceDecision;

/**
 <p>The name of the simulated resource, in Amazon Resource Name (ARN) format.</p>
 */
@property (nonatomic, strong) NSString * _Nullable evalResourceName;

/**
 <p>A list of the statements in the input policies that determine the result for this part of the simulation. Remember that even if multiple statements allow the operation on the resource, if <i>any</i> statement denies that operation, then the explicit deny overrides any allow. In addition, the deny statement is the only entry included in the result.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamStatement *> * _Nullable matchedStatements;

/**
 <p>A list of context keys that are required by the included input policies but that were not provided by one of the input parameters. This list is used when a list of ARNs is included in the <code>ResourceArns</code> parameter instead of "*". If you do not specify individual resources, by setting <code>ResourceArns</code> to "*" or by not including the <code>ResourceArns</code> parameter, then any missing context values are instead included under the <code>EvaluationResults</code> section. To discover the context keys used by a set of policies, you can call <a>GetContextKeysForCustomPolicy</a> or <a>GetContextKeysForPrincipalPolicy</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable missingContextValues;

/**
 <p>Contains information about the effect that a permissions boundary has on a policy simulation when that boundary is applied to an IAM entity.</p>
 */
@property (nonatomic, strong) AWSIamPermissionsBoundaryDecisionDetail * _Nullable permissionsBoundaryDecisionDetail;

@end

/**
 
 */
@interface AWSIamResyncMFADeviceRequest : AWSRequest


/**
 <p>An authentication code emitted by the device.</p><p>The format for this parameter is a sequence of six digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authenticationCode1;

/**
 <p>A subsequent authentication code emitted by the device.</p><p>The format for this parameter is a sequence of six digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable authenticationCode2;

/**
 <p>Serial number that uniquely identifies the MFA device.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable serialNumber;

/**
 <p>The name of the user whose MFA device you want to resynchronize.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains information about an IAM role. This structure is returned as a response element in several API operations that interact with roles.</p>
 Required parameters: [Path, RoleName, RoleId, Arn, CreateDate]
 */
@interface AWSIamRole : AWSModel


/**
 <p> The Amazon Resource Name (ARN) specifying the role. For more information about ARNs and how to use them in policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i> guide. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The policy that grants an entity permission to assume the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assumeRolePolicyDocument;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the role was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>A description of the role that you provide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The maximum session duration (in seconds) for the specified role. Anyone who uses the AWS CLI, or API to assume the role can specify the duration using the optional <code>DurationSeconds</code> API parameter or <code>duration-seconds</code> CLI parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSessionDuration;

/**
 <p> The path to the role. For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The ARN of the policy used to set the permissions boundary for the role.</p><p>For more information about permissions boundaries, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSIamAttachedPermissionsBoundary * _Nullable permissionsBoundary;

/**
 <p> The stable and unique string identifying the role. For more information about IDs, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable roleId;

/**
 <p>Contains information about the last time that an IAM role was used. This includes the date and time and the Region in which the role was last used. Activity is only reported for the trailing 400 days. This period can be shorter if your Region began supporting these features within the last year. The role might have been used more than 400 days ago. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period">Regions Where Data Is Tracked</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSIamRoleLastUsed * _Nullable roleLastUsed;

/**
 <p>The friendly name that identifies the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

/**
 <p>A list of tags that are attached to the specified role. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM Identities</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamTag *> * _Nullable tags;

@end

/**
 <p>Contains information about an IAM role, including all of the role's policies.</p><p>This data type is used as a response element in the <a>GetAccountAuthorizationDetails</a> operation.</p>
 */
@interface AWSIamRoleDetail : AWSModel


/**
 <p>The Amazon Resource Name (ARN). ARNs are unique identifiers for AWS resources.</p><p>For more information about ARNs, go to <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The trust policy that grants permission to assume the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable assumeRolePolicyDocument;

/**
 <p>A list of managed policies attached to the role. These policies are the role's access (permissions) policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamAttachedPolicy *> * _Nullable attachedManagedPolicies;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the role was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>A list of instance profiles that contain this role.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamInstanceProfile *> * _Nullable instanceProfileList;

/**
 <p>The path to the role. For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The ARN of the policy used to set the permissions boundary for the role.</p><p>For more information about permissions boundaries, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSIamAttachedPermissionsBoundary * _Nullable permissionsBoundary;

/**
 <p>The stable and unique string identifying the role. For more information about IDs, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleId;

/**
 <p>Contains information about the last time that an IAM role was used. This includes the date and time and the Region in which the role was last used. Activity is only reported for the trailing 400 days. This period can be shorter if your Region began supporting these features within the last year. The role might have been used more than 400 days ago. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period">Regions Where Data Is Tracked</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSIamRoleLastUsed * _Nullable roleLastUsed;

/**
 <p>The friendly name that identifies the role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

/**
 <p>A list of inline policies embedded in the role. These policies are the role's access (permissions) policies.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamPolicyDetail *> * _Nullable rolePolicyList;

/**
 <p>A list of tags that are attached to the specified role. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM Identities</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamTag *> * _Nullable tags;

@end

/**
 <p>Contains information about the last time that an IAM role was used. This includes the date and time and the Region in which the role was last used. Activity is only reported for the trailing 400 days. This period can be shorter if your Region began supporting these features within the last year. The role might have been used more than 400 days ago. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period">Regions Where Data Is Tracked</a> in the <i>IAM User Guide</i>.</p><p>This data type is returned as a response element in the <a>GetRole</a> and <a>GetAccountAuthorizationDetails</a> operations.</p>
 */
@interface AWSIamRoleLastUsed : AWSModel


/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a> that the role was last used.</p><p>This field is null if the role has not been used within the IAM tracking period. For more information about the tracking period, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period">Regions Where Data Is Tracked</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUsedDate;

/**
 <p>The name of the AWS Region in which the role was last used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

@end

/**
 <p>An object that contains details about how a service-linked role is used, if that information is returned by the service.</p><p>This data type is used as a response element in the <a>GetServiceLinkedRoleDeletionStatus</a> operation.</p>
 */
@interface AWSIamRoleUsageType : AWSModel


/**
 <p>The name of the Region where the service-linked role is being used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The name of the resource that is using the service-linked role.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resources;

@end

/**
 <p>Contains the list of SAML providers for this account.</p>
 */
@interface AWSIamSAMLProviderListEntry : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the SAML provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time when the SAML provider was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The expiration date and time for the SAML provider.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable validUntil;

@end

/**
 <p>Contains information about an SSH public key.</p><p>This data type is used as a response element in the <a>GetSSHPublicKey</a> and <a>UploadSSHPublicKey</a> operations. </p>
 Required parameters: [UserName, SSHPublicKeyId, Fingerprint, SSHPublicKeyBody, Status]
 */
@interface AWSIamSSHPublicKey : AWSModel


/**
 <p>The MD5 message digest of the SSH public key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fingerprint;

/**
 <p>The SSH public key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSHPublicKeyBody;

/**
 <p>The unique identifier for the SSH public key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSHPublicKeyId;

/**
 <p>The status of the SSH public key. <code>Active</code> means that the key can be used for authentication with an AWS CodeCommit repository. <code>Inactive</code> means that the key cannot be used.</p>
 */
@property (nonatomic, assign) AWSIamstatusType status;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the SSH public key was uploaded.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable uploadDate;

/**
 <p>The name of the IAM user associated with the SSH public key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains information about an SSH public key, without the key's body or fingerprint.</p><p>This data type is used as a response element in the <a>ListSSHPublicKeys</a> operation.</p>
 Required parameters: [UserName, SSHPublicKeyId, Status, UploadDate]
 */
@interface AWSIamSSHPublicKeyMetadata : AWSModel


/**
 <p>The unique identifier for the SSH public key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSHPublicKeyId;

/**
 <p>The status of the SSH public key. <code>Active</code> means that the key can be used for authentication with an AWS CodeCommit repository. <code>Inactive</code> means that the key cannot be used.</p>
 */
@property (nonatomic, assign) AWSIamstatusType status;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the SSH public key was uploaded.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable uploadDate;

/**
 <p>The name of the IAM user associated with the SSH public key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains information about a server certificate.</p><p> This data type is used as a response element in the <a>GetServerCertificate</a> operation. </p>
 Required parameters: [ServerCertificateMetadata, CertificateBody]
 */
@interface AWSIamServerCertificate : AWSModel


/**
 <p>The contents of the public key certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateBody;

/**
 <p>The contents of the public key certificate chain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateChain;

/**
 <p>The meta information of the server certificate, such as its name, path, ID, and ARN.</p>
 */
@property (nonatomic, strong) AWSIamServerCertificateMetadata * _Nullable serverCertificateMetadata;

@end

/**
 <p>Contains information about a server certificate without its certificate body, certificate chain, and private key.</p><p> This data type is used as a response element in the <a>UploadServerCertificate</a> and <a>ListServerCertificates</a> operations. </p>
 Required parameters: [Path, ServerCertificateName, ServerCertificateId, Arn]
 */
@interface AWSIamServerCertificateMetadata : AWSModel


/**
 <p> The Amazon Resource Name (ARN) specifying the server certificate. For more information about ARNs and how to use them in policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date on which the certificate is set to expire.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expiration;

/**
 <p> The path to the server certificate. For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p> The stable and unique string identifying the server certificate. For more information about IDs, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable serverCertificateId;

/**
 <p>The name that identifies the server certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverCertificateName;

/**
 <p>The date when the server certificate was uploaded.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable uploadDate;

@end

/**
 <p>Contains details about the most recent attempt to access the service.</p><p>This data type is used as a response element in the <a>GetServiceLastAccessedDetails</a> operation.</p>
 Required parameters: [ServiceName, ServiceNamespace]
 */
@interface AWSIamServiceLastAccessed : AWSModel


/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when an authenticated entity most recently attempted to access the service. AWS does not report unauthenticated requests.</p><p>This field is null if no IAM entities attempted to access the service within the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting period</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAuthenticated;

/**
 <p>The ARN of the authenticated entity (user or role) that last attempted to access the service. AWS does not report unauthenticated requests.</p><p>This field is null if no IAM entities attempted to access the service within the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting period</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastAuthenticatedEntity;

/**
 <p>The Region from which the authenticated entity (user or role) last attempted to access the service. AWS does not report unauthenticated requests.</p><p>This field is null if no IAM entities attempted to access the service within the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting period</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastAuthenticatedRegion;

/**
 <p>The name of the service in which access was attempted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

/**
 <p>The namespace of the service in which access was attempted.</p><p>To learn the service namespace of a service, go to <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html">Actions, Resources, and Condition Keys for AWS Services</a> in the <i>IAM User Guide</i>. Choose the name of the service to view details for that service. In the first paragraph, find the service prefix. For example, <code>(service prefix: a4b)</code>. For more information about service namespaces, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceNamespace;

/**
 <p>The total number of authenticated principals (root user, IAM users, or IAM roles) that have attempted to access the service.</p><p>This field is null if no principals attempted to access the service within the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting period</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable totalAuthenticatedEntities;

/**
 <p>An object that contains details about the most recent attempt to access a tracked action within the service.</p><p>This field is null if there no tracked actions or if the principal did not use the tracked actions within the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting period</a>. This field is also null if the report was generated at the service level and not the action level. For more information, see the <code>Granularity</code> field in <a>GenerateServiceLastAccessedDetails</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamTrackedActionLastAccessed *> * _Nullable trackedActionsLastAccessed;

@end

/**
 <p>Contains the details of a service-specific credential.</p>
 Required parameters: [CreateDate, ServiceName, ServiceUserName, ServicePassword, ServiceSpecificCredentialId, UserName, Status]
 */
@interface AWSIamServiceSpecificCredential : AWSModel


/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the service-specific credential were created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The name of the service associated with the service-specific credential.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

/**
 <p>The generated password for the service-specific credential.</p>
 */
@property (nonatomic, strong) NSString * _Nullable servicePassword;

/**
 <p>The unique identifier for the service-specific credential.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceSpecificCredentialId;

/**
 <p>The generated user name for the service-specific credential. This value is generated by combining the IAM user's name combined with the ID number of the AWS account, as in <code>jane-at-123456789012</code>, for example. This value cannot be configured by the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceUserName;

/**
 <p>The status of the service-specific credential. <code>Active</code> means that the key is valid for API calls, while <code>Inactive</code> means it is not.</p>
 */
@property (nonatomic, assign) AWSIamstatusType status;

/**
 <p>The name of the IAM user associated with the service-specific credential.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains additional details about a service-specific credential.</p>
 Required parameters: [UserName, Status, ServiceUserName, CreateDate, ServiceSpecificCredentialId, ServiceName]
 */
@interface AWSIamServiceSpecificCredentialMetadata : AWSModel


/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the service-specific credential were created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The name of the service associated with the service-specific credential.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceName;

/**
 <p>The unique identifier for the service-specific credential.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceSpecificCredentialId;

/**
 <p>The generated user name for the service-specific credential.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceUserName;

/**
 <p>The status of the service-specific credential. <code>Active</code> means that the key is valid for API calls, while <code>Inactive</code> means it is not.</p>
 */
@property (nonatomic, assign) AWSIamstatusType status;

/**
 <p>The name of the IAM user associated with the service-specific credential.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamSetDefaultPolicyVersionRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the IAM policy whose default version you want to set.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyArn;

/**
 <p>The version of the policy to set as the default (operative) version.</p><p>For more information about managed policy versions, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning for Managed Policies</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable versionId;

@end

/**
 
 */
@interface AWSIamSetSecurityTokenServicePreferencesRequest : AWSRequest


/**
 <p>The version of the global endpoint token. Version 1 tokens are valid only in AWS Regions that are available by default. These tokens do not work in manually enabled Regions, such as Asia Pacific (Hong Kong). Version 2 tokens are valid in all Regions. However, version 2 tokens are longer and might affect systems where you temporarily store tokens.</p><p>For information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating and Deactivating STS in an AWS Region</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSIamglobalEndpointTokenVersion globalEndpointTokenVersion;

@end

/**
 <p>Contains information about an X.509 signing certificate.</p><p>This data type is used as a response element in the <a>UploadSigningCertificate</a> and <a>ListSigningCertificates</a> operations. </p>
 Required parameters: [UserName, CertificateId, CertificateBody, Status]
 */
@interface AWSIamSigningCertificate : AWSModel


/**
 <p>The contents of the signing certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateBody;

/**
 <p>The ID for the signing certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p>The status of the signing certificate. <code>Active</code> means that the key is valid for API calls, while <code>Inactive</code> means it is not.</p>
 */
@property (nonatomic, assign) AWSIamstatusType status;

/**
 <p>The date when the signing certificate was uploaded.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable uploadDate;

/**
 <p>The name of the user the signing certificate is associated with.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamSimulateCustomPolicyRequest : AWSRequest


/**
 <p>A list of names of API operations to evaluate in the simulation. Each operation is evaluated against each resource. Each operation must include the service identifier, such as <code>iam:CreateUser</code>. This operation does not support using wildcards (*) in an action name.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable actionNames;

/**
 <p>The ARN of the IAM user that you want to use as the simulated caller of the API operations. <code>CallerArn</code> is required if you include a <code>ResourcePolicy</code> so that the policy's <code>Principal</code> element has a value to use in evaluating the policy.</p><p>You can specify only the ARN of an IAM user. You cannot specify the ARN of an assumed role, federated user, or a service principal.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callerArn;

/**
 <p>A list of context keys and corresponding values for the simulation to use. Whenever a context key is evaluated in one of the simulated IAM permissions policies, the corresponding value is supplied.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamContextEntry *> * _Nullable contextEntries;

/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The IAM permissions boundary policy to simulate. The permissions boundary sets the maximum permissions that an IAM entity can have. You can input only one permissions boundary when you pass a policy to this operation. For more information about permissions boundaries, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions Boundaries for IAM Entities</a> in the <i>IAM User Guide</i>. The policy input is specified as a string that contains the complete, valid JSON text of a permissions boundary policy.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable permissionsBoundaryPolicyInputList;

/**
 <p>A list of policy documents to include in the simulation. Each document is specified as a string containing the complete, valid JSON text of an IAM policy. Do not include any resource-based policies in this parameter. Any resource-based policy must be submitted with the <code>ResourcePolicy</code> parameter. The policies cannot be "scope-down" policies, such as you could include in a call to <a href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetFederationToken.html">GetFederationToken</a> or one of the <a href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_AssumeRole.html">AssumeRole</a> API operations. In other words, do not use policies designed to restrict what a user can do while using the temporary credentials.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyInputList;

/**
 <p>A list of ARNs of AWS resources to include in the simulation. If this parameter is not provided, then the value defaults to <code>*</code> (all resources). Each API in the <code>ActionNames</code> parameter is evaluated for each resource in this list. The simulation determines the access result (allowed or denied) of each combination and reports it in the response.</p><p>The simulation does not automatically retrieve policies for the specified resources. If you want to include a resource policy in the simulation, then you must include the policy as a string in the <code>ResourcePolicy</code> parameter.</p><p>If you include a <code>ResourcePolicy</code>, then it must be applicable to all of the resources included in the simulation or you receive an invalid input error.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceArns;

/**
 <p>Specifies the type of simulation to run. Different API operations that support resource-based policies require different combinations of resources. By specifying the type of simulation to run, you enable the policy simulator to enforce the presence of the required resources to ensure reliable simulation results. If your simulation does not match one of the following scenarios, then you can omit this parameter. The following list shows each of the supported scenario values and the resources that you must define to run the simulation.</p><p>Each of the EC2 scenarios requires that you specify instance, image, and security-group resources. If your scenario includes an EBS volume, then you must specify that volume as a resource. If the EC2 scenario includes VPC, then you must supply the network-interface resource. If it includes an IP subnet, then you must specify the subnet resource. For more information on the EC2 scenario options, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html">Supported Platforms</a> in the <i>Amazon EC2 User Guide</i>.</p><ul><li><p><b>EC2-Classic-InstanceStore</b></p><p>instance, image, security-group</p></li><li><p><b>EC2-Classic-EBS</b></p><p>instance, image, security-group, volume</p></li><li><p><b>EC2-VPC-InstanceStore</b></p><p>instance, image, security-group, network-interface</p></li><li><p><b>EC2-VPC-InstanceStore-Subnet</b></p><p>instance, image, security-group, network-interface, subnet</p></li><li><p><b>EC2-VPC-EBS</b></p><p>instance, image, security-group, network-interface, volume</p></li><li><p><b>EC2-VPC-EBS-Subnet</b></p><p>instance, image, security-group, network-interface, subnet, volume</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceHandlingOption;

/**
 <p>An ARN representing the AWS account ID that specifies the owner of any simulated resource that does not identify its owner in the resource ARN. Examples of resource ARNs include an S3 bucket or object. If <code>ResourceOwner</code> is specified, it is also used as the account owner of any <code>ResourcePolicy</code> included in the simulation. If the <code>ResourceOwner</code> parameter is not specified, then the owner of the resources and the resource policy defaults to the account of the identity provided in <code>CallerArn</code>. This parameter is required only if you specify a resource-based policy and account that owns the resource is different from the account that owns the simulated calling user <code>CallerArn</code>.</p><p>The ARN for an account uses the following syntax: <code>arn:aws:iam::<i>AWS-account-ID</i>:root</code>. For example, to represent the account with the 112233445566 ID, use the following ARN: <code>arn:aws:iam::112233445566-ID:root</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceOwner;

/**
 <p>A resource-based policy to include in the simulation provided as a string. Each resource in the simulation is treated as if it had this policy attached. You can include only one resource-based policy in a simulation.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourcePolicy;

@end

/**
 <p>Contains the response to a successful <a>SimulatePrincipalPolicy</a> or <a>SimulateCustomPolicy</a> request.</p>
 */
@interface AWSIamSimulatePolicyResponse : AWSModel


/**
 <p>The results of the simulation.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamEvaluationResult *> * _Nullable evaluationResults;

/**
 <p>A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the <code>Marker</code> request parameter to retrieve more items. Note that IAM might return fewer than the <code>MaxItems</code> number of results even when there are more results available. We recommend that you check <code>IsTruncated</code> after every call to ensure that you receive all your results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable isTruncated;

/**
 <p>When <code>IsTruncated</code> is <code>true</code>, this element is present and contains the value to use for the <code>Marker</code> parameter in a subsequent pagination request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

@end

/**
 
 */
@interface AWSIamSimulatePrincipalPolicyRequest : AWSRequest


/**
 <p>A list of names of API operations to evaluate in the simulation. Each operation is evaluated for each resource. Each operation must include the service identifier, such as <code>iam:CreateUser</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable actionNames;

/**
 <p>The ARN of the IAM user that you want to specify as the simulated caller of the API operations. If you do not specify a <code>CallerArn</code>, it defaults to the ARN of the user that you specify in <code>PolicySourceArn</code>, if you specified a user. If you include both a <code>PolicySourceArn</code> (for example, <code>arn:aws:iam::123456789012:user/David</code>) and a <code>CallerArn</code> (for example, <code>arn:aws:iam::123456789012:user/Bob</code>), the result is that you simulate calling the API operations as Bob, as if Bob had David's policies.</p><p>You can specify only the ARN of an IAM user. You cannot specify the ARN of an assumed role, federated user, or a service principal.</p><p><code>CallerArn</code> is required if you include a <code>ResourcePolicy</code> and the <code>PolicySourceArn</code> is not the ARN for an IAM user. This is required so that the resource-based policy's <code>Principal</code> element has a value to use in evaluating the policy.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable callerArn;

/**
 <p>A list of context keys and corresponding values for the simulation to use. Whenever a context key is evaluated in one of the simulated IAM permissions policies, the corresponding value is supplied.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamContextEntry *> * _Nullable contextEntries;

/**
 <p>Use this parameter only when paginating results and only after you receive a response indicating that the results are truncated. Set it to the value of the <code>Marker</code> element in the response that you received to indicate where the next call should start.</p>
 */
@property (nonatomic, strong) NSString * _Nullable marker;

/**
 <p>Use this only when paginating results to indicate the maximum number of items you want in the response. If additional items exist beyond the maximum you specify, the <code>IsTruncated</code> response element is <code>true</code>.</p><p>If you do not include this parameter, the number of items defaults to 100. Note that IAM might return fewer results, even when there are more results available. In that case, the <code>IsTruncated</code> response element returns <code>true</code>, and <code>Marker</code> contains a value to include in the subsequent call that tells the service where to continue from.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxItems;

/**
 <p>The IAM permissions boundary policy to simulate. The permissions boundary sets the maximum permissions that the entity can have. You can input only one permissions boundary when you pass a policy to this operation. An IAM entity can only have one permissions boundary in effect at a time. For example, if a permissions boundary is attached to an entity and you pass in a different permissions boundary policy using this parameter, then the new permissions boundary policy is used for the simulation. For more information about permissions boundaries, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions Boundaries for IAM Entities</a> in the <i>IAM User Guide</i>. The policy input is specified as a string containing the complete, valid JSON text of a permissions boundary policy.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable permissionsBoundaryPolicyInputList;

/**
 <p>An optional list of additional policy documents to include in the simulation. Each document is specified as a string containing the complete, valid JSON text of an IAM policy.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable policyInputList;

/**
 <p>The Amazon Resource Name (ARN) of a user, group, or role whose policies you want to include in the simulation. If you specify a user, group, or role, the simulation includes all policies that are associated with that entity. If you specify a user, the simulation also includes all policies that are attached to any groups the user belongs to.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policySourceArn;

/**
 <p>A list of ARNs of AWS resources to include in the simulation. If this parameter is not provided, then the value defaults to <code>*</code> (all resources). Each API in the <code>ActionNames</code> parameter is evaluated for each resource in this list. The simulation determines the access result (allowed or denied) of each combination and reports it in the response.</p><p>The simulation does not automatically retrieve policies for the specified resources. If you want to include a resource policy in the simulation, then you must include the policy as a string in the <code>ResourcePolicy</code> parameter.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable resourceArns;

/**
 <p>Specifies the type of simulation to run. Different API operations that support resource-based policies require different combinations of resources. By specifying the type of simulation to run, you enable the policy simulator to enforce the presence of the required resources to ensure reliable simulation results. If your simulation does not match one of the following scenarios, then you can omit this parameter. The following list shows each of the supported scenario values and the resources that you must define to run the simulation.</p><p>Each of the EC2 scenarios requires that you specify instance, image, and security group resources. If your scenario includes an EBS volume, then you must specify that volume as a resource. If the EC2 scenario includes VPC, then you must supply the network interface resource. If it includes an IP subnet, then you must specify the subnet resource. For more information on the EC2 scenario options, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html">Supported Platforms</a> in the <i>Amazon EC2 User Guide</i>.</p><ul><li><p><b>EC2-Classic-InstanceStore</b></p><p>instance, image, security group</p></li><li><p><b>EC2-Classic-EBS</b></p><p>instance, image, security group, volume</p></li><li><p><b>EC2-VPC-InstanceStore</b></p><p>instance, image, security group, network interface</p></li><li><p><b>EC2-VPC-InstanceStore-Subnet</b></p><p>instance, image, security group, network interface, subnet</p></li><li><p><b>EC2-VPC-EBS</b></p><p>instance, image, security group, network interface, volume</p></li><li><p><b>EC2-VPC-EBS-Subnet</b></p><p>instance, image, security group, network interface, subnet, volume</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourceHandlingOption;

/**
 <p>An AWS account ID that specifies the owner of any simulated resource that does not identify its owner in the resource ARN. Examples of resource ARNs include an S3 bucket or object. If <code>ResourceOwner</code> is specified, it is also used as the account owner of any <code>ResourcePolicy</code> included in the simulation. If the <code>ResourceOwner</code> parameter is not specified, then the owner of the resources and the resource policy defaults to the account of the identity provided in <code>CallerArn</code>. This parameter is required only if you specify a resource-based policy and account that owns the resource is different from the account that owns the simulated calling user <code>CallerArn</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceOwner;

/**
 <p>A resource-based policy to include in the simulation provided as a string. Each resource in the simulation is treated as if it had this policy attached. You can include only one resource-based policy in a simulation.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable resourcePolicy;

@end

/**
 <p>Contains a reference to a <code>Statement</code> element in a policy document that determines the result of the simulation.</p><p>This data type is used by the <code>MatchedStatements</code> member of the <code><a>EvaluationResult</a></code> type.</p>
 */
@interface AWSIamStatement : AWSModel


/**
 <p>The row and column of the end of a <code>Statement</code> in an IAM policy.</p>
 */
@property (nonatomic, strong) AWSIamPosition * _Nullable endPosition;

/**
 <p>The identifier of the policy that was provided as an input.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourcePolicyId;

/**
 <p>The type of the policy.</p>
 */
@property (nonatomic, assign) AWSIamPolicySourceType sourcePolicyType;

/**
 <p>The row and column of the beginning of the <code>Statement</code> in an IAM policy.</p>
 */
@property (nonatomic, strong) AWSIamPosition * _Nullable startPosition;

@end

/**
 <p>A structure that represents user-provided metadata that can be associated with a resource such as an IAM user or role. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM Identities</a> in the <i>IAM User Guide</i>.</p>
 Required parameters: [Key, Value]
 */
@interface AWSIamTag : AWSModel


/**
 <p>The key name that can be used to look up or retrieve the associated value. For example, <code>Department</code> or <code>Cost Center</code> are common choices.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The value associated with this tag. For example, tags with a key name of <code>Department</code> could have values such as <code>Human Resources</code>, <code>Accounting</code>, and <code>Support</code>. Tags with a key name of <code>Cost Center</code> might have values that consist of the number associated with the different cost centers in your company. Typically, many resources have tags with the same key name but with different values.</p><note><p>AWS always interprets the tag <code>Value</code> as a single string. If you need to store an array, you can store comma-separated values in the string. However, you must interpret the value in your code.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSIamTagRoleRequest : AWSRequest


/**
 <p>The name of the role that you want to add tags to.</p><p>This parameter accepts (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

/**
 <p>The list of tags that you want to attach to the role. Each tag consists of a key name and an associated value. You can specify this with a JSON string.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSIamTagUserRequest : AWSRequest


/**
 <p>The list of tags that you want to attach to the user. Each tag consists of a key name and an associated value.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamTag *> * _Nullable tags;

/**
 <p>The name of the user that you want to add tags to.</p><p>This parameter accepts (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains details about the most recent attempt to access an action within the service.</p><p>This data type is used as a response element in the <a>GetServiceLastAccessedDetails</a> operation.</p>
 */
@interface AWSIamTrackedActionLastAccessed : AWSModel


/**
 <p>The name of the tracked action to which access was attempted. Tracked actions are actions that report activity to IAM.</p>
 */
@property (nonatomic, strong) NSString * _Nullable actionName;

/**
 <p>The Amazon Resource Name (ARN). ARNs are unique identifiers for AWS resources.</p><p>For more information about ARNs, go to <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable lastAccessedEntity;

/**
 <p>The Region from which the authenticated entity (user or role) last attempted to access the tracked action. AWS does not report unauthenticated requests.</p><p>This field is null if no IAM entities attempted to access the service within the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting period</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lastAccessedRegion;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when an authenticated entity most recently attempted to access the tracked service. AWS does not report unauthenticated requests.</p><p>This field is null if no IAM entities attempted to access the service within the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting period</a>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastAccessedTime;

@end

/**
 
 */
@interface AWSIamUntagRoleRequest : AWSRequest


/**
 <p>The name of the IAM role from which you want to remove tags.</p><p>This parameter accepts (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

/**
 <p>A list of key names as a simple array of strings. The tags with matching keys are removed from the specified role.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSIamUntagUserRequest : AWSRequest


/**
 <p>A list of key names as a simple array of strings. The tags with matching keys are removed from the specified user.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

/**
 <p>The name of the IAM user from which you want to remove tags.</p><p>This parameter accepts (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamUpdateAccessKeyRequest : AWSRequest


/**
 <p>The access key ID of the secret access key you want to update.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that can consist of any upper or lowercased letter or digit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessKeyId;

/**
 <p> The status you want to assign to the secret access key. <code>Active</code> means that the key can be used for API calls to AWS, while <code>Inactive</code> means that the key cannot be used.</p>
 */
@property (nonatomic, assign) AWSIamstatusType status;

/**
 <p>The name of the user whose key you want to update.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamUpdateAccountPasswordPolicyRequest : AWSRequest


/**
 <p> Allows all IAM users in your account to use the AWS Management Console to change their own passwords. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/HowToPwdIAMUser.html">Letting IAM Users Change Their Own Passwords</a> in the <i>IAM User Guide</i>.</p><p>If you do not specify a value for this parameter, then the operation uses the default value of <code>false</code>. The result is that IAM users in the account do not automatically have permissions to change their own password.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowUsersToChangePassword;

/**
 <p>Prevents IAM users from setting a new password after their password has expired. The IAM user cannot be accessed until an administrator resets the password.</p><p>If you do not specify a value for this parameter, then the operation uses the default value of <code>false</code>. The result is that IAM users can change their passwords after they expire and continue to sign in as the user.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable hardExpiry;

/**
 <p>The number of days that an IAM user password is valid.</p><p>If you do not specify a value for this parameter, then the operation uses the default value of <code>0</code>. The result is that IAM user passwords never expire.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxPasswordAge;

/**
 <p>The minimum number of characters allowed in an IAM user password.</p><p>If you do not specify a value for this parameter, then the operation uses the default value of <code>6</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimumPasswordLength;

/**
 <p>Specifies the number of previous passwords that IAM users are prevented from reusing.</p><p>If you do not specify a value for this parameter, then the operation uses the default value of <code>0</code>. The result is that IAM users are not prevented from reusing previous passwords.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable passwordReusePrevention;

/**
 <p>Specifies whether IAM user passwords must contain at least one lowercase character from the ISO basic Latin alphabet (a to z).</p><p>If you do not specify a value for this parameter, then the operation uses the default value of <code>false</code>. The result is that passwords do not require at least one lowercase character.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireLowercaseCharacters;

/**
 <p>Specifies whether IAM user passwords must contain at least one numeric character (0 to 9).</p><p>If you do not specify a value for this parameter, then the operation uses the default value of <code>false</code>. The result is that passwords do not require at least one numeric character.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireNumbers;

/**
 <p>Specifies whether IAM user passwords must contain at least one of the following non-alphanumeric characters:</p><p>! @ # $ % ^ &amp; * ( ) _ + - = [ ] { } | '</p><p>If you do not specify a value for this parameter, then the operation uses the default value of <code>false</code>. The result is that passwords do not require at least one symbol character.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireSymbols;

/**
 <p>Specifies whether IAM user passwords must contain at least one uppercase character from the ISO basic Latin alphabet (A to Z).</p><p>If you do not specify a value for this parameter, then the operation uses the default value of <code>false</code>. The result is that passwords do not require at least one uppercase character.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireUppercaseCharacters;

@end

/**
 
 */
@interface AWSIamUpdateAssumeRolePolicyRequest : AWSRequest


/**
 <p>The policy that grants an entity permission to assume the role.</p><p>You must provide policies in JSON format in IAM. However, for AWS CloudFormation templates formatted in YAML, you can provide the policy in JSON or YAML format. AWS CloudFormation always converts a YAML policy to JSON format before submitting it to IAM.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable policyDocument;

/**
 <p>The name of the role to update with the new policy.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamUpdateGroupRequest : AWSRequest


/**
 <p>Name of the IAM group to update. If you're changing the name of the group, this is the original name.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>New name for the IAM group. Only include this if changing the group's name.</p><p>IAM user, group, role, and policy names must be unique within the account. Names are not distinguished by case. For example, you cannot create resources named both "MyResource" and "myresource".</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestGroupName;

/**
 <p>New path for the IAM group. Only include this if changing the group's path.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestPath;

@end

/**
 
 */
@interface AWSIamUpdateLoginProfileRequest : AWSRequest


/**
 <p>The new password for the specified IAM user.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul><p>However, the format can be further restricted by the account administrator by setting a password policy on the AWS account. For more information, see <a>UpdateAccountPasswordPolicy</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>Allows this new password to be used only once by requiring the specified IAM user to set a new password on next sign-in.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable passwordResetRequired;

/**
 <p>The name of the user whose password you want to update.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamUpdateOpenIDConnectProviderThumbprintRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the IAM OIDC provider resource object for which you want to update the thumbprint. You can get a list of OIDC provider ARNs by using the <a>ListOpenIDConnectProviders</a> operation.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable openIDConnectProviderArn;

/**
 <p>A list of certificate thumbprints that are associated with the specified IAM OpenID Connect provider. For more information, see <a>CreateOpenIDConnectProvider</a>. </p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable thumbprintList;

@end

/**
 
 */
@interface AWSIamUpdateRoleDescriptionRequest : AWSRequest


/**
 <p>The new description that you want to apply to the specified role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the role that you want to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamUpdateRoleDescriptionResponse : AWSModel


/**
 <p>A structure that contains details about the modified role.</p>
 */
@property (nonatomic, strong) AWSIamRole * _Nullable role;

@end

/**
 
 */
@interface AWSIamUpdateRoleRequest : AWSRequest


/**
 <p>The new description that you want to apply to the specified role.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours.</p><p>Anyone who assumes the role from the AWS CLI or API can use the <code>DurationSeconds</code> API parameter or the <code>duration-seconds</code> CLI parameter to request a longer session. The <code>MaxSessionDuration</code> setting determines the maximum duration that can be requested using the <code>DurationSeconds</code> parameter. If users don't specify a value for the <code>DurationSeconds</code> parameter, their security credentials are valid for one hour by default. This applies when you use the <code>AssumeRole*</code> API operations or the <code>assume-role*</code> CLI operations but does not apply when you use those operations to create a console URL. For more information, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html">Using IAM Roles</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxSessionDuration;

/**
 <p>The name of the role that you want to modify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSIamUpdateRoleResponse : AWSModel


@end

/**
 
 */
@interface AWSIamUpdateSAMLProviderRequest : AWSRequest


/**
 <p>An XML document generated by an identity provider (IdP) that supports SAML 2.0. The document includes the issuer's name, expiration information, and keys that can be used to validate the SAML authentication response (assertions) that are received from the IdP. You must generate the metadata document using the identity management software that is used as your organization's IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SAMLMetadataDocument;

/**
 <p>The Amazon Resource Name (ARN) of the SAML provider to update.</p><p>For more information about ARNs, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SAMLProviderArn;

@end

/**
 <p>Contains the response to a successful <a>UpdateSAMLProvider</a> request. </p>
 */
@interface AWSIamUpdateSAMLProviderResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the SAML provider that was updated.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SAMLProviderArn;

@end

/**
 
 */
@interface AWSIamUpdateSSHPublicKeyRequest : AWSRequest


/**
 <p>The unique identifier for the SSH public key.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that can consist of any upper or lowercased letter or digit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SSHPublicKeyId;

/**
 <p>The status to assign to the SSH public key. <code>Active</code> means that the key can be used for authentication with an AWS CodeCommit repository. <code>Inactive</code> means that the key cannot be used.</p>
 */
@property (nonatomic, assign) AWSIamstatusType status;

/**
 <p>The name of the IAM user associated with the SSH public key.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamUpdateServerCertificateRequest : AWSRequest


/**
 <p>The new path for the server certificate. Include this only if you are updating the server certificate's path.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestPath;

/**
 <p>The new name for the server certificate. Include this only if you are updating the server certificate's name. The name of the certificate cannot contain any spaces.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestServerCertificateName;

/**
 <p>The name of the server certificate that you want to update.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverCertificateName;

@end

/**
 
 */
@interface AWSIamUpdateServiceSpecificCredentialRequest : AWSRequest


/**
 <p>The unique identifier of the service-specific credential.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that can consist of any upper or lowercased letter or digit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serviceSpecificCredentialId;

/**
 <p>The status to be assigned to the service-specific credential.</p>
 */
@property (nonatomic, assign) AWSIamstatusType status;

/**
 <p>The name of the IAM user associated with the service-specific credential. If you do not specify this value, then the operation assumes the user whose credentials are used to call the operation.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamUpdateSigningCertificateRequest : AWSRequest


/**
 <p>The ID of the signing certificate you want to update.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters that can consist of any upper or lowercased letter or digit.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateId;

/**
 <p> The status you want to assign to the certificate. <code>Active</code> means that the certificate can be used for API calls to AWS <code>Inactive</code> means that the certificate cannot be used.</p>
 */
@property (nonatomic, assign) AWSIamstatusType status;

/**
 <p>The name of the IAM user the signing certificate belongs to.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamUpdateUserRequest : AWSRequest


/**
 <p>New path for the IAM user. Include this parameter only if you're changing the user's path.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestPath;

/**
 <p>New name for the user. Include this parameter only if you're changing the user's name.</p><p>IAM user, group, role, and policy names must be unique within the account. Names are not distinguished by case. For example, you cannot create resources named both "MyResource" and "myresource".</p>
 */
@property (nonatomic, strong) NSString * _Nullable latestUserName;

/**
 <p>Name of the user to update. If you're changing the name of the user, this is the original user name.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 
 */
@interface AWSIamUploadSSHPublicKeyRequest : AWSRequest


/**
 <p>The SSH public key. The public key must be encoded in ssh-rsa format or PEM format. The minimum bit-length of the public key is 2048 bits. For example, you can generate a 2048-bit key, and the resulting PEM file is 1679 bytes long.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable SSHPublicKeyBody;

/**
 <p>The name of the IAM user to associate the SSH public key with.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>UploadSSHPublicKey</a> request.</p>
 */
@interface AWSIamUploadSSHPublicKeyResponse : AWSModel


/**
 <p>Contains information about the SSH public key.</p>
 */
@property (nonatomic, strong) AWSIamSSHPublicKey * _Nullable SSHPublicKey;

@end

/**
 
 */
@interface AWSIamUploadServerCertificateRequest : AWSRequest


/**
 <p>The contents of the public key certificate in PEM-encoded format.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable certificateBody;

/**
 <p>The contents of the certificate chain. This is typically a concatenation of the PEM-encoded public key certificates of the chain.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable certificateChain;

/**
 <p>The path for the server certificate. For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p><p>This parameter is optional. If it is not included, it defaults to a slash (/). This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of either a forward slash (/) by itself or a string that must begin and end with forward slashes. In addition, it can contain any ASCII character from the ! (<code>\u0021</code>) through the DEL character (<code>\u007F</code>), including most punctuation characters, digits, and upper and lowercased letters.</p><note><p> If you are uploading a server certificate specifically for use with Amazon CloudFront distributions, you must specify a path using the <code>path</code> parameter. The path must begin with <code>/cloudfront</code> and must include a trailing slash (for example, <code>/cloudfront/test/</code>).</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The contents of the private key in PEM-encoded format.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable privateKey;

/**
 <p>The name for the server certificate. Do not include the path in this value. The name of the certificate cannot contain any spaces.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverCertificateName;

@end

/**
 <p>Contains the response to a successful <a>UploadServerCertificate</a> request. </p>
 */
@interface AWSIamUploadServerCertificateResponse : AWSModel


/**
 <p>The meta information of the uploaded server certificate without its certificate body, certificate chain, and private key.</p>
 */
@property (nonatomic, strong) AWSIamServerCertificateMetadata * _Nullable serverCertificateMetadata;

@end

/**
 
 */
@interface AWSIamUploadSigningCertificateRequest : AWSRequest


/**
 <p>The contents of the signing certificate.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to validate this parameter is a string of characters consisting of the following:</p><ul><li><p>Any printable ASCII character ranging from the space character (<code>\u0020</code>) through the end of the ASCII character range</p></li><li><p>The printable characters in the Basic Latin and Latin-1 Supplement character set (through <code>\u00FF</code>)</p></li><li><p>The special characters tab (<code>\u0009</code>), line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable certificateBody;

/**
 <p>The name of the user the signing certificate is for.</p><p>This parameter allows (through its <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: _+=,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains the response to a successful <a>UploadSigningCertificate</a> request. </p>
 Required parameters: [Certificate]
 */
@interface AWSIamUploadSigningCertificateResponse : AWSModel


/**
 <p>Information about the certificate.</p>
 */
@property (nonatomic, strong) AWSIamSigningCertificate * _Nullable certificate;

@end

/**
 <p>Contains information about an IAM user entity.</p><p>This data type is used as a response element in the following operations:</p><ul><li><p><a>CreateUser</a></p></li><li><p><a>GetUser</a></p></li><li><p><a>ListUsers</a></p></li></ul>
 Required parameters: [Path, UserName, UserId, Arn, CreateDate]
 */
@interface AWSIamUser : AWSModel


/**
 <p>The Amazon Resource Name (ARN) that identifies the user. For more information about ARNs and how to use ARNs in policies, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the user was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the user's password was last used to sign in to an AWS website. For a list of AWS websites that capture a user's last sign-in time, see the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html">Credential Reports</a> topic in the <i>IAM User Guide</i>. If a password is used more than once in a five-minute span, only the first use is returned in this field. If the field is null (no value), then it indicates that they never signed in with a password. This can be because:</p><ul><li><p>The user never had a password.</p></li><li><p>A password exists but has not been used since IAM started tracking this information on October 20, 2014.</p></li></ul><p>A null value does not mean that the user <i>never</i> had a password. Also, if the user does not currently have a password but had one in the past, then this field contains the date and time the most recent password was used.</p><p>This value is returned only in the <a>GetUser</a> and <a>ListUsers</a> operations. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable passwordLastUsed;

/**
 <p>The path to the user. For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The ARN of the policy used to set the permissions boundary for the user.</p><p>For more information about permissions boundaries, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSIamAttachedPermissionsBoundary * _Nullable permissionsBoundary;

/**
 <p>A list of tags that are associated with the specified user. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM Identities</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamTag *> * _Nullable tags;

/**
 <p>The stable and unique string identifying the user. For more information about IDs, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

/**
 <p>The friendly name identifying the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

@end

/**
 <p>Contains information about an IAM user, including all the user's policies and all the IAM groups the user is in.</p><p>This data type is used as a response element in the <a>GetAccountAuthorizationDetails</a> operation.</p>
 */
@interface AWSIamUserDetail : AWSModel


/**
 <p>The Amazon Resource Name (ARN). ARNs are unique identifiers for AWS resources.</p><p>For more information about ARNs, go to <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General Reference</i>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>A list of the managed policies attached to the user.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamAttachedPolicy *> * _Nullable attachedManagedPolicies;

/**
 <p>The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>, when the user was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createDate;

/**
 <p>A list of IAM groups that the user is in.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable groupList;

/**
 <p>The path to the user. For more information about paths, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable path;

/**
 <p>The ARN of the policy used to set the permissions boundary for the user.</p><p>For more information about permissions boundaries, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSIamAttachedPermissionsBoundary * _Nullable permissionsBoundary;

/**
 <p>A list of tags that are associated with the specified user. For more information about tagging, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging IAM Identities</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamTag *> * _Nullable tags;

/**
 <p>The stable and unique string identifying the user. For more information about IDs, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM Identifiers</a> in the <i>IAM User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

/**
 <p>The friendly name identifying the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userName;

/**
 <p>A list of the inline policies embedded in the user.</p>
 */
@property (nonatomic, strong) NSArray<AWSIamPolicyDetail *> * _Nullable userPolicyList;

@end

/**
 <p>Contains information about a virtual MFA device.</p>
 Required parameters: [SerialNumber]
 */
@interface AWSIamVirtualMFADevice : AWSModel


/**
 <p> The base32 seed defined as specified in <a href="https://tools.ietf.org/html/rfc3548.txt">RFC3548</a>. The <code>Base32StringSeed</code> is base64-encoded. </p>
 */
@property (nonatomic, strong) NSData * _Nullable base32StringSeed;

/**
 <p>The date and time on which the virtual MFA device was enabled.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable enableDate;

/**
 <p> A QR code PNG image that encodes <code>otpauth://totp/$virtualMFADeviceName@$AccountName?secret=$Base32String</code> where <code>$virtualMFADeviceName</code> is one of the create call arguments. <code>AccountName</code> is the user name if set (otherwise, the account ID otherwise), and <code>Base32String</code> is the seed in base32 format. The <code>Base32String</code> value is base64-encoded. </p>
 */
@property (nonatomic, strong) NSData * _Nullable QRCodePNG;

/**
 <p>The serial number associated with <code>VirtualMFADevice</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serialNumber;

/**
 <p>The IAM user associated with this virtual MFA device.</p>
 */
@property (nonatomic, strong) AWSIamUser * _Nullable user;

@end

NS_ASSUME_NONNULL_END
