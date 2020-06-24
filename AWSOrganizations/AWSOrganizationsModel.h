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

FOUNDATION_EXPORT NSString *const AWSOrganizationsErrorDomain;

typedef NS_ENUM(NSInteger, AWSOrganizationsErrorType) {
    AWSOrganizationsErrorUnknown,
    AWSOrganizationsErrorAWSOrganizationsNotInUse,
    AWSOrganizationsErrorAccessDenied,
    AWSOrganizationsErrorAccessDeniedForDependency,
    AWSOrganizationsErrorAccountAlreadyRegistered,
    AWSOrganizationsErrorAccountNotFound,
    AWSOrganizationsErrorAccountNotRegistered,
    AWSOrganizationsErrorAccountOwnerNotVerified,
    AWSOrganizationsErrorAlreadyInOrganization,
    AWSOrganizationsErrorChildNotFound,
    AWSOrganizationsErrorConcurrentModification,
    AWSOrganizationsErrorConstraintViolation,
    AWSOrganizationsErrorCreateAccountStatusNotFound,
    AWSOrganizationsErrorDestinationParentNotFound,
    AWSOrganizationsErrorDuplicateAccount,
    AWSOrganizationsErrorDuplicateHandshake,
    AWSOrganizationsErrorDuplicateOrganizationalUnit,
    AWSOrganizationsErrorDuplicatePolicyAttachment,
    AWSOrganizationsErrorDuplicatePolicy,
    AWSOrganizationsErrorEffectivePolicyNotFound,
    AWSOrganizationsErrorFinalizingOrganization,
    AWSOrganizationsErrorHandshakeAlreadyInState,
    AWSOrganizationsErrorHandshakeConstraintViolation,
    AWSOrganizationsErrorHandshakeNotFound,
    AWSOrganizationsErrorInvalidHandshakeTransition,
    AWSOrganizationsErrorInvalidInput,
    AWSOrganizationsErrorMalformedPolicyDocument,
    AWSOrganizationsErrorMasterCannotLeaveOrganization,
    AWSOrganizationsErrorOrganizationNotEmpty,
    AWSOrganizationsErrorOrganizationalUnitNotEmpty,
    AWSOrganizationsErrorOrganizationalUnitNotFound,
    AWSOrganizationsErrorParentNotFound,
    AWSOrganizationsErrorPolicyChangesInProgress,
    AWSOrganizationsErrorPolicyInUse,
    AWSOrganizationsErrorPolicyNotAttached,
    AWSOrganizationsErrorPolicyNotFound,
    AWSOrganizationsErrorPolicyTypeAlreadyEnabled,
    AWSOrganizationsErrorPolicyTypeNotAvailableForOrganization,
    AWSOrganizationsErrorPolicyTypeNotEnabled,
    AWSOrganizationsErrorRootNotFound,
    AWSOrganizationsErrorService,
    AWSOrganizationsErrorSourceParentNotFound,
    AWSOrganizationsErrorTargetNotFound,
    AWSOrganizationsErrorTooManyRequests,
    AWSOrganizationsErrorUnsupportedAPIEndpoint,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsAccessDeniedForDependencyExceptionReason) {
    AWSOrganizationsAccessDeniedForDependencyExceptionReasonUnknown,
    AWSOrganizationsAccessDeniedForDependencyExceptionReasonAccessDeniedDuringCreateServiceLinkedRole,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsAccountJoinedMethod) {
    AWSOrganizationsAccountJoinedMethodUnknown,
    AWSOrganizationsAccountJoinedMethodInvited,
    AWSOrganizationsAccountJoinedMethodCreated,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsAccountStatus) {
    AWSOrganizationsAccountStatusUnknown,
    AWSOrganizationsAccountStatusActive,
    AWSOrganizationsAccountStatusSuspended,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsActionType) {
    AWSOrganizationsActionTypeUnknown,
    AWSOrganizationsActionTypeInvite,
    AWSOrganizationsActionTypeEnableAllFeatures,
    AWSOrganizationsActionTypeApproveAllFeatures,
    AWSOrganizationsActionTypeAddOrganizationsServiceLinkedRole,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsChildType) {
    AWSOrganizationsChildTypeUnknown,
    AWSOrganizationsChildTypeAccount,
    AWSOrganizationsChildTypeOrganizationalUnit,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsConstraintViolationExceptionReason) {
    AWSOrganizationsConstraintViolationExceptionReasonUnknown,
    AWSOrganizationsConstraintViolationExceptionReasonAccountNumberLimitExceeded,
    AWSOrganizationsConstraintViolationExceptionReasonHandshakeRateLimitExceeded,
    AWSOrganizationsConstraintViolationExceptionReasonOuNumberLimitExceeded,
    AWSOrganizationsConstraintViolationExceptionReasonOuDepthLimitExceeded,
    AWSOrganizationsConstraintViolationExceptionReasonPolicyNumberLimitExceeded,
    AWSOrganizationsConstraintViolationExceptionReasonPolicyContentLimitExceeded,
    AWSOrganizationsConstraintViolationExceptionReasonMaxPolicyTypeAttachmentLimitExceeded,
    AWSOrganizationsConstraintViolationExceptionReasonMinPolicyTypeAttachmentLimitExceeded,
    AWSOrganizationsConstraintViolationExceptionReasonAccountCannotLeaveOrganization,
    AWSOrganizationsConstraintViolationExceptionReasonAccountCannotLeaveWithoutEula,
    AWSOrganizationsConstraintViolationExceptionReasonAccountCannotLeaveWithoutPhoneVerification,
    AWSOrganizationsConstraintViolationExceptionReasonMasterAccountPaymentInstrumentRequired,
    AWSOrganizationsConstraintViolationExceptionReasonMemberAccountPaymentInstrumentRequired,
    AWSOrganizationsConstraintViolationExceptionReasonAccountCreationRateLimitExceeded,
    AWSOrganizationsConstraintViolationExceptionReasonMasterAccountAddressDoesNotMatchMarketplace,
    AWSOrganizationsConstraintViolationExceptionReasonMasterAccountMissingContactInfo,
    AWSOrganizationsConstraintViolationExceptionReasonMasterAccountNotGovcloudEnabled,
    AWSOrganizationsConstraintViolationExceptionReasonOrganizationNotInAllFeaturesMode,
    AWSOrganizationsConstraintViolationExceptionReasonCreateOrganizationInBillingModeUnsupportedRegion,
    AWSOrganizationsConstraintViolationExceptionReasonEmailVerificationCodeExpired,
    AWSOrganizationsConstraintViolationExceptionReasonWaitPeriodActive,
    AWSOrganizationsConstraintViolationExceptionReasonMaxTagLimitExceeded,
    AWSOrganizationsConstraintViolationExceptionReasonTagPolicyViolation,
    AWSOrganizationsConstraintViolationExceptionReasonMaxDelegatedAdministratorsForServiceLimitExceeded,
    AWSOrganizationsConstraintViolationExceptionReasonCannotRegisterMasterAsDelegatedAdministrator,
    AWSOrganizationsConstraintViolationExceptionReasonCannotRemoveDelegatedAdministratorFromOrg,
    AWSOrganizationsConstraintViolationExceptionReasonDelegatedAdministratorExistsForThisService,
    AWSOrganizationsConstraintViolationExceptionReasonMasterAccountMissingBusinessLicense,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsCreateAccountFailureReason) {
    AWSOrganizationsCreateAccountFailureReasonUnknown,
    AWSOrganizationsCreateAccountFailureReasonAccountLimitExceeded,
    AWSOrganizationsCreateAccountFailureReasonEmailAlreadyExists,
    AWSOrganizationsCreateAccountFailureReasonInvalidAddress,
    AWSOrganizationsCreateAccountFailureReasonInvalidEmail,
    AWSOrganizationsCreateAccountFailureReasonConcurrentAccountModification,
    AWSOrganizationsCreateAccountFailureReasonInternalFailure,
    AWSOrganizationsCreateAccountFailureReasonGovcloudAccountAlreadyExists,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsCreateAccountState) {
    AWSOrganizationsCreateAccountStateUnknown,
    AWSOrganizationsCreateAccountStateInProgress,
    AWSOrganizationsCreateAccountStateSucceeded,
    AWSOrganizationsCreateAccountStateFailed,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsEffectivePolicyType) {
    AWSOrganizationsEffectivePolicyTypeUnknown,
    AWSOrganizationsEffectivePolicyTypeTagPolicy,
    AWSOrganizationsEffectivePolicyTypeBackupPolicy,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsHandshakeConstraintViolationExceptionReason) {
    AWSOrganizationsHandshakeConstraintViolationExceptionReasonUnknown,
    AWSOrganizationsHandshakeConstraintViolationExceptionReasonAccountNumberLimitExceeded,
    AWSOrganizationsHandshakeConstraintViolationExceptionReasonHandshakeRateLimitExceeded,
    AWSOrganizationsHandshakeConstraintViolationExceptionReasonAlreadyInAnOrganization,
    AWSOrganizationsHandshakeConstraintViolationExceptionReasonOrganizationAlreadyHasAllFeatures,
    AWSOrganizationsHandshakeConstraintViolationExceptionReasonInviteDisabledDuringEnableAllFeatures,
    AWSOrganizationsHandshakeConstraintViolationExceptionReasonPaymentInstrumentRequired,
    AWSOrganizationsHandshakeConstraintViolationExceptionReasonOrganizationFromDifferentSellerOfRecord,
    AWSOrganizationsHandshakeConstraintViolationExceptionReasonOrganizationMembershipChangeRateLimitExceeded,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsHandshakePartyType) {
    AWSOrganizationsHandshakePartyTypeUnknown,
    AWSOrganizationsHandshakePartyTypeAccount,
    AWSOrganizationsHandshakePartyTypeOrganization,
    AWSOrganizationsHandshakePartyTypeEmail,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsHandshakeResourceType) {
    AWSOrganizationsHandshakeResourceTypeUnknown,
    AWSOrganizationsHandshakeResourceTypeAccount,
    AWSOrganizationsHandshakeResourceTypeOrganization,
    AWSOrganizationsHandshakeResourceTypeOrganizationFeatureSet,
    AWSOrganizationsHandshakeResourceTypeEmail,
    AWSOrganizationsHandshakeResourceTypeMasterEmail,
    AWSOrganizationsHandshakeResourceTypeMasterName,
    AWSOrganizationsHandshakeResourceTypeNotes,
    AWSOrganizationsHandshakeResourceTypeParentHandshake,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsHandshakeState) {
    AWSOrganizationsHandshakeStateUnknown,
    AWSOrganizationsHandshakeStateRequested,
    AWSOrganizationsHandshakeStateOpen,
    AWSOrganizationsHandshakeStateCanceled,
    AWSOrganizationsHandshakeStateAccepted,
    AWSOrganizationsHandshakeStateDeclined,
    AWSOrganizationsHandshakeStateExpired,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsIAMUserAccessToBilling) {
    AWSOrganizationsIAMUserAccessToBillingUnknown,
    AWSOrganizationsIAMUserAccessToBillingAllow,
    AWSOrganizationsIAMUserAccessToBillingDeny,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsInvalidInputExceptionReason) {
    AWSOrganizationsInvalidInputExceptionReasonUnknown,
    AWSOrganizationsInvalidInputExceptionReasonInvalidPartyTypeTarget,
    AWSOrganizationsInvalidInputExceptionReasonInvalidSyntaxOrganizationArn,
    AWSOrganizationsInvalidInputExceptionReasonInvalidSyntaxPolicyId,
    AWSOrganizationsInvalidInputExceptionReasonInvalidEnum,
    AWSOrganizationsInvalidInputExceptionReasonInvalidEnumPolicyType,
    AWSOrganizationsInvalidInputExceptionReasonInvalidListMember,
    AWSOrganizationsInvalidInputExceptionReasonMaxLengthExceeded,
    AWSOrganizationsInvalidInputExceptionReasonMaxValueExceeded,
    AWSOrganizationsInvalidInputExceptionReasonMinLengthExceeded,
    AWSOrganizationsInvalidInputExceptionReasonMinValueExceeded,
    AWSOrganizationsInvalidInputExceptionReasonImmutablePolicy,
    AWSOrganizationsInvalidInputExceptionReasonInvalidPattern,
    AWSOrganizationsInvalidInputExceptionReasonInvalidPatternTargetId,
    AWSOrganizationsInvalidInputExceptionReasonInputRequired,
    AWSOrganizationsInvalidInputExceptionReasonInvalidNextToken,
    AWSOrganizationsInvalidInputExceptionReasonMaxLimitExceededFilter,
    AWSOrganizationsInvalidInputExceptionReasonMovingAccountBetweenDifferentRoots,
    AWSOrganizationsInvalidInputExceptionReasonInvalidFullNameTarget,
    AWSOrganizationsInvalidInputExceptionReasonUnrecognizedServicePrincipal,
    AWSOrganizationsInvalidInputExceptionReasonInvalidRoleName,
    AWSOrganizationsInvalidInputExceptionReasonInvalidSystemTagsParameter,
    AWSOrganizationsInvalidInputExceptionReasonTargetNotSupported,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsOrganizationFeatureSet) {
    AWSOrganizationsOrganizationFeatureSetUnknown,
    AWSOrganizationsOrganizationFeatureSetAll,
    AWSOrganizationsOrganizationFeatureSetConsolidatedBilling,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsParentType) {
    AWSOrganizationsParentTypeUnknown,
    AWSOrganizationsParentTypeRoot,
    AWSOrganizationsParentTypeOrganizationalUnit,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsPolicyType) {
    AWSOrganizationsPolicyTypeUnknown,
    AWSOrganizationsPolicyTypeServiceControlPolicy,
    AWSOrganizationsPolicyTypeTagPolicy,
    AWSOrganizationsPolicyTypeBackupPolicy,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsPolicyTypeStatus) {
    AWSOrganizationsPolicyTypeStatusUnknown,
    AWSOrganizationsPolicyTypeStatusEnabled,
    AWSOrganizationsPolicyTypeStatusPendingEnable,
    AWSOrganizationsPolicyTypeStatusPendingDisable,
};

