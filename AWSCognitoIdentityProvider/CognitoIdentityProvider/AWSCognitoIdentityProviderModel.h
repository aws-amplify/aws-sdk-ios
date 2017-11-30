//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

FOUNDATION_EXPORT NSString *const AWSCognitoIdentityProviderErrorDomain;

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderErrorType) {
    AWSCognitoIdentityProviderErrorUnknown,
    AWSCognitoIdentityProviderErrorAliasExists,
    AWSCognitoIdentityProviderErrorCodeDeliveryFailure,
    AWSCognitoIdentityProviderErrorCodeMismatch,
    AWSCognitoIdentityProviderErrorConcurrentModification,
    AWSCognitoIdentityProviderErrorDuplicateProvider,
    AWSCognitoIdentityProviderErrorEnableSoftwareTokenMFA,
    AWSCognitoIdentityProviderErrorExpiredCode,
    AWSCognitoIdentityProviderErrorGroupExists,
    AWSCognitoIdentityProviderErrorInternalError,
    AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy,
    AWSCognitoIdentityProviderErrorInvalidLambdaResponse,
    AWSCognitoIdentityProviderErrorInvalidOAuthFlow,
    AWSCognitoIdentityProviderErrorInvalidParameter,
    AWSCognitoIdentityProviderErrorInvalidPassword,
    AWSCognitoIdentityProviderErrorInvalidSmsRoleAccessPolicy,
    AWSCognitoIdentityProviderErrorInvalidSmsRoleTrustRelationship,
    AWSCognitoIdentityProviderErrorInvalidUserPoolConfiguration,
    AWSCognitoIdentityProviderErrorLimitExceeded,
    AWSCognitoIdentityProviderErrorMFAMethodNotFound,
    AWSCognitoIdentityProviderErrorNotAuthorized,
    AWSCognitoIdentityProviderErrorPasswordResetRequired,
    AWSCognitoIdentityProviderErrorPreconditionNotMet,
    AWSCognitoIdentityProviderErrorResourceNotFound,
    AWSCognitoIdentityProviderErrorScopeDoesNotExist,
    AWSCognitoIdentityProviderErrorSoftwareTokenMFANotFound,
    AWSCognitoIdentityProviderErrorTooManyFailedAttempts,
    AWSCognitoIdentityProviderErrorTooManyRequests,
    AWSCognitoIdentityProviderErrorUnexpectedLambda,
    AWSCognitoIdentityProviderErrorUnsupportedIdentityProvider,
    AWSCognitoIdentityProviderErrorUnsupportedUserState,
    AWSCognitoIdentityProviderErrorUserImportInProgress,
    AWSCognitoIdentityProviderErrorUserLambdaValidation,
    AWSCognitoIdentityProviderErrorUserNotConfirmed,
    AWSCognitoIdentityProviderErrorUserNotFound,
    AWSCognitoIdentityProviderErrorUserPoolAddOnNotEnabled,
    AWSCognitoIdentityProviderErrorUserPoolTagging,
    AWSCognitoIdentityProviderErrorUsernameExists,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderAccountTakeoverEventActionType) {
    AWSCognitoIdentityProviderAccountTakeoverEventActionTypeUnknown,
    AWSCognitoIdentityProviderAccountTakeoverEventActionTypeBlock,
    AWSCognitoIdentityProviderAccountTakeoverEventActionTypeMfaIfConfigured,
    AWSCognitoIdentityProviderAccountTakeoverEventActionTypeMfaRequired,
    AWSCognitoIdentityProviderAccountTakeoverEventActionTypeNoAction,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderAdvancedSecurityModeType) {
    AWSCognitoIdentityProviderAdvancedSecurityModeTypeUnknown,
    AWSCognitoIdentityProviderAdvancedSecurityModeTypeOff,
    AWSCognitoIdentityProviderAdvancedSecurityModeTypeAudit,
    AWSCognitoIdentityProviderAdvancedSecurityModeTypeEnforced,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderAliasAttributeType) {
    AWSCognitoIdentityProviderAliasAttributeTypeUnknown,
    AWSCognitoIdentityProviderAliasAttributeTypePhoneNumber,
    AWSCognitoIdentityProviderAliasAttributeTypeEmail,
    AWSCognitoIdentityProviderAliasAttributeTypePreferredUsername,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderAttributeDataType) {
    AWSCognitoIdentityProviderAttributeDataTypeUnknown,
    AWSCognitoIdentityProviderAttributeDataTypeString,
    AWSCognitoIdentityProviderAttributeDataTypeNumber,
    AWSCognitoIdentityProviderAttributeDataTypeDateTime,
    AWSCognitoIdentityProviderAttributeDataTypeBoolean,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderAuthFlowType) {
    AWSCognitoIdentityProviderAuthFlowTypeUnknown,
    AWSCognitoIdentityProviderAuthFlowTypeUserSrpAuth,
    AWSCognitoIdentityProviderAuthFlowTypeRefreshTokenAuth,
    AWSCognitoIdentityProviderAuthFlowTypeRefreshToken,
    AWSCognitoIdentityProviderAuthFlowTypeCustomAuth,
    AWSCognitoIdentityProviderAuthFlowTypeAdminNoSrpAuth,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderChallengeName) {
    AWSCognitoIdentityProviderChallengeNameUnknown,
    AWSCognitoIdentityProviderChallengeNamePassword,
    AWSCognitoIdentityProviderChallengeNameMfa,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderChallengeNameType) {
    AWSCognitoIdentityProviderChallengeNameTypeUnknown,
    AWSCognitoIdentityProviderChallengeNameTypeSmsMfa,
    AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa,
    AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType,
    AWSCognitoIdentityProviderChallengeNameTypeMfaSetup,
    AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier,
    AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge,
    AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth,
    AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier,
    AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth,
    AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderChallengeResponse) {
    AWSCognitoIdentityProviderChallengeResponseUnknown,
    AWSCognitoIdentityProviderChallengeResponseSuccess,
    AWSCognitoIdentityProviderChallengeResponseFailure,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderCompromisedCredentialsEventActionType) {
    AWSCognitoIdentityProviderCompromisedCredentialsEventActionTypeUnknown,
    AWSCognitoIdentityProviderCompromisedCredentialsEventActionTypeBlock,
    AWSCognitoIdentityProviderCompromisedCredentialsEventActionTypeNoAction,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderDefaultEmailOptionType) {
    AWSCognitoIdentityProviderDefaultEmailOptionTypeUnknown,
    AWSCognitoIdentityProviderDefaultEmailOptionTypeConfirmWithLink,
    AWSCognitoIdentityProviderDefaultEmailOptionTypeConfirmWithCode,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderDeliveryMediumType) {
    AWSCognitoIdentityProviderDeliveryMediumTypeUnknown,
    AWSCognitoIdentityProviderDeliveryMediumTypeSms,
    AWSCognitoIdentityProviderDeliveryMediumTypeEmail,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderDeviceRememberedStatusType) {
    AWSCognitoIdentityProviderDeviceRememberedStatusTypeUnknown,
    AWSCognitoIdentityProviderDeviceRememberedStatusTypeRemembered,
    AWSCognitoIdentityProviderDeviceRememberedStatusTypeNotRemembered,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderDomainStatusType) {
    AWSCognitoIdentityProviderDomainStatusTypeUnknown,
    AWSCognitoIdentityProviderDomainStatusTypeCreating,
    AWSCognitoIdentityProviderDomainStatusTypeDeleting,
    AWSCognitoIdentityProviderDomainStatusTypeUpdating,
    AWSCognitoIdentityProviderDomainStatusTypeActive,
    AWSCognitoIdentityProviderDomainStatusTypeFailed,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderEventFilterType) {
    AWSCognitoIdentityProviderEventFilterTypeUnknown,
    AWSCognitoIdentityProviderEventFilterTypeSignIn,
    AWSCognitoIdentityProviderEventFilterTypePasswordChange,
    AWSCognitoIdentityProviderEventFilterTypeSignUp,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderEventResponseType) {
    AWSCognitoIdentityProviderEventResponseTypeUnknown,
    AWSCognitoIdentityProviderEventResponseTypeSuccess,
    AWSCognitoIdentityProviderEventResponseTypeFailure,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderEventType) {
    AWSCognitoIdentityProviderEventTypeUnknown,
    AWSCognitoIdentityProviderEventTypeSignIn,
    AWSCognitoIdentityProviderEventTypeSignUp,
    AWSCognitoIdentityProviderEventTypeForgotPassword,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderExplicitAuthFlowsType) {
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeUnknown,
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeAdminNoSrpAuth,
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeCustomAuthFlowOnly,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderFeedbackValueType) {
    AWSCognitoIdentityProviderFeedbackValueTypeUnknown,
    AWSCognitoIdentityProviderFeedbackValueTypeValid,
    AWSCognitoIdentityProviderFeedbackValueTypeInvalid,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderIdentityProviderTypeType) {
    AWSCognitoIdentityProviderIdentityProviderTypeTypeUnknown,
    AWSCognitoIdentityProviderIdentityProviderTypeTypeSaml,
    AWSCognitoIdentityProviderIdentityProviderTypeTypeFacebook,
    AWSCognitoIdentityProviderIdentityProviderTypeTypeGoogle,
    AWSCognitoIdentityProviderIdentityProviderTypeTypeLoginWithAmazon,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderMessageActionType) {
    AWSCognitoIdentityProviderMessageActionTypeUnknown,
    AWSCognitoIdentityProviderMessageActionTypeResend,
    AWSCognitoIdentityProviderMessageActionTypeSuppress,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderOAuthFlowType) {
    AWSCognitoIdentityProviderOAuthFlowTypeUnknown,
    AWSCognitoIdentityProviderOAuthFlowTypeCode,
    AWSCognitoIdentityProviderOAuthFlowTypeImplicit,
    AWSCognitoIdentityProviderOAuthFlowTypeClientCredentials,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderRiskDecisionType) {
    AWSCognitoIdentityProviderRiskDecisionTypeUnknown,
    AWSCognitoIdentityProviderRiskDecisionTypeNoRisk,
    AWSCognitoIdentityProviderRiskDecisionTypeAccountTakeover,
    AWSCognitoIdentityProviderRiskDecisionTypeBlock,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderRiskLevelType) {
    AWSCognitoIdentityProviderRiskLevelTypeUnknown,
    AWSCognitoIdentityProviderRiskLevelTypeLow,
    AWSCognitoIdentityProviderRiskLevelTypeMedium,
    AWSCognitoIdentityProviderRiskLevelTypeHigh,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderStatusType) {
    AWSCognitoIdentityProviderStatusTypeUnknown,
    AWSCognitoIdentityProviderStatusTypeEnabled,
    AWSCognitoIdentityProviderStatusTypeDisabled,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderUserImportJobStatusType) {
    AWSCognitoIdentityProviderUserImportJobStatusTypeUnknown,
    AWSCognitoIdentityProviderUserImportJobStatusTypeCreated,
    AWSCognitoIdentityProviderUserImportJobStatusTypePending,
    AWSCognitoIdentityProviderUserImportJobStatusTypeInProgress,
    AWSCognitoIdentityProviderUserImportJobStatusTypeStopping,
    AWSCognitoIdentityProviderUserImportJobStatusTypeExpired,
    AWSCognitoIdentityProviderUserImportJobStatusTypeStopped,
    AWSCognitoIdentityProviderUserImportJobStatusTypeFailed,
    AWSCognitoIdentityProviderUserImportJobStatusTypeSucceeded,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderUserPoolMfaType) {
    AWSCognitoIdentityProviderUserPoolMfaTypeUnknown,
    AWSCognitoIdentityProviderUserPoolMfaTypeOff,
    AWSCognitoIdentityProviderUserPoolMfaTypeOn,
    AWSCognitoIdentityProviderUserPoolMfaTypeOptional,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderUserStatusType) {
    AWSCognitoIdentityProviderUserStatusTypeUnknown,
    AWSCognitoIdentityProviderUserStatusTypeUnconfirmed,
    AWSCognitoIdentityProviderUserStatusTypeConfirmed,
    AWSCognitoIdentityProviderUserStatusTypeArchived,
    AWSCognitoIdentityProviderUserStatusTypeCompromised,
    AWSCognitoIdentityProviderUserStatusTypeResetRequired,
    AWSCognitoIdentityProviderUserStatusTypeForceChangePassword,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderUsernameAttributeType) {
    AWSCognitoIdentityProviderUsernameAttributeTypeUnknown,
    AWSCognitoIdentityProviderUsernameAttributeTypePhoneNumber,
    AWSCognitoIdentityProviderUsernameAttributeTypeEmail,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderVerifiedAttributeType) {
    AWSCognitoIdentityProviderVerifiedAttributeTypeUnknown,
    AWSCognitoIdentityProviderVerifiedAttributeTypePhoneNumber,
    AWSCognitoIdentityProviderVerifiedAttributeTypeEmail,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderVerifySoftwareTokenResponseType) {
    AWSCognitoIdentityProviderVerifySoftwareTokenResponseTypeUnknown,
    AWSCognitoIdentityProviderVerifySoftwareTokenResponseTypeSuccess,
    AWSCognitoIdentityProviderVerifySoftwareTokenResponseTypeError,
};