typedef NS_ENUM(NSInteger, AWSOrganizationsTargetType) {
    AWSOrganizationsTargetTypeUnknown,
    AWSOrganizationsTargetTypeAccount,
    AWSOrganizationsTargetTypeOrganizationalUnit,
    AWSOrganizationsTargetTypeRoot,
};

@class AWSOrganizationsAcceptHandshakeRequest;
@class AWSOrganizationsAcceptHandshakeResponse;
@class AWSOrganizationsAccount;
@class AWSOrganizationsAttachPolicyRequest;
@class AWSOrganizationsCancelHandshakeRequest;
@class AWSOrganizationsCancelHandshakeResponse;
@class AWSOrganizationsChild;
@class AWSOrganizationsCreateAccountRequest;
@class AWSOrganizationsCreateAccountResponse;
@class AWSOrganizationsCreateAccountStatus;
@class AWSOrganizationsCreateGovCloudAccountRequest;
@class AWSOrganizationsCreateGovCloudAccountResponse;
@class AWSOrganizationsCreateOrganizationRequest;
@class AWSOrganizationsCreateOrganizationResponse;
@class AWSOrganizationsCreateOrganizationalUnitRequest;
@class AWSOrganizationsCreateOrganizationalUnitResponse;
@class AWSOrganizationsCreatePolicyRequest;
@class AWSOrganizationsCreatePolicyResponse;
@class AWSOrganizationsDeclineHandshakeRequest;
@class AWSOrganizationsDeclineHandshakeResponse;
@class AWSOrganizationsDelegatedAdministrator;
@class AWSOrganizationsDelegatedService;
@class AWSOrganizationsDeleteOrganizationalUnitRequest;
@class AWSOrganizationsDeletePolicyRequest;
@class AWSOrganizationsDeregisterDelegatedAdministratorRequest;
@class AWSOrganizationsDescribeAccountRequest;
@class AWSOrganizationsDescribeAccountResponse;
@class AWSOrganizationsDescribeCreateAccountStatusRequest;
@class AWSOrganizationsDescribeCreateAccountStatusResponse;
@class AWSOrganizationsDescribeEffectivePolicyRequest;
@class AWSOrganizationsDescribeEffectivePolicyResponse;
@class AWSOrganizationsDescribeHandshakeRequest;
@class AWSOrganizationsDescribeHandshakeResponse;
@class AWSOrganizationsDescribeOrganizationResponse;
@class AWSOrganizationsDescribeOrganizationalUnitRequest;
@class AWSOrganizationsDescribeOrganizationalUnitResponse;
@class AWSOrganizationsDescribePolicyRequest;
@class AWSOrganizationsDescribePolicyResponse;
@class AWSOrganizationsDetachPolicyRequest;
@class AWSOrganizationsDisableAWSServiceAccessRequest;
@class AWSOrganizationsDisablePolicyTypeRequest;
@class AWSOrganizationsDisablePolicyTypeResponse;
@class AWSOrganizationsEffectivePolicy;
@class AWSOrganizationsEnableAWSServiceAccessRequest;
@class AWSOrganizationsEnableAllFeaturesRequest;
@class AWSOrganizationsEnableAllFeaturesResponse;
@class AWSOrganizationsEnablePolicyTypeRequest;
@class AWSOrganizationsEnablePolicyTypeResponse;
@class AWSOrganizationsEnabledServicePrincipal;
@class AWSOrganizationsHandshake;
@class AWSOrganizationsHandshakeFilter;
@class AWSOrganizationsHandshakeParty;
@class AWSOrganizationsHandshakeResource;
@class AWSOrganizationsInviteAccountToOrganizationRequest;
@class AWSOrganizationsInviteAccountToOrganizationResponse;
@class AWSOrganizationsListAWSServiceAccessForOrganizationRequest;
@class AWSOrganizationsListAWSServiceAccessForOrganizationResponse;
@class AWSOrganizationsListAccountsForParentRequest;
@class AWSOrganizationsListAccountsForParentResponse;
@class AWSOrganizationsListAccountsRequest;
@class AWSOrganizationsListAccountsResponse;
@class AWSOrganizationsListChildrenRequest;
@class AWSOrganizationsListChildrenResponse;
@class AWSOrganizationsListCreateAccountStatusRequest;
@class AWSOrganizationsListCreateAccountStatusResponse;
@class AWSOrganizationsListDelegatedAdministratorsRequest;
@class AWSOrganizationsListDelegatedAdministratorsResponse;
@class AWSOrganizationsListDelegatedServicesForAccountRequest;
@class AWSOrganizationsListDelegatedServicesForAccountResponse;
@class AWSOrganizationsListHandshakesForAccountRequest;
@class AWSOrganizationsListHandshakesForAccountResponse;
@class AWSOrganizationsListHandshakesForOrganizationRequest;
@class AWSOrganizationsListHandshakesForOrganizationResponse;
@class AWSOrganizationsListOrganizationalUnitsForParentRequest;
@class AWSOrganizationsListOrganizationalUnitsForParentResponse;
@class AWSOrganizationsListParentsRequest;
@class AWSOrganizationsListParentsResponse;
@class AWSOrganizationsListPoliciesForTargetRequest;
@class AWSOrganizationsListPoliciesForTargetResponse;
@class AWSOrganizationsListPoliciesRequest;
@class AWSOrganizationsListPoliciesResponse;
@class AWSOrganizationsListRootsRequest;
@class AWSOrganizationsListRootsResponse;
@class AWSOrganizationsListTagsForResourceRequest;
@class AWSOrganizationsListTagsForResourceResponse;
@class AWSOrganizationsListTargetsForPolicyRequest;
@class AWSOrganizationsListTargetsForPolicyResponse;
@class AWSOrganizationsMoveAccountRequest;
@class AWSOrganizationsOrganization;
@class AWSOrganizationsOrganizationalUnit;
@class AWSOrganizationsParent;
@class AWSOrganizationsPolicy;
@class AWSOrganizationsPolicySummary;
@class AWSOrganizationsPolicyTargetSummary;
@class AWSOrganizationsPolicyTypeSummary;
@class AWSOrganizationsRegisterDelegatedAdministratorRequest;
@class AWSOrganizationsRemoveAccountFromOrganizationRequest;
@class AWSOrganizationsRoot;
@class AWSOrganizationsTag;
@class AWSOrganizationsTagResourceRequest;
@class AWSOrganizationsUntagResourceRequest;
@class AWSOrganizationsUpdateOrganizationalUnitRequest;
@class AWSOrganizationsUpdateOrganizationalUnitResponse;
@class AWSOrganizationsUpdatePolicyRequest;
@class AWSOrganizationsUpdatePolicyResponse;

/**
 
 */
@interface AWSOrganizationsAcceptHandshakeRequest : AWSRequest


/**
 <p>The unique identifier (ID) of the handshake that you want to accept.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for handshake ID string requires "h-" followed by from 8 to 32 lowercase letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable handshakeId;

@end

/**
 
 */
@interface AWSOrganizationsAcceptHandshakeResponse : AWSModel


/**
 <p>A structure that contains details about the accepted handshake.</p>
 */
@property (nonatomic, strong) AWSOrganizationsHandshake * _Nullable handshake;

@end

/**
 <p>Contains information about an AWS account that is a member of an organization.</p>
 */
@interface AWSOrganizationsAccount : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the account.</p><p>For more information about ARNs in Organizations, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN Formats Supported by Organizations</a> in the <i>AWS Organizations User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The email address associated with the AWS account.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for this parameter is a string of characters that represents a standard internet email address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The unique identifier (ID) of the account.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an account ID string requires exactly 12 digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The method by which the account joined the organization.</p>
 */
@property (nonatomic, assign) AWSOrganizationsAccountJoinedMethod joinedMethod;

/**
 <p>The date the account became a part of the organization.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable joinedTimestamp;

/**
 <p>The friendly name of the account.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used to validate this parameter is a string of any of the characters in the ASCII character range.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the account in the organization.</p>
 */
@property (nonatomic, assign) AWSOrganizationsAccountStatus status;

@end

/**
 
 */
@interface AWSOrganizationsAttachPolicyRequest : AWSRequest


/**
 <p>The unique identifier (ID) of the policy that you want to attach to the target. You can get the ID for the policy by calling the <a>ListPolicies</a> operation.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a policy ID string requires "p-" followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_).</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

/**
 <p>The unique identifier (ID) of the root, OU, or account that you want to attach the policy to. You can get the ID by calling the <a>ListRoots</a>, <a>ListOrganizationalUnitsForParent</a>, or <a>ListAccounts</a> operations.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a target ID string requires one of the following:</p><ul><li><p><b>Root</b> - A string that begins with "r-" followed by from 4 to 32 lowercase letters or digits.</p></li><li><p><b>Account</b> - A string that consists of exactly 12 digits.</p></li><li><p><b>Organizational unit (OU)</b> - A string that begins with "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable targetId;

@end

/**
 
 */
@interface AWSOrganizationsCancelHandshakeRequest : AWSRequest


/**
 <p>The unique identifier (ID) of the handshake that you want to cancel. You can get the ID from the <a>ListHandshakesForOrganization</a> operation.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for handshake ID string requires "h-" followed by from 8 to 32 lowercase letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable handshakeId;

@end

/**
 
 */
@interface AWSOrganizationsCancelHandshakeResponse : AWSModel


/**
 <p>A structure that contains details about the handshake that you canceled.</p>
 */
@property (nonatomic, strong) AWSOrganizationsHandshake * _Nullable handshake;

@end

/**
 <p>Contains a list of child entities, either OUs or accounts.</p>
 */
@interface AWSOrganizationsChild : AWSModel


/**
 <p>The unique identifier (ID) of this child entity.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a child ID string requires one of the following:</p><ul><li><p>Account: A string that consists of exactly 12 digits.</p></li><li><p>Organizational unit (OU): A string that begins with "ou-" followed by from 4 to 32 lower-case letters or digits (the ID of the root that contains the OU). This string is followed by a second "-" dash and from 8 to 32 additional lower-case letters or digits.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The type of this child entity.</p>
 */
@property (nonatomic, assign) AWSOrganizationsChildType types;

@end

/**
 
 */
@interface AWSOrganizationsCreateAccountRequest : AWSRequest


/**
 <p>The friendly name of the member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountName;

/**
 <p>The email address of the owner to assign to the new member account. This email address must not already be associated with another AWS account. You must use a valid email address to complete account creation. You can't access the root user of the account or remove an account that was created with an invalid email address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>If set to <code>ALLOW</code>, the new account enables IAM users to access account billing information <i>if</i> they have the required permissions. If set to <code>DENY</code>, only the root user of the new account can access account billing information. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate">Activating Access to the Billing and Cost Management Console</a> in the <i>AWS Billing and Cost Management User Guide</i>.</p><p>If you don't specify this parameter, the value defaults to <code>ALLOW</code>, and IAM users and roles with the required permissions can access billing information for the new account.</p>
 */
@property (nonatomic, assign) AWSOrganizationsIAMUserAccessToBilling iamUserAccessToBilling;

/**
 <p>(Optional)</p><p>The name of an IAM role that AWS Organizations automatically preconfigures in the new member account. This role trusts the master account, allowing users in the master account to assume the role, as permitted by the master account administrator. The role has administrator permissions in the new member account.</p><p>If you don't specify this parameter, the role name defaults to <code>OrganizationAccountAccessRole</code>.</p><p>For more information about how to use this role to access the member account, see the following links:</p><ul><li><p><a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html#orgs_manage_accounts_create-cross-account-role">Accessing and Administering the Member Accounts in Your Organization</a> in the <i>AWS Organizations User Guide</i></p></li><li><p>Steps 2 and 3 in <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html">Tutorial: Delegate Access Across AWS Accounts Using IAM Roles</a> in the <i>IAM User Guide</i></p></li></ul><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used to validate this parameter. The pattern can include uppercase letters, lowercase letters, digits with no spaces, and any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSOrganizationsCreateAccountResponse : AWSModel


/**
 <p>A structure that contains details about the request to create an account. This response structure might not be fully populated when you first receive it because account creation is an asynchronous process. You can pass the returned <code>CreateAccountStatus</code> ID as a parameter to <a>DescribeCreateAccountStatus</a> to get status about the progress of the request at later times. You can also check the AWS CloudTrail log for the <code>CreateAccountResult</code> event. For more information, see <a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_monitoring.html">Monitoring the Activity in Your Organization</a> in the <i>AWS Organizations User Guide</i>.</p>
 */
@property (nonatomic, strong) AWSOrganizationsCreateAccountStatus * _Nullable createAccountStatus;

@end

/**
 <p>Contains the status about a <a>CreateAccount</a> or <a>CreateGovCloudAccount</a> request to create an AWS account or an AWS GovCloud (US) account in an organization.</p>
 */
@interface AWSOrganizationsCreateAccountStatus : AWSModel


/**
 <p>If the account was created successfully, the unique identifier (ID) of the new account.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an account ID string requires exactly 12 digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The account name given to the account when it was created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountName;

/**
 <p>The date and time that the account was created and the request completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completedTimestamp;

/**
 <p>If the request failed, a description of the reason for the failure.</p><ul><li><p>ACCOUNT_LIMIT_EXCEEDED: The account could not be created because you have reached the limit on the number of accounts in your organization.</p></li><li><p>EMAIL_ALREADY_EXISTS: The account could not be created because another AWS account with that email address already exists.</p></li><li><p>GOVCLOUD_ACCOUNT_ALREADY_EXISTS: The account in the AWS GovCloud (US) Region could not be created because this Region already includes an account with that email address.</p></li><li><p>INVALID_ADDRESS: The account could not be created because the address you provided is not valid.</p></li><li><p>INVALID_EMAIL: The account could not be created because the email address you provided is not valid.</p></li><li><p>INTERNAL_FAILURE: The account could not be created because of an internal failure. Try again later. If the problem persists, contact Customer Support.</p></li></ul>
 */