@class AWSCognitoIdentityProviderAccountTakeoverActionType;
@class AWSCognitoIdentityProviderAccountTakeoverActionsType;
@class AWSCognitoIdentityProviderAccountTakeoverRiskConfigurationType;
@class AWSCognitoIdentityProviderAddCustomAttributesRequest;
@class AWSCognitoIdentityProviderAddCustomAttributesResponse;
@class AWSCognitoIdentityProviderAdminAddUserToGroupRequest;
@class AWSCognitoIdentityProviderAdminConfirmSignUpRequest;
@class AWSCognitoIdentityProviderAdminConfirmSignUpResponse;
@class AWSCognitoIdentityProviderAdminCreateUserConfigType;
@class AWSCognitoIdentityProviderAdminCreateUserRequest;
@class AWSCognitoIdentityProviderAdminCreateUserResponse;
@class AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest;
@class AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse;
@class AWSCognitoIdentityProviderAdminDeleteUserRequest;
@class AWSCognitoIdentityProviderAdminDisableProviderForUserRequest;
@class AWSCognitoIdentityProviderAdminDisableProviderForUserResponse;
@class AWSCognitoIdentityProviderAdminDisableUserRequest;
@class AWSCognitoIdentityProviderAdminDisableUserResponse;
@class AWSCognitoIdentityProviderAdminEnableUserRequest;
@class AWSCognitoIdentityProviderAdminEnableUserResponse;
@class AWSCognitoIdentityProviderAdminForgetDeviceRequest;
@class AWSCognitoIdentityProviderAdminGetDeviceRequest;
@class AWSCognitoIdentityProviderAdminGetDeviceResponse;
@class AWSCognitoIdentityProviderAdminGetUserRequest;
@class AWSCognitoIdentityProviderAdminGetUserResponse;
@class AWSCognitoIdentityProviderAdminInitiateAuthRequest;
@class AWSCognitoIdentityProviderAdminInitiateAuthResponse;
@class AWSCognitoIdentityProviderAdminLinkProviderForUserRequest;
@class AWSCognitoIdentityProviderAdminLinkProviderForUserResponse;
@class AWSCognitoIdentityProviderAdminListDevicesRequest;
@class AWSCognitoIdentityProviderAdminListDevicesResponse;
@class AWSCognitoIdentityProviderAdminListGroupsForUserRequest;
@class AWSCognitoIdentityProviderAdminListGroupsForUserResponse;
@class AWSCognitoIdentityProviderAdminListUserAuthEventsRequest;
@class AWSCognitoIdentityProviderAdminListUserAuthEventsResponse;
@class AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest;
@class AWSCognitoIdentityProviderAdminResetUserPasswordRequest;
@class AWSCognitoIdentityProviderAdminResetUserPasswordResponse;
@class AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest;
@class AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse;
@class AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest;
@class AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse;
@class AWSCognitoIdentityProviderAdminSetUserSettingsRequest;
@class AWSCognitoIdentityProviderAdminSetUserSettingsResponse;
@class AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest;
@class AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse;
@class AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest;
@class AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse;
@class AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest;
@class AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse;
@class AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest;
@class AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse;
@class AWSCognitoIdentityProviderAnalyticsConfigurationType;
@class AWSCognitoIdentityProviderAnalyticsMetadataType;
@class AWSCognitoIdentityProviderAssociateSoftwareTokenRequest;
@class AWSCognitoIdentityProviderAssociateSoftwareTokenResponse;
@class AWSCognitoIdentityProviderAttributeType;
@class AWSCognitoIdentityProviderAuthEventType;
@class AWSCognitoIdentityProviderAuthenticationResultType;
@class AWSCognitoIdentityProviderChallengeResponseType;
@class AWSCognitoIdentityProviderChangePasswordRequest;
@class AWSCognitoIdentityProviderChangePasswordResponse;
@class AWSCognitoIdentityProviderCodeDeliveryDetailsType;
@class AWSCognitoIdentityProviderCompromisedCredentialsActionsType;
@class AWSCognitoIdentityProviderCompromisedCredentialsRiskConfigurationType;
@class AWSCognitoIdentityProviderConfirmDeviceRequest;
@class AWSCognitoIdentityProviderConfirmDeviceResponse;
@class AWSCognitoIdentityProviderConfirmForgotPasswordRequest;
@class AWSCognitoIdentityProviderConfirmForgotPasswordResponse;
@class AWSCognitoIdentityProviderConfirmSignUpRequest;
@class AWSCognitoIdentityProviderConfirmSignUpResponse;
@class AWSCognitoIdentityProviderContextDataType;
@class AWSCognitoIdentityProviderCreateGroupRequest;
@class AWSCognitoIdentityProviderCreateGroupResponse;
@class AWSCognitoIdentityProviderCreateIdentityProviderRequest;
@class AWSCognitoIdentityProviderCreateIdentityProviderResponse;
@class AWSCognitoIdentityProviderCreateResourceServerRequest;
@class AWSCognitoIdentityProviderCreateResourceServerResponse;
@class AWSCognitoIdentityProviderCreateUserImportJobRequest;
@class AWSCognitoIdentityProviderCreateUserImportJobResponse;
@class AWSCognitoIdentityProviderCreateUserPoolClientRequest;
@class AWSCognitoIdentityProviderCreateUserPoolClientResponse;
@class AWSCognitoIdentityProviderCreateUserPoolDomainRequest;
@class AWSCognitoIdentityProviderCreateUserPoolDomainResponse;
@class AWSCognitoIdentityProviderCreateUserPoolRequest;
@class AWSCognitoIdentityProviderCreateUserPoolResponse;
@class AWSCognitoIdentityProviderDeleteGroupRequest;
@class AWSCognitoIdentityProviderDeleteIdentityProviderRequest;
@class AWSCognitoIdentityProviderDeleteResourceServerRequest;
@class AWSCognitoIdentityProviderDeleteUserAttributesRequest;
@class AWSCognitoIdentityProviderDeleteUserAttributesResponse;
@class AWSCognitoIdentityProviderDeleteUserPoolClientRequest;
@class AWSCognitoIdentityProviderDeleteUserPoolDomainRequest;
@class AWSCognitoIdentityProviderDeleteUserPoolDomainResponse;
@class AWSCognitoIdentityProviderDeleteUserPoolRequest;
@class AWSCognitoIdentityProviderDeleteUserRequest;
@class AWSCognitoIdentityProviderDescribeIdentityProviderRequest;
@class AWSCognitoIdentityProviderDescribeIdentityProviderResponse;
@class AWSCognitoIdentityProviderDescribeResourceServerRequest;
@class AWSCognitoIdentityProviderDescribeResourceServerResponse;
@class AWSCognitoIdentityProviderDescribeRiskConfigurationRequest;
@class AWSCognitoIdentityProviderDescribeRiskConfigurationResponse;
@class AWSCognitoIdentityProviderDescribeUserImportJobRequest;
@class AWSCognitoIdentityProviderDescribeUserImportJobResponse;
@class AWSCognitoIdentityProviderDescribeUserPoolClientRequest;
@class AWSCognitoIdentityProviderDescribeUserPoolClientResponse;
@class AWSCognitoIdentityProviderDescribeUserPoolDomainRequest;
@class AWSCognitoIdentityProviderDescribeUserPoolDomainResponse;
@class AWSCognitoIdentityProviderDescribeUserPoolRequest;
@class AWSCognitoIdentityProviderDescribeUserPoolResponse;
@class AWSCognitoIdentityProviderDeviceConfigurationType;
@class AWSCognitoIdentityProviderDeviceSecretVerifierConfigType;
@class AWSCognitoIdentityProviderDeviceType;
@class AWSCognitoIdentityProviderDomainDescriptionType;
@class AWSCognitoIdentityProviderEmailConfigurationType;
@class AWSCognitoIdentityProviderEventContextDataType;
@class AWSCognitoIdentityProviderEventFeedbackType;
@class AWSCognitoIdentityProviderEventRiskType;
@class AWSCognitoIdentityProviderForgetDeviceRequest;
@class AWSCognitoIdentityProviderForgotPasswordRequest;
@class AWSCognitoIdentityProviderForgotPasswordResponse;
@class AWSCognitoIdentityProviderGetCSVHeaderRequest;
@class AWSCognitoIdentityProviderGetCSVHeaderResponse;
@class AWSCognitoIdentityProviderGetDeviceRequest;
@class AWSCognitoIdentityProviderGetDeviceResponse;
@class AWSCognitoIdentityProviderGetGroupRequest;
@class AWSCognitoIdentityProviderGetGroupResponse;
@class AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest;
@class AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse;
@class AWSCognitoIdentityProviderGetUICustomizationRequest;
@class AWSCognitoIdentityProviderGetUICustomizationResponse;
@class AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest;
@class AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse;
@class AWSCognitoIdentityProviderGetUserPoolMfaConfigRequest;
@class AWSCognitoIdentityProviderGetUserPoolMfaConfigResponse;
@class AWSCognitoIdentityProviderGetUserRequest;
@class AWSCognitoIdentityProviderGetUserResponse;
@class AWSCognitoIdentityProviderGlobalSignOutRequest;
@class AWSCognitoIdentityProviderGlobalSignOutResponse;
@class AWSCognitoIdentityProviderGroupType;
@class AWSCognitoIdentityProviderHttpHeader;
@class AWSCognitoIdentityProviderIdentityProviderType;
@class AWSCognitoIdentityProviderInitiateAuthRequest;
@class AWSCognitoIdentityProviderInitiateAuthResponse;
@class AWSCognitoIdentityProviderLambdaConfigType;
@class AWSCognitoIdentityProviderListDevicesRequest;
@class AWSCognitoIdentityProviderListDevicesResponse;
@class AWSCognitoIdentityProviderListGroupsRequest;
@class AWSCognitoIdentityProviderListGroupsResponse;
@class AWSCognitoIdentityProviderListIdentityProvidersRequest;
@class AWSCognitoIdentityProviderListIdentityProvidersResponse;
@class AWSCognitoIdentityProviderListResourceServersRequest;
@class AWSCognitoIdentityProviderListResourceServersResponse;
@class AWSCognitoIdentityProviderListUserImportJobsRequest;
@class AWSCognitoIdentityProviderListUserImportJobsResponse;
@class AWSCognitoIdentityProviderListUserPoolClientsRequest;
@class AWSCognitoIdentityProviderListUserPoolClientsResponse;
@class AWSCognitoIdentityProviderListUserPoolsRequest;
@class AWSCognitoIdentityProviderListUserPoolsResponse;
@class AWSCognitoIdentityProviderListUsersInGroupRequest;
@class AWSCognitoIdentityProviderListUsersInGroupResponse;
@class AWSCognitoIdentityProviderListUsersRequest;
@class AWSCognitoIdentityProviderListUsersResponse;
@class AWSCognitoIdentityProviderMFAOptionType;
@class AWSCognitoIdentityProviderMessageTemplateType;
@class AWSCognitoIdentityProviderLatestDeviceMetadataType;
@class AWSCognitoIdentityProviderNotifyConfigurationType;
@class AWSCognitoIdentityProviderNotifyEmailType;
@class AWSCognitoIdentityProviderNumberAttributeConstraintsType;
@class AWSCognitoIdentityProviderPasswordPolicyType;
@class AWSCognitoIdentityProviderProviderDescription;
@class AWSCognitoIdentityProviderProviderUserIdentifierType;
@class AWSCognitoIdentityProviderResendConfirmationCodeRequest;
@class AWSCognitoIdentityProviderResendConfirmationCodeResponse;
@class AWSCognitoIdentityProviderResourceServerScopeType;
@class AWSCognitoIdentityProviderResourceServerType;
@class AWSCognitoIdentityProviderRespondToAuthChallengeRequest;
@class AWSCognitoIdentityProviderRespondToAuthChallengeResponse;
@class AWSCognitoIdentityProviderRiskConfigurationType;
@class AWSCognitoIdentityProviderRiskExceptionConfigurationType;
@class AWSCognitoIdentityProviderSMSMfaSettingsType;
@class AWSCognitoIdentityProviderSchemaAttributeType;
@class AWSCognitoIdentityProviderSetRiskConfigurationRequest;
@class AWSCognitoIdentityProviderSetRiskConfigurationResponse;
@class AWSCognitoIdentityProviderSetUICustomizationRequest;
@class AWSCognitoIdentityProviderSetUICustomizationResponse;
@class AWSCognitoIdentityProviderSetUserMFAPreferenceRequest;
@class AWSCognitoIdentityProviderSetUserMFAPreferenceResponse;
@class AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest;
@class AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse;
@class AWSCognitoIdentityProviderSetUserSettingsRequest;
@class AWSCognitoIdentityProviderSetUserSettingsResponse;
@class AWSCognitoIdentityProviderSignUpRequest;
@class AWSCognitoIdentityProviderSignUpResponse;
@class AWSCognitoIdentityProviderSmsConfigurationType;
@class AWSCognitoIdentityProviderSmsMfaConfigType;
@class AWSCognitoIdentityProviderSoftwareTokenMfaConfigType;
@class AWSCognitoIdentityProviderSoftwareTokenMfaSettingsType;
@class AWSCognitoIdentityProviderStartUserImportJobRequest;
@class AWSCognitoIdentityProviderStartUserImportJobResponse;
@class AWSCognitoIdentityProviderStopUserImportJobRequest;
@class AWSCognitoIdentityProviderStopUserImportJobResponse;
@class AWSCognitoIdentityProviderStringAttributeConstraintsType;
@class AWSCognitoIdentityProviderUICustomizationType;
@class AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest;
@class AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse;
@class AWSCognitoIdentityProviderUpdateDeviceStatusRequest;
@class AWSCognitoIdentityProviderUpdateDeviceStatusResponse;
@class AWSCognitoIdentityProviderUpdateGroupRequest;
@class AWSCognitoIdentityProviderUpdateGroupResponse;
@class AWSCognitoIdentityProviderUpdateIdentityProviderRequest;
@class AWSCognitoIdentityProviderUpdateIdentityProviderResponse;
@class AWSCognitoIdentityProviderUpdateResourceServerRequest;
@class AWSCognitoIdentityProviderUpdateResourceServerResponse;
@class AWSCognitoIdentityProviderUpdateUserAttributesRequest;
@class AWSCognitoIdentityProviderUpdateUserAttributesResponse;
@class AWSCognitoIdentityProviderUpdateUserPoolClientRequest;
@class AWSCognitoIdentityProviderUpdateUserPoolClientResponse;
@class AWSCognitoIdentityProviderUpdateUserPoolRequest;
@class AWSCognitoIdentityProviderUpdateUserPoolResponse;
@class AWSCognitoIdentityProviderUserContextDataType;
@class AWSCognitoIdentityProviderUserImportJobType;
@class AWSCognitoIdentityProviderUserPoolAddOnsType;
@class AWSCognitoIdentityProviderUserPoolClientDescription;
@class AWSCognitoIdentityProviderUserPoolClientType;
@class AWSCognitoIdentityProviderUserPoolDescriptionType;
@class AWSCognitoIdentityProviderUserPoolPolicyType;
@class AWSCognitoIdentityProviderUserPoolType;
@class AWSCognitoIdentityProviderUserType;
@class AWSCognitoIdentityProviderVerificationMessageTemplateType;
@class AWSCognitoIdentityProviderVerifySoftwareTokenRequest;
@class AWSCognitoIdentityProviderVerifySoftwareTokenResponse;
@class AWSCognitoIdentityProviderVerifyUserAttributeRequest;
@class AWSCognitoIdentityProviderVerifyUserAttributeResponse;

/**
 
 */
@interface AWSCognitoIdentityProviderAccountTakeoverActionType : AWSModel


/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderAccountTakeoverEventActionType eventAction;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable notify;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAccountTakeoverActionsType : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountTakeoverActionType * _Nullable highAction;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountTakeoverActionType * _Nullable lowAction;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountTakeoverActionType * _Nullable mediumAction;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAccountTakeoverRiskConfigurationType : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountTakeoverActionsType * _Nullable actions;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderNotifyConfigurationType * _Nullable notifyConfiguration;

@end

/**
 <p>Represents the request to add custom attributes.</p>
 Required parameters: [UserPoolId, CustomAttributes]
 */
@interface AWSCognitoIdentityProviderAddCustomAttributesRequest : AWSRequest


/**
 <p>An array of custom attributes, such as Mutable and Name.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderSchemaAttributeType *> * _Nullable customAttributes;

/**
 <p>The user pool ID for the user pool where you want to add custom attributes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the response from the server for the request to add custom attributes.</p>
 */
@interface AWSCognitoIdentityProviderAddCustomAttributesResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminAddUserToGroupRequest : AWSRequest


/**
 <p>The group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the request to confirm user registration.</p>
 Required parameters: [UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminConfirmSignUpRequest : AWSRequest


/**
 <p>The user pool ID for which you want to confirm user registration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The user name for which you want to confirm user registration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the response from the server for the request to confirm registration.</p>
 */
@interface AWSCognitoIdentityProviderAdminConfirmSignUpResponse : AWSModel


@end

/**
 <p>The configuration for creating a new user profile.</p>
 */
@interface AWSCognitoIdentityProviderAdminCreateUserConfigType : AWSModel


/**
 <p>Set to <code>True</code> if only the administrator is allowed to create user profiles. Set to <code>False</code> if users can sign themselves up via an app.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowAdminCreateUserOnly;

/**
 <p>The message template to be used for the welcome message to new users.</p><p>See also <a href="http://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-message-customizations.html#cognito-user-pool-settings-user-invitation-message-customization">Customizing User Invitation Messages</a>.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderMessageTemplateType * _Nullable inviteMessageTemplate;

/**
 <p>The user account expiration limit, in days, after which the account is no longer usable. To reset the account after that time limit, you must call <code>AdminCreateUser</code> again, specifying <code>"RESEND"</code> for the <code>MessageAction</code> parameter. The default value for this parameter is 7.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unusedAccountValidityDays;

@end

/**
 <p>Represents the request to create a user in the specified user pool.</p>
 Required parameters: [UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminCreateUserRequest : AWSRequest


/**
 <p>Specify <code>"EMAIL"</code> if email will be used to send the welcome message. Specify <code>"SMS"</code> if the phone number will be used. The default value is <code>"SMS"</code>. More than one value can be specified.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable desiredDeliveryMediums;

/**
 <p>This parameter is only used if the <code>phone_number_verified</code> or <code>email_verified</code> attribute is set to <code>True</code>. Otherwise, it is ignored.</p><p>If this parameter is set to <code>True</code> and the phone number or email address specified in the UserAttributes parameter already exists as an alias with a different user, the API call will migrate the alias from the previous user to the newly created user. The previous user will no longer be able to log in using that alias.</p><p>If this parameter is set to <code>False</code>, the API throws an <code>AliasExistsException</code> error if the alias already exists. The default value is <code>False</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceAliasCreation;

/**
 <p>Set to <code>"RESEND"</code> to resend the invitation message to a user that already exists and reset the expiration limit on the user's account. Set to <code>"SUPPRESS"</code> to suppress sending the message. Only one value can be specified.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderMessageActionType messageAction;

/**
 <p>The user's temporary password. This password must conform to the password policy that you specified when you created the user pool.</p><p>The temporary password is valid only once. To complete the Admin Create User flow, the user must enter the temporary password in the sign-in page along with a new password to be used in all future sign-ins.</p><p>This parameter is not required. If you do not specify a value, Amazon Cognito generates one for you.</p><p>The temporary password can only be used until the user account expiration limit that you specified when you created the user pool. To reset the account after that time limit, you must call <code>AdminCreateUser</code> again, specifying <code>"RESEND"</code> for the <code>MessageAction</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable temporaryPassword;

/**
 <p>An array of name-value pairs that contain user attributes and attribute values to be set for the user to be created. You can create a user without specifying any attributes other than <code>Username</code>. However, any attributes that you specify as required (in or in the <b>Attributes</b> tab of the console) must be supplied either by you (in your call to <code>AdminCreateUser</code>) or by the user (when he or she signs up in response to your welcome message).</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p><p>To send a message inviting the user to sign up, you must specify the user's email address or phone number. This can be done in your call to AdminCreateUser or in the <b>Users</b> tab of the Amazon Cognito console for managing your user pools.</p><p>In your call to <code>AdminCreateUser</code>, you can set the <code>email_verified</code> attribute to <code>True</code>, and you can set the <code>phone_number_verified</code> attribute to <code>True</code>. (You can also do this by calling .)</p><ul><li><p><b>email</b>: The email address of the user to whom the message that contains the code and username will be sent. Required if the <code>email_verified</code> attribute is set to <code>True</code>, or if <code>"EMAIL"</code> is specified in the <code>DesiredDeliveryMediums</code> parameter.</p></li><li><p><b>phone_number</b>: The phone number of the user to whom the message that contains the code and username will be sent. Required if the <code>phone_number_verified</code> attribute is set to <code>True</code>, or if <code>"SMS"</code> is specified in the <code>DesiredDeliveryMediums</code> parameter.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

/**
 <p>The user pool ID for the user pool where the user will be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username for the user. Must be unique within the user pool. Must be a UTF-8 string between 1 and 128 characters. After the user is created, the username cannot be changed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

/**
 <p>The user's validation data. This is an array of name-value pairs that contain user attributes and attribute values that you can use for custom validation, such as restricting the types of user accounts that can be registered. For example, you might choose to allow or disallow user sign-up based on the user's domain.</p><p>To configure custom validation, you must create a Pre Sign-up Lambda trigger for the user pool as described in the Amazon Cognito Developer Guide. The Lambda trigger receives the validation data and uses it in the validation process.</p><p>The user's validation data is not persisted.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable validationData;

@end

/**
 <p>Represents the response from the server to the request to create the user.</p>
 */
@interface AWSCognitoIdentityProviderAdminCreateUserResponse : AWSModel


/**
 <p>The newly created user.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserType * _Nullable user;

@end

/**
 <p>Represents the request to delete user attributes as an administrator.</p>
 Required parameters: [UserPoolId, Username, UserAttributeNames]
 */
@interface AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest : AWSRequest


/**
 <p>An array of strings representing the user attribute names you wish to delete.</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userAttributeNames;

/**
 <p>The user pool ID for the user pool where you want to delete user attributes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The user name of the user from which you would like to delete attributes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the response received from the server for a request to delete user attributes.</p>
 */
@interface AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse : AWSModel


@end

/**
 <p>Represents the request to delete a user as an administrator.</p>
 Required parameters: [UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminDeleteUserRequest : AWSRequest


/**
 <p>The user pool ID for the user pool where you want to delete the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The user name of the user you wish to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminDisableProviderForUserRequest : AWSRequest


/**
 <p>The user to be disabled.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderProviderUserIdentifierType * _Nullable user;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminDisableProviderForUserResponse : AWSModel


@end

/**
 <p>Represents the request to disable any user as an administrator.</p>
 Required parameters: [UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminDisableUserRequest : AWSRequest


/**
 <p>The user pool ID for the user pool where you want to disable the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The user name of the user you wish to disable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the response received from the server to disable the user as an administrator.</p>
 */
@interface AWSCognitoIdentityProviderAdminDisableUserResponse : AWSModel


@end

/**
 <p>Represents the request that enables the user as an administrator.</p>
 Required parameters: [UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminEnableUserRequest : AWSRequest


/**
 <p>The user pool ID for the user pool where you want to enable the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The user name of the user you wish to enable.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the response from the server for the request to enable a user as an administrator.</p>
 */
@interface AWSCognitoIdentityProviderAdminEnableUserResponse : AWSModel


@end

/**
 <p>Sends the forgot device request, as an administrator.</p>
 Required parameters: [UserPoolId, Username, DeviceKey]
 */
@interface AWSCognitoIdentityProviderAdminForgetDeviceRequest : AWSRequest


/**
 <p>The device key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceKey;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The user name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the request to get the device, as an administrator.</p>
 Required parameters: [DeviceKey, UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminGetDeviceRequest : AWSRequest


/**
 <p>The device key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceKey;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The user name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Gets the device response, as an administrator.</p>
 Required parameters: [Device]
 */
@interface AWSCognitoIdentityProviderAdminGetDeviceResponse : AWSModel


/**
 <p>The device.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderDeviceType * _Nullable device;

@end

/**
 <p>Represents the request to get the specified user as an administrator.</p>
 Required parameters: [UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminGetUserRequest : AWSRequest


/**
 <p>The user pool ID for the user pool where you want to get information about the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The user name of the user you wish to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the response from the server from the request to get the specified user as an administrator.</p>
 Required parameters: [Username]
 */
@interface AWSCognitoIdentityProviderAdminGetUserResponse : AWSModel


/**
 <p>Indicates that the status is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Specifies the options for MFA (e.g., email or phone number).</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderMFAOptionType *> * _Nullable MFAOptions;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable preferredMfaSetting;

/**
 <p>An array of name-value pairs representing user attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

/**
 <p>The date the user was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable userCreateDate;

/**
 <p>The date the user was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable userLastModifiedDate;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userMFASettingList;

/**
 <p>The user status. Can be one of the following:</p><ul><li><p>UNCONFIRMED - User has been created but not confirmed.</p></li><li><p>CONFIRMED - User has been confirmed.</p></li><li><p>ARCHIVED - User is no longer active.</p></li><li><p>COMPROMISED - User is disabled due to a potential security threat.</p></li><li><p>UNKNOWN - User status is not known.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserStatusType userStatus;

/**
 <p>The user name of the user about whom you are receiving information.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Initiates the authorization request, as an administrator.</p>
 Required parameters: [UserPoolId, ClientId, AuthFlow]
 */
@interface AWSCognitoIdentityProviderAdminInitiateAuthRequest : AWSRequest


/**
 <p>The analytics metadata for collecting Amazon Pinpoint metrics for <code>AdminInitiateAuth</code> calls.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

/**
 <p>The authentication flow for this call to execute. The API action will depend on this value. For example:</p><ul><li><p><code>REFRESH_TOKEN_AUTH</code> will take in a valid refresh token and return new tokens.</p></li><li><p><code>USER_SRP_AUTH</code> will take in <code>USERNAME</code> and <code>SRP_A</code> and return the SRP variables to be used for next challenge execution.</p></li></ul><p>Valid values include:</p><ul><li><p><code>USER_SRP_AUTH</code>: Authentication flow for the Secure Remote Password (SRP) protocol.</p></li><li><p><code>REFRESH_TOKEN_AUTH</code>/<code>REFRESH_TOKEN</code>: Authentication flow for refreshing the access token and ID token by supplying a valid refresh token.</p></li><li><p><code>CUSTOM_AUTH</code>: Custom authentication flow.</p></li><li><p><code>ADMIN_NO_SRP_AUTH</code>: Non-SRP authentication flow; you can pass in the USERNAME and PASSWORD directly if the flow is enabled for calling the app client.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderAuthFlowType authFlow;

/**
 <p>The authentication parameters. These are inputs corresponding to the <code>AuthFlow</code> that you are invoking. The required values depend on the value of <code>AuthFlow</code>:</p><ul><li><p>For <code>USER_SRP_AUTH</code>: <code>USERNAME</code> (required), <code>SRP_A</code> (required), <code>SECRET_HASH</code> (required if the app client is configured with a client secret), <code>DEVICE_KEY</code></p></li><li><p>For <code>REFRESH_TOKEN_AUTH/REFRESH_TOKEN</code>: <code>USERNAME</code> (required), <code>SECRET_HASH</code> (required if the app client is configured with a client secret), <code>REFRESH_TOKEN</code> (required), <code>DEVICE_KEY</code></p></li><li><p>For <code>ADMIN_NO_SRP_AUTH</code>: <code>USERNAME</code> (required), <code>SECRET_HASH</code> (if app client is configured with client secret), <code>PASSWORD</code> (required), <code>DEVICE_KEY</code></p></li><li><p>For <code>CUSTOM_AUTH</code>: <code>USERNAME</code> (required), <code>SECRET_HASH</code> (if app client is configured with client secret), <code>DEVICE_KEY</code></p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable authParameters;

/**
 <p>The app client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>This is a random key-value pair map which can contain any key and will be passed to your PreAuthentication Lambda trigger as-is. It can be used to implement additional validations around authentication.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderContextDataType * _Nullable contextData;

/**
 <p>The ID of the Amazon Cognito user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Initiates the authentication response, as an administrator.</p>
 */
@interface AWSCognitoIdentityProviderAdminInitiateAuthResponse : AWSModel


/**
 <p>The result of the authentication response. This is only returned if the caller does not need to pass another challenge. If the caller does need to pass another challenge before it gets tokens, <code>ChallengeName</code>, <code>ChallengeParameters</code>, and <code>Session</code> are returned.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAuthenticationResultType * _Nullable authenticationResult;

/**
 <p>The name of the challenge which you are responding to with this call. This is returned to you in the <code>AdminInitiateAuth</code> response if you need to pass another challenge.</p><ul><li><p><code>SMS_MFA</code>: Next challenge is to supply an <code>SMS_MFA_CODE</code>, delivered via SMS.</p></li><li><p><code>PASSWORD_VERIFIER</code>: Next challenge is to supply <code>PASSWORD_CLAIM_SIGNATURE</code>, <code>PASSWORD_CLAIM_SECRET_BLOCK</code>, and <code>TIMESTAMP</code> after the client-side SRP calculations.</p></li><li><p><code>CUSTOM_CHALLENGE</code>: This is returned if your custom authentication flow determines that the user should pass another challenge before tokens are issued.</p></li><li><p><code>DEVICE_SRP_AUTH</code>: If device tracking was enabled on your user pool and the previous challenges were passed, this challenge is returned so that Amazon Cognito can start tracking this device.</p></li><li><p><code>DEVICE_PASSWORD_VERIFIER</code>: Similar to <code>PASSWORD_VERIFIER</code>, but for devices only.</p></li><li><p><code>ADMIN_NO_SRP_AUTH</code>: This is returned if you need to authenticate with <code>USERNAME</code> and <code>PASSWORD</code> directly. An app client must be enabled to use this flow.</p></li><li><p><code>NEW_PASSWORD_REQUIRED</code>: For users which are required to change their passwords after successful first login. This challenge should be passed with <code>NEW_PASSWORD</code> and any other required attributes.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge parameters. These are returned to you in the <code>AdminInitiateAuth</code> response if you need to pass another challenge. The responses in this parameter should be used to compute inputs to the next call (<code>AdminRespondToAuthChallenge</code>).</p><p>All challenges require <code>USERNAME</code> and <code>SECRET_HASH</code> (if applicable).</p><p>The value of the <code>USER_IF_FOR_SRP</code> attribute will be the user's actual username, not an alias (such as email address or phone number), even if you specified an alias in your call to <code>AdminInitiateAuth</code>. This is because, in the <code>AdminRespondToAuthChallenge</code> API <code>ChallengeResponses</code>, the <code>USERNAME</code> attribute cannot be an alias.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeParameters;

/**
 <p>The session which should be passed both ways in challenge-response calls to the service. If <code>AdminInitiateAuth</code> or <code>AdminRespondToAuthChallenge</code> API call determines that the caller needs to go through another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>AdminRespondToAuthChallenge</code> API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminLinkProviderForUserRequest : AWSRequest


/**
 <p>The existing user in the user pool to be linked to the external identity provider user account. Can be a native (Username + Password) Cognito User Pools user or a federated user (for example, a SAML or Facebook user). If the user doesn't exist, an exception is thrown. This is the user that is returned when the new user (with the linked identity provider attribute) signs in.</p><p>For a native username + password user, the <code>ProviderAttributeValue</code> for the <code>DestinationUser</code> should be the username in the user pool. For a federated user, it should be the provider-specific <code>user_id</code>.</p><p>The <code>ProviderAttributeName</code> of the <code>DestinationUser</code> is ignored.</p><p>The <code>ProviderName</code> should be set to <code>Cognito</code> for users in Cognito user pools.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderProviderUserIdentifierType * _Nullable destinationUser;

/**
 <p>An external identity provider account for a user who does not currently exist yet in the user pool. This user must be a federated user (for example, a SAML or Facebook user), not another native user.</p><p>If the <code>SourceUser</code> is a federated social identity provider user (Facebook, Google, or Login with Amazon), you must set the <code>ProviderAttributeName</code> to <code>Cognito_Subject</code>. For social identity providers, the <code>ProviderName</code> will be <code>Facebook</code>, <code>Google</code>, or <code>LoginWithAmazon</code>, and Cognito will automatically parse the Facebook, Google, and Login with Amazon tokens for <code>id</code>, <code>sub</code>, and <code>user_id</code>, respectively. The <code>ProviderAttributeValue</code> for the user must be the same value as the <code>id</code>, <code>sub</code>, or <code>user_id</code> value found in the social identity provider token.</p><p/><p>For SAML, the <code>ProviderAttributeName</code> can be any value that matches a claim in the SAML assertion. If you wish to link SAML users based on the subject of the SAML assertion, you should map the subject to a claim through the SAML identity provider and submit that claim name as the <code>ProviderAttributeName</code>. If you set <code>ProviderAttributeName</code> to <code>Cognito_Subject</code>, Cognito will automatically parse the default unique identifier found in the subject from the SAML token.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderProviderUserIdentifierType * _Nullable sourceUser;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminLinkProviderForUserResponse : AWSModel


@end

/**
 <p>Represents the request to list devices, as an administrator.</p>
 Required parameters: [UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminListDevicesRequest : AWSRequest


/**
 <p>The limit of the devices request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The pagination token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The user name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Lists the device's response, as an administrator.</p>
 */