@property (nonatomic, assign) AWSOrganizationsCreateAccountFailureReason failureReason;

/**
 <p>If the account was created successfully, the unique identifier (ID) of the new account in the AWS GovCloud (US) Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable govCloudAccountId;

/**
 <p>The unique identifier (ID) that references this request. You get this value from the response of the initial <a>CreateAccount</a> request to create the account.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a create account request ID string requires "car-" followed by from 8 to 32 lower-case letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The date and time that the request was made for the account creation.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable requestedTimestamp;

/**
 <p>The status of the request.</p>
 */
@property (nonatomic, assign) AWSOrganizationsCreateAccountState state;

@end

/**
 
 */
@interface AWSOrganizationsCreateGovCloudAccountRequest : AWSRequest


/**
 <p>The friendly name of the member account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountName;

/**
 <p>The email address of the owner to assign to the new member account in the commercial Region. This email address must not already be associated with another AWS account. You must use a valid email address to complete account creation. You can't access the root user of the account or remove an account that was created with an invalid email address. Like all request parameters for <code>CreateGovCloudAccount</code>, the request for the email address for the AWS GovCloud (US) account originates from the commercial Region, not from the AWS GovCloud (US) Region.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>If set to <code>ALLOW</code>, the new linked account in the commercial Region enables IAM users to access account billing information <i>if</i> they have the required permissions. If set to <code>DENY</code>, only the root user of the new account can access account billing information. For more information, see <a href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate">Activating Access to the Billing and Cost Management Console</a> in the <i>AWS Billing and Cost Management User Guide.</i></p><p>If you don't specify this parameter, the value defaults to <code>ALLOW</code>, and IAM users and roles with the required permissions can access billing information for the new account.</p>
 */
@property (nonatomic, assign) AWSOrganizationsIAMUserAccessToBilling iamUserAccessToBilling;

/**
 <p>(Optional)</p><p>The name of an IAM role that AWS Organizations automatically preconfigures in the new member accounts in both the AWS GovCloud (US) Region and in the commercial Region. This role trusts the master account, allowing users in the master account to assume the role, as permitted by the master account administrator. The role has administrator permissions in the new member account.</p><p>If you don't specify this parameter, the role name defaults to <code>OrganizationAccountAccessRole</code>.</p><p>For more information about how to use this role to access the member account, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html#orgs_manage_accounts_create-cross-account-role">Accessing and Administering the Member Accounts in Your Organization</a> in the <i>AWS Organizations User Guide</i> and steps 2 and 3 in <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html">Tutorial: Delegate Access Across AWS Accounts Using IAM Roles</a> in the <i>IAM User Guide.</i></p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used to validate this parameter. The pattern can include uppercase letters, lowercase letters, digits with no spaces, and any of the following characters: =,.@-</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleName;

@end

/**
 
 */
@interface AWSOrganizationsCreateGovCloudAccountResponse : AWSModel


/**
 <p>Contains the status about a <a>CreateAccount</a> or <a>CreateGovCloudAccount</a> request to create an AWS account or an AWS GovCloud (US) account in an organization.</p>
 */
@property (nonatomic, strong) AWSOrganizationsCreateAccountStatus * _Nullable createAccountStatus;

@end

/**
 
 */
@interface AWSOrganizationsCreateOrganizationRequest : AWSRequest


/**
 <p>Specifies the feature set supported by the new organization. Each feature set supports different levels of functionality.</p><ul><li><p><code>CONSOLIDATED_BILLING</code>: All member accounts have their bills consolidated to and paid by the master account. For more information, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#feature-set-cb-only">Consolidated billing</a> in the <i>AWS Organizations User Guide.</i></p><p> The consolidated billing feature subset isn't available for organizations in the AWS GovCloud (US) Region.</p></li><li><p><code>ALL</code>: In addition to all the features supported by the consolidated billing feature set, the master account can also apply any policy type to any member account in the organization. For more information, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#feature-set-all">All features</a> in the <i>AWS Organizations User Guide.</i></p></li></ul>
 */
@property (nonatomic, assign) AWSOrganizationsOrganizationFeatureSet featureSet;

@end

/**
 
 */
@interface AWSOrganizationsCreateOrganizationResponse : AWSModel


/**
 <p>A structure that contains details about the newly created organization.</p>
 */
@property (nonatomic, strong) AWSOrganizationsOrganization * _Nullable organization;

@end

/**
 
 */
@interface AWSOrganizationsCreateOrganizationalUnitRequest : AWSRequest


/**
 <p>The friendly name to assign to the new OU.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique identifier (ID) of the parent root or OU that you want to create the new OU in.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a parent ID string requires one of the following:</p><ul><li><p><b>Root</b> - A string that begins with "r-" followed by from 4 to 32 lowercase letters or digits.</p></li><li><p><b>Organizational unit (OU)</b> - A string that begins with "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable parentId;

@end

/**
 
 */
@interface AWSOrganizationsCreateOrganizationalUnitResponse : AWSModel


/**
 <p>A structure that contains details about the newly created OU.</p>
 */
@property (nonatomic, strong) AWSOrganizationsOrganizationalUnit * _Nullable organizationalUnit;

@end

/**
 
 */
@interface AWSOrganizationsCreatePolicyRequest : AWSRequest


/**
 <p>The policy text content to add to the new policy. The text that you supply must adhere to the rules of the policy type you specify in the <code>Type</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>An optional description to assign to the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The friendly name to assign to the policy.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used to validate this parameter is a string of any of the characters in the ASCII character range.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of policy to create. You can specify one of the following values:</p><ul><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html">SERVICE_CONTROL_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a></p></li></ul>
 */
@property (nonatomic, assign) AWSOrganizationsPolicyType types;

@end

/**
 
 */
@interface AWSOrganizationsCreatePolicyResponse : AWSModel


/**
 <p>A structure that contains details about the newly created policy.</p>
 */
@property (nonatomic, strong) AWSOrganizationsPolicy * _Nullable policy;

@end

/**
 
 */
@interface AWSOrganizationsDeclineHandshakeRequest : AWSRequest


/**
 <p>The unique identifier (ID) of the handshake that you want to decline. You can get the ID from the <a>ListHandshakesForAccount</a> operation.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for handshake ID string requires "h-" followed by from 8 to 32 lowercase letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable handshakeId;

@end

/**
 
 */
@interface AWSOrganizationsDeclineHandshakeResponse : AWSModel


/**
 <p>A structure that contains details about the declined handshake. The state is updated to show the value <code>DECLINED</code>.</p>
 */
@property (nonatomic, strong) AWSOrganizationsHandshake * _Nullable handshake;

@end

/**
 <p>Contains information about the delegated administrator.</p>
 */
@interface AWSOrganizationsDelegatedAdministrator : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the delegated administrator's account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date when the account was made a delegated administrator.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable delegationEnabledDate;

/**
 <p>The email address that is associated with the delegated administrator's AWS account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable email;

/**
 <p>The unique identifier (ID) of the delegated administrator's account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The method by which the delegated administrator's account joined the organization.</p>
 */
@property (nonatomic, assign) AWSOrganizationsAccountJoinedMethod joinedMethod;

/**
 <p>The date when the delegated administrator's account became a part of the organization.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable joinedTimestamp;

/**
 <p>The friendly name of the delegated administrator's account.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The status of the delegated administrator's account in the organization.</p>
 */
@property (nonatomic, assign) AWSOrganizationsAccountStatus status;

@end

/**
 <p>Contains information about the AWS service for which the account is a delegated administrator.</p>
 */
@interface AWSOrganizationsDelegatedService : AWSModel


/**
 <p>The date that the account became a delegated administrator for this service. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable delegationEnabledDate;

/**
 <p>The name of a service that can request an operation for the specified service. This is typically in the form of a URL, such as: <code><i>servicename</i>.amazonaws.com</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable servicePrincipal;

@end

/**
 
 */
@interface AWSOrganizationsDeleteOrganizationalUnitRequest : AWSRequest


/**
 <p>The unique identifier (ID) of the organizational unit that you want to delete. You can get the ID from the <a>ListOrganizationalUnitsForParent</a> operation.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an organizational unit ID string requires "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that contains the OU). This string is followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationalUnitId;

@end

/**
 
 */
@interface AWSOrganizationsDeletePolicyRequest : AWSRequest


/**
 <p>The unique identifier (ID) of the policy that you want to delete. You can get the ID from the <a>ListPolicies</a> or <a>ListPoliciesForTarget</a> operations.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a policy ID string requires "p-" followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_).</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

@end

/**
 
 */
@interface AWSOrganizationsDeregisterDelegatedAdministratorRequest : AWSRequest


/**
 <p>The account ID number of the member account in the organization that you want to deregister as a delegated administrator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The service principal name of an AWS service for which the account is a delegated administrator.</p><p>Delegated administrator privileges are revoked for only the specified AWS service from the member account. If the specified service is the only service for which the member account is a delegated administrator, the operation also revokes Organizations read action permissions.</p>
 */