@interface AWSCognitoIdentityProviderAdminListDevicesResponse : AWSModel


/**
 <p>The devices in the list of devices response.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderDeviceType *> * _Nullable devices;

/**
 <p>The pagination token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminListGroupsForUserRequest : AWSRequest


/**
 <p>The limit of the request to list groups.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminListGroupsForUserResponse : AWSModel


/**
 <p>The groups that the user belongs to.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderGroupType *> * _Nullable groups;

/**
 <p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminListUserAuthEventsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminListUserAuthEventsResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAuthEventType *> * _Nullable authEvents;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest : AWSRequest


/**
 <p>The group name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the request to reset a user's password as an administrator.</p>
 Required parameters: [UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminResetUserPasswordRequest : AWSRequest


/**
 <p>The user pool ID for the user pool where you want to reset the user's password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The user name of the user whose password you wish to reset.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the response from the server to reset a user password as an administrator.</p>
 */
@interface AWSCognitoIdentityProviderAdminResetUserPasswordResponse : AWSModel


@end

/**
 <p>The request to respond to the authentication challenge, as an administrator.</p>
 Required parameters: [UserPoolId, ClientId, ChallengeName]
 */
@interface AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest : AWSRequest


/**
 <p>The analytics metadata for collecting Amazon Pinpoint metrics for <code>AdminRespondToAuthChallenge</code> calls.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

/**
 <p>The challenge name. For more information, see .</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge responses. These are inputs corresponding to the value of <code>ChallengeName</code>, for example:</p><ul><li><p><code>SMS_MFA</code>: <code>SMS_MFA_CODE</code>, <code>USERNAME</code>, <code>SECRET_HASH</code> (if app client is configured with client secret).</p></li><li><p><code>PASSWORD_VERIFIER</code>: <code>PASSWORD_CLAIM_SIGNATURE</code>, <code>PASSWORD_CLAIM_SECRET_BLOCK</code>, <code>TIMESTAMP</code>, <code>USERNAME</code>, <code>SECRET_HASH</code> (if app client is configured with client secret).</p></li><li><p><code>ADMIN_NO_SRP_AUTH</code>: <code>PASSWORD</code>, <code>USERNAME</code>, <code>SECRET_HASH</code> (if app client is configured with client secret). </p></li><li><p><code>NEW_PASSWORD_REQUIRED</code>: <code>NEW_PASSWORD</code>, any other required attributes, <code>USERNAME</code>, <code>SECRET_HASH</code> (if app client is configured with client secret). </p></li></ul><p>The value of the <code>USERNAME</code> attribute must be the user's actual username, not an alias (such as email address or phone number). To make this easier, the <code>AdminInitiateAuth</code> response includes the actual username value in the <code>USERNAMEUSER_ID_FOR_SRP</code> attribute, even if you specified an alias in your call to <code>AdminInitiateAuth</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeResponses;

/**
 <p>The app client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderContextDataType * _Nullable contextData;

/**
 <p>The session which should be passed both ways in challenge-response calls to the service. If <code>InitiateAuth</code> or <code>RespondToAuthChallenge</code> API call determines that the caller needs to go through another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

/**
 <p>The ID of the Amazon Cognito user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Responds to the authentication challenge, as an administrator.</p>
 */
@interface AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse : AWSModel


/**
 <p>The result returned by the server in response to the authentication request.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAuthenticationResultType * _Nullable authenticationResult;

/**
 <p>The name of the challenge. For more information, see .</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge parameters. For more information, see .</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeParameters;

/**
 <p>The session which should be passed both ways in challenge-response calls to the service. If the or API call determines that the caller needs to go through another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSMSMfaSettingsType * _Nullable SMSMfaSettings;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSoftwareTokenMfaSettingsType * _Nullable softwareTokenMfaSettings;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse : AWSModel


@end

/**
 <p>Represents the request to set user settings as an administrator.</p>
 Required parameters: [UserPoolId, Username, MFAOptions]
 */
@interface AWSCognitoIdentityProviderAdminSetUserSettingsRequest : AWSRequest


/**
 <p>Specifies the options for MFA (e.g., email or phone number).</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderMFAOptionType *> * _Nullable MFAOptions;

/**
 <p>The user pool ID for the user pool where you want to set the user's settings, such as MFA options.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The user name of the user for whom you wish to set user settings.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the response from the server to set user settings as an administrator.</p>
 */
@interface AWSCognitoIdentityProviderAdminSetUserSettingsResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderFeedbackValueType feedbackValue;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse : AWSModel


@end

/**
 <p>The request to update the device status, as an administrator.</p>
 Required parameters: [UserPoolId, Username, DeviceKey]
 */
@interface AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest : AWSRequest


/**
 <p>The device key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceKey;

/**
 <p>The status indicating whether a device has been remembered or not.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderDeviceRememberedStatusType deviceRememberedStatus;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The user name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>The status response from the request to update the device, as an administrator.</p>
 */
@interface AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse : AWSModel


@end

/**
 <p>Represents the request to update the user's attributes as an administrator.</p>
 Required parameters: [UserPoolId, Username, UserAttributes]
 */
@interface AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest : AWSRequest


/**
 <p>An array of name-value pairs representing user attributes.</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

/**
 <p>The user pool ID for the user pool where you want to update user attributes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The user name of the user for whom you want to update user attributes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the response from the server for the request to update user attributes as an administrator.</p>
 */
@interface AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse : AWSModel


@end

/**
 <p>The request to sign out of all devices, as an administrator.</p>
 Required parameters: [UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest : AWSRequest


/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The user name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>The global sign-out response, as an administrator.</p>
 */
@interface AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse : AWSModel


@end

/**
 <p>The Amazon Pinpoint analytics configuration for collecting metrics for a user pool.</p>
 Required parameters: [ApplicationId, RoleArn, ExternalId]
 */
@interface AWSCognitoIdentityProviderAnalyticsConfigurationType : AWSModel


/**
 <p>The application ID for an Amazon Pinpoint application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The external ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 <p>The ARN of an IAM role that authorizes Amazon Cognito to publish events to Amazon Pinpoint analytics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>If <code>UserDataShared</code> is <code>true</code>, Amazon Cognito will include user data in the events it publishes to Amazon Pinpoint analytics.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable userDataShared;

@end

/**
 <p>An Amazon Pinpoint analytics endpoint.</p><p>An endpoint uniquely identifies a mobile device, email address, or phone number that can receive messages from Amazon Pinpoint analytics.</p>
 */
@interface AWSCognitoIdentityProviderAnalyticsMetadataType : AWSModel


/**
 <p>The endpoint ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable analyticsEndpointId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAssociateSoftwareTokenRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable session;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAssociateSoftwareTokenResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable secretCode;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable session;

@end

/**
 <p>Specifies whether the attribute is standard or custom.</p>
 Required parameters: [Name]
 */
@interface AWSCognitoIdentityProviderAttributeType : AWSModel


/**
 <p>The name of the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The value of the attribute.</p>
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAuthEventType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderChallengeResponseType *> * _Nullable challengeResponses;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderEventContextDataType * _Nullable eventContextData;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderEventFeedbackType * _Nullable eventFeedback;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderEventResponseType eventResponse;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderEventRiskType * _Nullable eventRisk;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderEventType eventType;

@end

/**
 <p>The authentication result.</p>
 */
@interface AWSCognitoIdentityProviderAuthenticationResultType : AWSModel


/**
 <p>The access token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The expiration period of the authentication result.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expiresIn;

/**
 <p>The ID token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idToken;

/**
 <p>The new device metadata from an authentication result.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLatestDeviceMetadataType * _Nullable latestDeviceMetadata;

/**
 <p>The refresh token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable refreshToken;

/**
 <p>The token type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenType;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderChallengeResponseType : AWSModel


/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeName challengeName;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeResponse challengeResponse;

@end

/**
 <p>Represents the request to change a user password.</p>
 Required parameters: [PreviousPassword, ProposedPassword, AccessToken]
 */
@interface AWSCognitoIdentityProviderChangePasswordRequest : AWSRequest


/**
 <p>The access token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The old password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable previousPassword;

/**
 <p>The new password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable proposedPassword;

@end

/**
 <p>The response from the server to the change password request.</p>
 */
@interface AWSCognitoIdentityProviderChangePasswordResponse : AWSModel


@end

/**
 <p>The code delivery details being returned from the server.</p>
 */
@interface AWSCognitoIdentityProviderCodeDeliveryDetailsType : AWSModel


/**
 <p>The attribute name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The delivery medium (email message or phone number).</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderDeliveryMediumType deliveryMedium;

/**
 <p>The destination for the code delivery details.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destination;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderCompromisedCredentialsActionsType : AWSModel


/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderCompromisedCredentialsEventActionType eventAction;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderCompromisedCredentialsRiskConfigurationType : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCompromisedCredentialsActionsType * _Nullable actions;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventFilter;

@end

/**
 <p>Confirms the device request.</p>
 Required parameters: [AccessToken, DeviceKey]
 */
@interface AWSCognitoIdentityProviderConfirmDeviceRequest : AWSRequest


/**
 <p>The access token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The device key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceKey;

/**
 <p>The device name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>The configuration of the device secret verifier.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderDeviceSecretVerifierConfigType * _Nullable deviceSecretVerifierConfig;

@end

/**
 <p>Confirms the device response.</p>
 */
@interface AWSCognitoIdentityProviderConfirmDeviceResponse : AWSModel


/**
 <p>Indicates whether the user confirmation is necessary to confirm the device response.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable userConfirmationNecessary;

@end

/**
 <p>The request representing the confirmation for a password reset.</p>
 Required parameters: [ClientId, Username, ConfirmationCode, Password]
 */
@interface AWSCognitoIdentityProviderConfirmForgotPasswordRequest : AWSRequest


/**
 <p>The Amazon Pinpoint analytics metadata for collecting metrics for <code>ConfirmForgotPassword</code> calls.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

/**
 <p>The app client ID of the app associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The confirmation code sent by a user's request to retrieve a forgotten password. For more information, see </p>
 */
@property (nonatomic, strong) NSString * _Nullable confirmationCode;

/**
 <p>The password sent by a user's request to retrieve a forgotten password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserContextDataType * _Nullable userContextData;

/**
 <p>The user name of the user for whom you want to enter a code to retrieve a forgotten password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>The response from the server that results from a user's request to retrieve a forgotten password.</p>
 */
@interface AWSCognitoIdentityProviderConfirmForgotPasswordResponse : AWSModel


@end

/**
 <p>Represents the request to confirm registration of a user.</p>
 Required parameters: [ClientId, Username, ConfirmationCode]
 */
@interface AWSCognitoIdentityProviderConfirmSignUpRequest : AWSRequest


/**
 <p>The Amazon Pinpoint analytics metadata for collecting metrics for <code>ConfirmSignUp</code> calls.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

/**
 <p>The ID of the app client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The confirmation code sent by a user's request to confirm registration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable confirmationCode;

/**
 <p>Boolean to be specified to force user confirmation irrespective of existing alias. By default set to <code>False</code>. If this parameter is set to <code>True</code> and the phone number/email used for sign up confirmation already exists as an alias with a different user, the API call will migrate the alias from the previous user to the newly created user being confirmed. If set to <code>False</code>, the API will throw an <b>AliasExistsException</b> error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceAliasCreation;

/**
 <p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserContextDataType * _Nullable userContextData;

/**
 <p>The user name of the user whose registration you wish to confirm.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the response from the server for the registration confirmation.</p>
 */
@interface AWSCognitoIdentityProviderConfirmSignUpResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderContextDataType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable encodedData;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderHttpHeader *> * _Nullable httpHeaders;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable ipAddress;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable serverPath;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderCreateGroupRequest : AWSRequest


/**
 <p>A string containing the description of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the group. Must be unique.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>A nonnegative integer value that specifies the precedence of this group relative to the other groups that a user can belong to in the user pool. Zero is the highest precedence value. Groups with lower <code>Precedence</code> values take precedence over groups with higher or null <code>Precedence</code> values. If a user belongs to two or more groups, it is the group with the lowest precedence value whose role ARN will be used in the <code>cognito:roles</code> and <code>cognito:preferred_role</code> claims in the user's tokens.</p><p>Two groups can have the same <code>Precedence</code> value. If this happens, neither group takes precedence over the other. If two groups with the same <code>Precedence</code> have the same role ARN, that role is used in the <code>cognito:preferred_role</code> claim in tokens for users in each group. If the two groups have different role ARNs, the <code>cognito:preferred_role</code> claim is not set in users' tokens.</p><p>The default <code>Precedence</code> value is null.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable precedence;

/**
 <p>The role ARN for the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderCreateGroupResponse : AWSModel


/**
 <p>The group object for the group.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderGroupType * _Nullable group;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderCreateIdentityProviderRequest : AWSRequest


/**
 <p>A mapping of identity provider attributes to standard and custom user pool attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributeMapping;

/**
 <p>A list of identity provider identifiers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable idpIdentifiers;

/**
 <p>The identity provider details, such as <code>MetadataURL</code> and <code>MetadataFile</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable providerDetails;

/**
 <p>The identity provider name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The identity provider type.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderIdentityProviderTypeType providerType;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderCreateIdentityProviderResponse : AWSModel


/**
 <p>The newly created identity provider object.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderIdentityProviderType * _Nullable identityProvider;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderCreateResourceServerRequest : AWSRequest


/**
 <p>A unique resource server identifier for the resource server. This could be an HTTPS endpoint where the resource server is located. For example, <code>https://my-weather-api.example.com</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>A friendly name for the resource server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of scopes. Each scope is map, where the keys are <code>name</code> and <code>description</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderResourceServerScopeType *> * _Nullable scopes;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderCreateResourceServerResponse : AWSModel


/**
 <p>The newly created resource server.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderResourceServerType * _Nullable resourceServer;

@end

/**
 <p>Represents the request to create the user import job.</p>
 Required parameters: [JobName, UserPoolId, CloudWatchLogsRoleArn]
 */