@property (nonatomic, strong) NSString * _Nullable servicePrincipal;

@end

/**
 
 */
@interface AWSOrganizationsDescribeAccountRequest : AWSRequest


/**
 <p>The unique identifier (ID) of the AWS account that you want information about. You can get the ID from the <a>ListAccounts</a> or <a>ListAccountsForParent</a> operations.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an account ID string requires exactly 12 digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

@end

/**
 
 */
@interface AWSOrganizationsDescribeAccountResponse : AWSModel


/**
 <p>A structure that contains information about the requested account.</p>
 */
@property (nonatomic, strong) AWSOrganizationsAccount * _Nullable account;

@end

/**
 
 */
@interface AWSOrganizationsDescribeCreateAccountStatusRequest : AWSRequest


/**
 <p>Specifies the <code>operationId</code> that uniquely identifies the request. You can get the ID from the response to an earlier <a>CreateAccount</a> request, or from the <a>ListCreateAccountStatus</a> operation.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a create account request ID string requires "car-" followed by from 8 to 32 lowercase letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createAccountRequestId;

@end

/**
 
 */
@interface AWSOrganizationsDescribeCreateAccountStatusResponse : AWSModel


/**
 <p>A structure that contains the current status of an account creation request.</p>
 */
@property (nonatomic, strong) AWSOrganizationsCreateAccountStatus * _Nullable createAccountStatus;

@end

/**
 
 */
@interface AWSOrganizationsDescribeEffectivePolicyRequest : AWSRequest


/**
 <p>The type of policy that you want information about. You can specify one of the following values:</p><ul><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a></p></li></ul>
 */
@property (nonatomic, assign) AWSOrganizationsEffectivePolicyType policyType;

/**
 <p>When you're signed in as the master account, specify the ID of the account that you want details about. Specifying an organization root or organizational unit (OU) as the target is not supported. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetId;

@end

/**
 
 */
@interface AWSOrganizationsDescribeEffectivePolicyResponse : AWSModel


/**
 <p>The contents of the effective policy.</p>
 */
@property (nonatomic, strong) AWSOrganizationsEffectivePolicy * _Nullable effectivePolicy;

@end

/**
 
 */
@interface AWSOrganizationsDescribeHandshakeRequest : AWSRequest


/**
 <p>The unique identifier (ID) of the handshake that you want information about. You can get the ID from the original call to <a>InviteAccountToOrganization</a>, or from a call to <a>ListHandshakesForAccount</a> or <a>ListHandshakesForOrganization</a>.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for handshake ID string requires "h-" followed by from 8 to 32 lowercase letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable handshakeId;

@end

/**
 
 */
@interface AWSOrganizationsDescribeHandshakeResponse : AWSModel


/**
 <p>A structure that contains information about the specified handshake.</p>
 */
@property (nonatomic, strong) AWSOrganizationsHandshake * _Nullable handshake;

@end

/**
 
 */
@interface AWSOrganizationsDescribeOrganizationResponse : AWSModel


/**
 <p>A structure that contains information about the organization.</p>
 */
@property (nonatomic, strong) AWSOrganizationsOrganization * _Nullable organization;

@end

/**
 
 */
@interface AWSOrganizationsDescribeOrganizationalUnitRequest : AWSRequest


/**
 <p>The unique identifier (ID) of the organizational unit that you want details about. You can get the ID from the <a>ListOrganizationalUnitsForParent</a> operation.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an organizational unit ID string requires "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that contains the OU). This string is followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationalUnitId;

@end

/**
 
 */
@interface AWSOrganizationsDescribeOrganizationalUnitResponse : AWSModel


/**
 <p>A structure that contains details about the specified OU.</p>
 */
@property (nonatomic, strong) AWSOrganizationsOrganizationalUnit * _Nullable organizationalUnit;

@end

/**
 
 */
@interface AWSOrganizationsDescribePolicyRequest : AWSRequest


/**
 <p>The unique identifier (ID) of the policy that you want details about. You can get the ID from the <a>ListPolicies</a> or <a>ListPoliciesForTarget</a> operations.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a policy ID string requires "p-" followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_).</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

@end

/**
 
 */
@interface AWSOrganizationsDescribePolicyResponse : AWSModel


/**
 <p>A structure that contains details about the specified policy.</p>
 */
@property (nonatomic, strong) AWSOrganizationsPolicy * _Nullable policy;

@end

/**
 
 */
@interface AWSOrganizationsDetachPolicyRequest : AWSRequest


/**
 <p>The unique identifier (ID) of the policy you want to detach. You can get the ID from the <a>ListPolicies</a> or <a>ListPoliciesForTarget</a> operations.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a policy ID string requires "p-" followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_).</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

/**
 <p>The unique identifier (ID) of the root, OU, or account that you want to detach the policy from. You can get the ID from the <a>ListRoots</a>, <a>ListOrganizationalUnitsForParent</a>, or <a>ListAccounts</a> operations.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a target ID string requires one of the following:</p><ul><li><p><b>Root</b> - A string that begins with "r-" followed by from 4 to 32 lowercase letters or digits.</p></li><li><p><b>Account</b> - A string that consists of exactly 12 digits.</p></li><li><p><b>Organizational unit (OU)</b> - A string that begins with "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable targetId;

@end

/**
 
 */
@interface AWSOrganizationsDisableAWSServiceAccessRequest : AWSRequest


/**
 <p>The service principal name of the AWS service for which you want to disable integration with your organization. This is typically in the form of a URL, such as <code><i>service-abbreviation</i>.amazonaws.com</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable servicePrincipal;

@end

/**
 
 */
@interface AWSOrganizationsDisablePolicyTypeRequest : AWSRequest


/**
 <p>The policy type that you want to disable in this root. You can specify one of the following values:</p><ul><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html">SERVICE_CONTROL_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a></p></li></ul>
 */
@property (nonatomic, assign) AWSOrganizationsPolicyType policyType;

/**
 <p>The unique identifier (ID) of the root in which you want to disable a policy type. You can get the ID from the <a>ListRoots</a> operation.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a root ID string requires "r-" followed by from 4 to 32 lowercase letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rootId;

@end

/**
 
 */
@interface AWSOrganizationsDisablePolicyTypeResponse : AWSModel


/**
 <p>A structure that shows the root with the updated list of enabled policy types.</p>
 */
@property (nonatomic, strong) AWSOrganizationsRoot * _Nullable root;

@end

/**
 <p>Contains rules to be applied to the affected accounts. The effective policy is the aggregation of any policies the account inherits, plus any policy directly attached to the account.</p>
 */
@interface AWSOrganizationsEffectivePolicy : AWSModel


/**
 <p>The time of the last update to this policy.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastUpdatedTimestamp;

/**
 <p>The text content of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyContent;

/**
 <p>The policy type.</p>
 */
@property (nonatomic, assign) AWSOrganizationsEffectivePolicyType policyType;

/**
 <p>The account ID of the policy target. </p>
 */
@property (nonatomic, strong) NSString * _Nullable targetId;

@end

/**
 
 */
@interface AWSOrganizationsEnableAWSServiceAccessRequest : AWSRequest


/**
 <p>The service principal name of the AWS service for which you want to enable integration with your organization. This is typically in the form of a URL, such as <code><i>service-abbreviation</i>.amazonaws.com</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable servicePrincipal;

@end

/**
 
 */
@interface AWSOrganizationsEnableAllFeaturesRequest : AWSRequest


@end

/**
 
 */
@interface AWSOrganizationsEnableAllFeaturesResponse : AWSModel


/**
 <p>A structure that contains details about the handshake created to support this request to enable all features in the organization.</p>
 */
@property (nonatomic, strong) AWSOrganizationsHandshake * _Nullable handshake;

@end

/**
 
 */
@interface AWSOrganizationsEnablePolicyTypeRequest : AWSRequest


/**
 <p>The policy type that you want to enable. You can specify one of the following values:</p><ul><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html">SERVICE_CONTROL_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a></p></li></ul>
 */
@property (nonatomic, assign) AWSOrganizationsPolicyType policyType;

/**
 <p>The unique identifier (ID) of the root in which you want to enable a policy type. You can get the ID from the <a>ListRoots</a> operation.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a root ID string requires "r-" followed by from 4 to 32 lowercase letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable rootId;

@end

/**
 
 */
@interface AWSOrganizationsEnablePolicyTypeResponse : AWSModel


/**
 <p>A structure that shows the root with the updated list of enabled policy types.</p>
 */
@property (nonatomic, strong) AWSOrganizationsRoot * _Nullable root;

@end

/**
 <p>A structure that contains details of a service principal that represents an AWS service that is enabled to integrate with AWS Organizations.</p>
 */
@interface AWSOrganizationsEnabledServicePrincipal : AWSModel


/**
 <p>The date that the service principal was enabled for integration with AWS Organizations.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable dateEnabled;

/**
 <p>The name of the service principal. This is typically in the form of a URL, such as: <code><i>servicename</i>.amazonaws.com</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable servicePrincipal;

@end

/**
 <p>Contains information that must be exchanged to securely establish a relationship between two accounts (an <i>originator</i> and a <i>recipient</i>). For example, when a master account (the originator) invites another account (the recipient) to join its organization, the two accounts exchange information as a series of handshake requests and responses.</p><p><b>Note:</b> Handshakes that are CANCELED, ACCEPTED, or DECLINED show up in lists for only 30 days after entering that state After that they are deleted.</p>
 */
@interface AWSOrganizationsHandshake : AWSModel


/**
 <p>The type of handshake, indicating what action occurs when the recipient accepts the handshake. The following handshake types are supported:</p><ul><li><p><b>INVITE</b>: This type of handshake represents a request to join an organization. It is always sent from the master account to only non-member accounts.</p></li><li><p><b>ENABLE_ALL_FEATURES</b>: This type of handshake represents a request to enable all features in an organization. It is always sent from the master account to only <i>invited</i> member accounts. Created accounts do not receive this because those accounts were created by the organization's master account and approval is inferred.</p></li><li><p><b>APPROVE_ALL_FEATURES</b>: This type of handshake is sent from the Organizations service when all member accounts have approved the <code>ENABLE_ALL_FEATURES</code> invitation. It is sent only to the master account and signals the master that it can finalize the process to enable all features.</p></li></ul>
 */
@property (nonatomic, assign) AWSOrganizationsActionType action;

/**
 <p>The Amazon Resource Name (ARN) of a handshake.</p><p>For more information about ARNs in Organizations, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN Formats Supported by Organizations</a> in the <i>AWS Organizations User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The date and time that the handshake expires. If the recipient of the handshake request fails to respond before the specified date and time, the handshake becomes inactive and is no longer valid.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable expirationTimestamp;

/**
 <p>The unique identifier (ID) of a handshake. The originating account creates the ID when it initiates the handshake.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for handshake ID string requires "h-" followed by from 8 to 32 lower-case letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>Information about the two accounts that are participating in the handshake.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsHandshakeParty *> * _Nullable parties;

/**
 <p>The date and time that the handshake request was made.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable requestedTimestamp;

/**
 <p>Additional information that is needed to process the handshake.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsHandshakeResource *> * _Nullable resources;

/**
 <p>The current state of the handshake. Use the state to trace the flow of the handshake through the process from its creation to its acceptance. The meaning of each of the valid values is as follows:</p><ul><li><p><b>REQUESTED</b>: This handshake was sent to multiple recipients (applicable to only some handshake types) and not all recipients have responded yet. The request stays in this state until all recipients respond.</p></li><li><p><b>OPEN</b>: This handshake was sent to multiple recipients (applicable to only some policy types) and all recipients have responded, allowing the originator to complete the handshake action.</p></li><li><p><b>CANCELED</b>: This handshake is no longer active because it was canceled by the originating account.</p></li><li><p><b>ACCEPTED</b>: This handshake is complete because it has been accepted by the recipient.</p></li><li><p><b>DECLINED</b>: This handshake is no longer active because it was declined by the recipient account.</p></li><li><p><b>EXPIRED</b>: This handshake is no longer active because the originator did not receive a response of any kind from the recipient before the expiration time (15 days).</p></li></ul>
 */
@property (nonatomic, assign) AWSOrganizationsHandshakeState state;

@end

/**
 <p>Specifies the criteria that are used to select the handshakes for the operation.</p>
 */
@interface AWSOrganizationsHandshakeFilter : AWSModel


/**
 <p>Specifies the type of handshake action.</p><p>If you specify <code>ActionType</code>, you cannot also specify <code>ParentHandshakeId</code>.</p>
 */
@property (nonatomic, assign) AWSOrganizationsActionType actionType;

/**
 <p>Specifies the parent handshake. Only used for handshake types that are a child of another type.</p><p>If you specify <code>ParentHandshakeId</code>, you cannot also specify <code>ActionType</code>.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for handshake ID string requires "h-" followed by from 8 to 32 lower-case letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentHandshakeId;

@end

/**
 <p>Identifies a participant in a handshake.</p>
 Required parameters: [Id, Type]
 */
@interface AWSOrganizationsHandshakeParty : AWSModel


/**
 <p>The unique identifier (ID) for the party.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for handshake ID string requires "h-" followed by from 8 to 32 lower-case letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The type of party.</p>
 */
@property (nonatomic, assign) AWSOrganizationsHandshakePartyType types;

@end

/**
 <p>Contains additional data that is needed to process a handshake.</p>
 */
@interface AWSOrganizationsHandshakeResource : AWSModel


/**
 <p>When needed, contains an additional array of <code>HandshakeResource</code> objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsHandshakeResource *> * _Nullable resources;

/**
 <p>The type of information being passed, specifying how the value is to be interpreted by the other party:</p><ul><li><p><code>ACCOUNT</code> - Specifies an AWS account ID number.</p></li><li><p><code>ORGANIZATION</code> - Specifies an organization ID number.</p></li><li><p><code>EMAIL</code> - Specifies the email address that is associated with the account that receives the handshake. </p></li><li><p><code>OWNER_EMAIL</code> - Specifies the email address associated with the master account. Included as information about an organization. </p></li><li><p><code>OWNER_NAME</code> - Specifies the name associated with the master account. Included as information about an organization. </p></li><li><p><code>NOTES</code> - Additional text provided by the handshake initiator and intended for the recipient to read.</p></li></ul>
 */
@property (nonatomic, assign) AWSOrganizationsHandshakeResourceType types;

/**
 <p>The information that is passed to the other party in the handshake. The format of the value string must match the requirements of the specified type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSOrganizationsInviteAccountToOrganizationRequest : AWSRequest


/**
 <p>Additional information that you want to include in the generated email to the recipient account owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable notes;

/**
 <p>The identifier (ID) of the AWS account that you want to invite to join your organization. This is a JSON object that contains the following elements: </p><p><code>{ "Type": "ACCOUNT", "Id": "&lt;<i><b>account id number</b></i>&gt;" }</code></p><p>If you use the AWS CLI, you can submit this as a single string, similar to the following example:</p><p><code>--target Id=123456789012,Type=ACCOUNT</code></p><p>If you specify <code>"Type": "ACCOUNT"</code>, you must provide the AWS account ID number as the <code>Id</code>. If you specify <code>"Type": "EMAIL"</code>, you must specify the email address that is associated with the account.</p><p><code>--target Id=diego@example.com,Type=EMAIL</code></p>
 */
@property (nonatomic, strong) AWSOrganizationsHandshakeParty * _Nullable target;

@end

/**
 
 */
@interface AWSOrganizationsInviteAccountToOrganizationResponse : AWSModel


/**
 <p>A structure that contains details about the handshake that is created to support this invitation request.</p>
 */
@property (nonatomic, strong) AWSOrganizationsHandshake * _Nullable handshake;

@end

/**
 
 */
@interface AWSOrganizationsListAWSServiceAccessForOrganizationRequest : AWSRequest


/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListAWSServiceAccessForOrganizationResponse : AWSModel


/**
 <p>A list of the service principals for the services that are enabled to integrate with your organization. Each principal is a structure that includes the name and the date that it was enabled for integration with AWS Organizations.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsEnabledServicePrincipal *> * _Nullable enabledServicePrincipals;

/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListAccountsForParentRequest : AWSRequest


/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The unique identifier (ID) for the parent root or organization unit (OU) whose accounts you want to list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable parentId;

@end

/**
 
 */
@interface AWSOrganizationsListAccountsForParentResponse : AWSModel


/**
 <p>A list of the accounts in the specified root or OU.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsAccount *> * _Nullable accounts;

/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListAccountsRequest : AWSRequest


/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListAccountsResponse : AWSModel


/**
 <p>A list of objects in the organization.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsAccount *> * _Nullable accounts;

/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListChildrenRequest : AWSRequest


/**
 <p>Filters the output to include only the specified child type.</p>
 */
@property (nonatomic, assign) AWSOrganizationsChildType childType;

/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The unique identifier (ID) for the parent root or OU whose children you want to list.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a parent ID string requires one of the following:</p><ul><li><p><b>Root</b> - A string that begins with "r-" followed by from 4 to 32 lowercase letters or digits.</p></li><li><p><b>Organizational unit (OU)</b> - A string that begins with "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable parentId;

@end

/**
 
 */
@interface AWSOrganizationsListChildrenResponse : AWSModel


/**
 <p>The list of children of the specified parent container.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsChild *> * _Nullable children;

/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListCreateAccountStatusRequest : AWSRequest


/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of one or more states that you want included in the response. If this parameter isn't present, all requests are included in the response.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable states;

@end

/**
 
 */
@interface AWSOrganizationsListCreateAccountStatusResponse : AWSModel


/**
 <p>A list of objects with details about the requests. Certain elements, such as the accountId number, are present in the output only after the account has been successfully created.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsCreateAccountStatus *> * _Nullable createAccountStatuses;

/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListDelegatedAdministratorsRequest : AWSRequest


/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specifies a service principal name. If specified, then the operation lists the delegated administrators only for the specified service.</p><p>If you don't specify a service principal, the operation lists all delegated administrators for all services in your organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable servicePrincipal;

@end

/**
 
 */
@interface AWSOrganizationsListDelegatedAdministratorsResponse : AWSModel