@interface AWSCognitoIdentityProviderCreateUserImportJobRequest : AWSRequest


/**
 <p>The role ARN for the Amazon CloudWatch Logging role for the user import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudWatchLogsRoleArn;

/**
 <p>The job name for the user import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The user pool ID for the user pool that the users are being imported into.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the response from the server to the request to create the user import job.</p>
 */
@interface AWSCognitoIdentityProviderCreateUserImportJobResponse : AWSModel


/**
 <p>The job object that represents the user import job.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserImportJobType * _Nullable userImportJob;

@end

/**
 <p>Represents the request to create a user pool client.</p>
 Required parameters: [UserPoolId, ClientName]
 */
@interface AWSCognitoIdentityProviderCreateUserPoolClientRequest : AWSRequest


/**
 <p>Set to <code>code</code> to initiate a code grant flow, which provides an authorization code as the response. This code can be exchanged for access tokens with the token endpoint.</p><p>Set to <code>token</code> to specify that the client should get the access token (and, optionally, ID token, based on scopes) directly.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOAuthFlows;

/**
 <p>Set to <code>True</code> if the client is allowed to follow the OAuth protocol when interacting with Cognito user pools.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowedOAuthFlowsUserPoolClient;

/**
 <p>A list of allowed <code>OAuth</code> scopes. Currently supported values are <code>"phone"</code>, <code>"email"</code>, <code>"openid"</code>, and <code>"Cognito"</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOAuthScopes;

/**
 <p>The Amazon Pinpoint analytics configuration for collecting metrics for this user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsConfigurationType * _Nullable analyticsConfiguration;

/**
 <p>A list of allowed callback URLs for the identity providers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable callbackURLs;

/**
 <p>The client name for the user pool client you would like to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientName;

/**
 <p>The default redirect URI. Must be in the <code>CallbackURLs</code> list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultRedirectURI;

/**
 <p>The explicit authentication flows.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable explicitAuthFlows;

/**
 <p>Boolean to specify whether you want to generate a secret for the user pool client being created.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable generateSecret;

/**
 <p>A list of allowed logout URLs for the identity providers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logoutURLs;

/**
 <p>The read attributes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable readAttributes;

/**
 <p>The time limit, in days, after which the refresh token is no longer valid and cannot be used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable refreshTokenValidity;

/**
 <p>A list of provider names for the identity providers that are supported on this client.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedIdentityProviders;

/**
 <p>The user pool ID for the user pool where you want to create a user pool client.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The write attributes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable writeAttributes;

@end

/**
 <p>Represents the response from the server to create a user pool client.</p>
 */
@interface AWSCognitoIdentityProviderCreateUserPoolClientResponse : AWSModel


/**
 <p>The user pool client that was just created.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolClientType * _Nullable userPoolClient;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderCreateUserPoolDomainRequest : AWSRequest


/**
 <p>The domain string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderCreateUserPoolDomainResponse : AWSModel


@end

/**
 <p>Represents the request to create a user pool.</p>
 Required parameters: [PoolName]
 */
@interface AWSCognitoIdentityProviderCreateUserPoolRequest : AWSRequest


/**
 <p>The configuration for <code>AdminCreateUser</code> requests.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAdminCreateUserConfigType * _Nullable adminCreateUserConfig;

/**
 <p>Attributes supported as an alias for this user pool. Possible values: <b>phone_number</b>, <b>email</b>, or <b>preferred_username</b>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable aliasAttributes;

/**
 <p>The attributes to be auto-verified. Possible values: <b>email</b>, <b>phone_number</b>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoVerifiedAttributes;

/**
 <p>The device configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderDeviceConfigurationType * _Nullable deviceConfiguration;

/**
 <p>The email configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderEmailConfigurationType * _Nullable emailConfiguration;

/**
 <p>A string representing the email verification message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationMessage;

/**
 <p>A string representing the email verification subject.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationSubject;

/**
 <p>The Lambda trigger configuration information for the new user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLambdaConfigType * _Nullable lambdaConfig;

/**
 <p>Specifies MFA configuration details.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserPoolMfaType mfaConfiguration;

/**
 <p>The policies associated with the new user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolPolicyType * _Nullable policies;

/**
 <p>A string used to name the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable poolName;

/**
 <p>An array of schema attributes for the new user pool. These attributes can be standard or custom attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderSchemaAttributeType *> * _Nullable schema;

/**
 <p>A string representing the SMS authentication message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsAuthenticationMessage;

/**
 <p>The SMS configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSmsConfigurationType * _Nullable smsConfiguration;

/**
 <p>A string representing the SMS verification message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsVerificationMessage;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolAddOnsType * _Nullable userPoolAddOns;

/**
 <p>The cost allocation tags for the user pool. For more information, see <a href="http://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-cost-allocation-tagging.html">Adding Cost Allocation Tags to Your User Pool</a></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable userPoolTags;

/**
 <p>Specifies whether email addresses or phone numbers can be specified as usernames when a user signs up.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable usernameAttributes;

/**
 <p>The template for the verification message that the user sees when the app requests permission to access the user's information.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderVerificationMessageTemplateType * _Nullable verificationMessageTemplate;

@end

/**
 <p>Represents the response from the server for the request to create a user pool.</p>
 */
@interface AWSCognitoIdentityProviderCreateUserPoolResponse : AWSModel


/**
 <p>A container for the user pool details.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolType * _Nullable userPool;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDeleteGroupRequest : AWSRequest


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDeleteIdentityProviderRequest : AWSRequest


/**
 <p>The identity provider name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDeleteResourceServerRequest : AWSRequest


/**
 <p>The identifier for the resource server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The user pool ID for the user pool that hosts the resource server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the request to delete user attributes.</p>
 Required parameters: [UserAttributeNames, AccessToken]
 */
@interface AWSCognitoIdentityProviderDeleteUserAttributesRequest : AWSRequest


/**
 <p>The access token used in the request to delete user attributes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>An array of strings representing the user attribute names you wish to delete.</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userAttributeNames;

@end

/**
 <p>Represents the response from the server to delete user attributes.</p>
 */
@interface AWSCognitoIdentityProviderDeleteUserAttributesResponse : AWSModel


@end

/**
 <p>Represents the request to delete a user pool client.</p>
 Required parameters: [UserPoolId, ClientId]
 */
@interface AWSCognitoIdentityProviderDeleteUserPoolClientRequest : AWSRequest


/**
 <p>The app client ID of the app associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The user pool ID for the user pool where you want to delete the client.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDeleteUserPoolDomainRequest : AWSRequest


/**
 <p>The domain string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDeleteUserPoolDomainResponse : AWSModel


@end

/**
 <p>Represents the request to delete a user pool.</p>
 Required parameters: [UserPoolId]
 */
@interface AWSCognitoIdentityProviderDeleteUserPoolRequest : AWSRequest


/**
 <p>The user pool ID for the user pool you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the request to delete a user.</p>
 Required parameters: [AccessToken]
 */
@interface AWSCognitoIdentityProviderDeleteUserRequest : AWSRequest


/**
 <p>The access token from a request to delete a user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeIdentityProviderRequest : AWSRequest


/**
 <p>The identity provider name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeIdentityProviderResponse : AWSModel


/**
 <p>The identity provider that was deleted.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderIdentityProviderType * _Nullable identityProvider;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeResourceServerRequest : AWSRequest


/**
 <p>The identifier for the resource server</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The user pool ID for the user pool that hosts the resource server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeResourceServerResponse : AWSModel


/**
 <p>The resource server.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderResourceServerType * _Nullable resourceServer;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeRiskConfigurationRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeRiskConfigurationResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderRiskConfigurationType * _Nullable riskConfiguration;

@end

/**
 <p>Represents the request to describe the user import job.</p>
 Required parameters: [UserPoolId, JobId]
 */
@interface AWSCognitoIdentityProviderDescribeUserImportJobRequest : AWSRequest


/**
 <p>The job ID for the user import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The user pool ID for the user pool that the users are being imported into.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the response from the server to the request to describe the user import job.</p>
 */
@interface AWSCognitoIdentityProviderDescribeUserImportJobResponse : AWSModel


/**
 <p>The job object that represents the user import job.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserImportJobType * _Nullable userImportJob;

@end

/**
 <p>Represents the request to describe a user pool client.</p>
 Required parameters: [UserPoolId, ClientId]
 */
@interface AWSCognitoIdentityProviderDescribeUserPoolClientRequest : AWSRequest


/**
 <p>The app client ID of the app associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The user pool ID for the user pool you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the response from the server from a request to describe the user pool client.</p>
 */
@interface AWSCognitoIdentityProviderDescribeUserPoolClientResponse : AWSModel


/**
 <p>The user pool client from a server response to describe the user pool client.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolClientType * _Nullable userPoolClient;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeUserPoolDomainRequest : AWSRequest


/**
 <p>The domain string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeUserPoolDomainResponse : AWSModel


/**
 <p>A domain description object containing information about the domain.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderDomainDescriptionType * _Nullable domainDescription;

@end

/**
 <p>Represents the request to describe the user pool.</p>
 Required parameters: [UserPoolId]
 */
@interface AWSCognitoIdentityProviderDescribeUserPoolRequest : AWSRequest


/**
 <p>The user pool ID for the user pool you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the response to describe the user pool.</p>
 */
@interface AWSCognitoIdentityProviderDescribeUserPoolResponse : AWSModel


/**
 <p>The container of metadata returned by the server to describe the pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolType * _Nullable userPool;

@end

/**
 <p>The configuration for the user pool's device tracking.</p>
 */
@interface AWSCognitoIdentityProviderDeviceConfigurationType : AWSModel


/**
 <p>Indicates whether a challenge is required on a new device. Only applicable to a new device.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable challengeRequiredOnNewDevice;

/**
 <p>If true, a device is only remembered on user prompt.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deviceOnlyRememberedOnUserPrompt;

@end

/**
 <p>The device verifier against which it will be authenticated.</p>
 */
@interface AWSCognitoIdentityProviderDeviceSecretVerifierConfigType : AWSModel


/**
 <p>The password verifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable passwordVerifier;

/**
 <p>The salt.</p>
 */
@property (nonatomic, strong) NSString * _Nullable salt;

@end

/**
 <p>The device type.</p>
 */
@interface AWSCognitoIdentityProviderDeviceType : AWSModel


/**
 <p>The device attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable deviceAttributes;

/**
 <p>The creation date of the device.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deviceCreateDate;

/**
 <p>The device key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceKey;

/**
 <p>The date in which the device was last authenticated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deviceLastAuthenticatedDate;

/**
 <p>The last modified date of the device.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deviceLastModifiedDate;

@end

/**
 <p>A container for information about a domain.</p>
 */
@interface AWSCognitoIdentityProviderDomainDescriptionType : AWSModel


/**
 <p>The AWS account ID for the user pool owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable AWSAccountId;

/**
 <p>The ARN of the CloudFront distribution.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudFrontDistribution;

/**
 <p>The domain string.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>The S3 bucket where the static files for this domain are stored.</p>
 */
@property (nonatomic, strong) NSString * _Nullable s3Bucket;

/**
 <p>The domain status.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderDomainStatusType status;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The app version.</p>
 */
@property (nonatomic, strong) NSString * _Nullable version;

@end

/**
 <p>The email configuration type.</p>
 */
@interface AWSCognitoIdentityProviderEmailConfigurationType : AWSModel


/**
 <p>The REPLY-TO email address.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replyToEmailAddress;

/**
 <p>The Amazon Resource Name (ARN) of the email source.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderEventContextDataType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable city;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable country;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable ipAddress;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderEventFeedbackType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable feedbackDate;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderFeedbackValueType feedbackValue;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable provider;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderEventRiskType : AWSModel


/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderRiskDecisionType riskDecision;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderRiskLevelType riskLevel;

@end

/**
 <p>Represents the request to forget the device.</p>
 Required parameters: [DeviceKey]
 */
@interface AWSCognitoIdentityProviderForgetDeviceRequest : AWSRequest


/**
 <p>The access token for the forgotten device request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The device key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceKey;

@end

/**
 <p>Represents the request to reset a user's password.</p>
 Required parameters: [ClientId, Username]
 */
@interface AWSCognitoIdentityProviderForgotPasswordRequest : AWSRequest


/**
 <p>The Amazon Pinpoint analytics metadata for collecting metrics for <code>ForgotPassword</code> calls.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

/**
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserContextDataType * _Nullable userContextData;

/**
 <p>The user name of the user for whom you want to enter a code to reset a forgotten password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Respresents the response from the server regarding the request to reset a password.</p>
 */
@interface AWSCognitoIdentityProviderForgotPasswordResponse : AWSModel


/**
 <p>The code delivery details returned by the server in response to the request to reset a password.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCodeDeliveryDetailsType * _Nullable codeDeliveryDetails;

@end

/**
 <p>Represents the request to get the header information for the .csv file for the user import job.</p>
 Required parameters: [UserPoolId]
 */
@interface AWSCognitoIdentityProviderGetCSVHeaderRequest : AWSRequest


/**
 <p>The user pool ID for the user pool that the users are to be imported into.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the response from the server to the request to get the header information for the .csv file for the user import job.</p>
 */
@interface AWSCognitoIdentityProviderGetCSVHeaderResponse : AWSModel


/**
 <p>The header information for the .csv file for the user import job.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable CSVHeader;

/**
 <p>The user pool ID for the user pool that the users are to be imported into.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the request to get the device.</p>
 Required parameters: [DeviceKey]
 */
@interface AWSCognitoIdentityProviderGetDeviceRequest : AWSRequest


/**
 <p>The access token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The device key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceKey;

@end

/**
 <p>Gets the device response.</p>
 Required parameters: [Device]
 */
@interface AWSCognitoIdentityProviderGetDeviceResponse : AWSModel


/**
 <p>The device.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderDeviceType * _Nullable device;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetGroupRequest : AWSRequest


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetGroupResponse : AWSModel


/**
 <p>The group object for the group.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderGroupType * _Nullable group;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest : AWSRequest


/**
 <p>The identity provider ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idpIdentifier;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse : AWSModel


/**
 <p>The identity provider object.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderIdentityProviderType * _Nullable identityProvider;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetUICustomizationRequest : AWSRequest


/**
 <p>The client ID for the client app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetUICustomizationResponse : AWSModel


/**
 <p>The UI customization information.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUICustomizationType * _Nullable UICustomization;

@end

/**
 <p>Represents the request to get user attribute verification.</p>
 Required parameters: [AccessToken, AttributeName]
 */