/**
 <p>The list of delegated administrators in your organization.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsDelegatedAdministrator *> * _Nullable delegatedAdministrators;

/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListDelegatedServicesForAccountRequest : AWSRequest


/**
 <p>The account ID number of a delegated administrator account in the organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListDelegatedServicesForAccountResponse : AWSModel


/**
 <p>The services for which the account is a delegated administrator.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsDelegatedService *> * _Nullable delegatedServices;

/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListHandshakesForAccountRequest : AWSRequest


/**
 <p>Filters the handshakes that you want included in the response. The default is all types. Use the <code>ActionType</code> element to limit the output to only a specified type, such as <code>INVITE</code>, <code>ENABLE_ALL_FEATURES</code>, or <code>APPROVE_ALL_FEATURES</code>. Alternatively, for the <code>ENABLE_ALL_FEATURES</code> handshake that generates a separate child handshake for each member account, you can specify <code>ParentHandshakeId</code> to see only the handshakes that were generated by that parent request.</p>
 */
@property (nonatomic, strong) AWSOrganizationsHandshakeFilter * _Nullable filter;

/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListHandshakesForAccountResponse : AWSModel


/**
 <p>A list of <a>Handshake</a> objects with details about each of the handshakes that is associated with the specified account.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsHandshake *> * _Nullable handshakes;

/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListHandshakesForOrganizationRequest : AWSRequest


/**
 <p>A filter of the handshakes that you want included in the response. The default is all types. Use the <code>ActionType</code> element to limit the output to only a specified type, such as <code>INVITE</code>, <code>ENABLE-ALL-FEATURES</code>, or <code>APPROVE-ALL-FEATURES</code>. Alternatively, for the <code>ENABLE-ALL-FEATURES</code> handshake that generates a separate child handshake for each member account, you can specify the <code>ParentHandshakeId</code> to see only the handshakes that were generated by that parent request.</p>
 */
@property (nonatomic, strong) AWSOrganizationsHandshakeFilter * _Nullable filter;

/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListHandshakesForOrganizationResponse : AWSModel


/**
 <p>A list of <a>Handshake</a> objects with details about each of the handshakes that are associated with an organization.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsHandshake *> * _Nullable handshakes;

/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListOrganizationalUnitsForParentRequest : AWSRequest


/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The unique identifier (ID) of the root or OU whose child OUs you want to list.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a parent ID string requires one of the following:</p><ul><li><p><b>Root</b> - A string that begins with "r-" followed by from 4 to 32 lowercase letters or digits.</p></li><li><p><b>Organizational unit (OU)</b> - A string that begins with "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable parentId;

@end

/**
 
 */
@interface AWSOrganizationsListOrganizationalUnitsForParentResponse : AWSModel


/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of the OUs in the specified root or parent OU.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsOrganizationalUnit *> * _Nullable organizationalUnits;

@end

/**
 
 */
@interface AWSOrganizationsListParentsRequest : AWSRequest


/**
 <p>The unique identifier (ID) of the OU or account whose parent containers you want to list. Don't specify a root.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a child ID string requires one of the following:</p><ul><li><p><b>Account</b> - A string that consists of exactly 12 digits.</p></li><li><p><b>Organizational unit (OU)</b> - A string that begins with "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that contains the OU). This string is followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable childId;

/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListParentsResponse : AWSModel


/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of parents for the specified child account or OU.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsParent *> * _Nullable parents;

@end

/**
 
 */
@interface AWSOrganizationsListPoliciesForTargetRequest : AWSRequest


/**
 <p>The type of policy that you want to include in the returned list. You must specify one of the following values:</p><ul><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html">SERVICE_CONTROL_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a></p></li></ul>
 */
@property (nonatomic, assign) AWSOrganizationsPolicyType filter;

/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The unique identifier (ID) of the root, organizational unit, or account whose policies you want to list.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a target ID string requires one of the following:</p><ul><li><p><b>Root</b> - A string that begins with "r-" followed by from 4 to 32 lowercase letters or digits.</p></li><li><p><b>Account</b> - A string that consists of exactly 12 digits.</p></li><li><p><b>Organizational unit (OU)</b> - A string that begins with "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable targetId;

@end

/**
 
 */
@interface AWSOrganizationsListPoliciesForTargetResponse : AWSModel


/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The list of policies that match the criteria in the request.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsPolicySummary *> * _Nullable policies;

@end

/**
 
 */
@interface AWSOrganizationsListPoliciesRequest : AWSRequest


/**
 <p>Specifies the type of policy that you want to include in the response. You must specify one of the following values:</p><ul><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html">SERVICE_CONTROL_POLICY</a></p></li><li><p><a href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a></p></li></ul>
 */
@property (nonatomic, assign) AWSOrganizationsPolicyType filter;

/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListPoliciesResponse : AWSModel


/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of policies that match the filter criteria in the request. The output list doesn't include the policy contents. To see the content for a policy, see <a>DescribePolicy</a>.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsPolicySummary *> * _Nullable policies;

@end

/**
 
 */
@interface AWSOrganizationsListRootsRequest : AWSRequest


/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSOrganizationsListRootsResponse : AWSModel


/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of roots that are defined in an organization.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsRoot *> * _Nullable roots;

@end

/**
 
 */
@interface AWSOrganizationsListTagsForResourceRequest : AWSRequest


/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The ID of the resource that you want to retrieve tags for. </p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

@end

/**
 
 */
@interface AWSOrganizationsListTagsForResourceResponse : AWSModel


/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The tags that are assigned to the resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSOrganizationsListTargetsForPolicyRequest : AWSRequest


/**
 <p>The total number of results that you want included on each page of the response. If you do not include this parameter, it defaults to a value that is specific to the operation. If additional items exist beyond the maximum you specify, the <code>NextToken</code> response element is present and has a value (is not null). Include that value as the <code>NextToken</code> request parameter in the next call to the operation to get the next part of the results. Note that Organizations might return fewer results than the maximum even when there are more results available. You should check <code>NextToken</code> after every operation to ensure that you receive all of the results.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The parameter for receiving additional results if you receive a <code>NextToken</code> response in a previous request. A <code>NextToken</code> response indicates that more output is available. Set this parameter to the value of the previous call's <code>NextToken</code> response to indicate where the output should continue from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The unique identifier (ID) of the policy whose attachments you want to know.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a policy ID string requires "p-" followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_).</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

@end

/**
 
 */
@interface AWSOrganizationsListTargetsForPolicyResponse : AWSModel


/**
 <p>If present, indicates that more output is available than is included in the current response. Use this value in the <code>NextToken</code> request parameter in a subsequent call to the operation to get the next part of the output. You should repeat this until the <code>NextToken</code> response element comes back as <code>null</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of structures, each of which contains details about one of the entities to which the specified policy is attached.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsPolicyTargetSummary *> * _Nullable targets;

@end

/**
 
 */
@interface AWSOrganizationsMoveAccountRequest : AWSRequest


/**
 <p>The unique identifier (ID) of the account that you want to move.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an account ID string requires exactly 12 digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The unique identifier (ID) of the root or organizational unit that you want to move the account to.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a parent ID string requires one of the following:</p><ul><li><p><b>Root</b> - A string that begins with "r-" followed by from 4 to 32 lowercase letters or digits.</p></li><li><p><b>Organizational unit (OU)</b> - A string that begins with "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable destinationParentId;

/**
 <p>The unique identifier (ID) of the root or organizational unit that you want to move the account from.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a parent ID string requires one of the following:</p><ul><li><p><b>Root</b> - A string that begins with "r-" followed by from 4 to 32 lowercase letters or digits.</p></li><li><p><b>Organizational unit (OU)</b> - A string that begins with "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This string is followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable sourceParentId;

@end

/**
 <p>Contains details about an organization. An organization is a collection of accounts that are centrally managed together using consolidated billing, organized hierarchically with organizational units (OUs), and controlled with policies .</p>
 */
@interface AWSOrganizationsOrganization : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of an organization.</p><p>For more information about ARNs in Organizations, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN Formats Supported by Organizations</a> in the <i>AWS Organizations User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>A list of policy types that are enabled for this organization. For example, if your organization has all features enabled, then service control policies (SCPs) are included in the list.</p><note><p>Even if a policy type is shown as available in the organization, you can separately enable and disable them at the root level by using <a>EnablePolicyType</a> and <a>DisablePolicyType</a>. Use <a>ListRoots</a> to see the status of a policy type in that root.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsPolicyTypeSummary *> * _Nullable availablePolicyTypes;

/**
 <p>Specifies the functionality that currently is available to the organization. If set to "ALL", then all features are enabled and policies can be applied to accounts in the organization. If set to "CONSOLIDATED_BILLING", then only consolidated billing functionality is available. For more information, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">Enabling All Features in Your Organization</a> in the <i>AWS Organizations User Guide</i>.</p>
 */
@property (nonatomic, assign) AWSOrganizationsOrganizationFeatureSet featureSet;

/**
 <p>The unique identifier (ID) of an organization.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an organization ID string requires "o-" followed by from 10 to 32 lower-case letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Amazon Resource Name (ARN) of the account that is designated as the master account for the organization.</p><p>For more information about ARNs in Organizations, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN Formats Supported by Organizations</a> in the <i>AWS Organizations User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterAccountArn;

/**
 <p>The email address that is associated with the AWS account that is designated as the master account for the organization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterAccountEmail;

/**
 <p>The unique identifier (ID) of the master account of an organization.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an account ID string requires exactly 12 digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable masterAccountId;

@end

/**
 <p>Contains details about an organizational unit (OU). An OU is a container of AWS accounts within a root of an organization. Policies that are attached to an OU apply to all accounts contained in that OU and in any child OUs.</p>
 */
@interface AWSOrganizationsOrganizationalUnit : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of this OU.</p><p>For more information about ARNs in Organizations, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN Formats Supported by Organizations</a> in the <i>AWS Organizations User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The unique identifier (ID) associated with this OU.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an organizational unit ID string requires "ou-" followed by from 4 to 32 lower-case letters or digits (the ID of the root that contains the OU). This string is followed by a second "-" dash and from 8 to 32 additional lower-case letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The friendly name of this OU.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used to validate this parameter is a string of any of the characters in the ASCII character range.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

/**
 <p>Contains information about either a root or an organizational unit (OU) that can contain OUs or accounts in an organization.</p>
 */
@interface AWSOrganizationsParent : AWSModel


/**
 <p>The unique identifier (ID) of the parent entity.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a parent ID string requires one of the following:</p><ul><li><p>Root: A string that begins with "r-" followed by from 4 to 32 lower-case letters or digits.</p></li><li><p>Organizational unit (OU): A string that begins with "ou-" followed by from 4 to 32 lower-case letters or digits (the ID of the root that the OU is in). This string is followed by a second "-" dash and from 8 to 32 additional lower-case letters or digits.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The type of the parent entity.</p>
 */
@property (nonatomic, assign) AWSOrganizationsParentType types;

@end

/**
 <p>Contains rules to be applied to the affected accounts. Policies can be attached directly to accounts, or to roots and OUs to affect all accounts in those hierarchies.</p>
 */
@interface AWSOrganizationsPolicy : AWSModel


/**
 <p>The text content of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>A structure that contains additional details about the policy.</p>
 */
@property (nonatomic, strong) AWSOrganizationsPolicySummary * _Nullable policySummary;

@end

/**
 <p>Contains information about a policy, but does not include the content. To see the content of a policy, see <a>DescribePolicy</a>.</p>
 */
@interface AWSOrganizationsPolicySummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the policy.</p><p>For more information about ARNs in Organizations, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN Formats Supported by Organizations</a> in the <i>AWS Organizations User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>A boolean value that indicates whether the specified policy is an AWS managed policy. If true, then you can attach the policy to roots, OUs, or accounts, but you cannot edit it.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable awsManaged;

/**
 <p>The description of the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The unique identifier (ID) of the policy.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a policy ID string requires "p-" followed by from 8 to 128 lower-case letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The friendly name of the policy.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used to validate this parameter is a string of any of the characters in the ASCII character range.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The type of policy.</p>
 */
@property (nonatomic, assign) AWSOrganizationsPolicyType types;

@end

/**
 <p>Contains information about a root, OU, or account that a policy is attached to.</p>
 */
@interface AWSOrganizationsPolicyTargetSummary : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the policy target.</p><p>For more information about ARNs in Organizations, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN Formats Supported by Organizations</a> in the <i>AWS Organizations User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The friendly name of the policy target.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used to validate this parameter is a string of any of the characters in the ASCII character range.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique identifier (ID) of the policy target.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a target ID string requires one of the following:</p><ul><li><p>Root: A string that begins with "r-" followed by from 4 to 32 lower-case letters or digits.</p></li><li><p>Account: A string that consists of exactly 12 digits.</p></li><li><p>Organizational unit (OU): A string that begins with "ou-" followed by from 4 to 32 lower-case letters or digits (the ID of the root that the OU is in). This string is followed by a second "-" dash and from 8 to 32 additional lower-case letters or digits.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable targetId;

/**
 <p>The type of the policy target.</p>
 */
@property (nonatomic, assign) AWSOrganizationsTargetType types;

@end

/**
 <p>Contains information about a policy type and its status in the associated root.</p>
 */
@interface AWSOrganizationsPolicyTypeSummary : AWSModel


/**
 <p>The status of the policy type as it relates to the associated root. To attach a policy of the specified type to a root or to an OU or account in that root, it must be available in the organization and enabled for that root.</p>
 */
@property (nonatomic, assign) AWSOrganizationsPolicyTypeStatus status;

/**
 <p>The name of the policy type.</p>
 */
@property (nonatomic, assign) AWSOrganizationsPolicyType types;

@end

/**
 
 */
@interface AWSOrganizationsRegisterDelegatedAdministratorRequest : AWSRequest


/**
 <p>The account ID number of the member account in the organization to register as a delegated administrator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

/**
 <p>The service principal of the AWS service for which you want to make the member account a delegated administrator.</p>
 */
@property (nonatomic, strong) NSString * _Nullable servicePrincipal;

@end

/**
 
 */
@interface AWSOrganizationsRemoveAccountFromOrganizationRequest : AWSRequest


/**
 <p>The unique identifier (ID) of the member account that you want to remove from the organization.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an account ID string requires exactly 12 digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accountId;

@end

/**
 <p>Contains details about a root. A root is a top-level parent node in the hierarchy of an organization that can contain organizational units (OUs) and accounts. Every root contains every AWS account in the organization. Each root enables the accounts to be organized in a different way and to have different policy types enabled for use in that root.</p>
 */
@interface AWSOrganizationsRoot : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the root.</p><p>For more information about ARNs in Organizations, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN Formats Supported by Organizations</a> in the <i>AWS Organizations User Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The unique identifier (ID) for the root.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a root ID string requires "r-" followed by from 4 to 32 lower-case letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The friendly name of the root.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used to validate this parameter is a string of any of the characters in the ASCII character range.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The types of policies that are currently enabled for the root and therefore can be attached to the root or to its OUs or accounts.</p><note><p>Even if a policy type is shown as available in the organization, you can separately enable and disable them at the root level by using <a>EnablePolicyType</a> and <a>DisablePolicyType</a>. Use <a>DescribeOrganization</a> to see the availability of the policy types in that organization.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsPolicyTypeSummary *> * _Nullable policyTypes;

@end

/**
 <p>A custom key-value pair associated with a resource such as an account within your organization. </p>
 Required parameters: [Key, Value]
 */
@interface AWSOrganizationsTag : AWSModel


/**
 <p>The key identifier, or name, of the tag.</p>
 */
@property (nonatomic, strong) NSString * _Nullable key;

/**
 <p>The string value that's associated with the key of the tag. You can set the value of a tag to an empty string, but you can't set the value of a tag to null.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSOrganizationsTagResourceRequest : AWSRequest


/**
 <p>The ID of the resource to add a tag to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The tag to add to the specified resource. You must specify both a tag key and value. You can set the value of a tag to an empty string, but you can't set it to null.</p>
 */
@property (nonatomic, strong) NSArray<AWSOrganizationsTag *> * _Nullable tags;

@end

/**
 
 */
@interface AWSOrganizationsUntagResourceRequest : AWSRequest


/**
 <p>The ID of the resource to remove the tag from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceId;

/**
 <p>The tag to remove from the specified resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSOrganizationsUpdateOrganizationalUnitRequest : AWSRequest


/**
 <p>The new name that you want to assign to the OU.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used to validate this parameter is a string of any of the characters in the ASCII character range.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique identifier (ID) of the OU that you want to rename. You can get the ID from the <a>ListOrganizationalUnitsForParent</a> operation.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an organizational unit ID string requires "ou-" followed by from 4 to 32 lowercase letters or digits (the ID of the root that contains the OU). This string is followed by a second "-" dash and from 8 to 32 additional lowercase letters or digits.</p>
 */
@property (nonatomic, strong) NSString * _Nullable organizationalUnitId;

@end

/**
 
 */
@interface AWSOrganizationsUpdateOrganizationalUnitResponse : AWSModel


/**
 <p>A structure that contains the details about the specified OU, including its new name.</p>
 */
@property (nonatomic, strong) AWSOrganizationsOrganizationalUnit * _Nullable organizationalUnit;

@end

/**
 
 */
@interface AWSOrganizationsUpdatePolicyRequest : AWSRequest


/**
 <p>If provided, the new content for the policy. The text must be correctly formatted JSON that complies with the syntax for the policy's type. For more information, see <a href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_scp-syntax.html">Service Control Policy Syntax</a> in the <i>AWS Organizations User Guide.</i></p>
 */
@property (nonatomic, strong) NSString * _Nullable content;

/**
 <p>If provided, the new description for the policy.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>If provided, the new name for the policy.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used to validate this parameter is a string of any of the characters in the ASCII character range.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The unique identifier (ID) of the policy that you want to update.</p><p>The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a policy ID string requires "p-" followed by from 8 to 128 lowercase or uppercase letters, digits, or the underscore character (_).</p>
 */
@property (nonatomic, strong) NSString * _Nullable policyId;

@end

/**
 
 */
@interface AWSOrganizationsUpdatePolicyResponse : AWSModel


/**
 <p>A structure that contains details about the updated policy, showing the requested changes.</p>
 */
@property (nonatomic, strong) AWSOrganizationsPolicy * _Nullable policy;

@end

NS_ASSUME_NONNULL_END