@interface AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest : AWSRequest


/**
 <p>The access token returned by the server response to get the user attribute verification code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The attribute name returned by the server response to get the user attribute verification code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

@end

/**
 <p>The verification code response returned by the server response to get the user attribute verification code.</p>
 */
@interface AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse : AWSModel


/**
 <p>The code delivery details returned by the server in response to the request to get the user attribute verification code.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCodeDeliveryDetailsType * _Nullable codeDeliveryDetails;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetUserPoolMfaConfigRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetUserPoolMfaConfigResponse : AWSModel


/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserPoolMfaType mfaConfiguration;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSmsMfaConfigType * _Nullable smsMfaConfiguration;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSoftwareTokenMfaConfigType * _Nullable softwareTokenMfaConfiguration;

@end

/**
 <p>Represents the request to get information about the user.</p>
 Required parameters: [AccessToken]
 */
@interface AWSCognitoIdentityProviderGetUserRequest : AWSRequest


/**
 <p>The access token returned by the server response to get information about the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

@end

/**
 <p>Represents the response from the server from the request to get information about the user.</p>
 Required parameters: [Username, UserAttributes]
 */
@interface AWSCognitoIdentityProviderGetUserResponse : AWSModel


/**
 <p>Specifies the options for MFA (e.g., email or phone number).</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderMFAOptionType *> * _Nullable MFAOptions;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable preferredMfaSetting;

/**
 <p>An array of name-value pairs representing user attributes.</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userMFASettingList;

/**
 <p>The user name of the user you wish to retrieve from the get user request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the request to sign out all devices.</p>
 Required parameters: [AccessToken]
 */
@interface AWSCognitoIdentityProviderGlobalSignOutRequest : AWSRequest


/**
 <p>The access token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

@end

/**
 <p>The response to the request to sign out all devices.</p>
 */
@interface AWSCognitoIdentityProviderGlobalSignOutResponse : AWSModel


@end

/**
 <p>The group type.</p>
 */
@interface AWSCognitoIdentityProviderGroupType : AWSModel


/**
 <p>The date the group was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A string containing the description of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The date the group was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>A nonnegative integer value that specifies the precedence of this group relative to the other groups that a user can belong to in the user pool. If a user belongs to two or more groups, it is the group with the highest precedence whose role ARN will be used in the <code>cognito:roles</code> and <code>cognito:preferred_role</code> claims in the user's tokens. Groups with higher <code>Precedence</code> values take precedence over groups with lower <code>Precedence</code> values or with null <code>Precedence</code> values.</p><p>Two groups can have the same <code>Precedence</code> value. If this happens, neither group takes precedence over the other. If two groups with the same <code>Precedence</code> have the same role ARN, that role is used in the <code>cognito:preferred_role</code> claim in tokens for users in each group. If the two groups have different role ARNs, the <code>cognito:preferred_role</code> claim is not set in users' tokens.</p><p>The default <code>Precedence</code> value is null.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable precedence;

/**
 <p>The role ARN for the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderHttpHeader : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable headerName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable headerValue;

@end

/**
 <p>A container for information about an identity provider.</p>
 */
@interface AWSCognitoIdentityProviderIdentityProviderType : AWSModel


/**
 <p>A mapping of identity provider attributes to standard and custom user pool attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributeMapping;

/**
 <p>The date the identity provider was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A list of identity provider identifiers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable idpIdentifiers;

/**
 <p>The date the identity provider was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The identity provider details, such as <code>MetadataURL</code> and <code>MetadataFile</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable providerDetails;

/**
 <p>The identity provider name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The identity provider type.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderIdentityProviderTypeType providerType;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Initiates the authentication request.</p>
 Required parameters: [AuthFlow, ClientId]
 */
@interface AWSCognitoIdentityProviderInitiateAuthRequest : AWSRequest


/**
 <p>The Amazon Pinpoint analytics metadata for collecting metrics for <code>InitiateAuth</code> calls.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

/**
 <p>The authentication flow for this call to execute. The API action will depend on this value. For example: </p><ul><li><p><code>REFRESH_TOKEN_AUTH</code> will take in a valid refresh token and return new tokens.</p></li><li><p><code>USER_SRP_AUTH</code> will take in <code>USERNAME</code> and <code>SRP_A</code> and return the SRP variables to be used for next challenge execution.</p></li></ul><p>Valid values include:</p><ul><li><p><code>USER_SRP_AUTH</code>: Authentication flow for the Secure Remote Password (SRP) protocol.</p></li><li><p><code>REFRESH_TOKEN_AUTH</code>/<code>REFRESH_TOKEN</code>: Authentication flow for refreshing the access token and ID token by supplying a valid refresh token.</p></li><li><p><code>CUSTOM_AUTH</code>: Custom authentication flow.</p></li></ul><p><code>ADMIN_NO_SRP_AUTH</code> is not a valid value.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderAuthFlowType authFlow;

/**
 <p>The authentication parameters. These are inputs corresponding to the <code>AuthFlow</code> that you are invoking. The required values depend on the value of <code>AuthFlow</code>:</p><ul><li><p>For <code>USER_SRP_AUTH</code>: <code>USERNAME</code> (required), <code>SRP_A</code> (required), <code>SECRET_HASH</code> (required if the app client is configured with a client secret), <code>DEVICE_KEY</code></p></li><li><p>For <code>REFRESH_TOKEN_AUTH/REFRESH_TOKEN</code>: <code>USERNAME</code> (required), <code>SECRET_HASH</code> (required if the app client is configured with a client secret), <code>REFRESH_TOKEN</code> (required), <code>DEVICE_KEY</code></p></li><li><p>For <code>CUSTOM_AUTH</code>: <code>USERNAME</code> (required), <code>SECRET_HASH</code> (if app client is configured with client secret), <code>DEVICE_KEY</code></p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable authParameters;

/**
 <p>The app client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>This is a random key-value pair map which can contain any key and will be passed to your PreAuthentication Lambda trigger as-is. It can be used to implement additional validations around authentication.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserContextDataType * _Nullable userContextData;

@end

/**
 <p>Initiates the authentication response.</p>
 */
@interface AWSCognitoIdentityProviderInitiateAuthResponse : AWSModel


/**
 <p>The result of the authentication response. This is only returned if the caller does not need to pass another challenge. If the caller does need to pass another challenge before it gets tokens, <code>ChallengeName</code>, <code>ChallengeParameters</code>, and <code>Session</code> are returned.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAuthenticationResultType * _Nullable authenticationResult;

/**
 <p>The name of the challenge which you are responding to with this call. This is returned to you in the <code>AdminInitiateAuth</code> response if you need to pass another challenge.</p><p>Valid values include the following. Note that all of these challenges require <code>USERNAME</code> and <code>SECRET_HASH</code> (if applicable) in the parameters.</p><ul><li><p><code>SMS_MFA</code>: Next challenge is to supply an <code>SMS_MFA_CODE</code>, delivered via SMS.</p></li><li><p><code>PASSWORD_VERIFIER</code>: Next challenge is to supply <code>PASSWORD_CLAIM_SIGNATURE</code>, <code>PASSWORD_CLAIM_SECRET_BLOCK</code>, and <code>TIMESTAMP</code> after the client-side SRP calculations.</p></li><li><p><code>CUSTOM_CHALLENGE</code>: This is returned if your custom authentication flow determines that the user should pass another challenge before tokens are issued.</p></li><li><p><code>DEVICE_SRP_AUTH</code>: If device tracking was enabled on your user pool and the previous challenges were passed, this challenge is returned so that Amazon Cognito can start tracking this device.</p></li><li><p><code>DEVICE_PASSWORD_VERIFIER</code>: Similar to <code>PASSWORD_VERIFIER</code>, but for devices only.</p></li><li><p><code>NEW_PASSWORD_REQUIRED</code>: For users which are required to change their passwords after successful first login. This challenge should be passed with <code>NEW_PASSWORD</code> and any other required attributes.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge parameters. These are returned to you in the <code>InitiateAuth</code> response if you need to pass another challenge. The responses in this parameter should be used to compute inputs to the next call (<code>RespondToAuthChallenge</code>). </p><p>All challenges require <code>USERNAME</code> and <code>SECRET_HASH</code> (if applicable).</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeParameters;

/**
 <p>The session which should be passed both ways in challenge-response calls to the service. If the or API call determines that the caller needs to go through another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

@end

/**
 <p>Specifies the configuration for AWS Lambda triggers.</p>
 */
@interface AWSCognitoIdentityProviderLambdaConfigType : AWSModel


/**
 <p>Creates an authentication challenge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createAuthChallenge;

/**
 <p>A custom Message AWS Lambda trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customMessage;

/**
 <p>Defines the authentication challenge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defineAuthChallenge;

/**
 <p>A post-authentication AWS Lambda trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable postAuthentication;

/**
 <p>A post-confirmation AWS Lambda trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable postConfirmation;

/**
 <p>A pre-authentication AWS Lambda trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preAuthentication;

/**
 <p>A pre-registration AWS Lambda trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preSignUp;

/**
 <p>A Lambda trigger that is invoked before token generation.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preTokenGeneration;

/**
 <p>Verifies the authentication challenge response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable verifyAuthChallengeResponse;

@end

/**
 <p>Represents the request to list the devices.</p>
 Required parameters: [AccessToken]
 */
@interface AWSCognitoIdentityProviderListDevicesRequest : AWSRequest


/**
 <p>The access tokens for the request to list devices.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The limit of the device request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>The pagination token for the list request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

@end

/**
 <p>Represents the response to list devices.</p>
 */
@interface AWSCognitoIdentityProviderListDevicesResponse : AWSModel


/**
 <p>The devices returned in the list devices response.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderDeviceType *> * _Nullable devices;

/**
 <p>The pagination token for the list device response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListGroupsRequest : AWSRequest


/**
 <p>The limit of the request to list groups.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListGroupsResponse : AWSModel


/**
 <p>The group objects for the groups.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderGroupType *> * _Nullable groups;

/**
 <p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListIdentityProvidersRequest : AWSRequest


/**
 <p>The maximum number of identity providers to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A pagination token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListIdentityProvidersResponse : AWSModel


/**
 <p>A pagination token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of identity provider objects.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderProviderDescription *> * _Nullable providers;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListResourceServersRequest : AWSRequest


/**
 <p>The maximum number of resource servers to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A pagination token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListResourceServersResponse : AWSModel


/**
 <p>A pagination token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The resource servers.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderResourceServerType *> * _Nullable resourceServers;

@end

/**
 <p>Represents the request to list the user import jobs.</p>
 Required parameters: [UserPoolId, MaxResults]
 */
@interface AWSCognitoIdentityProviderListUserImportJobsRequest : AWSRequest


/**
 <p>The maximum number of import jobs you want the request to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An identifier that was returned from the previous call to <code>ListUserImportJobs</code>, which can be used to return the next set of import jobs in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>The user pool ID for the user pool that the users are being imported into.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the response from the server to the request to list the user import jobs.</p>
 */
@interface AWSCognitoIdentityProviderListUserImportJobsResponse : AWSModel


/**
 <p>An identifier that can be used to return the next set of user import jobs in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>The user import jobs.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderUserImportJobType *> * _Nullable userImportJobs;

@end

/**
 <p>Represents the request to list the user pool clients.</p>
 Required parameters: [UserPoolId]
 */
@interface AWSCognitoIdentityProviderListUserPoolClientsRequest : AWSRequest


/**
 <p>The maximum number of results you want the request to return when listing the user pool clients.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The user pool ID for the user pool where you want to list user pool clients.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the response from the server that lists user pool clients.</p>
 */
@interface AWSCognitoIdentityProviderListUserPoolClientsResponse : AWSModel


/**
 <p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The user pool clients in the response that lists user pool clients.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderUserPoolClientDescription *> * _Nullable userPoolClients;

@end

/**
 <p>Represents the request to list user pools.</p>
 Required parameters: [MaxResults]
 */
@interface AWSCognitoIdentityProviderListUserPoolsRequest : AWSRequest


/**
 <p>The maximum number of results you want the request to return when listing the user pools.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Represents the response to list user pools.</p>
 */
@interface AWSCognitoIdentityProviderListUserPoolsResponse : AWSModel


/**
 <p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The user pools from the response to list users.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderUserPoolDescriptionType *> * _Nullable userPools;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListUsersInGroupRequest : AWSRequest


/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The limit of the request to list users.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListUsersInGroupResponse : AWSModel


/**
 <p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The users returned in the request to list users.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderUserType *> * _Nullable users;

@end

/**
 <p>Represents the request to list users.</p>
 Required parameters: [UserPoolId]
 */
@interface AWSCognitoIdentityProviderListUsersRequest : AWSRequest


/**
 <p>An array of strings, where each string is the name of a user attribute to be returned for each user in the search results. If the array is null, all attributes are returned.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributesToGet;

/**
 <p>A filter string of the form "<i>AttributeName</i><i>Filter-Type</i> "<i>AttributeValue</i>"". Quotation marks within the filter string must be escaped using the backslash (\) character. For example, "<code>family_name</code> = \"Reddy\"".</p><ul><li><p><i>AttributeName</i>: The name of the attribute to search for. You can only search for one attribute at a time.</p></li><li><p><i>Filter-Type</i>: For an exact match, use =, for example, "<code>given_name</code> = \"Jon\"". For a prefix ("starts with") match, use ^=, for example, "<code>given_name</code> ^= \"Jon\"". </p></li><li><p><i>AttributeValue</i>: The attribute value that must be matched for each user.</p></li></ul><p>If the filter string is empty, <code>ListUsers</code> returns all users in the user pool.</p><p>You can only search for the following standard attributes:</p><ul><li><p><code>username</code> (case-sensitive)</p></li><li><p><code>email</code></p></li><li><p><code>phone_number</code></p></li><li><p><code>name</code></p></li><li><p><code>given_name</code></p></li><li><p><code>family_name</code></p></li><li><p><code>preferred_username</code></p></li><li><p><code>cognito:user_status</code> (called <b>Enabled</b> in the Console) (case-sensitive)</p></li><li><p><code>status</code> (case-insensitive)</p></li><li><p><code>sub</code></p></li></ul><p>Custom attributes are not searchable.</p><p>For more information, see <a href="http://docs.aws.amazon.com/cognito/latest/developerguide/how-to-manage-user-accounts.html#cognito-user-pools-searching-for-users-using-listusers-api">Searching for Users Using the ListUsers API</a> and <a href="http://docs.aws.amazon.com/cognito/latest/developerguide/how-to-manage-user-accounts.html#cognito-user-pools-searching-for-users-listusers-api-examples">Examples of Using the ListUsers API</a> in the <i>Amazon Cognito Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filter;

/**
 <p>Maximum number of users to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>The user pool ID for the user pool on which the search should be performed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>The response from the request to list users.</p>
 */
@interface AWSCognitoIdentityProviderListUsersResponse : AWSModel


/**
 <p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>The users returned in the request to list users.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderUserType *> * _Nullable users;

@end

/**
 <p>Specifies the different settings for multi-factor authentication (MFA).</p>
 */
@interface AWSCognitoIdentityProviderMFAOptionType : AWSModel


/**
 <p>The attribute name of the MFA option type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The delivery medium (email message or SMS message) to send the MFA code.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderDeliveryMediumType deliveryMedium;

@end

/**
 <p>The message template structure.</p>
 */
@interface AWSCognitoIdentityProviderMessageTemplateType : AWSModel


/**
 <p>The message template for email messages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailMessage;

/**
 <p>The subject line for email messages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailSubject;

/**
 <p>The message template for SMS messages.</p>
 */
@property (nonatomic, strong) NSString * _Nullable SMSMessage;

@end

/**
 <p>The new device metadata type.</p>
 */
@interface AWSCognitoIdentityProviderLatestDeviceMetadataType : AWSModel


/**
 <p>The device group key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceGroupKey;

/**
 <p>The device key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceKey;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderNotifyConfigurationType : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderNotifyEmailType * _Nullable blockEmail;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable from;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderNotifyEmailType * _Nullable mfaEmail;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderNotifyEmailType * _Nullable noActionEmail;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable replyTo;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderNotifyEmailType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable htmlBody;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable subject;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable textBody;

@end

/**
 <p>The minimum and maximum value of an attribute that is of the number data type.</p>
 */
@interface AWSCognitoIdentityProviderNumberAttributeConstraintsType : AWSModel


/**
 <p>The maximum value of an attribute that is of the number data type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxValue;

/**
 <p>The minimum value of an attribute that is of the number data type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minValue;

@end

/**
 <p>The password policy type.</p>
 */
@interface AWSCognitoIdentityProviderPasswordPolicyType : AWSModel


/**
 <p>The minimum length of the password policy that you have set. Cannot be less than 6.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable minimumLength;

/**
 <p>In the password policy that you have set, refers to whether you have required users to use at least one lowercase letter in their password.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireLowercase;

/**
 <p>In the password policy that you have set, refers to whether you have required users to use at least one number in their password.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireNumbers;

/**
 <p>In the password policy that you have set, refers to whether you have required users to use at least one symbol in their password.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireSymbols;

/**
 <p>In the password policy that you have set, refers to whether you have required users to use at least one uppercase letter in their password.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable requireUppercase;

@end

/**
 <p>A container for identity provider details.</p>
 */
@interface AWSCognitoIdentityProviderProviderDescription : AWSModel


/**
 <p>The date the provider was added to the user pool.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date the provider was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The identity provider name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The identity provider type.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderIdentityProviderTypeType providerType;

@end

/**
 <p>A container for information about an identity provider for a user pool.</p>
 */
@interface AWSCognitoIdentityProviderProviderUserIdentifierType : AWSModel


/**
 <p>The name of the provider attribute to link to, for example, <code>NameID</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerAttributeName;

/**
 <p>The value of the provider attribute to link to, for example, <code>xxxxx_account</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerAttributeValue;

/**
 <p>The name of the provider, for example, Facebook, Google, or Login with Amazon.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

@end

/**
 <p>Represents the request to resend the confirmation code.</p>
 Required parameters: [ClientId, Username]
 */
@interface AWSCognitoIdentityProviderResendConfirmationCodeRequest : AWSRequest


/**
 <p>The Amazon Pinpoint analytics metadata for collecting metrics for <code>ResendConfirmationCode</code> calls.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

/**
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserContextDataType * _Nullable userContextData;

/**
 <p>The user name of the user to whom you wish to resend a confirmation code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>The response from the server when the Amazon Cognito Your User Pools service makes the request to resend a confirmation code.</p>
 */
@interface AWSCognitoIdentityProviderResendConfirmationCodeResponse : AWSModel


/**
 <p>The code delivery details returned by the server in response to the request to resend the confirmation code.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCodeDeliveryDetailsType * _Nullable codeDeliveryDetails;

@end

/**
 <p>A resource server scope.</p>
 Required parameters: [ScopeName, ScopeDescription]
 */
@interface AWSCognitoIdentityProviderResourceServerScopeType : AWSModel


/**
 <p>A description of the scope.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scopeDescription;

/**
 <p>The name of the scope.</p>
 */
@property (nonatomic, strong) NSString * _Nullable scopeName;

@end

/**
 <p>A container for information about a resource server for a user pool.</p>
 */
@interface AWSCognitoIdentityProviderResourceServerType : AWSModel


/**
 <p>The identifier for the resource server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the resource server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of scopes that are defined for the resource server.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderResourceServerScopeType *> * _Nullable scopes;

/**
 <p>The user pool ID for the user pool that hosts the resource server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>The request to respond to an authentication challenge.</p>
 Required parameters: [ClientId, ChallengeName]
 */
@interface AWSCognitoIdentityProviderRespondToAuthChallengeRequest : AWSRequest


/**
 <p>The Amazon Pinpoint analytics metadata for collecting metrics for <code>RespondToAuthChallenge</code> calls.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

/**
 <p>The challenge name. For more information, see .</p><p><code>ADMIN_NO_SRP_AUTH</code> is not a valid value.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge responses. These are inputs corresponding to the value of <code>ChallengeName</code>, for example:</p><ul><li><p><code>SMS_MFA</code>: <code>SMS_MFA_CODE</code>, <code>USERNAME</code>, <code>SECRET_HASH</code> (if app client is configured with client secret).</p></li><li><p><code>PASSWORD_VERIFIER</code>: <code>PASSWORD_CLAIM_SIGNATURE</code>, <code>PASSWORD_CLAIM_SECRET_BLOCK</code>, <code>TIMESTAMP</code>, <code>USERNAME</code>, <code>SECRET_HASH</code> (if app client is configured with client secret).</p></li><li><p><code>NEW_PASSWORD_REQUIRED</code>: <code>NEW_PASSWORD</code>, any other required attributes, <code>USERNAME</code>, <code>SECRET_HASH</code> (if app client is configured with client secret). </p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeResponses;

/**
 <p>The app client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The session which should be passed both ways in challenge-response calls to the service. If <code>InitiateAuth</code> or <code>RespondToAuthChallenge</code> API call determines that the caller needs to go through another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserContextDataType * _Nullable userContextData;

@end

/**
 <p>The response to respond to the authentication challenge.</p>
 */
@interface AWSCognitoIdentityProviderRespondToAuthChallengeResponse : AWSModel


/**
 <p>The result returned by the server in response to the request to respond to the authentication challenge.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAuthenticationResultType * _Nullable authenticationResult;

/**
 <p>The challenge name. For more information, see .</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge parameters. For more information, see .</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeParameters;

/**
 <p>The session which should be passed both ways in challenge-response calls to the service. If the or API call determines that the caller needs to go through another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderRiskConfigurationType : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountTakeoverRiskConfigurationType * _Nullable accountTakeoverRiskConfiguration;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCompromisedCredentialsRiskConfigurationType * _Nullable compromisedCredentialsRiskConfiguration;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderRiskExceptionConfigurationType * _Nullable riskExceptionConfiguration;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderRiskExceptionConfigurationType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable blockedIPRangeList;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable skippedIPRangeList;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSMSMfaSettingsType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable preferredMfa;

@end

/**
 <p>Contains information about the schema attribute.</p>
 */
@interface AWSCognitoIdentityProviderSchemaAttributeType : AWSModel


/**
 <p>The attribute data type.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderAttributeDataType attributeDataType;

/**
 <p>Specifies whether the attribute type is developer only.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable developerOnlyAttribute;

/**
 <p>Specifies whether the attribute can be changed once it has been created.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable varying;

/**
 <p>A schema attribute of the name type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specifies the constraints for an attribute of the number type.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderNumberAttributeConstraintsType * _Nullable numberAttributeConstraints;

/**
 <p>Specifies whether a user pool attribute is required. If the attribute is required and the user does not provide a value, registration or sign-in will fail.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable required;

/**
 <p>Specifies the constraints for an attribute of the string type.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderStringAttributeConstraintsType * _Nullable stringAttributeConstraints;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetRiskConfigurationRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountTakeoverRiskConfigurationType * _Nullable accountTakeoverRiskConfiguration;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCompromisedCredentialsRiskConfigurationType * _Nullable compromisedCredentialsRiskConfiguration;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderRiskExceptionConfigurationType * _Nullable riskExceptionConfiguration;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetRiskConfigurationResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderRiskConfigurationType * _Nullable riskConfiguration;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetUICustomizationRequest : AWSRequest


/**
 <p>The CSS values in the UI customization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CSS;

/**
 <p>The client ID for the client app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The uploaded logo image for the UI customization.</p>
 */
@property (nonatomic, strong) NSData * _Nullable imageFile;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetUICustomizationResponse : AWSModel


/**
 <p>The UI customization information.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUICustomizationType * _Nullable UICustomization;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetUserMFAPreferenceRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSMSMfaSettingsType * _Nullable SMSMfaSettings;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSoftwareTokenMfaSettingsType * _Nullable softwareTokenMfaSettings;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetUserMFAPreferenceResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest : AWSRequest


/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserPoolMfaType mfaConfiguration;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSmsMfaConfigType * _Nullable smsMfaConfiguration;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSoftwareTokenMfaConfigType * _Nullable softwareTokenMfaConfiguration;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse : AWSModel


/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserPoolMfaType mfaConfiguration;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSmsMfaConfigType * _Nullable smsMfaConfiguration;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSoftwareTokenMfaConfigType * _Nullable softwareTokenMfaConfiguration;

@end

/**
 <p>Represents the request to set user settings.</p>
 Required parameters: [AccessToken, MFAOptions]
 */
@interface AWSCognitoIdentityProviderSetUserSettingsRequest : AWSRequest


/**
 <p>The access token for the set user settings request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>Specifies the options for MFA (e.g., email or phone number).</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderMFAOptionType *> * _Nullable MFAOptions;

@end

/**
 <p>The response from the server for a set user settings request.</p>
 */
@interface AWSCognitoIdentityProviderSetUserSettingsResponse : AWSModel


@end

/**
 <p>Represents the request to register a user.</p>
 Required parameters: [ClientId, Username, Password]
 */
@interface AWSCognitoIdentityProviderSignUpRequest : AWSRequest


/**
 <p>The Amazon Pinpoint analytics metadata for collecting metrics for <code>SignUp</code> calls.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

/**
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The password of the user you wish to register.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 <p>An array of name-value pairs representing user attributes.</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserContextDataType * _Nullable userContextData;

/**
 <p>The user name of the user you wish to register.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

/**
 <p>The validation data in the request to register a user.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable validationData;

@end

/**
 <p>The response from the server for a registration request.</p>
 Required parameters: [UserConfirmed, UserSub]
 */
@interface AWSCognitoIdentityProviderSignUpResponse : AWSModel


/**
 <p>The code delivery details returned by the server response to the user registration request.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCodeDeliveryDetailsType * _Nullable codeDeliveryDetails;

/**
 <p>A response from the server indicating that a user registration has been confirmed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable userConfirmed;

/**
 <p>The UUID of the authenticated user. This is not the same as <code>username</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userSub;

@end

/**
 <p>The SMS configuration type.</p>
 Required parameters: [SnsCallerArn]
 */
@interface AWSCognitoIdentityProviderSmsConfigurationType : AWSModel


/**
 <p>The external ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) caller.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsCallerArn;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSmsMfaConfigType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable smsAuthenticationMessage;

/**
 <p>The SMS configuration type.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSmsConfigurationType * _Nullable smsConfiguration;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSoftwareTokenMfaConfigType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSoftwareTokenMfaSettingsType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable preferredMfa;

@end

/**
 <p>Represents the request to start the user import job.</p>
 Required parameters: [UserPoolId, JobId]
 */
@interface AWSCognitoIdentityProviderStartUserImportJobRequest : AWSRequest


/**
 <p>The job ID for the user import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The user pool ID for the user pool that the users are being imported into.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the response from the server to the request to start the user import job.</p>
 */
@interface AWSCognitoIdentityProviderStartUserImportJobResponse : AWSModel


/**
 <p>The job object that represents the user import job.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserImportJobType * _Nullable userImportJob;

@end

/**
 <p>Represents the request to stop the user import job.</p>
 Required parameters: [UserPoolId, JobId]
 */
@interface AWSCognitoIdentityProviderStopUserImportJobRequest : AWSRequest


/**
 <p>The job ID for the user import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The user pool ID for the user pool that the users are being imported into.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the response from the server to the request to stop the user import job.</p>
 */
@interface AWSCognitoIdentityProviderStopUserImportJobResponse : AWSModel


/**
 <p>The job object that represents the user import job.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserImportJobType * _Nullable userImportJob;

@end

/**
 <p>The constraints associated with a string attribute.</p>
 */
@interface AWSCognitoIdentityProviderStringAttributeConstraintsType : AWSModel


/**
 <p>The maximum length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxLength;

/**
 <p>The minimum length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minLength;

@end

/**
 <p>A container for the UI customization information for a user pool's built-in app UI.</p>
 */
@interface AWSCognitoIdentityProviderUICustomizationType : AWSModel


/**
 <p>The CSS values in the UI customization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CSS;

/**
 <p>The CSS version number.</p>
 */
@property (nonatomic, strong) NSString * _Nullable CSSVersion;

/**
 <p>The client ID for the client app.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The creation date for the UI customization.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The logo image for the UI customization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUrl;

/**
 <p>The last-modified date for the UI customization.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable feedbackToken;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderFeedbackValueType feedbackValue;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse : AWSModel


@end

/**
 <p>Represents the request to update the device status.</p>
 Required parameters: [AccessToken, DeviceKey]
 */
@interface AWSCognitoIdentityProviderUpdateDeviceStatusRequest : AWSRequest


/**
 <p>The access token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The device key.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceKey;

/**
 <p>The status of whether a device is remembered.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderDeviceRememberedStatusType deviceRememberedStatus;

@end

/**
 <p>The response to the request to update the device status.</p>
 */
@interface AWSCognitoIdentityProviderUpdateDeviceStatusResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateGroupRequest : AWSRequest


/**
 <p>A string containing the new description of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The new precedence value for the group. For more information about this parameter, see .</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable precedence;

/**
 <p>The new role ARN for the group. This is used for setting the <code>cognito:roles</code> and <code>cognito:preferred_role</code> claims in the token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateGroupResponse : AWSModel


/**
 <p>The group object for the group.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderGroupType * _Nullable group;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateIdentityProviderRequest : AWSRequest


/**
 <p>The identity provider attribute mapping to be changed.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributeMapping;

/**
 <p>A list of identity provider identifiers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable idpIdentifiers;

/**
 <p>The identity provider details to be updated, such as <code>MetadataURL</code> and <code>MetadataFile</code>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable providerDetails;

/**
 <p>The identity provider name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateIdentityProviderResponse : AWSModel


/**
 <p>The identity provider object.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderIdentityProviderType * _Nullable identityProvider;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateResourceServerRequest : AWSRequest


/**
 <p>The identifier for the resource server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The name of the resource server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The scope values to be set for the resource server.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderResourceServerScopeType *> * _Nullable scopes;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateResourceServerResponse : AWSModel


/**
 <p>The resource server.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderResourceServerType * _Nullable resourceServer;

@end

/**
 <p>Represents the request to update user attributes.</p>
 Required parameters: [UserAttributes, AccessToken]
 */
@interface AWSCognitoIdentityProviderUpdateUserAttributesRequest : AWSRequest


/**
 <p>The access token for the request to update user attributes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>An array of name-value pairs representing user attributes.</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

@end

/**
 <p>Represents the response from the server for the request to update user attributes.</p>
 */
@interface AWSCognitoIdentityProviderUpdateUserAttributesResponse : AWSModel


/**
 <p>The code delivery details list from the server for the request to update user attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderCodeDeliveryDetailsType *> * _Nullable codeDeliveryDetailsList;

@end

/**
 <p>Represents the request to update the user pool client.</p>
 Required parameters: [UserPoolId, ClientId]
 */
@interface AWSCognitoIdentityProviderUpdateUserPoolClientRequest : AWSRequest


/**
 <p>Set to <code>code</code> to initiate a code grant flow, which provides an authorization code as the response. This code can be exchanged for access tokens with the token endpoint.</p><p>Set to <code>token</code> to specify that the client should get the access token (and, optionally, ID token, based on scopes) directly.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOAuthFlows;

/**
 <p>Set to TRUE if the client is allowed to follow the OAuth protocol when interacting with Cognito user pools.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowedOAuthFlowsUserPoolClient;

/**
 <p>A list of allowed <code>OAuth</code> scopes. Currently supported values are <code>"phone"</code>, <code>"email"</code>, <code>"openid"</code>, and <code>"Cognito"</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOAuthScopes;

/**
 <p>The Amazon Pinpoint analytics configuration for collecting metrics for this user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsConfigurationType * _Nullable analyticsConfiguration;

/**
 <p>A list of allowed callback URLs for the identity providers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable callbackURLs;

/**
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The client name from the update user pool client request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientName;

/**
 <p>The default redirect URI. Must be in the <code>CallbackURLs</code> list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultRedirectURI;

/**
 <p>Explicit authentication flows.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable explicitAuthFlows;

/**
 <p>A list of allowed logout URLs for the identity providers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logoutURLs;

/**
 <p>The read-only attributes of the user pool.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable readAttributes;

/**
 <p>The time limit, in days, after which the refresh token is no longer valid and cannot be used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable refreshTokenValidity;

/**
 <p>A list of provider names for the identity providers that are supported on this client.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedIdentityProviders;

/**
 <p>The user pool ID for the user pool where you want to update the user pool client.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The writeable attributes of the user pool.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable writeAttributes;

@end

/**
 <p>Represents the response from the server to the request to update the user pool client.</p>
 */
@interface AWSCognitoIdentityProviderUpdateUserPoolClientResponse : AWSModel


/**
 <p>The user pool client value from the response from the server when an update user pool client request is made.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolClientType * _Nullable userPoolClient;

@end

/**
 <p>Represents the request to update the user pool.</p>
 Required parameters: [UserPoolId]
 */
@interface AWSCognitoIdentityProviderUpdateUserPoolRequest : AWSRequest


/**
 <p>The configuration for <code>AdminCreateUser</code> requests.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAdminCreateUserConfigType * _Nullable adminCreateUserConfig;

/**
 <p>The attributes that are automatically verified when the Amazon Cognito service makes a request to update user pools.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoVerifiedAttributes;

/**
 <p>Device configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderDeviceConfigurationType * _Nullable deviceConfiguration;

/**
 <p>Email configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderEmailConfigurationType * _Nullable emailConfiguration;

/**
 <p>The contents of the email verification message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationMessage;

/**
 <p>The subject of the email verification message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationSubject;

/**
 <p>The AWS Lambda configuration information from the request to update the user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLambdaConfigType * _Nullable lambdaConfig;

/**
 <p>Can be one of the following values:</p><ul><li><p><code>OFF</code> - MFA tokens are not required and cannot be specified during user registration.</p></li><li><p><code>ON</code> - MFA tokens are required for all user registrations. You can only specify required when you are initially creating a user pool.</p></li><li><p><code>OPTIONAL</code> - Users have the option when registering to create an MFA token.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserPoolMfaType mfaConfiguration;

/**
 <p>A container with the policies you wish to update in a user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolPolicyType * _Nullable policies;

/**
 <p>The contents of the SMS authentication message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsAuthenticationMessage;

/**
 <p>SMS configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSmsConfigurationType * _Nullable smsConfiguration;

/**
 <p>A container with information about the SMS verification message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsVerificationMessage;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolAddOnsType * _Nullable userPoolAddOns;

/**
 <p>The user pool ID for the user pool you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The cost allocation tags for the user pool. For more information, see <a href="http://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-cost-allocation-tagging.html">Adding Cost Allocation Tags to Your User Pool</a></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable userPoolTags;

/**
 <p>The template for verification messages.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderVerificationMessageTemplateType * _Nullable verificationMessageTemplate;

@end

/**
 <p>Represents the response from the server when you make a request to update the user pool.</p>
 */
@interface AWSCognitoIdentityProviderUpdateUserPoolResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderUserContextDataType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable encodedData;

@end

/**
 <p>The user import job type.</p>
 */
@interface AWSCognitoIdentityProviderUserImportJobType : AWSModel


/**
 <p>The role ARN for the Amazon CloudWatch Logging role for the user import job. For more information, see "Creating the CloudWatch Logs IAM Role" in the Amazon Cognito Developer Guide.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudWatchLogsRoleArn;

/**
 <p>The date when the user import job was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionDate;

/**
 <p>The message returned when the user import job is completed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable completionMessage;

/**
 <p>The date the user import job was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The number of users that could not be imported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable failedUsers;

/**
 <p>The number of users that were successfully imported.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable importedUsers;

/**
 <p>The job ID for the user import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobId;

/**
 <p>The job name for the user import job.</p>
 */
@property (nonatomic, strong) NSString * _Nullable jobName;

/**
 <p>The pre-signed URL to be used to upload the <code>.csv</code> file.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preSignedUrl;

/**
 <p>The number of users that were skipped.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable skippedUsers;

/**
 <p>The date when the user import job was started.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable startDate;

/**
 <p>The status of the user import job. One of the following:</p><ul><li><p><code>Created</code> - The job was created but not started.</p></li><li><p><code>Pending</code> - A transition state. You have started the job, but it has not begun importing users yet.</p></li><li><p><code>InProgress</code> - The job has started, and users are being imported.</p></li><li><p><code>Stopping</code> - You have stopped the job, but the job has not stopped importing users yet.</p></li><li><p><code>Stopped</code> - You have stopped the job, and the job has stopped importing users.</p></li><li><p><code>Succeeded</code> - The job has completed successfully.</p></li><li><p><code>Failed</code> - The job has stopped due to an error.</p></li><li><p><code>Expired</code> - You created a job, but did not start the job within 24-48 hours. All data associated with the job was deleted, and the job cannot be started.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserImportJobStatusType status;

/**
 <p>The user pool ID for the user pool that the users are being imported into.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUserPoolAddOnsType : AWSModel


/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderAdvancedSecurityModeType advancedSecurityMode;

@end

/**
 <p>The description of the user pool client.</p>
 */
@interface AWSCognitoIdentityProviderUserPoolClientDescription : AWSModel


/**
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The client name from the user pool client description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientName;

/**
 <p>The user pool ID for the user pool where you want to describe the user pool client.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Contains information about a user pool client.</p>
 */
@interface AWSCognitoIdentityProviderUserPoolClientType : AWSModel


/**
 <p>Set to <code>code</code> to initiate a code grant flow, which provides an authorization code as the response. This code can be exchanged for access tokens with the token endpoint.</p><p>Set to <code>token</code> to specify that the client should get the access token (and, optionally, ID token, based on scopes) directly.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOAuthFlows;

/**
 <p>Set to TRUE if the client is allowed to follow the OAuth protocol when interacting with Cognito user pools.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowedOAuthFlowsUserPoolClient;

/**
 <p>A list of allowed <code>OAuth</code> scopes. Currently supported values are <code>"phone"</code>, <code>"email"</code>, <code>"openid"</code>, and <code>"Cognito"</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOAuthScopes;

/**
 <p>The Amazon Pinpoint analytics configuration for the user pool client.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsConfigurationType * _Nullable analyticsConfiguration;

/**
 <p>A list of allowed callback URLs for the identity providers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable callbackURLs;

/**
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The client name from the user pool request of the client type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientName;

/**
 <p>The client secret from the user pool request of the client type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientSecret;

/**
 <p>The date the user pool client was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The default redirect URI. Must be in the <code>CallbackURLs</code> list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultRedirectURI;

/**
 <p>The explicit authentication flows.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable explicitAuthFlows;

/**
 <p>The date the user pool client was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>A list of allowed logout URLs for the identity providers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logoutURLs;

/**
 <p>The Read-only attributes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable readAttributes;

/**
 <p>The time limit, in days, after which the refresh token is no longer valid and cannot be used.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable refreshTokenValidity;

/**
 <p>A list of provider names for the identity providers that are supported on this client.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedIdentityProviders;

/**
 <p>The user pool ID for the user pool client.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The writeable attributes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable writeAttributes;

@end

/**
 <p>A user pool description.</p>
 */
@interface AWSCognitoIdentityProviderUserPoolDescriptionType : AWSModel


/**
 <p>The date the user pool description was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The ID in a user pool description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The AWS Lambda configuration information in a user pool description.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLambdaConfigType * _Nullable lambdaConfig;

/**
 <p>The date the user pool description was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The name in a user pool description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The user pool status in a user pool description.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderStatusType status;

@end

/**
 <p>The policy associated with a user pool.</p>
 */
@interface AWSCognitoIdentityProviderUserPoolPolicyType : AWSModel


/**
 <p>The password policy.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderPasswordPolicyType * _Nullable passwordPolicy;

@end

/**
 <p>A container for information about the user pool.</p>
 */
@interface AWSCognitoIdentityProviderUserPoolType : AWSModel


/**
 <p>The configuration for <code>AdminCreateUser</code> requests.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAdminCreateUserConfigType * _Nullable adminCreateUserConfig;

/**
 <p>Specifies the attributes that are aliased in a user pool.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable aliasAttributes;

/**
 <p>Specifies the attributes that are auto-verified in a user pool.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoVerifiedAttributes;

/**
 <p>The date the user pool was created.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The device configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderDeviceConfigurationType * _Nullable deviceConfiguration;

/**
 <p>The email configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderEmailConfigurationType * _Nullable emailConfiguration;

/**
 <p>The reason why the email configuration cannot send the messages to your users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailConfigurationFailure;

/**
 <p>The contents of the email verification message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationMessage;

/**
 <p>The subject of the email verification message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationSubject;

/**
 <p>A number estimating the size of the user pool.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable estimatedNumberOfUsers;

/**
 <p>The ID of the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The AWS Lambda triggers associated with tue user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLambdaConfigType * _Nullable lambdaConfig;

/**
 <p>The date the user pool was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>Can be one of the following values:</p><ul><li><p><code>OFF</code> - MFA tokens are not required and cannot be specified during user registration.</p></li><li><p><code>ON</code> - MFA tokens are required for all user registrations. You can only specify required when you are initially creating a user pool.</p></li><li><p><code>OPTIONAL</code> - Users have the option when registering to create an MFA token.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserPoolMfaType mfaConfiguration;

/**
 <p>The name of the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>The policies associated with the user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolPolicyType * _Nullable policies;

/**
 <p>A container with the schema attributes of a user pool.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderSchemaAttributeType *> * _Nullable schemaAttributes;

/**
 <p>The contents of the SMS authentication message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsAuthenticationMessage;

/**
 <p>The SMS configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSmsConfigurationType * _Nullable smsConfiguration;

/**
 <p>The reason why the SMS configuration cannot send the messages to your users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsConfigurationFailure;

/**
 <p>The contents of the SMS verification message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsVerificationMessage;

/**
 <p>The status of a user pool.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderStatusType status;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolAddOnsType * _Nullable userPoolAddOns;

/**
 <p>The cost allocation tags for the user pool. For more information, see <a href="http://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-cost-allocation-tagging.html">Adding Cost Allocation Tags to Your User Pool</a></p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable userPoolTags;

/**
 <p>Specifies whether email addresses or phone numbers can be specified as usernames when a user signs up.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable usernameAttributes;

/**
 <p>The template for verification messages.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderVerificationMessageTemplateType * _Nullable verificationMessageTemplate;

@end

/**
 <p>The user type.</p>
 */
@interface AWSCognitoIdentityProviderUserType : AWSModel


/**
 <p>A container with information about the user type attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable attributes;

/**
 <p>Specifies whether the user is enabled.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>The MFA options for the user.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderMFAOptionType *> * _Nullable MFAOptions;

/**
 <p>The creation date of the user.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable userCreateDate;

/**
 <p>The last modified date of the user.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable userLastModifiedDate;

/**
 <p>The user status. Can be one of the following:</p><ul><li><p>UNCONFIRMED - User has been created but not confirmed.</p></li><li><p>CONFIRMED - User has been confirmed.</p></li><li><p>ARCHIVED - User is no longer active.</p></li><li><p>COMPROMISED - User is disabled due to a potential security threat.</p></li><li><p>UNKNOWN - User status is not known.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserStatusType userStatus;

/**
 <p>The user name of the user you wish to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>The template for verification messages.</p>
 */
@interface AWSCognitoIdentityProviderVerificationMessageTemplateType : AWSModel


/**
 <p>The default email option.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderDefaultEmailOptionType defaultEmailOption;

/**
 <p>The email message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailMessage;

/**
 <p>The email message template for sending a confirmation link to the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailMessageByLink;

/**
 <p>The subject line for the email message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailSubject;

/**
 <p>The subject line for the email message template for sending a confirmation link to the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailSubjectByLink;

/**
 <p>The SMS message template.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsMessage;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderVerifySoftwareTokenRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable friendlyDeviceName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable session;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userCode;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderVerifySoftwareTokenResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable session;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderVerifySoftwareTokenResponseType status;

@end

/**
 <p>Represents the request to verify user attributes.</p>
 Required parameters: [AccessToken, AttributeName, Code]
 */
@interface AWSCognitoIdentityProviderVerifyUserAttributeRequest : AWSRequest


/**
 <p>Represents the access token of the request to verify user attributes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The attribute name in the request to verify user attributes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The verification code in the request to verify user attributes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable code;

@end

/**
 <p>A container representing the response from the server from the request to verify user attributes.</p>
 */
@interface AWSCognitoIdentityProviderVerifyUserAttributeResponse : AWSModel


@end

NS_ASSUME_NONNULL_END
