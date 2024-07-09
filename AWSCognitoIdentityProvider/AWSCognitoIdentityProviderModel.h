//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
    AWSCognitoIdentityProviderErrorForbidden,
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
    AWSCognitoIdentityProviderErrorUnauthorized,
    AWSCognitoIdentityProviderErrorUnexpectedLambda,
    AWSCognitoIdentityProviderErrorUnsupportedIdentityProvider,
    AWSCognitoIdentityProviderErrorUnsupportedOperation,
    AWSCognitoIdentityProviderErrorUnsupportedTokenType,
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
    AWSCognitoIdentityProviderAuthFlowTypeUserPasswordAuth,
    AWSCognitoIdentityProviderAuthFlowTypeAdminUserPasswordAuth,
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

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderCustomEmailSenderLambdaVersionType) {
    AWSCognitoIdentityProviderCustomEmailSenderLambdaVersionTypeUnknown,
    AWSCognitoIdentityProviderCustomEmailSenderLambdaVersionTypeV10,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderCustomSMSSenderLambdaVersionType) {
    AWSCognitoIdentityProviderCustomSMSSenderLambdaVersionTypeUnknown,
    AWSCognitoIdentityProviderCustomSMSSenderLambdaVersionTypeV10,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderDefaultEmailOptionType) {
    AWSCognitoIdentityProviderDefaultEmailOptionTypeUnknown,
    AWSCognitoIdentityProviderDefaultEmailOptionTypeConfirmWithLink,
    AWSCognitoIdentityProviderDefaultEmailOptionTypeConfirmWithCode,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderDeletionProtectionType) {
    AWSCognitoIdentityProviderDeletionProtectionTypeUnknown,
    AWSCognitoIdentityProviderDeletionProtectionTypeActive,
    AWSCognitoIdentityProviderDeletionProtectionTypeInactive,
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

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderEmailSendingAccountType) {
    AWSCognitoIdentityProviderEmailSendingAccountTypeUnknown,
    AWSCognitoIdentityProviderEmailSendingAccountTypeCognitoDefault,
    AWSCognitoIdentityProviderEmailSendingAccountTypeDeveloper,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderEventFilterType) {
    AWSCognitoIdentityProviderEventFilterTypeUnknown,
    AWSCognitoIdentityProviderEventFilterTypeSignIn,
    AWSCognitoIdentityProviderEventFilterTypePasswordChange,
    AWSCognitoIdentityProviderEventFilterTypeSignUp,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderEventResponseType) {
    AWSCognitoIdentityProviderEventResponseTypeUnknown,
    AWSCognitoIdentityProviderEventResponseTypePass,
    AWSCognitoIdentityProviderEventResponseTypeFail,
    AWSCognitoIdentityProviderEventResponseTypeInProgress,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderEventSourceName) {
    AWSCognitoIdentityProviderEventSourceNameUnknown,
    AWSCognitoIdentityProviderEventSourceNameUserNotification,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderEventType) {
    AWSCognitoIdentityProviderEventTypeUnknown,
    AWSCognitoIdentityProviderEventTypeSignIn,
    AWSCognitoIdentityProviderEventTypeSignUp,
    AWSCognitoIdentityProviderEventTypeForgotPassword,
    AWSCognitoIdentityProviderEventTypePasswordChange,
    AWSCognitoIdentityProviderEventTypeResendCode,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderExplicitAuthFlowsType) {
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeUnknown,
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeAdminNoSrpAuth,
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeCustomAuthFlowOnly,
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeUserPasswordAuth,
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeAllowAdminUserPasswordAuth,
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeAllowCustomAuth,
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeAllowUserPasswordAuth,
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeAllowUserSrpAuth,
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeAllowRefreshTokenAuth,
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
    AWSCognitoIdentityProviderIdentityProviderTypeTypeSignInWithApple,
    AWSCognitoIdentityProviderIdentityProviderTypeTypeOidc,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderLogLevel) {
    AWSCognitoIdentityProviderLogLevelUnknown,
    AWSCognitoIdentityProviderLogLevelError,
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

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderPreTokenGenerationLambdaVersionType) {
    AWSCognitoIdentityProviderPreTokenGenerationLambdaVersionTypeUnknown,
    AWSCognitoIdentityProviderPreTokenGenerationLambdaVersionTypeV10,
    AWSCognitoIdentityProviderPreTokenGenerationLambdaVersionTypeV20,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderPreventUserExistenceErrorTypes) {
    AWSCognitoIdentityProviderPreventUserExistenceErrorTypesUnknown,
    AWSCognitoIdentityProviderPreventUserExistenceErrorTypesLegacy,
    AWSCognitoIdentityProviderPreventUserExistenceErrorTypesEnabled,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderRecoveryOptionNameType) {
    AWSCognitoIdentityProviderRecoveryOptionNameTypeUnknown,
    AWSCognitoIdentityProviderRecoveryOptionNameTypeVerifiedEmail,
    AWSCognitoIdentityProviderRecoveryOptionNameTypeVerifiedPhoneNumber,
    AWSCognitoIdentityProviderRecoveryOptionNameTypeAdminOnly,
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

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderTimeUnitsType) {
    AWSCognitoIdentityProviderTimeUnitsTypeUnknown,
    AWSCognitoIdentityProviderTimeUnitsTypeSeconds,
    AWSCognitoIdentityProviderTimeUnitsTypeMinutes,
    AWSCognitoIdentityProviderTimeUnitsTypeHours,
    AWSCognitoIdentityProviderTimeUnitsTypeDays,
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
    AWSCognitoIdentityProviderUserStatusTypeExternalProvider,
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

@class AWSCognitoIdentityProviderAccountRecoverySettingType;
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
@class AWSCognitoIdentityProviderAdminSetUserPasswordRequest;
@class AWSCognitoIdentityProviderAdminSetUserPasswordResponse;
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
@class AWSCognitoIdentityProviderCloudWatchLogsConfigurationType;
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
@class AWSCognitoIdentityProviderCustomDomainConfigType;
@class AWSCognitoIdentityProviderCustomEmailLambdaVersionConfigType;
@class AWSCognitoIdentityProviderCustomSMSLambdaVersionConfigType;
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
@class AWSCognitoIdentityProviderGetLogDeliveryConfigurationRequest;
@class AWSCognitoIdentityProviderGetLogDeliveryConfigurationResponse;
@class AWSCognitoIdentityProviderGetSigningCertificateRequest;
@class AWSCognitoIdentityProviderGetSigningCertificateResponse;
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
@class AWSCognitoIdentityProviderListTagsForResourceRequest;
@class AWSCognitoIdentityProviderListTagsForResourceResponse;
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
@class AWSCognitoIdentityProviderLogConfigurationType;
@class AWSCognitoIdentityProviderLogDeliveryConfigurationType;
@class AWSCognitoIdentityProviderMFAOptionType;
@class AWSCognitoIdentityProviderMessageTemplateType;
@class AWSCognitoIdentityProviderLatestDeviceMetadataType;
@class AWSCognitoIdentityProviderNotifyConfigurationType;
@class AWSCognitoIdentityProviderNotifyEmailType;
@class AWSCognitoIdentityProviderNumberAttributeConstraintsType;
@class AWSCognitoIdentityProviderPasswordPolicyType;
@class AWSCognitoIdentityProviderPreTokenGenerationVersionConfigType;
@class AWSCognitoIdentityProviderProviderDescription;
@class AWSCognitoIdentityProviderProviderUserIdentifierType;
@class AWSCognitoIdentityProviderRecoveryOptionType;
@class AWSCognitoIdentityProviderResendConfirmationCodeRequest;
@class AWSCognitoIdentityProviderResendConfirmationCodeResponse;
@class AWSCognitoIdentityProviderResourceServerScopeType;
@class AWSCognitoIdentityProviderResourceServerType;
@class AWSCognitoIdentityProviderRespondToAuthChallengeRequest;
@class AWSCognitoIdentityProviderRespondToAuthChallengeResponse;
@class AWSCognitoIdentityProviderRevokeTokenRequest;
@class AWSCognitoIdentityProviderRevokeTokenResponse;
@class AWSCognitoIdentityProviderRiskConfigurationType;
@class AWSCognitoIdentityProviderRiskExceptionConfigurationType;
@class AWSCognitoIdentityProviderSMSMfaSettingsType;
@class AWSCognitoIdentityProviderSchemaAttributeType;
@class AWSCognitoIdentityProviderSetLogDeliveryConfigurationRequest;
@class AWSCognitoIdentityProviderSetLogDeliveryConfigurationResponse;
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
@class AWSCognitoIdentityProviderTagResourceRequest;
@class AWSCognitoIdentityProviderTagResourceResponse;
@class AWSCognitoIdentityProviderTokenValidityUnitsType;
@class AWSCognitoIdentityProviderUICustomizationType;
@class AWSCognitoIdentityProviderUntagResourceRequest;
@class AWSCognitoIdentityProviderUntagResourceResponse;
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
@class AWSCognitoIdentityProviderUpdateUserPoolDomainRequest;
@class AWSCognitoIdentityProviderUpdateUserPoolDomainResponse;
@class AWSCognitoIdentityProviderUpdateUserPoolRequest;
@class AWSCognitoIdentityProviderUpdateUserPoolResponse;
@class AWSCognitoIdentityProviderUserAttributeUpdateSettingsType;
@class AWSCognitoIdentityProviderUserContextDataType;
@class AWSCognitoIdentityProviderUserImportJobType;
@class AWSCognitoIdentityProviderUserPoolAddOnsType;
@class AWSCognitoIdentityProviderUserPoolClientDescription;
@class AWSCognitoIdentityProviderUserPoolClientType;
@class AWSCognitoIdentityProviderUserPoolDescriptionType;
@class AWSCognitoIdentityProviderUserPoolPolicyType;
@class AWSCognitoIdentityProviderUserPoolType;
@class AWSCognitoIdentityProviderUserType;
@class AWSCognitoIdentityProviderUsernameConfigurationType;
@class AWSCognitoIdentityProviderVerificationMessageTemplateType;
@class AWSCognitoIdentityProviderVerifySoftwareTokenRequest;
@class AWSCognitoIdentityProviderVerifySoftwareTokenResponse;
@class AWSCognitoIdentityProviderVerifyUserAttributeRequest;
@class AWSCognitoIdentityProviderVerifyUserAttributeResponse;

/**
 <p>The data type for <code>AccountRecoverySetting</code>.</p>
 */
@interface AWSCognitoIdentityProviderAccountRecoverySettingType : AWSModel


/**
 <p>The list of <code>RecoveryOptionTypes</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderRecoveryOptionType *> * _Nullable recoveryMechanisms;

@end

/**
 <p>Account takeover action type.</p>
 Required parameters: [Notify, EventAction]
 */
@interface AWSCognitoIdentityProviderAccountTakeoverActionType : AWSModel


/**
 <p>The action to take in response to the account takeover action. Valid values are as follows:</p><ul><li><p><code>BLOCK</code> Choosing this action will block the request.</p></li><li><p><code>MFA_IF_CONFIGURED</code> Present an MFA challenge if user has configured it, else allow the request.</p></li><li><p><code>MFA_REQUIRED</code> Present an MFA challenge if user has configured it, else block the request.</p></li><li><p><code>NO_ACTION</code> Allow the user to sign in.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderAccountTakeoverEventActionType eventAction;

/**
 <p>Flag specifying whether to send a notification.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable notify;

@end

/**
 <p>Account takeover actions type.</p>
 */
@interface AWSCognitoIdentityProviderAccountTakeoverActionsType : AWSModel


/**
 <p>Action to take for a high risk.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountTakeoverActionType * _Nullable highAction;

/**
 <p>Action to take for a low risk.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountTakeoverActionType * _Nullable lowAction;

/**
 <p>Action to take for a medium risk.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountTakeoverActionType * _Nullable mediumAction;

@end

/**
 <p>Configuration for mitigation actions and notification for different levels of risk detected for a potential account takeover.</p>
 Required parameters: [Actions]
 */
@interface AWSCognitoIdentityProviderAccountTakeoverRiskConfigurationType : AWSModel


/**
 <p>Account takeover risk configuration actions.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountTakeoverActionsType * _Nullable actions;

/**
 <p>The notify configuration used to construct email notifications.</p>
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
 <p>The name of the group that you want to add your user to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable groupName;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Confirm a user's registration as a user pool administrator.</p>
 Required parameters: [UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminConfirmSignUpRequest : AWSRequest


/**
 <p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers.</p><p>If your user pool configuration includes triggers, the AdminConfirmSignUp API action invokes the Lambda function that is specified for the <i>post confirmation</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. In this payload, the <code>clientMetadata</code> attribute provides the data that you assigned to the ClientMetadata parameter in your AdminConfirmSignUp request. In your function code in Lambda, you can process the ClientMetadata value to enhance your workflow for your specific needs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 <p>The user pool ID for which you want to confirm user registration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>The message template to be used for the welcome message to new users.</p><p>See also <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-message-customizations.html#cognito-user-pool-settings-user-invitation-message-customization">Customizing User Invitation Messages</a>.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderMessageTemplateType * _Nullable inviteMessageTemplate;

/**
 <p>The user account expiration limit, in days, after which a new account that hasn't signed in is no longer usable. To reset the account after that time limit, you must call <code>AdminCreateUser</code> again, specifying <code>"RESEND"</code> for the <code>MessageAction</code> parameter. The default value for this parameter is 7.</p><note><p>If you set a value for <code>TemporaryPasswordValidityDays</code> in <code>PasswordPolicy</code>, that value will be used, and <code>UnusedAccountValidityDays</code> will be no longer be an available parameter for that user pool.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable unusedAccountValidityDays;

@end

/**
 <p>Represents the request to create a user in the specified user pool.</p>
 Required parameters: [UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminCreateUserRequest : AWSRequest


/**
 <p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers.</p><p>You create custom workflows by assigning Lambda functions to user pool triggers. When you use the AdminCreateUser API action, Amazon Cognito invokes the function that is assigned to the <i>pre sign-up</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your AdminCreateUser request. In your function code in Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 <p>Specify <code>"EMAIL"</code> if email will be used to send the welcome message. Specify <code>"SMS"</code> if the phone number will be used. The default value is <code>"SMS"</code>. You can specify more than one value.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable desiredDeliveryMediums;

/**
 <p>This parameter is used only if the <code>phone_number_verified</code> or <code>email_verified</code> attribute is set to <code>True</code>. Otherwise, it is ignored.</p><p>If this parameter is set to <code>True</code> and the phone number or email address specified in the UserAttributes parameter already exists as an alias with a different user, the API call will migrate the alias from the previous user to the newly created user. The previous user will no longer be able to log in using that alias.</p><p>If this parameter is set to <code>False</code>, the API throws an <code>AliasExistsException</code> error if the alias already exists. The default value is <code>False</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceAliasCreation;

/**
 <p>Set to <code>RESEND</code> to resend the invitation message to a user that already exists and reset the expiration limit on the user's account. Set to <code>SUPPRESS</code> to suppress sending the message. You can specify only one value.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderMessageActionType messageAction;

/**
 <p>The user's temporary password. This password must conform to the password policy that you specified when you created the user pool.</p><p>The temporary password is valid only once. To complete the Admin Create User flow, the user must enter the temporary password in the sign-in page, along with a new password to be used in all future sign-ins.</p><p>This parameter isn't required. If you don't specify a value, Amazon Cognito generates one for you.</p><p>The temporary password can only be used until the user account expiration limit that you set for your user pool. To reset the account after that time limit, you must call <code>AdminCreateUser</code> again and specify <code>RESEND</code> for the <code>MessageAction</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable temporaryPassword;

/**
 <p>An array of name-value pairs that contain user attributes and attribute values to be set for the user to be created. You can create a user without specifying any attributes other than <code>Username</code>. However, any attributes that you specify as required (when creating a user pool or in the <b>Attributes</b> tab of the console) either you should supply (in your call to <code>AdminCreateUser</code>) or the user should supply (when they sign up in response to your welcome message).</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p><p>To send a message inviting the user to sign up, you must specify the user's email address or phone number. You can do this in your call to AdminCreateUser or in the <b>Users</b> tab of the Amazon Cognito console for managing your user pools.</p><p>In your call to <code>AdminCreateUser</code>, you can set the <code>email_verified</code> attribute to <code>True</code>, and you can set the <code>phone_number_verified</code> attribute to <code>True</code>. You can also do this by calling <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminUpdateUserAttributes.html">AdminUpdateUserAttributes</a>.</p><ul><li><p><b>email</b>: The email address of the user to whom the message that contains the code and username will be sent. Required if the <code>email_verified</code> attribute is set to <code>True</code>, or if <code>"EMAIL"</code> is specified in the <code>DesiredDeliveryMediums</code> parameter.</p></li><li><p><b>phone_number</b>: The phone number of the user to whom the message that contains the code and username will be sent. Required if the <code>phone_number_verified</code> attribute is set to <code>True</code>, or if <code>"SMS"</code> is specified in the <code>DesiredDeliveryMediums</code> parameter.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

/**
 <p>The user pool ID for the user pool where the user will be created.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The value that you want to set as the username sign-in attribute. The following conditions apply to the username parameter.</p><ul><li><p>The username can't be a duplicate of another username in the same user pool.</p></li><li><p>You can't change the value of a username after you create it.</p></li><li><p>You can only provide a value if usernames are a valid sign-in attribute for your user pool. If your user pool only supports phone numbers or email addresses as sign-in attributes, Amazon Cognito automatically generates a username value. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-attributes.html#user-pool-settings-aliases">Customizing sign-in attributes</a>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable username;

/**
 <p>Temporary user attributes that contribute to the outcomes of your pre sign-up Lambda trigger. This set of key-value pairs are for custom validation of information that you collect from your users but don't need to retain.</p><p>Your Lambda function can analyze this additional data and act on it. Your function might perform external API operations like logging user attributes and validation data to Amazon CloudWatch Logs. Validation data might also affect the response that your function returns to Amazon Cognito, like automatically confirming the user if they sign up from within your network.</p><p>For more information about the pre sign-up Lambda trigger, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-pre-sign-up.html">Pre sign-up Lambda trigger</a>.</p>
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
 <p>An array of strings representing the user attribute names you want to delete.</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userAttributeNames;

/**
 <p>The user pool ID for the user pool where you want to delete user attributes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>Represents the request to disable the user as an administrator.</p>
 Required parameters: [UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminDisableUserRequest : AWSRequest


/**
 <p>The user pool ID for the user pool where you want to disable the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the response from the server from the request to get the specified user as an administrator.</p>
 Required parameters: [Username]
 */
@interface AWSCognitoIdentityProviderAdminGetUserResponse : AWSModel


/**
 <p>Indicates that the status is <code>enabled</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p><i>This response parameter is no longer supported.</i> It provides information only about SMS MFA configurations. It doesn't provide information about time-based one-time password (TOTP) software token MFA configurations. To look up information about either type of MFA configuration, use UserMFASettingList instead.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderMFAOptionType *> * _Nullable MFAOptions;

/**
 <p>The user's preferred MFA setting.</p>
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
 <p>The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable userLastModifiedDate;

/**
 <p>The MFA options that are activated for the user. The possible values in this list are <code>SMS_MFA</code> and <code>SOFTWARE_TOKEN_MFA</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userMFASettingList;

/**
 <p>The user status. Can be one of the following:</p><ul><li><p>UNCONFIRMED - User has been created but not confirmed.</p></li><li><p>CONFIRMED - User has been confirmed.</p></li><li><p>UNKNOWN - User status isn't known.</p></li><li><p>RESET_REQUIRED - User is confirmed, but the user must request a code and reset their password before they can sign in.</p></li><li><p>FORCE_CHANGE_PASSWORD - The user is confirmed and the user can sign in using a temporary password, but on first sign-in, the user must change their password to a new value before doing anything else. </p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserStatusType userStatus;

/**
 <p>The username of the user that you requested.</p>
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
 <p>The authentication flow for this call to run. The API action will depend on this value. For example:</p><ul><li><p><code>REFRESH_TOKEN_AUTH</code> will take in a valid refresh token and return new tokens.</p></li><li><p><code>USER_SRP_AUTH</code> will take in <code>USERNAME</code> and <code>SRP_A</code> and return the Secure Remote Password (SRP) protocol variables to be used for next challenge execution.</p></li><li><p><code>ADMIN_USER_PASSWORD_AUTH</code> will take in <code>USERNAME</code> and <code>PASSWORD</code> and return the next challenge or tokens.</p></li></ul><p>Valid values include:</p><ul><li><p><code>USER_SRP_AUTH</code>: Authentication flow for the Secure Remote Password (SRP) protocol.</p></li><li><p><code>REFRESH_TOKEN_AUTH</code>/<code>REFRESH_TOKEN</code>: Authentication flow for refreshing the access token and ID token by supplying a valid refresh token.</p></li><li><p><code>CUSTOM_AUTH</code>: Custom authentication flow.</p></li><li><p><code>ADMIN_NO_SRP_AUTH</code>: Non-SRP authentication flow; you can pass in the USERNAME and PASSWORD directly if the flow is enabled for calling the app client.</p></li><li><p><code>ADMIN_USER_PASSWORD_AUTH</code>: Admin-based user password authentication. This replaces the <code>ADMIN_NO_SRP_AUTH</code> authentication flow. In this flow, Amazon Cognito receives the password in the request instead of using the SRP process to verify passwords.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderAuthFlowType authFlow;

/**
 <p>The authentication parameters. These are inputs corresponding to the <code>AuthFlow</code> that you're invoking. The required values depend on the value of <code>AuthFlow</code>:</p><ul><li><p>For <code>USER_SRP_AUTH</code>: <code>USERNAME</code> (required), <code>SRP_A</code> (required), <code>SECRET_HASH</code> (required if the app client is configured with a client secret), <code>DEVICE_KEY</code>.</p></li><li><p>For <code>ADMIN_USER_PASSWORD_AUTH</code>: <code>USERNAME</code> (required), <code>PASSWORD</code> (required), <code>SECRET_HASH</code> (required if the app client is configured with a client secret), <code>DEVICE_KEY</code>.</p></li><li><p>For <code>REFRESH_TOKEN_AUTH/REFRESH_TOKEN</code>: <code>REFRESH_TOKEN</code> (required), <code>SECRET_HASH</code> (required if the app client is configured with a client secret), <code>DEVICE_KEY</code>.</p></li><li><p>For <code>CUSTOM_AUTH</code>: <code>USERNAME</code> (required), <code>SECRET_HASH</code> (if app client is configured with client secret), <code>DEVICE_KEY</code>. To start the authentication flow with password verification, include <code>ChallengeName: SRP_A</code> and <code>SRP_A: (The SRP_A Value)</code>.</p></li></ul><p>For more information about <code>SECRET_HASH</code>, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash">Computing secret hash values</a>. For information about <code>DEVICE_KEY</code>, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html">Working with user devices in your user pool</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable authParameters;

/**
 <p>The app client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>A map of custom key-value pairs that you can provide as input for certain custom workflows that this action triggers.</p><p>You create custom workflows by assigning Lambda functions to user pool triggers. When you use the AdminInitiateAuth API action, Amazon Cognito invokes the Lambda functions that are specified for various triggers. The ClientMetadata value is passed as input to the functions for only the following triggers:</p><ul><li><p>Pre signup</p></li><li><p>Pre authentication</p></li><li><p>User migration</p></li></ul><p>When Amazon Cognito invokes the functions for these triggers, it passes a JSON payload, which the function receives as input. This payload contains a <code>validationData</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your AdminInitiateAuth request. In your function code in Lambda, you can process the <code>validationData</code> value to enhance your workflow for your specific needs.</p><p>When you use the AdminInitiateAuth API action, Amazon Cognito also invokes the functions for the following triggers, but it doesn't provide the ClientMetadata value as input:</p><ul><li><p>Post authentication</p></li><li><p>Custom message</p></li><li><p>Pre token generation</p></li><li><p>Create auth challenge</p></li><li><p>Define auth challenge</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 <p>Contextual data about your user session, such as the device fingerprint, IP address, or location. Amazon Cognito advanced security evaluates the risk of an authentication event based on the context that your app generates and passes to Amazon Cognito when it makes API requests.</p>
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
 <p>The result of the authentication response. This is only returned if the caller doesn't need to pass another challenge. If the caller does need to pass another challenge before it gets tokens, <code>ChallengeName</code>, <code>ChallengeParameters</code>, and <code>Session</code> are returned.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAuthenticationResultType * _Nullable authenticationResult;

/**
 <p>The name of the challenge that you're responding to with this call. This is returned in the <code>AdminInitiateAuth</code> response if you must pass another challenge.</p><ul><li><p><code>MFA_SETUP</code>: If MFA is required, users who don't have at least one of the MFA methods set up are presented with an <code>MFA_SETUP</code> challenge. The user must set up at least one MFA type to continue to authenticate.</p></li><li><p><code>SELECT_MFA_TYPE</code>: Selects the MFA type. Valid MFA options are <code>SMS_MFA</code> for text SMS MFA, and <code>SOFTWARE_TOKEN_MFA</code> for time-based one-time password (TOTP) software token MFA.</p></li><li><p><code>SMS_MFA</code>: Next challenge is to supply an <code>SMS_MFA_CODE</code>, delivered via SMS.</p></li><li><p><code>PASSWORD_VERIFIER</code>: Next challenge is to supply <code>PASSWORD_CLAIM_SIGNATURE</code>, <code>PASSWORD_CLAIM_SECRET_BLOCK</code>, and <code>TIMESTAMP</code> after the client-side SRP calculations.</p></li><li><p><code>CUSTOM_CHALLENGE</code>: This is returned if your custom authentication flow determines that the user should pass another challenge before tokens are issued.</p></li><li><p><code>DEVICE_SRP_AUTH</code>: If device tracking was activated in your user pool and the previous challenges were passed, this challenge is returned so that Amazon Cognito can start tracking this device.</p></li><li><p><code>DEVICE_PASSWORD_VERIFIER</code>: Similar to <code>PASSWORD_VERIFIER</code>, but for devices only.</p></li><li><p><code>ADMIN_NO_SRP_AUTH</code>: This is returned if you must authenticate with <code>USERNAME</code> and <code>PASSWORD</code> directly. An app client must be enabled to use this flow.</p></li><li><p><code>NEW_PASSWORD_REQUIRED</code>: For users who are required to change their passwords after successful first login. Respond to this challenge with <code>NEW_PASSWORD</code> and any required attributes that Amazon Cognito returned in the <code>requiredAttributes</code> parameter. You can also set values for attributes that aren't required by your user pool and that your app client can write. For more information, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminRespondToAuthChallenge.html">AdminRespondToAuthChallenge</a>.</p><note><p>In a <code>NEW_PASSWORD_REQUIRED</code> challenge response, you can't modify a required attribute that already has a value. In <code>AdminRespondToAuthChallenge</code>, set a value for any keys that Amazon Cognito returned in the <code>requiredAttributes</code> parameter, then use the <code>AdminUpdateUserAttributes</code> API operation to modify the value of any additional attributes.</p></note></li><li><p><code>MFA_SETUP</code>: For users who are required to set up an MFA factor before they can sign in. The MFA types activated for the user pool will be listed in the challenge parameters <code>MFAS_CAN_SETUP</code> value. </p><p> To set up software token MFA, use the session returned here from <code>InitiateAuth</code> as an input to <code>AssociateSoftwareToken</code>, and use the session returned by <code>VerifySoftwareToken</code> as an input to <code>RespondToAuthChallenge</code> with challenge name <code>MFA_SETUP</code> to complete sign-in. To set up SMS MFA, users will need help from an administrator to add a phone number to their account and then call <code>InitiateAuth</code> again to restart sign-in.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge parameters. These are returned to you in the <code>AdminInitiateAuth</code> response if you must pass another challenge. The responses in this parameter should be used to compute inputs to the next call (<code>AdminRespondToAuthChallenge</code>).</p><p>All challenges require <code>USERNAME</code> and <code>SECRET_HASH</code> (if applicable).</p><p>The value of the <code>USER_ID_FOR_SRP</code> attribute is the user's actual username, not an alias (such as email address or phone number), even if you specified an alias in your call to <code>AdminInitiateAuth</code>. This happens because, in the <code>AdminRespondToAuthChallenge</code> API <code>ChallengeResponses</code>, the <code>USERNAME</code> attribute can't be an alias.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeParameters;

/**
 <p>The session that should be passed both ways in challenge-response calls to the service. If <code>AdminInitiateAuth</code> or <code>AdminRespondToAuthChallenge</code> API call determines that the caller must pass another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>AdminRespondToAuthChallenge</code> API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminLinkProviderForUserRequest : AWSRequest


/**
 <p>The existing user in the user pool that you want to assign to the external IdP user account. This user can be a local (Username + Password) Amazon Cognito user pools user or a federated user (for example, a SAML or Facebook user). If the user doesn't exist, Amazon Cognito generates an exception. Amazon Cognito returns this user when the new user (with the linked IdP attribute) signs in.</p><p>For a native username + password user, the <code>ProviderAttributeValue</code> for the <code>DestinationUser</code> should be the username in the user pool. For a federated user, it should be the provider-specific <code>user_id</code>.</p><p>The <code>ProviderAttributeName</code> of the <code>DestinationUser</code> is ignored.</p><p>The <code>ProviderName</code> should be set to <code>Cognito</code> for users in Cognito user pools.</p><important><p>All attributes in the DestinationUser profile must be mutable. If you have assigned the user any immutable custom attributes, the operation won't succeed.</p></important>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderProviderUserIdentifierType * _Nullable destinationUser;

/**
 <p>An external IdP account for a user who doesn't exist yet in the user pool. This user must be a federated user (for example, a SAML or Facebook user), not another native user.</p><p>If the <code>SourceUser</code> is using a federated social IdP, such as Facebook, Google, or Login with Amazon, you must set the <code>ProviderAttributeName</code> to <code>Cognito_Subject</code>. For social IdPs, the <code>ProviderName</code> will be <code>Facebook</code>, <code>Google</code>, or <code>LoginWithAmazon</code>, and Amazon Cognito will automatically parse the Facebook, Google, and Login with Amazon tokens for <code>id</code>, <code>sub</code>, and <code>user_id</code>, respectively. The <code>ProviderAttributeValue</code> for the user must be the same value as the <code>id</code>, <code>sub</code>, or <code>user_id</code> value found in the social IdP token.</p><p/><p>For OIDC, the <code>ProviderAttributeName</code> can be any value that matches a claim in the ID token, or that your app retrieves from the <code>userInfo</code> endpoint. You must map the claim to a user pool attribute in your IdP configuration, and set the user pool attribute name as the value of <code>ProviderAttributeName</code> in your <code>AdminLinkProviderForUser</code> request.</p><p>For SAML, the <code>ProviderAttributeName</code> can be any value that matches a claim in the SAML assertion. To link SAML users based on the subject of the SAML assertion, map the subject to a claim through the SAML IdP and set that claim name as the value of <code>ProviderAttributeName</code> in your <code>AdminLinkProviderForUser</code> request.</p><p>For both OIDC and SAML users, when you set <code>ProviderAttributeName</code> to <code>Cognito_Subject</code>, Amazon Cognito will automatically parse the default unique identifier found in the subject from the IdP token.</p>
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
 <p>This API operation returns a limited number of results. The pagination token is an identifier that you can present in an additional API request with the same parameters. When you include the pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent requests return a new pagination token. By use of this token, you can paginate through the full list of items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>The identifier that Amazon Cognito returned with the previous request to this operation. When you include a pagination token in your request, Amazon Cognito returns the next set of items in the list. By use of this token, you can paginate through the full list of items.</p>
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
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>The maximum number of authentication events to return. Returns 60 events if you set <code>MaxResults</code> to 0, or if you don't include a <code>MaxResults</code> parameter.</p>
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

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminListUserAuthEventsResponse : AWSModel


/**
 <p>The response object. It includes the <code>EventID</code>, <code>EventType</code>, <code>CreationDate</code>, <code>EventRisk</code>, and <code>EventResponse</code>.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAuthEventType *> * _Nullable authEvents;

/**
 <p>A pagination token.</p>
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
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the request to reset a user's password as an administrator.</p>
 Required parameters: [UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminResetUserPasswordRequest : AWSRequest


/**
 <p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers.</p><p>You create custom workflows by assigning Lambda functions to user pool triggers. When you use the AdminResetUserPassword API action, Amazon Cognito invokes the function that is assigned to the <i>custom message</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your AdminResetUserPassword request. In your function code in Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs. </p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 <p>The user pool ID for the user pool where you want to reset the user's password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>The challenge name. For more information, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminInitiateAuth.html">AdminInitiateAuth</a>.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The responses to the challenge that you received in the previous request. Each challenge has its own required response parameters. The following examples are partial JSON request bodies that highlight challenge-response parameters.</p><important><p>You must provide a SECRET_HASH parameter in all challenge responses to an app client that has a client secret.</p></important><dl><dt>SMS_MFA</dt><dd><p><code>"ChallengeName": "SMS_MFA", "ChallengeResponses": {"SMS_MFA_CODE": "[SMS_code]", "USERNAME": "[username]"}</code></p></dd><dt>PASSWORD_VERIFIER</dt><dd><p><code>"ChallengeName": "PASSWORD_VERIFIER", "ChallengeResponses": {"PASSWORD_CLAIM_SIGNATURE": "[claim_signature]", "PASSWORD_CLAIM_SECRET_BLOCK": "[secret_block]", "TIMESTAMP": [timestamp], "USERNAME": "[username]"}</code></p><p>Add <code>"DEVICE_KEY"</code> when you sign in with a remembered device.</p></dd><dt>CUSTOM_CHALLENGE</dt><dd><p><code>"ChallengeName": "CUSTOM_CHALLENGE", "ChallengeResponses": {"USERNAME": "[username]", "ANSWER": "[challenge_answer]"}</code></p><p>Add <code>"DEVICE_KEY"</code> when you sign in with a remembered device.</p></dd><dt>NEW_PASSWORD_REQUIRED</dt><dd><p><code>"ChallengeName": "NEW_PASSWORD_REQUIRED", "ChallengeResponses": {"NEW_PASSWORD": "[new_password]", "USERNAME": "[username]"}</code></p><p>To set any required attributes that <code>InitiateAuth</code> returned in an <code>requiredAttributes</code> parameter, add <code>"userAttributes.[attribute_name]": "[attribute_value]"</code>. This parameter can also set values for writable attributes that aren't required by your user pool.</p><note><p>In a <code>NEW_PASSWORD_REQUIRED</code> challenge response, you can't modify a required attribute that already has a value. In <code>RespondToAuthChallenge</code>, set a value for any keys that Amazon Cognito returned in the <code>requiredAttributes</code> parameter, then use the <code>UpdateUserAttributes</code> API operation to modify the value of any additional attributes.</p></note></dd><dt>SOFTWARE_TOKEN_MFA</dt><dd><p><code>"ChallengeName": "SOFTWARE_TOKEN_MFA", "ChallengeResponses": {"USERNAME": "[username]", "SOFTWARE_TOKEN_MFA_CODE": [authenticator_code]}</code></p></dd><dt>DEVICE_SRP_AUTH</dt><dd><p><code>"ChallengeName": "DEVICE_SRP_AUTH", "ChallengeResponses": {"USERNAME": "[username]", "DEVICE_KEY": "[device_key]", "SRP_A": "[srp_a]"}</code></p></dd><dt>DEVICE_PASSWORD_VERIFIER</dt><dd><p><code>"ChallengeName": "DEVICE_PASSWORD_VERIFIER", "ChallengeResponses": {"DEVICE_KEY": "[device_key]", "PASSWORD_CLAIM_SIGNATURE": "[claim_signature]", "PASSWORD_CLAIM_SECRET_BLOCK": "[secret_block]", "TIMESTAMP": [timestamp], "USERNAME": "[username]"}</code></p></dd><dt>MFA_SETUP</dt><dd><p><code>"ChallengeName": "MFA_SETUP", "ChallengeResponses": {"USERNAME": "[username]"}, "SESSION": "[Session ID from VerifySoftwareToken]"</code></p></dd><dt>SELECT_MFA_TYPE</dt><dd><p><code>"ChallengeName": "SELECT_MFA_TYPE", "ChallengeResponses": {"USERNAME": "[username]", "ANSWER": "[SMS_MFA or SOFTWARE_TOKEN_MFA]"}</code></p></dd></dl><p>For more information about <code>SECRET_HASH</code>, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash">Computing secret hash values</a>. For information about <code>DEVICE_KEY</code>, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html">Working with user devices in your user pool</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeResponses;

/**
 <p>The app client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers.</p><p>You create custom workflows by assigning Lambda functions to user pool triggers. When you use the AdminRespondToAuthChallenge API action, Amazon Cognito invokes any functions that you have assigned to the following triggers: </p><ul><li><p>pre sign-up</p></li><li><p>custom message</p></li><li><p>post authentication</p></li><li><p>user migration</p></li><li><p>pre token generation</p></li><li><p>define auth challenge</p></li><li><p>create auth challenge</p></li><li><p>verify auth challenge response</p></li></ul><p>When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute that provides the data that you assigned to the ClientMetadata parameter in your AdminRespondToAuthChallenge request. In your function code in Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 <p>Contextual data about your user session, such as the device fingerprint, IP address, or location. Amazon Cognito advanced security evaluates the risk of an authentication event based on the context that your app generates and passes to Amazon Cognito when it makes API requests.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderContextDataType * _Nullable contextData;

/**
 <p>The session that should be passed both ways in challenge-response calls to the service. If an <code>InitiateAuth</code> or <code>RespondToAuthChallenge</code> API call determines that the caller must pass another challenge, it returns a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>
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
 <p>The name of the challenge. For more information, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminInitiateAuth.html">AdminInitiateAuth</a>.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge parameters. For more information, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminInitiateAuth.html">AdminInitiateAuth</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeParameters;

/**
 <p>The session that should be passed both ways in challenge-response calls to the service. If the caller must pass another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest : AWSRequest


/**
 <p>The SMS text message MFA settings.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSMSMfaSettingsType * _Nullable SMSMfaSettings;

/**
 <p>The time-based one-time password software token MFA settings.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSoftwareTokenMfaSettingsType * _Nullable softwareTokenMfaSettings;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminSetUserPasswordRequest : AWSRequest


/**
 <p>The password for the user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p><code>True</code> if the password is permanent, <code>False</code> if it is temporary.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable permanent;

/**
 <p>The user pool ID for the user pool where you want to set the user's password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminSetUserPasswordResponse : AWSModel


@end

/**
 <p>You can use this parameter to set an MFA configuration that uses the SMS delivery medium.</p>
 Required parameters: [UserPoolId, Username, MFAOptions]
 */
@interface AWSCognitoIdentityProviderAdminSetUserSettingsRequest : AWSRequest


/**
 <p>You can use this parameter only to set an SMS configuration that uses SMS for delivery.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderMFAOptionType *> * _Nullable MFAOptions;

/**
 <p>The ID of the user pool that contains the user whose options you're setting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>The authentication event ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 <p>The authentication event feedback value. When you provide a <code>FeedbackValue</code> value of <code>valid</code>, you tell Amazon Cognito that you trust a user session where Amazon Cognito has evaluated some level of risk. When you provide a <code>FeedbackValue</code> value of <code>invalid</code>, you tell Amazon Cognito that you don't trust a user session, or you don't believe that Amazon Cognito evaluated a high-enough risk level.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderFeedbackValueType feedbackValue;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>The status response to the request to update the device, as an administrator.</p>
 */
@interface AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse : AWSModel


@end

/**
 <p>Represents the request to update the user's attributes as an administrator.</p>
 Required parameters: [UserPoolId, Username, UserAttributes]
 */
@interface AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest : AWSRequest


/**
 <p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers.</p><p>You create custom workflows by assigning Lambda functions to user pool triggers. When you use the AdminUpdateUserAttributes API action, Amazon Cognito invokes the function that is assigned to the <i>custom message</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your AdminUpdateUserAttributes request. In your function code in Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 <p>An array of name-value pairs representing user attributes.</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p><p>If your user pool requires verification before Amazon Cognito updates an attribute value that you specify in this request, Amazon Cognito doesn’t immediately update the value of that attribute. After your user receives and responds to a verification message to verify the new value, Amazon Cognito updates the attribute value. Your user can sign in and receive messages with the original attribute value until they verify the new value.</p><p>To update the value of an attribute that requires verification in the same API request, include the <code>email_verified</code> or <code>phone_number_verified</code> attribute, with a value of <code>true</code>. If you set the <code>email_verified</code> or <code>phone_number_verified</code> value for an <code>email</code> or <code>phone_number</code> attribute that requires verification to <code>true</code>, Amazon Cognito doesn’t send a verification message to your user.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

/**
 <p>The user pool ID for the user pool where you want to update user attributes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>The global sign-out response, as an administrator.</p>
 */
@interface AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse : AWSModel


@end

/**
 <p>The Amazon Pinpoint analytics configuration necessary to collect metrics for a user pool.</p><note><p>In Regions where Amazon Pinpoint isn't available, user pools only support sending events to Amazon Pinpoint projects in us-east-1. In Regions where Amazon Pinpoint is available, user pools support sending events to Amazon Pinpoint projects within that same Region.</p></note>
 */
@interface AWSCognitoIdentityProviderAnalyticsConfigurationType : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of an Amazon Pinpoint project. You can use the Amazon Pinpoint project to integrate with the chosen user pool Client. Amazon Cognito publishes events to the Amazon Pinpoint project that the app ARN declares.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationArn;

/**
 <p>The application ID for an Amazon Pinpoint application.</p>
 */
@property (nonatomic, strong) NSString * _Nullable applicationId;

/**
 <p>The external ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 <p>The ARN of an Identity and Access Management role that authorizes Amazon Cognito to publish events to Amazon Pinpoint analytics.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>If <code>UserDataShared</code> is <code>true</code>, Amazon Cognito includes user data in the events that it publishes to Amazon Pinpoint analytics.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable userDataShared;

@end

/**
 <p>An Amazon Pinpoint analytics endpoint.</p><p>An endpoint uniquely identifies a mobile device, email address, or phone number that can receive messages from Amazon Pinpoint analytics. For more information about Amazon Web Services Regions that can contain Amazon Pinpoint resources for use with Amazon Cognito user pools, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-pinpoint-integration.html">Using Amazon Pinpoint analytics with Amazon Cognito user pools</a>.</p>
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
 <p>A valid access token that Amazon Cognito issued to the user whose software token you want to generate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The session that should be passed both ways in challenge-response calls to the service. This allows authentication of the user as part of the MFA setup process.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAssociateSoftwareTokenResponse : AWSModel


/**
 <p>A unique generated shared secret code that is used in the TOTP algorithm to generate a one-time code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretCode;

/**
 <p>The session that should be passed both ways in challenge-response calls to the service. This allows authentication of the user as part of the MFA setup process.</p>
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
 <p>The authentication event type.</p>
 */
@interface AWSCognitoIdentityProviderAuthEventType : AWSModel


/**
 <p>The challenge responses.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderChallengeResponseType *> * _Nullable challengeResponses;

/**
 <p>The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The user context data captured at the time of an event request. This value provides additional information about the client from which event the request is received.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderEventContextDataType * _Nullable eventContextData;

/**
 <p>A flag specifying the user feedback captured at the time of an event request is good or bad. </p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderEventFeedbackType * _Nullable eventFeedback;

/**
 <p>The event ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 <p>The event response.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderEventResponseType eventResponse;

/**
 <p>The event risk.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderEventRiskType * _Nullable eventRisk;

/**
 <p>The event type.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderEventType eventType;

@end

/**
 <p>The authentication result.</p>
 */
@interface AWSCognitoIdentityProviderAuthenticationResultType : AWSModel


/**
 <p>A valid access token that Amazon Cognito issued to the user who you want to authenticate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The expiration period of the authentication result in seconds.</p>
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
 <p>The challenge response type.</p>
 */
@interface AWSCognitoIdentityProviderChallengeResponseType : AWSModel


/**
 <p>The challenge name.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeName challengeName;

/**
 <p>The challenge response.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeResponse challengeResponse;

@end

/**
 <p>Represents the request to change a user password.</p>
 Required parameters: [PreviousPassword, ProposedPassword, AccessToken]
 */
@interface AWSCognitoIdentityProviderChangePasswordRequest : AWSRequest


/**
 <p>A valid access token that Amazon Cognito issued to the user whose password you want to change.</p>
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
 <p>The CloudWatch logging destination of a user pool detailed activity logging configuration.</p>
 */
@interface AWSCognitoIdentityProviderCloudWatchLogsConfigurationType : AWSModel


/**
 <p>The Amazon Resource Name (arn) of a CloudWatch Logs log group where your user pool sends logs. The log group must not be encrypted with Key Management Service and must be in the same Amazon Web Services account as your user pool.</p><p>To send logs to log groups with a resource policy of a size greater than 5120 characters, configure a log group with a path that starts with <code>/aws/vendedlogs</code>. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html">Enabling logging from certain Amazon Web Services services</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable logGroupArn;

@end

/**
 <p>The delivery details for an email or SMS message that Amazon Cognito sent for authentication or verification.</p>
 */
@interface AWSCognitoIdentityProviderCodeDeliveryDetailsType : AWSModel


/**
 <p>The name of the attribute that Amazon Cognito verifies with the code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The method that Amazon Cognito used to send the code.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderDeliveryMediumType deliveryMedium;

/**
 <p>The email address or phone number destination where Amazon Cognito sent the code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable destination;

@end

/**
 <p>The compromised credentials actions type.</p>
 Required parameters: [EventAction]
 */
@interface AWSCognitoIdentityProviderCompromisedCredentialsActionsType : AWSModel


/**
 <p>The event action.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderCompromisedCredentialsEventActionType eventAction;

@end

/**
 <p>The compromised credentials risk configuration type.</p>
 Required parameters: [Actions]
 */
@interface AWSCognitoIdentityProviderCompromisedCredentialsRiskConfigurationType : AWSModel


/**
 <p>The compromised credentials risk configuration actions.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCompromisedCredentialsActionsType * _Nullable actions;

/**
 <p>Perform the action for these events. The default is to perform all events if no event filter is specified.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable eventFilter;

@end

/**
 <p>Confirms the device request.</p>
 Required parameters: [AccessToken, DeviceKey]
 */
@interface AWSCognitoIdentityProviderConfirmDeviceRequest : AWSRequest


/**
 <p>A valid access token that Amazon Cognito issued to the user whose device you want to confirm.</p>
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
 <p>Indicates whether the user confirmation must confirm the device response.</p>
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
 <p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers.</p><p>You create custom workflows by assigning Lambda functions to user pool triggers. When you use the ConfirmForgotPassword API action, Amazon Cognito invokes the function that is assigned to the <i>post confirmation</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your ConfirmForgotPassword request. In your function code in Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 <p>The confirmation code from your user's request to reset their password. For more information, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_ForgotPassword.html">ForgotPassword</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable confirmationCode;

/**
 <p>The new password that your user wants to set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message. For more information about <code>SecretHash</code>, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash">Computing secret hash values</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 <p>Contextual data about your user session, such as the device fingerprint, IP address, or location. Amazon Cognito advanced security evaluates the risk of an authentication event based on the context that your app generates and passes to Amazon Cognito when it makes API requests.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserContextDataType * _Nullable userContextData;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers.</p><p>You create custom workflows by assigning Lambda functions to user pool triggers. When you use the ConfirmSignUp API action, Amazon Cognito invokes the function that is assigned to the <i>post confirmation</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your ConfirmSignUp request. In your function code in Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

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
 <p>Contextual data about your user session, such as the device fingerprint, IP address, or location. Amazon Cognito advanced security evaluates the risk of an authentication event based on the context that your app generates and passes to Amazon Cognito when it makes API requests.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserContextDataType * _Nullable userContextData;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the response from the server for the registration confirmation.</p>
 */
@interface AWSCognitoIdentityProviderConfirmSignUpResponse : AWSModel


@end

/**
 <p>Contextual user data type used for evaluating the risk of an unexpected event by Amazon Cognito advanced security.</p>
 Required parameters: [IpAddress, ServerName, ServerPath, HttpHeaders]
 */
@interface AWSCognitoIdentityProviderContextDataType : AWSModel


/**
 <p>Encoded device-fingerprint details that your app collected with the Amazon Cognito context data collection library. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-adaptive-authentication.html#user-pool-settings-adaptive-authentication-device-fingerprint">Adding user device and session data to API requests</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable encodedData;

/**
 <p>HttpHeaders received on your server in same order.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderHttpHeader *> * _Nullable httpHeaders;

/**
 <p>The source IP address of your user's device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddress;

/**
 <p>Your server endpoint where this API is invoked.</p>
 */
@property (nonatomic, strong) NSString * _Nullable serverName;

/**
 <p>Your server path where this API is invoked.</p>
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
 <p>A non-negative integer value that specifies the precedence of this group relative to the other groups that a user can belong to in the user pool. Zero is the highest precedence value. Groups with lower <code>Precedence</code> values take precedence over groups with higher or null <code>Precedence</code> values. If a user belongs to two or more groups, it is the group with the lowest precedence value whose role ARN is given in the user's tokens for the <code>cognito:roles</code> and <code>cognito:preferred_role</code> claims.</p><p>Two groups can have the same <code>Precedence</code> value. If this happens, neither group takes precedence over the other. If two groups with the same <code>Precedence</code> have the same role ARN, that role is used in the <code>cognito:preferred_role</code> claim in tokens for users in each group. If the two groups have different role ARNs, the <code>cognito:preferred_role</code> claim isn't set in users' tokens.</p><p>The default <code>Precedence</code> value is null. The maximum <code>Precedence</code> value is <code>2^31-1</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable precedence;

/**
 <p>The role Amazon Resource Name (ARN) for the group.</p>
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
 <p>A mapping of IdP attributes to standard and custom user pool attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributeMapping;

/**
 <p>A list of IdP identifiers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable idpIdentifiers;

/**
 <p>The scopes, URLs, and identifiers for your external identity provider. The following examples describe the provider detail keys for each IdP type. These values and their schema are subject to change. Social IdP <code>authorize_scopes</code> values must match the values listed here.</p><dl><dt>OpenID Connect (OIDC)</dt><dd><p>Amazon Cognito accepts the following elements when it can't discover endpoint URLs from <code>oidc_issuer</code>: <code>attributes_url</code>, <code>authorize_url</code>, <code>jwks_uri</code>, <code>token_url</code>.</p><p>Create or update request: <code>"ProviderDetails": { "attributes_request_method": "GET", "attributes_url": "https://auth.example.com/userInfo", "authorize_scopes": "openid profile email", "authorize_url": "https://auth.example.com/authorize", "client_id": "1example23456789", "client_secret": "provider-app-client-secret", "jwks_uri": "https://auth.example.com/.well-known/jwks.json", "oidc_issuer": "https://auth.example.com", "token_url": "https://example.com/token" }</code></p><p>Describe response: <code>"ProviderDetails": { "attributes_request_method": "GET", "attributes_url": "https://auth.example.com/userInfo", "attributes_url_add_attributes": "false", "authorize_scopes": "openid profile email", "authorize_url": "https://auth.example.com/authorize", "client_id": "1example23456789", "client_secret": "provider-app-client-secret", "jwks_uri": "https://auth.example.com/.well-known/jwks.json", "oidc_issuer": "https://auth.example.com", "token_url": "https://example.com/token" }</code></p></dd><dt>SAML</dt><dd><p>Create or update request with Metadata URL: <code>"ProviderDetails": { "IDPInit": "true", "IDPSignout": "true", "EncryptedResponses" : "true", "MetadataURL": "https://auth.example.com/sso/saml/metadata", "RequestSigningAlgorithm": "rsa-sha256" }</code></p><p>Create or update request with Metadata file: <code>"ProviderDetails": { "IDPInit": "true", "IDPSignout": "true", "EncryptedResponses" : "true", "MetadataFile": "[metadata XML]", "RequestSigningAlgorithm": "rsa-sha256" }</code></p><p>The value of <code>MetadataFile</code> must be the plaintext metadata document with all quote (") characters escaped by backslashes.</p><p>Describe response: <code>"ProviderDetails": { "IDPInit": "true", "IDPSignout": "true", "EncryptedResponses" : "true", "ActiveEncryptionCertificate": "[certificate]", "MetadataURL": "https://auth.example.com/sso/saml/metadata", "RequestSigningAlgorithm": "rsa-sha256", "SLORedirectBindingURI": "https://auth.example.com/slo/saml", "SSORedirectBindingURI": "https://auth.example.com/sso/saml" }</code></p></dd><dt>LoginWithAmazon</dt><dd><p>Create or update request: <code>"ProviderDetails": { "authorize_scopes": "profile postal_code", "client_id": "amzn1.application-oa2-client.1example23456789", "client_secret": "provider-app-client-secret"</code></p><p>Describe response: <code>"ProviderDetails": { "attributes_url": "https://api.amazon.com/user/profile", "attributes_url_add_attributes": "false", "authorize_scopes": "profile postal_code", "authorize_url": "https://www.amazon.com/ap/oa", "client_id": "amzn1.application-oa2-client.1example23456789", "client_secret": "provider-app-client-secret", "token_request_method": "POST", "token_url": "https://api.amazon.com/auth/o2/token" }</code></p></dd><dt>Google</dt><dd><p>Create or update request: <code>"ProviderDetails": { "authorize_scopes": "email profile openid", "client_id": "1example23456789.apps.googleusercontent.com", "client_secret": "provider-app-client-secret" }</code></p><p>Describe response: <code>"ProviderDetails": { "attributes_url": "https://people.googleapis.com/v1/people/me?personFields=", "attributes_url_add_attributes": "true", "authorize_scopes": "email profile openid", "authorize_url": "https://accounts.google.com/o/oauth2/v2/auth", "client_id": "1example23456789.apps.googleusercontent.com", "client_secret": "provider-app-client-secret", "oidc_issuer": "https://accounts.google.com", "token_request_method": "POST", "token_url": "https://www.googleapis.com/oauth2/v4/token" }</code></p></dd><dt>SignInWithApple</dt><dd><p>Create or update request: <code>"ProviderDetails": { "authorize_scopes": "email name", "client_id": "com.example.cognito", "private_key": "1EXAMPLE", "key_id": "2EXAMPLE", "team_id": "3EXAMPLE" }</code></p><p>Describe response: <code>"ProviderDetails": { "attributes_url_add_attributes": "false", "authorize_scopes": "email name", "authorize_url": "https://appleid.apple.com/auth/authorize", "client_id": "com.example.cognito", "key_id": "1EXAMPLE", "oidc_issuer": "https://appleid.apple.com", "team_id": "2EXAMPLE", "token_request_method": "POST", "token_url": "https://appleid.apple.com/auth/token" }</code></p></dd><dt>Facebook</dt><dd><p>Create or update request: <code>"ProviderDetails": { "api_version": "v17.0", "authorize_scopes": "public_profile, email", "client_id": "1example23456789", "client_secret": "provider-app-client-secret" }</code></p><p>Describe response: <code>"ProviderDetails": { "api_version": "v17.0", "attributes_url": "https://graph.facebook.com/v17.0/me?fields=", "attributes_url_add_attributes": "true", "authorize_scopes": "public_profile, email", "authorize_url": "https://www.facebook.com/v17.0/dialog/oauth", "client_id": "1example23456789", "client_secret": "provider-app-client-secret", "token_request_method": "GET", "token_url": "https://graph.facebook.com/v17.0/oauth/access_token" }</code></p></dd></dl>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable providerDetails;

/**
 <p>The IdP name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The IdP type.</p>
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
 <p>The newly created IdP object.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderIdentityProviderType * _Nullable identityProvider;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderCreateResourceServerRequest : AWSRequest


/**
 <p>A unique resource server identifier for the resource server. The identifier can be an API friendly name like <code>solar-system-data</code>. You can also set an API URL like <code>https://solar-system-data-api.example.com</code> as your identifier.</p><p>Amazon Cognito represents scopes in the access token in the format <code>$resource-server-identifier/$scope</code>. Longer scope-identifier strings increase the size of your access tokens.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>A friendly name for the resource server.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>A list of scopes. Each scope is a key-value map with the keys <code>name</code> and <code>description</code>.</p>
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
 <p>The role ARN for the Amazon CloudWatch Logs Logging role for the user import job.</p>
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
 <p>The access token time limit. After this limit expires, your user can't use their access token. To specify the time unit for <code>AccessTokenValidity</code> as <code>seconds</code>, <code>minutes</code>, <code>hours</code>, or <code>days</code>, set a <code>TokenValidityUnits</code> value in your API request.</p><p>For example, when you set <code>AccessTokenValidity</code> to <code>10</code> and <code>TokenValidityUnits</code> to <code>hours</code>, your user can authorize access with their access token for 10 hours.</p><p>The default time unit for <code>AccessTokenValidity</code> in an API request is hours. <i>Valid range</i> is displayed below in seconds.</p><p>If you don't specify otherwise in the configuration of your app client, your access tokens are valid for one hour.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable accessTokenValidity;

/**
 <p>The OAuth grant types that you want your app client to generate. To create an app client that generates client credentials grants, you must add <code>client_credentials</code> as the only allowed OAuth flow.</p><dl><dt>code</dt><dd><p>Use a code grant flow, which provides an authorization code as the response. This code can be exchanged for access tokens with the <code>/oauth2/token</code> endpoint.</p></dd><dt>implicit</dt><dd><p>Issue the access token (and, optionally, ID token, based on scopes) directly to your user.</p></dd><dt>client_credentials</dt><dd><p>Issue the access token from the <code>/oauth2/token</code> endpoint directly to a non-person user using a combination of the client ID and client secret.</p></dd></dl>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOAuthFlows;

/**
 <p>Set to <code>true</code> to use OAuth 2.0 features in your user pool app client.</p><p><code>AllowedOAuthFlowsUserPoolClient</code> must be <code>true</code> before you can configure the following features in your app client.</p><ul><li><p><code>CallBackURLs</code>: Callback URLs.</p></li><li><p><code>LogoutURLs</code>: Sign-out redirect URLs.</p></li><li><p><code>AllowedOAuthScopes</code>: OAuth 2.0 scopes.</p></li><li><p><code>AllowedOAuthFlows</code>: Support for authorization code, implicit, and client credentials OAuth 2.0 grants.</p></li></ul><p>To use OAuth 2.0 features, configure one of these features in the Amazon Cognito console or set <code>AllowedOAuthFlowsUserPoolClient</code> to <code>true</code> in a <code>CreateUserPoolClient</code> or <code>UpdateUserPoolClient</code> API request. If you don't set a value for <code>AllowedOAuthFlowsUserPoolClient</code> in a request with the CLI or SDKs, it defaults to <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowedOAuthFlowsUserPoolClient;

/**
 <p>The allowed OAuth scopes. Possible values provided by OAuth are <code>phone</code>, <code>email</code>, <code>openid</code>, and <code>profile</code>. Possible values provided by Amazon Web Services are <code>aws.cognito.signin.user.admin</code>. Custom scopes created in Resource Servers are also supported.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOAuthScopes;

/**
 <p>The user pool analytics configuration for collecting metrics and sending them to your Amazon Pinpoint campaign.</p><note><p>In Amazon Web Services Regions where Amazon Pinpoint isn't available, user pools only support sending events to Amazon Pinpoint projects in Amazon Web Services Region us-east-1. In Regions where Amazon Pinpoint is available, user pools support sending events to Amazon Pinpoint projects within that same Region.</p></note>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsConfigurationType * _Nullable analyticsConfiguration;

/**
 <p>Amazon Cognito creates a session token for each API request in an authentication flow. <code>AuthSessionValidity</code> is the duration, in minutes, of that session token. Your user pool native user must respond to each authentication challenge before the session expires.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable authSessionValidity;

/**
 <p>A list of allowed redirect (callback) URLs for the IdPs.</p><p>A redirect URI must:</p><ul><li><p>Be an absolute URI.</p></li><li><p>Be registered with the authorization server.</p></li><li><p>Not include a fragment component.</p></li></ul><p>See <a href="https://tools.ietf.org/html/rfc6749#section-3.1.2">OAuth 2.0 - Redirection Endpoint</a>.</p><p>Amazon Cognito requires HTTPS over HTTP except for http://localhost for testing purposes only.</p><p>App callback URLs such as myapp://example are also supported.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable callbackURLs;

/**
 <p>The client name for the user pool client you would like to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientName;

/**
 <p>The default redirect URI. In app clients with one assigned IdP, replaces <code>redirect_uri</code> in authentication requests. Must be in the <code>CallbackURLs</code> list.</p><p>A redirect URI must:</p><ul><li><p>Be an absolute URI.</p></li><li><p>Be registered with the authorization server.</p></li><li><p>Not include a fragment component.</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-client-apps.html#cognito-user-pools-app-idp-settings-about">Default redirect URI</a>.</p><p>Amazon Cognito requires HTTPS over HTTP except for http://localhost for testing purposes only.</p><p>App callback URLs such as myapp://example are also supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultRedirectURI;

/**
 <p>Activates the propagation of additional user context data. For more information about propagation of user context data, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-advanced-security.html"> Adding advanced security to a user pool</a>. If you don’t include this parameter, you can't send device fingerprint information, including source IP address, to Amazon Cognito advanced security. You can only activate <code>EnablePropagateAdditionalUserContextData</code> in an app client that has a client secret.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enablePropagateAdditionalUserContextData;

/**
 <p>Activates or deactivates token revocation. For more information about revoking tokens, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_RevokeToken.html">RevokeToken</a>.</p><p>If you don't include this parameter, token revocation is automatically activated for the new user pool client.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableTokenRevocation;

/**
 <p>The authentication flows that you want your user pool client to support. For each app client in your user pool, you can sign in your users with any combination of one or more flows, including with a user name and Secure Remote Password (SRP), a user name and password, or a custom authentication process that you define with Lambda functions.</p><note><p>If you don't specify a value for <code>ExplicitAuthFlows</code>, your user client supports <code>ALLOW_REFRESH_TOKEN_AUTH</code>, <code>ALLOW_USER_SRP_AUTH</code>, and <code>ALLOW_CUSTOM_AUTH</code>.</p></note><p>Valid values include:</p><ul><li><p><code>ALLOW_ADMIN_USER_PASSWORD_AUTH</code>: Enable admin based user password authentication flow <code>ADMIN_USER_PASSWORD_AUTH</code>. This setting replaces the <code>ADMIN_NO_SRP_AUTH</code> setting. With this authentication flow, your app passes a user name and password to Amazon Cognito in the request, instead of using the Secure Remote Password (SRP) protocol to securely transmit the password.</p></li><li><p><code>ALLOW_CUSTOM_AUTH</code>: Enable Lambda trigger based authentication.</p></li><li><p><code>ALLOW_USER_PASSWORD_AUTH</code>: Enable user password-based authentication. In this flow, Amazon Cognito receives the password in the request instead of using the SRP protocol to verify passwords.</p></li><li><p><code>ALLOW_USER_SRP_AUTH</code>: Enable SRP-based authentication.</p></li><li><p><code>ALLOW_REFRESH_TOKEN_AUTH</code>: Enable authflow to refresh tokens.</p></li></ul><p>In some environments, you will see the values <code>ADMIN_NO_SRP_AUTH</code>, <code>CUSTOM_AUTH_FLOW_ONLY</code>, or <code>USER_PASSWORD_AUTH</code>. You can't assign these legacy <code>ExplicitAuthFlows</code> values to user pool clients at the same time as values that begin with <code>ALLOW_</code>, like <code>ALLOW_USER_SRP_AUTH</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable explicitAuthFlows;

/**
 <p>Boolean to specify whether you want to generate a secret for the user pool client being created.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable generateSecret;

/**
 <p>The ID token time limit. After this limit expires, your user can't use their ID token. To specify the time unit for <code>IdTokenValidity</code> as <code>seconds</code>, <code>minutes</code>, <code>hours</code>, or <code>days</code>, set a <code>TokenValidityUnits</code> value in your API request.</p><p>For example, when you set <code>IdTokenValidity</code> as <code>10</code> and <code>TokenValidityUnits</code> as <code>hours</code>, your user can authenticate their session with their ID token for 10 hours.</p><p>The default time unit for <code>IdTokenValidity</code> in an API request is hours. <i>Valid range</i> is displayed below in seconds.</p><p>If you don't specify otherwise in the configuration of your app client, your ID tokens are valid for one hour.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable idTokenValidity;

/**
 <p>A list of allowed logout URLs for the IdPs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logoutURLs;

/**
 <p>Errors and responses that you want Amazon Cognito APIs to return during authentication, account confirmation, and password recovery when the user doesn't exist in the user pool. When set to <code>ENABLED</code> and the user doesn't exist, authentication returns an error indicating either the username or password was incorrect. Account confirmation and password recovery return a response indicating a code was sent to a simulated destination. When set to <code>LEGACY</code>, those APIs return a <code>UserNotFoundException</code> exception if the user doesn't exist in the user pool.</p><p>Valid values include:</p><ul><li><p><code>ENABLED</code> - This prevents user existence-related errors.</p></li><li><p><code>LEGACY</code> - This represents the early behavior of Amazon Cognito where user existence related errors aren't prevented.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderPreventUserExistenceErrorTypes preventUserExistenceErrors;

/**
 <p>The list of user attributes that you want your app client to have read-only access to. After your user authenticates in your app, their access token authorizes them to read their own attribute value for any attribute in this list. An example of this kind of activity is when your user selects a link to view their profile information. Your app makes a <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_GetUser.html">GetUser</a> API request to retrieve and display your user's profile data.</p><p>When you don't specify the <code>ReadAttributes</code> for your app client, your app can read the values of <code>email_verified</code>, <code>phone_number_verified</code>, and the Standard attributes of your user pool. When your user pool has read access to these default attributes, <code>ReadAttributes</code> doesn't return any information. Amazon Cognito only populates <code>ReadAttributes</code> in the API response if you have specified your own custom set of read attributes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable readAttributes;

/**
 <p>The refresh token time limit. After this limit expires, your user can't use their refresh token. To specify the time unit for <code>RefreshTokenValidity</code> as <code>seconds</code>, <code>minutes</code>, <code>hours</code>, or <code>days</code>, set a <code>TokenValidityUnits</code> value in your API request.</p><p>For example, when you set <code>RefreshTokenValidity</code> as <code>10</code> and <code>TokenValidityUnits</code> as <code>days</code>, your user can refresh their session and retrieve new access and ID tokens for 10 days.</p><p>The default time unit for <code>RefreshTokenValidity</code> in an API request is days. You can't set <code>RefreshTokenValidity</code> to 0. If you do, Amazon Cognito overrides the value with the default value of 30 days. <i>Valid range</i> is displayed below in seconds.</p><p>If you don't specify otherwise in the configuration of your app client, your refresh tokens are valid for 30 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable refreshTokenValidity;

/**
 <p>A list of provider names for the identity providers (IdPs) that are supported on this client. The following are supported: <code>COGNITO</code>, <code>Facebook</code>, <code>Google</code>, <code>SignInWithApple</code>, and <code>LoginWithAmazon</code>. You can also specify the names that you configured for the SAML and OIDC IdPs in your user pool, for example <code>MySAMLIdP</code> or <code>MyOIDCIdP</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedIdentityProviders;

/**
 <p>The units in which the validity times are represented. The default unit for RefreshToken is days, and default for ID and access tokens are hours.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderTokenValidityUnitsType * _Nullable tokenValidityUnits;

/**
 <p>The user pool ID for the user pool where you want to create a user pool client.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The list of user attributes that you want your app client to have write access to. After your user authenticates in your app, their access token authorizes them to set or modify their own attribute value for any attribute in this list. An example of this kind of activity is when you present your user with a form to update their profile information and they change their last name. Your app then makes an <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UpdateUserAttributes.html">UpdateUserAttributes</a> API request and sets <code>family_name</code> to the new value. </p><p>When you don't specify the <code>WriteAttributes</code> for your app client, your app can write the values of the Standard attributes of your user pool. When your user pool has write access to these default attributes, <code>WriteAttributes</code> doesn't return any information. Amazon Cognito only populates <code>WriteAttributes</code> in the API response if you have specified your own custom set of write attributes.</p><p>If your app client allows users to sign in through an IdP, this array must include all attributes that you have mapped to IdP attributes. Amazon Cognito updates mapped attributes when users sign in to your application through an IdP. If your app client does not have write access to a mapped attribute, Amazon Cognito throws an error when it tries to update the attribute. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-specifying-attribute-mapping.html">Specifying IdP Attribute Mappings for Your user pool</a>.</p>
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
 <p>The configuration for a custom domain that hosts the sign-up and sign-in webpages for your application.</p><p>Provide this parameter only if you want to use a custom domain for your user pool. Otherwise, you can exclude this parameter and use the Amazon Cognito hosted domain instead.</p><p>For more information about the hosted domain and custom domains, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-assign-domain.html">Configuring a User Pool Domain</a>.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCustomDomainConfigType * _Nullable customDomainConfig;

/**
 <p>The domain string. For custom domains, this is the fully-qualified domain name, such as <code>auth.example.com</code>. For Amazon Cognito prefix domains, this is the prefix alone, such as <code>auth</code>.</p>
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


/**
 <p>The Amazon CloudFront endpoint that you use as the target of the alias that you set up with your Domain Name Service (DNS) provider. Amazon Cognito returns this value if you set a custom domain with <code>CustomDomainConfig</code>. If you set an Amazon Cognito prefix domain, this operation returns a blank response.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudFrontDomain;

@end

/**
 <p>Represents the request to create a user pool.</p>
 Required parameters: [PoolName]
 */
@interface AWSCognitoIdentityProviderCreateUserPoolRequest : AWSRequest


/**
 <p>The available verified method a user can use to recover their password when they call <code>ForgotPassword</code>. You can use this setting to define a preferred method when a user has more than one method available. With this setting, SMS doesn't qualify for a valid password recovery mechanism if the user also has SMS multi-factor authentication (MFA) activated. In the absence of this setting, Amazon Cognito uses the legacy behavior to determine the recovery method where SMS is preferred through email.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountRecoverySettingType * _Nullable accountRecoverySetting;

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
 <p>When active, <code>DeletionProtection</code> prevents accidental deletion of your user pool. Before you can delete a user pool that you have protected against deletion, you must deactivate this feature.</p><p>When you try to delete a protected user pool in a <code>DeleteUserPool</code> API request, Amazon Cognito returns an <code>InvalidParameterException</code> error. To delete a protected user pool, send a new <code>DeleteUserPool</code> request after you deactivate deletion protection in an <code>UpdateUserPool</code> API request.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderDeletionProtectionType deletionProtection;

/**
 <p>The device-remembering configuration for a user pool. A null value indicates that you have deactivated device remembering in your user pool.</p><note><p>When you provide a value for any <code>DeviceConfiguration</code> field, you activate the Amazon Cognito device-remembering feature.</p></note>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderDeviceConfigurationType * _Nullable deviceConfiguration;

/**
 <p>The email configuration of your user pool. The email configuration type sets your preferred sending method, Amazon Web Services Region, and sender for messages from your user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderEmailConfigurationType * _Nullable emailConfiguration;

/**
 <p>This parameter is no longer used. See <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_VerificationMessageTemplateType.html">VerificationMessageTemplateType</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationMessage;

/**
 <p>This parameter is no longer used. See <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_VerificationMessageTemplateType.html">VerificationMessageTemplateType</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationSubject;

/**
 <p>The Lambda trigger configuration information for the new user pool.</p><note><p>In a push model, event sources (such as Amazon S3 and custom applications) need permission to invoke a function. So you must make an extra call to add permission for these event sources to invoke your Lambda function.</p><p/><p>For more information on using the Lambda API to add permission, see<a href="https://docs.aws.amazon.com/lambda/latest/dg/API_AddPermission.html"> AddPermission </a>. </p><p>For adding permission using the CLI, see<a href="https://docs.aws.amazon.com/cli/latest/reference/lambda/add-permission.html"> add-permission </a>.</p></note>
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
 <p>The SMS configuration with the settings that your Amazon Cognito user pool must use to send an SMS message from your Amazon Web Services account through Amazon Simple Notification Service. To send SMS messages with Amazon SNS in the Amazon Web Services Region that you want, the Amazon Cognito user pool uses an Identity and Access Management (IAM) role in your Amazon Web Services account.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSmsConfigurationType * _Nullable smsConfiguration;

/**
 <p>This parameter is no longer used. See <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_VerificationMessageTemplateType.html">VerificationMessageTemplateType</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsVerificationMessage;

/**
 <p>The settings for updates to user attributes. These settings include the property <code>AttributesRequireVerificationBeforeUpdate</code>, a user-pool setting that tells Amazon Cognito how to handle changes to the value of your users' email address and phone number attributes. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-email-phone-verification.html#user-pool-settings-verifications-verify-attribute-updates"> Verifying updates to email addresses and phone numbers</a>.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserAttributeUpdateSettingsType * _Nullable userAttributeUpdateSettings;

/**
 <p>User pool add-ons. Contains settings for activation of advanced security features. To log user security information but take no action, set to <code>AUDIT</code>. To configure automatic security responses to risky traffic to your user pool, set to <code>ENFORCED</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-advanced-security.html">Adding advanced security to a user pool</a>.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolAddOnsType * _Nullable userPoolAddOns;

/**
 <p>The tag keys and values to assign to the user pool. A tag is a label that you can use to categorize and manage user pools in different ways, such as by purpose, owner, environment, or other criteria.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable userPoolTags;

/**
 <p>Specifies whether a user can use an email address or phone number as a username when they sign up.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable usernameAttributes;

/**
 <p>Case sensitivity on the username input for the selected sign-in option. When case sensitivity is set to <code>False</code> (case insensitive), users can sign in with any combination of capital and lowercase letters. For example, <code>username</code>, <code>USERNAME</code>, or <code>UserName</code>, or for email, <code>email@example.com</code> or <code>EMaiL@eXamplE.Com</code>. For most use cases, set case sensitivity to <code>False</code> (case insensitive) as a best practice. When usernames and email addresses are case insensitive, Amazon Cognito treats any variation in case as the same user, and prevents a case variation from being assigned to the same attribute for a different user.</p><p>This configuration is immutable after you set it. For more information, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UsernameConfigurationType.html">UsernameConfigurationType</a>.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUsernameConfigurationType * _Nullable usernameConfiguration;

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
 <p>The configuration for a custom domain that hosts the sign-up and sign-in webpages for your application.</p>
 Required parameters: [CertificateArn]
 */
@interface AWSCognitoIdentityProviderCustomDomainConfigType : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of an Certificate Manager SSL certificate. You use this certificate for the subdomain of your custom domain.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificateArn;

@end

/**
 <p>The properties of a custom email sender Lambda trigger.</p>
 Required parameters: [LambdaVersion, LambdaArn]
 */
@interface AWSCognitoIdentityProviderCustomEmailLambdaVersionConfigType : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the function that you want to assign to your Lambda trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lambdaArn;

/**
 <p>The user pool trigger version of the request that Amazon Cognito sends to your Lambda function. Higher-numbered versions add fields that support new features.</p><p>You must use a <code>LambdaVersion</code> of <code>V1_0</code> with a custom sender function.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderCustomEmailSenderLambdaVersionType lambdaVersion;

@end

/**
 <p>The properties of a custom SMS sender Lambda trigger.</p>
 Required parameters: [LambdaVersion, LambdaArn]
 */
@interface AWSCognitoIdentityProviderCustomSMSLambdaVersionConfigType : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the function that you want to assign to your Lambda trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lambdaArn;

/**
 <p>The user pool trigger version of the request that Amazon Cognito sends to your Lambda function. Higher-numbered versions add fields that support new features.</p><p>You must use a <code>LambdaVersion</code> of <code>V1_0</code> with a custom sender function.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderCustomSMSSenderLambdaVersionType lambdaVersion;

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
 <p>The IdP name.</p>
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
 <p>A valid access token that Amazon Cognito issued to the user whose attributes you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>An array of strings representing the user attribute names you want to delete.</p><p>For custom attributes, you must prependattach the <code>custom:</code> prefix to the front of the attribute name.</p>
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
 <p>The domain string. For custom domains, this is the fully-qualified domain name, such as <code>auth.example.com</code>. For Amazon Cognito prefix domains, this is the prefix alone, such as <code>auth</code>.</p>
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
 <p>A valid access token that Amazon Cognito issued to the user whose user profile you want to delete.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeIdentityProviderRequest : AWSRequest


/**
 <p>The IdP name.</p>
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
 <p>The identity provider details.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderIdentityProviderType * _Nullable identityProvider;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeResourceServerRequest : AWSRequest


/**
 <p>A unique resource server identifier for the resource server. The identifier can be an API friendly name like <code>solar-system-data</code>. You can also set an API URL like <code>https://solar-system-data-api.example.com</code> as your identifier.</p><p>Amazon Cognito represents scopes in the access token in the format <code>$resource-server-identifier/$scope</code>. Longer scope-identifier strings increase the size of your access tokens.</p>
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
 <p>The app client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeRiskConfigurationResponse : AWSModel


/**
 <p>The risk configuration.</p>
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
 <p>The domain string. For custom domains, this is the fully-qualified domain name, such as <code>auth.example.com</code>. For Amazon Cognito prefix domains, this is the prefix alone, such as <code>auth</code>.</p>
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
 <p>The device-remembering configuration for a user pool. A <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPool.html"> DescribeUserPool</a> request returns a null value for this object when the user pool isn't configured to remember devices. When device remembering is active, you can remember a user's device with a <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_ConfirmDevice.html">ConfirmDevice</a> API request. Additionally. when the property <code>DeviceOnlyRememberedOnUserPrompt</code> is <code>true</code>, you must follow <code>ConfirmDevice</code> with an <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UpdateDeviceStatus.html">UpdateDeviceStatus</a> API request that sets the user's device to <code>remembered</code> or <code>not_remembered</code>.</p><p>To sign in with a remembered device, include <code>DEVICE_KEY</code> in the authentication parameters in your user's <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_InitiateAuth.html"> InitiateAuth</a> request. If your app doesn't include a <code>DEVICE_KEY</code> parameter, the <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_InitiateAuth.html#API_InitiateAuth_ResponseSyntax">response</a> from Amazon Cognito includes newly-generated <code>DEVICE_KEY</code> and <code>DEVICE_GROUP_KEY</code> values under <code>NewDeviceMetadata</code>. Store these values to use in future device-authentication requests.</p><note><p>When you provide a value for any property of <code>DeviceConfiguration</code>, you activate the device remembering for the user pool.</p></note>
 */
@interface AWSCognitoIdentityProviderDeviceConfigurationType : AWSModel


/**
 <p>When true, a remembered device can sign in with device authentication instead of SMS and time-based one-time password (TOTP) factors for multi-factor authentication (MFA).</p><note><p>Whether or not <code>ChallengeRequiredOnNewDevice</code> is true, users who sign in with devices that have not been confirmed or remembered must still provide a second factor in a user pool that requires MFA.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable challengeRequiredOnNewDevice;

/**
 <p>When true, Amazon Cognito doesn't automatically remember a user's device when your app sends a <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_ConfirmDevice.html"> ConfirmDevice</a> API request. In your app, create a prompt for your user to choose whether they want to remember their device. Return the user's choice in an <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UpdateDeviceStatus.html"> UpdateDeviceStatus</a> API request.</p><p>When <code>DeviceOnlyRememberedOnUserPrompt</code> is <code>false</code>, Amazon Cognito immediately remembers devices that you register in a <code>ConfirmDevice</code> API request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable deviceOnlyRememberedOnUserPrompt;

@end

/**
 <p>The device verifier against which it is authenticated.</p>
 */
@interface AWSCognitoIdentityProviderDeviceSecretVerifierConfigType : AWSModel


/**
 <p>The password verifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable passwordVerifier;

/**
 <p>The <a href="https://en.wikipedia.org/wiki/Salt_(cryptography)">salt</a></p>
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
 <p>The date when the device was last authenticated.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deviceLastAuthenticatedDate;

/**
 <p>The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable deviceLastModifiedDate;

@end

/**
 <p>A container for information about a domain.</p>
 */
@interface AWSCognitoIdentityProviderDomainDescriptionType : AWSModel


/**
 <p>The Amazon Web Services ID for the user pool owner.</p>
 */
@property (nonatomic, strong) NSString * _Nullable AWSAccountId;

/**
 <p>The Amazon CloudFront endpoint that you use as the target of the alias that you set up with your Domain Name Service (DNS) provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudFrontDistribution;

/**
 <p>The configuration for a custom domain that hosts the sign-up and sign-in webpages for your application.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCustomDomainConfigType * _Nullable customDomainConfig;

/**
 <p>The domain string. For custom domains, this is the fully-qualified domain name, such as <code>auth.example.com</code>. For Amazon Cognito prefix domains, this is the prefix alone, such as <code>auth</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>The Amazon S3 bucket where the static files for this domain are stored.</p>
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
 <p>The email configuration of your user pool. The email configuration type sets your preferred sending method, Amazon Web Services Region, and sender for messages from your user pool.</p><note><p>Amazon Cognito can send email messages with Amazon Simple Email Service resources in the Amazon Web Services Region where you created your user pool, and in alternate Regions in some cases. For more information on the supported Regions, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-email.html">Email settings for Amazon Cognito user pools</a>.</p></note>
 */
@interface AWSCognitoIdentityProviderEmailConfigurationType : AWSModel


/**
 <p>The set of configuration rules that can be applied to emails sent using Amazon Simple Email Service. A configuration set is applied to an email by including a reference to the configuration set in the headers of the email. Once applied, all of the rules in that configuration set are applied to the email. Configuration sets can be used to apply the following types of rules to emails: </p><dl><dt>Event publishing</dt><dd><p>Amazon Simple Email Service can track the number of send, delivery, open, click, bounce, and complaint events for each email sent. Use event publishing to send information about these events to other Amazon Web Services services such as and Amazon CloudWatch</p></dd><dt>IP pool management</dt><dd><p>When leasing dedicated IP addresses with Amazon Simple Email Service, you can create groups of IP addresses, called dedicated IP pools. You can then associate the dedicated IP pools with configuration sets.</p></dd></dl>
 */
@property (nonatomic, strong) NSString * _Nullable configurationSet;

/**
 <p>Specifies whether Amazon Cognito uses its built-in functionality to send your users email messages, or uses your Amazon Simple Email Service email configuration. Specify one of the following values:</p><dl><dt>COGNITO_DEFAULT</dt><dd><p>When Amazon Cognito emails your users, it uses its built-in email functionality. When you use the default option, Amazon Cognito allows only a limited number of emails each day for your user pool. For typical production environments, the default email limit is less than the required delivery volume. To achieve a higher delivery volume, specify DEVELOPER to use your Amazon SES email configuration.</p><p>To look up the email delivery limit for the default option, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/limits.html">Limits</a> in the <i>Amazon Cognito Developer Guide</i>.</p><p>The default FROM address is <code>no-reply@verificationemail.com</code>. To customize the FROM address, provide the Amazon Resource Name (ARN) of an Amazon SES verified email address for the <code>SourceArn</code> parameter.</p></dd><dt>DEVELOPER</dt><dd><p>When Amazon Cognito emails your users, it uses your Amazon SES configuration. Amazon Cognito calls Amazon SES on your behalf to send email from your verified email address. When you use this option, the email delivery limits are the same limits that apply to your Amazon SES verified email address in your Amazon Web Services account.</p><p>If you use this option, provide the ARN of an Amazon SES verified email address for the <code>SourceArn</code> parameter.</p><p>Before Amazon Cognito can email your users, it requires additional permissions to call Amazon SES on your behalf. When you update your user pool with this option, Amazon Cognito creates a <i>service-linked role</i>, which is a type of role in your Amazon Web Services account. This role contains the permissions that allow you to access Amazon SES and send email messages from your email address. For more information about the service-linked role that Amazon Cognito creates, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/using-service-linked-roles.html">Using Service-Linked Roles for Amazon Cognito</a> in the <i>Amazon Cognito Developer Guide</i>.</p></dd></dl>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderEmailSendingAccountType emailSendingAccount;

/**
 <p>Either the sender’s email address or the sender’s name with their email address. For example, <code>testuser@example.com</code> or <code>Test User &lt;testuser@example.com&gt;</code>. This address appears before the body of the email.</p>
 */
@property (nonatomic, strong) NSString * _Nullable from;

/**
 <p>The destination to which the receiver of the email should reply.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replyToEmailAddress;

/**
 <p>The ARN of a verified email address or an address from a verified domain in Amazon SES. You can set a <code>SourceArn</code> email from a verified domain only with an API request. You can set a verified email address, but not an address in a verified domain, in the Amazon Cognito console. Amazon Cognito uses the email address that you provide in one of the following ways, depending on the value that you specify for the <code>EmailSendingAccount</code> parameter:</p><ul><li><p>If you specify <code>COGNITO_DEFAULT</code>, Amazon Cognito uses this address as the custom FROM address when it emails your users using its built-in email account.</p></li><li><p>If you specify <code>DEVELOPER</code>, Amazon Cognito emails your users with this address by calling Amazon SES on your behalf.</p></li></ul><p>The Region value of the <code>SourceArn</code> parameter must indicate a supported Amazon Web Services Region of your user pool. Typically, the Region in the <code>SourceArn</code> and the user pool Region are the same. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-email.html#user-pool-email-developer-region-mapping">Amazon SES email configuration regions</a> in the <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html">Amazon Cognito Developer Guide</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

@end

/**
 <p>Specifies the user context data captured at the time of an event request.</p>
 */
@interface AWSCognitoIdentityProviderEventContextDataType : AWSModel


/**
 <p>The user's city.</p>
 */
@property (nonatomic, strong) NSString * _Nullable city;

/**
 <p>The user's country.</p>
 */
@property (nonatomic, strong) NSString * _Nullable country;

/**
 <p>The user's device name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceName;

/**
 <p>The source IP address of your user's device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddress;

/**
 <p>The user's time zone.</p>
 */
@property (nonatomic, strong) NSString * _Nullable timezone;

@end

/**
 <p>Specifies the event feedback type.</p>
 Required parameters: [FeedbackValue, Provider]
 */
@interface AWSCognitoIdentityProviderEventFeedbackType : AWSModel


/**
 <p>The event feedback date.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable feedbackDate;

/**
 <p>The authentication event feedback value. When you provide a <code>FeedbackValue</code> value of <code>valid</code>, you tell Amazon Cognito that you trust a user session where Amazon Cognito has evaluated some level of risk. When you provide a <code>FeedbackValue</code> value of <code>invalid</code>, you tell Amazon Cognito that you don't trust a user session, or you don't believe that Amazon Cognito evaluated a high-enough risk level.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderFeedbackValueType feedbackValue;

/**
 <p>The provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable provider;

@end

/**
 <p>The event risk type.</p>
 */
@interface AWSCognitoIdentityProviderEventRiskType : AWSModel


/**
 <p>Indicates whether compromised credentials were detected during an authentication event.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable compromisedCredentialsDetected;

/**
 <p>The risk decision.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderRiskDecisionType riskDecision;

/**
 <p>The risk level.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderRiskLevelType riskLevel;

@end

/**
 <p>Represents the request to forget the device.</p>
 Required parameters: [DeviceKey]
 */
@interface AWSCognitoIdentityProviderForgetDeviceRequest : AWSRequest


/**
 <p>A valid access token that Amazon Cognito issued to the user whose registered device you want to forget.</p>
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
 <p>The Amazon Pinpoint analytics metadata that contributes to your metrics for <code>ForgotPassword</code> calls.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

/**
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers.</p><p>You create custom workflows by assigning Lambda functions to user pool triggers. When you use the ForgotPassword API action, Amazon Cognito invokes any functions that are assigned to the following triggers: <i>pre sign-up</i>, <i>custom message</i>, and <i>user migration</i>. When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your ForgotPassword request. In your function code in Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 <p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 <p>Contextual data about your user session, such as the device fingerprint, IP address, or location. Amazon Cognito advanced security evaluates the risk of an authentication event based on the context that your app generates and passes to Amazon Cognito when it makes API requests.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserContextDataType * _Nullable userContextData;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>The response from Amazon Cognito to a request to reset a password.</p>
 */
@interface AWSCognitoIdentityProviderForgotPasswordResponse : AWSModel


/**
 <p>The code delivery details returned by the server in response to the request to reset a password.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCodeDeliveryDetailsType * _Nullable codeDeliveryDetails;

@end

/**
 <p>Represents the request to get the header information of the CSV file for the user import job.</p>
 Required parameters: [UserPoolId]
 */
@interface AWSCognitoIdentityProviderGetCSVHeaderRequest : AWSRequest


/**
 <p>The user pool ID for the user pool that the users are to be imported into.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the response from the server to the request to get the header information of the CSV file for the user import job.</p>
 */
@interface AWSCognitoIdentityProviderGetCSVHeaderResponse : AWSModel


/**
 <p>The header information of the CSV file for the user import job.</p>
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
 <p>A valid access token that Amazon Cognito issued to the user whose device information you want to request.</p>
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
 <p>The IdP identifier.</p>
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
 <p>The identity provider details.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderIdentityProviderType * _Nullable identityProvider;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetLogDeliveryConfigurationRequest : AWSRequest


/**
 <p>The ID of the user pool where you want to view detailed activity logging configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetLogDeliveryConfigurationResponse : AWSModel


/**
 <p>The detailed activity logging configuration of the requested user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLogDeliveryConfigurationType * _Nullable logDeliveryConfiguration;

@end

/**
 <p>Request to get a signing certificate from Amazon Cognito.</p>
 Required parameters: [UserPoolId]
 */
@interface AWSCognitoIdentityProviderGetSigningCertificateRequest : AWSRequest


/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Response from Amazon Cognito for a signing certificate request.</p>
 */
@interface AWSCognitoIdentityProviderGetSigningCertificateResponse : AWSModel


/**
 <p>The signing certificate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable certificate;

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
 <p>A non-expired access token for the user whose attribute verification code you want to generate.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The attribute name returned by the server response to get the user attribute verification code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers.</p><p>You create custom workflows by assigning Lambda functions to user pool triggers. When you use the GetUserAttributeVerificationCode API action, Amazon Cognito invokes the function that is assigned to the <i>custom message</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your GetUserAttributeVerificationCode request. In your function code in Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

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
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetUserPoolMfaConfigResponse : AWSModel


/**
 <p>The multi-factor authentication (MFA) configuration. Valid values include:</p><ul><li><p><code>OFF</code> MFA won't be used for any users.</p></li><li><p><code>ON</code> MFA is required for all users to sign in.</p></li><li><p><code>OPTIONAL</code> MFA will be required only for individual users who have an MFA factor activated.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserPoolMfaType mfaConfiguration;

/**
 <p>The SMS text message multi-factor authentication (MFA) configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSmsMfaConfigType * _Nullable smsMfaConfiguration;

/**
 <p>The software token multi-factor authentication (MFA) configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSoftwareTokenMfaConfigType * _Nullable softwareTokenMfaConfiguration;

@end

/**
 <p>Represents the request to get information about the user.</p>
 Required parameters: [AccessToken]
 */
@interface AWSCognitoIdentityProviderGetUserRequest : AWSRequest


/**
 <p>A non-expired access token for the user whose information you want to query.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

@end

/**
 <p>Represents the response from the server from the request to get information about the user.</p>
 Required parameters: [Username, UserAttributes]
 */
@interface AWSCognitoIdentityProviderGetUserResponse : AWSModel


/**
 <p><i>This response parameter is no longer supported.</i> It provides information only about SMS MFA configurations. It doesn't provide information about time-based one-time password (TOTP) software token MFA configurations. To look up information about either type of MFA configuration, use UserMFASettingList instead.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderMFAOptionType *> * _Nullable MFAOptions;

/**
 <p>The user's preferred MFA setting.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preferredMfaSetting;

/**
 <p>An array of name-value pairs representing user attributes.</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

/**
 <p>The MFA options that are activated for the user. The possible values in this list are <code>SMS_MFA</code> and <code>SOFTWARE_TOKEN_MFA</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userMFASettingList;

/**
 <p>The username of the user that you requested.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the request to sign out all devices.</p>
 Required parameters: [AccessToken]
 */
@interface AWSCognitoIdentityProviderGlobalSignOutRequest : AWSRequest


/**
 <p>A valid access token that Amazon Cognito issued to the user who you want to sign out.</p>
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
 <p>The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
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
 <p>The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>A non-negative integer value that specifies the precedence of this group relative to the other groups that a user can belong to in the user pool. Zero is the highest precedence value. Groups with lower <code>Precedence</code> values take precedence over groups with higher ornull <code>Precedence</code> values. If a user belongs to two or more groups, it is the group with the lowest precedence value whose role ARN is given in the user's tokens for the <code>cognito:roles</code> and <code>cognito:preferred_role</code> claims.</p><p>Two groups can have the same <code>Precedence</code> value. If this happens, neither group takes precedence over the other. If two groups with the same <code>Precedence</code> have the same role ARN, that role is used in the <code>cognito:preferred_role</code> claim in tokens for users in each group. If the two groups have different role ARNs, the <code>cognito:preferred_role</code> claim isn't set in users' tokens.</p><p>The default <code>Precedence</code> value is null.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable precedence;

/**
 <p>The role Amazon Resource Name (ARN) for the group.</p>
 */
@property (nonatomic, strong) NSString * _Nullable roleArn;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>The HTTP header.</p>
 */
@interface AWSCognitoIdentityProviderHttpHeader : AWSModel


/**
 <p>The header name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable headerName;

/**
 <p>The header value.</p>
 */
@property (nonatomic, strong) NSString * _Nullable headerValue;

@end

/**
 <p>A container for information about an IdP.</p>
 */
@interface AWSCognitoIdentityProviderIdentityProviderType : AWSModel


/**
 <p>A mapping of IdP attributes to standard and custom user pool attributes.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributeMapping;

/**
 <p>The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A list of IdP identifiers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable idpIdentifiers;

/**
 <p>The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The scopes, URLs, and identifiers for your external identity provider. The following examples describe the provider detail keys for each IdP type. These values and their schema are subject to change. Social IdP <code>authorize_scopes</code> values must match the values listed here.</p><dl><dt>OpenID Connect (OIDC)</dt><dd><p>Amazon Cognito accepts the following elements when it can't discover endpoint URLs from <code>oidc_issuer</code>: <code>attributes_url</code>, <code>authorize_url</code>, <code>jwks_uri</code>, <code>token_url</code>.</p><p>Create or update request: <code>"ProviderDetails": { "attributes_request_method": "GET", "attributes_url": "https://auth.example.com/userInfo", "authorize_scopes": "openid profile email", "authorize_url": "https://auth.example.com/authorize", "client_id": "1example23456789", "client_secret": "provider-app-client-secret", "jwks_uri": "https://auth.example.com/.well-known/jwks.json", "oidc_issuer": "https://auth.example.com", "token_url": "https://example.com/token" }</code></p><p>Describe response: <code>"ProviderDetails": { "attributes_request_method": "GET", "attributes_url": "https://auth.example.com/userInfo", "attributes_url_add_attributes": "false", "authorize_scopes": "openid profile email", "authorize_url": "https://auth.example.com/authorize", "client_id": "1example23456789", "client_secret": "provider-app-client-secret", "jwks_uri": "https://auth.example.com/.well-known/jwks.json", "oidc_issuer": "https://auth.example.com", "token_url": "https://example.com/token" }</code></p></dd><dt>SAML</dt><dd><p>Create or update request with Metadata URL: <code>"ProviderDetails": { "IDPInit": "true", "IDPSignout": "true", "EncryptedResponses" : "true", "MetadataURL": "https://auth.example.com/sso/saml/metadata", "RequestSigningAlgorithm": "rsa-sha256" }</code></p><p>Create or update request with Metadata file: <code>"ProviderDetails": { "IDPInit": "true", "IDPSignout": "true", "EncryptedResponses" : "true", "MetadataFile": "[metadata XML]", "RequestSigningAlgorithm": "rsa-sha256" }</code></p><p>The value of <code>MetadataFile</code> must be the plaintext metadata document with all quote (") characters escaped by backslashes.</p><p>Describe response: <code>"ProviderDetails": { "IDPInit": "true", "IDPSignout": "true", "EncryptedResponses" : "true", "ActiveEncryptionCertificate": "[certificate]", "MetadataURL": "https://auth.example.com/sso/saml/metadata", "RequestSigningAlgorithm": "rsa-sha256", "SLORedirectBindingURI": "https://auth.example.com/slo/saml", "SSORedirectBindingURI": "https://auth.example.com/sso/saml" }</code></p></dd><dt>LoginWithAmazon</dt><dd><p>Create or update request: <code>"ProviderDetails": { "authorize_scopes": "profile postal_code", "client_id": "amzn1.application-oa2-client.1example23456789", "client_secret": "provider-app-client-secret"</code></p><p>Describe response: <code>"ProviderDetails": { "attributes_url": "https://api.amazon.com/user/profile", "attributes_url_add_attributes": "false", "authorize_scopes": "profile postal_code", "authorize_url": "https://www.amazon.com/ap/oa", "client_id": "amzn1.application-oa2-client.1example23456789", "client_secret": "provider-app-client-secret", "token_request_method": "POST", "token_url": "https://api.amazon.com/auth/o2/token" }</code></p></dd><dt>Google</dt><dd><p>Create or update request: <code>"ProviderDetails": { "authorize_scopes": "email profile openid", "client_id": "1example23456789.apps.googleusercontent.com", "client_secret": "provider-app-client-secret" }</code></p><p>Describe response: <code>"ProviderDetails": { "attributes_url": "https://people.googleapis.com/v1/people/me?personFields=", "attributes_url_add_attributes": "true", "authorize_scopes": "email profile openid", "authorize_url": "https://accounts.google.com/o/oauth2/v2/auth", "client_id": "1example23456789.apps.googleusercontent.com", "client_secret": "provider-app-client-secret", "oidc_issuer": "https://accounts.google.com", "token_request_method": "POST", "token_url": "https://www.googleapis.com/oauth2/v4/token" }</code></p></dd><dt>SignInWithApple</dt><dd><p>Create or update request: <code>"ProviderDetails": { "authorize_scopes": "email name", "client_id": "com.example.cognito", "private_key": "1EXAMPLE", "key_id": "2EXAMPLE", "team_id": "3EXAMPLE" }</code></p><p>Describe response: <code>"ProviderDetails": { "attributes_url_add_attributes": "false", "authorize_scopes": "email name", "authorize_url": "https://appleid.apple.com/auth/authorize", "client_id": "com.example.cognito", "key_id": "1EXAMPLE", "oidc_issuer": "https://appleid.apple.com", "team_id": "2EXAMPLE", "token_request_method": "POST", "token_url": "https://appleid.apple.com/auth/token" }</code></p></dd><dt>Facebook</dt><dd><p>Create or update request: <code>"ProviderDetails": { "api_version": "v17.0", "authorize_scopes": "public_profile, email", "client_id": "1example23456789", "client_secret": "provider-app-client-secret" }</code></p><p>Describe response: <code>"ProviderDetails": { "api_version": "v17.0", "attributes_url": "https://graph.facebook.com/v17.0/me?fields=", "attributes_url_add_attributes": "true", "authorize_scopes": "public_profile, email", "authorize_url": "https://www.facebook.com/v17.0/dialog/oauth", "client_id": "1example23456789", "client_secret": "provider-app-client-secret", "token_request_method": "GET", "token_url": "https://graph.facebook.com/v17.0/oauth/access_token" }</code></p></dd></dl>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable providerDetails;

/**
 <p>The IdP name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The IdP type.</p>
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
 <p>The Amazon Pinpoint analytics metadata that contributes to your metrics for <code>InitiateAuth</code> calls.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

/**
 <p>The authentication flow for this call to run. The API action will depend on this value. For example:</p><ul><li><p><code>REFRESH_TOKEN_AUTH</code> takes in a valid refresh token and returns new tokens.</p></li><li><p><code>USER_SRP_AUTH</code> takes in <code>USERNAME</code> and <code>SRP_A</code> and returns the SRP variables to be used for next challenge execution.</p></li><li><p><code>USER_PASSWORD_AUTH</code> takes in <code>USERNAME</code> and <code>PASSWORD</code> and returns the next challenge or tokens.</p></li></ul><p>Valid values include:</p><ul><li><p><code>USER_SRP_AUTH</code>: Authentication flow for the Secure Remote Password (SRP) protocol.</p></li><li><p><code>REFRESH_TOKEN_AUTH</code>/<code>REFRESH_TOKEN</code>: Authentication flow for refreshing the access token and ID token by supplying a valid refresh token.</p></li><li><p><code>CUSTOM_AUTH</code>: Custom authentication flow.</p></li><li><p><code>USER_PASSWORD_AUTH</code>: Non-SRP authentication flow; user name and password are passed directly. If a user migration Lambda trigger is set, this flow will invoke the user migration Lambda if it doesn't find the user name in the user pool. </p></li></ul><p><code>ADMIN_NO_SRP_AUTH</code> isn't a valid value.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderAuthFlowType authFlow;

/**
 <p>The authentication parameters. These are inputs corresponding to the <code>AuthFlow</code> that you're invoking. The required values depend on the value of <code>AuthFlow</code>:</p><ul><li><p>For <code>USER_SRP_AUTH</code>: <code>USERNAME</code> (required), <code>SRP_A</code> (required), <code>SECRET_HASH</code> (required if the app client is configured with a client secret), <code>DEVICE_KEY</code>.</p></li><li><p>For <code>USER_PASSWORD_AUTH</code>: <code>USERNAME</code> (required), <code>PASSWORD</code> (required), <code>SECRET_HASH</code> (required if the app client is configured with a client secret), <code>DEVICE_KEY</code>.</p></li><li><p>For <code>REFRESH_TOKEN_AUTH/REFRESH_TOKEN</code>: <code>REFRESH_TOKEN</code> (required), <code>SECRET_HASH</code> (required if the app client is configured with a client secret), <code>DEVICE_KEY</code>.</p></li><li><p>For <code>CUSTOM_AUTH</code>: <code>USERNAME</code> (required), <code>SECRET_HASH</code> (if app client is configured with client secret), <code>DEVICE_KEY</code>. To start the authentication flow with password verification, include <code>ChallengeName: SRP_A</code> and <code>SRP_A: (The SRP_A Value)</code>.</p></li></ul><p>For more information about <code>SECRET_HASH</code>, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash">Computing secret hash values</a>. For information about <code>DEVICE_KEY</code>, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html">Working with user devices in your user pool</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable authParameters;

/**
 <p>The app client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>A map of custom key-value pairs that you can provide as input for certain custom workflows that this action triggers.</p><p>You create custom workflows by assigning Lambda functions to user pool triggers. When you use the InitiateAuth API action, Amazon Cognito invokes the Lambda functions that are specified for various triggers. The ClientMetadata value is passed as input to the functions for only the following triggers:</p><ul><li><p>Pre signup</p></li><li><p>Pre authentication</p></li><li><p>User migration</p></li></ul><p>When Amazon Cognito invokes the functions for these triggers, it passes a JSON payload, which the function receives as input. This payload contains a <code>validationData</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your InitiateAuth request. In your function code in Lambda, you can process the <code>validationData</code> value to enhance your workflow for your specific needs.</p><p>When you use the InitiateAuth API action, Amazon Cognito also invokes the functions for the following triggers, but it doesn't provide the ClientMetadata value as input:</p><ul><li><p>Post authentication</p></li><li><p>Custom message</p></li><li><p>Pre token generation</p></li><li><p>Create auth challenge</p></li><li><p>Define auth challenge</p></li></ul><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 <p>Contextual data about your user session, such as the device fingerprint, IP address, or location. Amazon Cognito advanced security evaluates the risk of an authentication event based on the context that your app generates and passes to Amazon Cognito when it makes API requests.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserContextDataType * _Nullable userContextData;

@end

/**
 <p>Initiates the authentication response.</p>
 */
@interface AWSCognitoIdentityProviderInitiateAuthResponse : AWSModel


/**
 <p>The result of the authentication response. This result is only returned if the caller doesn't need to pass another challenge. If the caller does need to pass another challenge before it gets tokens, <code>ChallengeName</code>, <code>ChallengeParameters</code>, and <code>Session</code> are returned.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAuthenticationResultType * _Nullable authenticationResult;

/**
 <p>The name of the challenge that you're responding to with this call. This name is returned in the <code>InitiateAuth</code> response if you must pass another challenge.</p><p>Valid values include the following:</p><note><p>All of the following challenges require <code>USERNAME</code> and <code>SECRET_HASH</code> (if applicable) in the parameters.</p></note><ul><li><p><code>SMS_MFA</code>: Next challenge is to supply an <code>SMS_MFA_CODE</code>, delivered via SMS.</p></li><li><p><code>PASSWORD_VERIFIER</code>: Next challenge is to supply <code>PASSWORD_CLAIM_SIGNATURE</code>, <code>PASSWORD_CLAIM_SECRET_BLOCK</code>, and <code>TIMESTAMP</code> after the client-side SRP calculations.</p></li><li><p><code>CUSTOM_CHALLENGE</code>: This is returned if your custom authentication flow determines that the user should pass another challenge before tokens are issued.</p></li><li><p><code>DEVICE_SRP_AUTH</code>: If device tracking was activated on your user pool and the previous challenges were passed, this challenge is returned so that Amazon Cognito can start tracking this device.</p></li><li><p><code>DEVICE_PASSWORD_VERIFIER</code>: Similar to <code>PASSWORD_VERIFIER</code>, but for devices only.</p></li><li><p><code>NEW_PASSWORD_REQUIRED</code>: For users who are required to change their passwords after successful first login. </p><p>Respond to this challenge with <code>NEW_PASSWORD</code> and any required attributes that Amazon Cognito returned in the <code>requiredAttributes</code> parameter. You can also set values for attributes that aren't required by your user pool and that your app client can write. For more information, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_RespondToAuthChallenge.html">RespondToAuthChallenge</a>.</p><note><p>In a <code>NEW_PASSWORD_REQUIRED</code> challenge response, you can't modify a required attribute that already has a value. In <code>RespondToAuthChallenge</code>, set a value for any keys that Amazon Cognito returned in the <code>requiredAttributes</code> parameter, then use the <code>UpdateUserAttributes</code> API operation to modify the value of any additional attributes.</p></note></li><li><p><code>MFA_SETUP</code>: For users who are required to setup an MFA factor before they can sign in. The MFA types activated for the user pool will be listed in the challenge parameters <code>MFAS_CAN_SETUP</code> value. </p><p> To set up software token MFA, use the session returned here from <code>InitiateAuth</code> as an input to <code>AssociateSoftwareToken</code>. Use the session returned by <code>VerifySoftwareToken</code> as an input to <code>RespondToAuthChallenge</code> with challenge name <code>MFA_SETUP</code> to complete sign-in. To set up SMS MFA, an administrator should help the user to add a phone number to their account, and then the user should call <code>InitiateAuth</code> again to restart sign-in.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge parameters. These are returned in the <code>InitiateAuth</code> response if you must pass another challenge. The responses in this parameter should be used to compute inputs to the next call (<code>RespondToAuthChallenge</code>). </p><p>All challenges require <code>USERNAME</code> and <code>SECRET_HASH</code> (if applicable).</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeParameters;

/**
 <p>The session that should pass both ways in challenge-response calls to the service. If the caller must pass another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

@end

/**
 <p>Specifies the configuration for Lambda triggers.</p>
 */
@interface AWSCognitoIdentityProviderLambdaConfigType : AWSModel


/**
 <p>Creates an authentication challenge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable createAuthChallenge;

/**
 <p>A custom email sender Lambda trigger.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCustomEmailLambdaVersionConfigType * _Nullable customEmailSender;

/**
 <p>A custom Message Lambda trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customMessage;

/**
 <p>A custom SMS sender Lambda trigger.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCustomSMSLambdaVersionConfigType * _Nullable customSMSSender;

/**
 <p>Defines the authentication challenge.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defineAuthChallenge;

/**
 <p>The Amazon Resource Name (ARN) of an <a href="/kms/latest/developerguide/concepts.html#master_keys">KMS key</a>. Amazon Cognito uses the key to encrypt codes and temporary passwords sent to <code>CustomEmailSender</code> and <code>CustomSMSSender</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable KMSKeyID;

/**
 <p>A post-authentication Lambda trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable postAuthentication;

/**
 <p>A post-confirmation Lambda trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable postConfirmation;

/**
 <p>A pre-authentication Lambda trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preAuthentication;

/**
 <p>A pre-registration Lambda trigger.</p>
 */
@property (nonatomic, strong) NSString * _Nullable preSignUp;

/**
 <p>The Amazon Resource Name (ARN) of the function that you want to assign to your Lambda trigger.</p><p>Set this parameter for legacy purposes. If you also set an ARN in <code>PreTokenGenerationConfig</code>, its value must be identical to <code>PreTokenGeneration</code>. For new instances of pre token generation triggers, set the <code>LambdaArn</code> of <code>PreTokenGenerationConfig</code>.</p><p>You can set <code/></p>
 */
@property (nonatomic, strong) NSString * _Nullable preTokenGeneration;

/**
 <p>The detailed configuration of a pre token generation trigger. If you also set an ARN in <code>PreTokenGeneration</code>, its value must be identical to <code>PreTokenGenerationConfig</code>.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderPreTokenGenerationVersionConfigType * _Nullable preTokenGenerationConfig;

/**
 <p>The user migration Lambda config type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userMigration;

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
 <p>A valid access token that Amazon Cognito issued to the user whose list of devices you want to view.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The limit of the device request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>This API operation returns a limited number of results. The pagination token is an identifier that you can present in an additional API request with the same parameters. When you include the pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent requests return a new pagination token. By use of this token, you can paginate through the full list of items.</p>
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
 <p>The identifier that Amazon Cognito returned with the previous request to this operation. When you include a pagination token in your request, Amazon Cognito returns the next set of items in the list. By use of this token, you can paginate through the full list of items.</p>
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
 <p>The maximum number of IdPs to return.</p>
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
 <p>A list of IdP objects.</p>
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
 
 */
@interface AWSCognitoIdentityProviderListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the user pool that the tags are assigned to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListTagsForResourceResponse : AWSModel


/**
 <p>The tags that are assigned to the user pool.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

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
 <p>This API operation returns a limited number of results. The pagination token is an identifier that you can present in an additional API request with the same parameters. When you include the pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent requests return a new pagination token. By use of this token, you can paginate through the full list of items.</p>
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
 <p>The identifier that Amazon Cognito returned with the previous request to this operation. When you include a pagination token in your request, Amazon Cognito returns the next set of items in the list. By use of this token, you can paginate through the full list of items.</p>
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
 <p>The maximum number of users that you want to retrieve before pagination.</p>
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
 <p>An identifier that you can use in a later request to return the next set of items in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>A list of users in the group, and their attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderUserType *> * _Nullable users;

@end

/**
 <p>Represents the request to list users.</p>
 Required parameters: [UserPoolId]
 */
@interface AWSCognitoIdentityProviderListUsersRequest : AWSRequest


/**
 <p>A JSON array of user attribute names, for example <code>given_name</code>, that you want Amazon Cognito to include in the response for each user. When you don't provide an <code>AttributesToGet</code> parameter, Amazon Cognito returns all attributes for each user.</p><p>Use <code>AttributesToGet</code> with required attributes in your user pool, or in conjunction with <code>Filter</code>. Amazon Cognito returns an error if not all users in the results have set a value for the attribute you request. Attributes that you can't filter on, including custom attributes, must have a value set in every user profile before an <code>AttributesToGet</code> parameter returns results.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributesToGet;

/**
 <p>A filter string of the form "<i>AttributeName</i><i>Filter-Type</i> "<i>AttributeValue</i>"". Quotation marks within the filter string must be escaped using the backslash (<code>\</code>) character. For example, <code>"family_name = \"Reddy\""</code>.</p><ul><li><p><i>AttributeName</i>: The name of the attribute to search for. You can only search for one attribute at a time.</p></li><li><p><i>Filter-Type</i>: For an exact match, use <code>=</code>, for example, "<code>given_name = \"Jon\"</code>". For a prefix ("starts with") match, use <code>^=</code>, for example, "<code>given_name ^= \"Jon\"</code>". </p></li><li><p><i>AttributeValue</i>: The attribute value that must be matched for each user.</p></li></ul><p>If the filter string is empty, <code>ListUsers</code> returns all users in the user pool.</p><p>You can only search for the following standard attributes:</p><ul><li><p><code>username</code> (case-sensitive)</p></li><li><p><code>email</code></p></li><li><p><code>phone_number</code></p></li><li><p><code>name</code></p></li><li><p><code>given_name</code></p></li><li><p><code>family_name</code></p></li><li><p><code>preferred_username</code></p></li><li><p><code>cognito:user_status</code> (called <b>Status</b> in the Console) (case-insensitive)</p></li><li><p><code>status (called <b>Enabled</b> in the Console) (case-sensitive)</code></p></li><li><p><code>sub</code></p></li></ul><p>Custom attributes aren't searchable.</p><note><p>You can also list users with a client-side filter. The server-side filter matches no more than one attribute. For an advanced search, use a client-side filter with the <code>--query</code> parameter of the <code>list-users</code> action in the CLI. When you use a client-side filter, ListUsers returns a paginated list of zero or more users. You can receive multiple pages in a row with zero results. Repeat the query with each pagination token that is returned until you receive a null pagination token value, and then review the combined result. </p><p>For more information about server-side and client-side filtering, see <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-filter.html">FilteringCLI output</a> in the <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-filter.html">Command Line Interface User Guide</a>. </p></note><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-manage-user-accounts.html#cognito-user-pools-searching-for-users-using-listusers-api">Searching for Users Using the ListUsers API</a> and <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-manage-user-accounts.html#cognito-user-pools-searching-for-users-listusers-api-examples">Examples of Using the ListUsers API</a> in the <i>Amazon Cognito Developer Guide</i>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filter;

/**
 <p>Maximum number of users to be returned.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>This API operation returns a limited number of results. The pagination token is an identifier that you can present in an additional API request with the same parameters. When you include the pagination token, Amazon Cognito returns the next set of items after the current list. Subsequent requests return a new pagination token. By use of this token, you can paginate through the full list of items.</p>
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
 <p>The identifier that Amazon Cognito returned with the previous request to this operation. When you include a pagination token in your request, Amazon Cognito returns the next set of items in the list. By use of this token, you can paginate through the full list of items.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>A list of the user pool users, and their attributes, that match your query.</p><note><p>Amazon Cognito creates a profile in your user pool for each native user in your user pool, and each unique user ID from your third-party identity providers (IdPs). When you link users with the <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminLinkProviderForUser.html">AdminLinkProviderForUser</a> API operation, the output of <code>ListUsers</code> displays both the IdP user and the native user that you linked. You can identify IdP users in the <code>Users</code> object of this API response by the IdP prefix that Amazon Cognito appends to <code>Username</code>.</p></note>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderUserType *> * _Nullable users;

@end

/**
 <p>The logging parameters of a user pool.</p>
 Required parameters: [LogLevel, EventSource]
 */
@interface AWSCognitoIdentityProviderLogConfigurationType : AWSModel


/**
 <p>The CloudWatch logging destination of a user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCloudWatchLogsConfigurationType * _Nullable cloudWatchLogsConfiguration;

/**
 <p>The source of events that your user pool sends for detailed activity logging.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderEventSourceName eventSource;

/**
 <p>The <code>errorlevel</code> selection of logs that a user pool sends for detailed activity logging.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderLogLevel logLevel;

@end

/**
 <p>The logging parameters of a user pool.</p>
 Required parameters: [UserPoolId, LogConfigurations]
 */
@interface AWSCognitoIdentityProviderLogDeliveryConfigurationType : AWSModel


/**
 <p>The detailed activity logging destination of a user pool.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderLogConfigurationType *> * _Nullable logConfigurations;

/**
 <p>The ID of the user pool where you configured detailed activity logging.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p><i>This data type is no longer supported.</i> Applies only to SMS multi-factor authentication (MFA) configurations. Does not apply to time-based one-time password (TOTP) software token MFA configurations.</p>
 */
@interface AWSCognitoIdentityProviderMFAOptionType : AWSModel


/**
 <p>The attribute name of the MFA option type. The only valid value is <code>phone_number</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 <p>The delivery medium to send the MFA code. You can use this parameter to set only the <code>SMS</code> delivery medium value.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderDeliveryMediumType deliveryMedium;

@end

/**
 <p>The message template structure.</p>
 */
@interface AWSCognitoIdentityProviderMessageTemplateType : AWSModel


/**
 <p>The message template for email messages. EmailMessage is allowed only if <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount">EmailSendingAccount</a> is DEVELOPER. </p>
 */
@property (nonatomic, strong) NSString * _Nullable emailMessage;

/**
 <p>The subject line for email messages. EmailSubject is allowed only if <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount">EmailSendingAccount</a> is DEVELOPER. </p>
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
 <p>The notify configuration type.</p>
 Required parameters: [SourceArn]
 */
@interface AWSCognitoIdentityProviderNotifyConfigurationType : AWSModel


/**
 <p>Email template used when a detected risk event is blocked.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderNotifyEmailType * _Nullable blockEmail;

/**
 <p>The email address that is sending the email. The address must be either individually verified with Amazon Simple Email Service, or from a domain that has been verified with Amazon SES.</p>
 */
@property (nonatomic, strong) NSString * _Nullable from;

/**
 <p>The multi-factor authentication (MFA) email template used when MFA is challenged as part of a detected risk.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderNotifyEmailType * _Nullable mfaEmail;

/**
 <p>The email template used when a detected risk event is allowed.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderNotifyEmailType * _Nullable noActionEmail;

/**
 <p>The destination to which the receiver of an email should reply to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable replyTo;

/**
 <p>The Amazon Resource Name (ARN) of the identity that is associated with the sending authorization policy. This identity permits Amazon Cognito to send for the email address specified in the <code>From</code> parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable sourceArn;

@end

/**
 <p>The notify email type.</p>
 Required parameters: [Subject]
 */
@interface AWSCognitoIdentityProviderNotifyEmailType : AWSModel


/**
 <p>The email HTML body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable htmlBody;

/**
 <p>The email subject.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subject;

/**
 <p>The email text body.</p>
 */
@property (nonatomic, strong) NSString * _Nullable textBody;

@end

/**
 <p>The minimum and maximum values of an attribute that is of the number data type.</p>
 */
@interface AWSCognitoIdentityProviderNumberAttributeConstraintsType : AWSModel


/**
 <p>The maximum length of a number attribute value. Must be a number less than or equal to <code>2^1023</code>, represented as a string with a length of 131072 characters or fewer.</p>
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
 <p>The minimum length of the password in the policy that you have set. This value can't be less than 6.</p>
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

/**
 <p>The number of days a temporary password is valid in the password policy. If the user doesn't sign in during this time, an administrator must reset their password. Defaults to <code>7</code>. If you submit a value of <code>0</code>, Amazon Cognito treats it as a null value and sets <code>TemporaryPasswordValidityDays</code> to its default value.</p><note><p>When you set <code>TemporaryPasswordValidityDays</code> for a user pool, you can no longer set a value for the legacy <code>UnusedAccountValidityDays</code> parameter in that user pool.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable temporaryPasswordValidityDays;

@end

/**
 <p>The properties of a pre token generation Lambda trigger.</p>
 Required parameters: [LambdaVersion, LambdaArn]
 */
@interface AWSCognitoIdentityProviderPreTokenGenerationVersionConfigType : AWSModel


/**
 <p>The Amazon Resource Name (ARN) of the function that you want to assign to your Lambda trigger.</p><p>This parameter and the <code>PreTokenGeneration</code> property of <code>LambdaConfig</code> have the same value. For new instances of pre token generation triggers, set <code>LambdaArn</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable lambdaArn;

/**
 <p>The user pool trigger version of the request that Amazon Cognito sends to your Lambda function. Higher-numbered versions add fields that support new features.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderPreTokenGenerationLambdaVersionType lambdaVersion;

@end

/**
 <p>A container for IdP details.</p>
 */
@interface AWSCognitoIdentityProviderProviderDescription : AWSModel


/**
 <p>The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The date the provider was last modified.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The IdP name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

/**
 <p>The IdP type.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderIdentityProviderTypeType providerType;

@end

/**
 <p>A container for information about an IdP for a user pool.</p>
 */
@interface AWSCognitoIdentityProviderProviderUserIdentifierType : AWSModel


/**
 <p>The name of the provider attribute to link to, such as <code>NameID</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerAttributeName;

/**
 <p>The value of the provider attribute to link to, such as <code>xxxxx_account</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerAttributeValue;

/**
 <p>The name of the provider, such as Facebook, Google, or Login with Amazon.</p>
 */
@property (nonatomic, strong) NSString * _Nullable providerName;

@end

/**
 <p>A map containing a priority as a key, and recovery method name as a value.</p>
 Required parameters: [Priority, Name]
 */
@interface AWSCognitoIdentityProviderRecoveryOptionType : AWSModel


/**
 <p>The recovery method for a user.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderRecoveryOptionNameType name;

/**
 <p>A positive integer specifying priority of a method with 1 being the highest priority.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable priority;

@end

/**
 <p>Represents the request to resend the confirmation code.</p>
 Required parameters: [ClientId, Username]
 */
@interface AWSCognitoIdentityProviderResendConfirmationCodeRequest : AWSRequest


/**
 <p>The Amazon Pinpoint analytics metadata that contributes to your metrics for <code>ResendConfirmationCode</code> calls.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

/**
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers.</p><p>You create custom workflows by assigning Lambda functions to user pool triggers. When you use the ResendConfirmationCode API action, Amazon Cognito invokes the function that is assigned to the <i>custom message</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your ResendConfirmationCode request. In your function code in Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 <p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 <p>Contextual data about your user session, such as the device fingerprint, IP address, or location. Amazon Cognito advanced security evaluates the risk of an authentication event based on the context that your app generates and passes to Amazon Cognito when it makes API requests.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserContextDataType * _Nullable userContextData;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>The response from the server when Amazon Cognito makes the request to resend a confirmation code.</p>
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
 <p>A unique resource server identifier for the resource server. The identifier can be an API friendly name like <code>solar-system-data</code>. You can also set an API URL like <code>https://solar-system-data-api.example.com</code> as your identifier.</p><p>Amazon Cognito represents scopes in the access token in the format <code>$resource-server-identifier/$scope</code>. Longer scope-identifier strings increase the size of your access tokens.</p>
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
 <p>The Amazon Pinpoint analytics metadata that contributes to your metrics for <code>RespondToAuthChallenge</code> calls.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

/**
 <p>The challenge name. For more information, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_InitiateAuth.html">InitiateAuth</a>.</p><p><code>ADMIN_NO_SRP_AUTH</code> isn't a valid value.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The responses to the challenge that you received in the previous request. Each challenge has its own required response parameters. The following examples are partial JSON request bodies that highlight challenge-response parameters.</p><important><p>You must provide a SECRET_HASH parameter in all challenge responses to an app client that has a client secret.</p></important><dl><dt>SMS_MFA</dt><dd><p><code>"ChallengeName": "SMS_MFA", "ChallengeResponses": {"SMS_MFA_CODE": "[SMS_code]", "USERNAME": "[username]"}</code></p></dd><dt>PASSWORD_VERIFIER</dt><dd><p><code>"ChallengeName": "PASSWORD_VERIFIER", "ChallengeResponses": {"PASSWORD_CLAIM_SIGNATURE": "[claim_signature]", "PASSWORD_CLAIM_SECRET_BLOCK": "[secret_block]", "TIMESTAMP": [timestamp], "USERNAME": "[username]"}</code></p><p>Add <code>"DEVICE_KEY"</code> when you sign in with a remembered device.</p></dd><dt>CUSTOM_CHALLENGE</dt><dd><p><code>"ChallengeName": "CUSTOM_CHALLENGE", "ChallengeResponses": {"USERNAME": "[username]", "ANSWER": "[challenge_answer]"}</code></p><p>Add <code>"DEVICE_KEY"</code> when you sign in with a remembered device.</p></dd><dt>NEW_PASSWORD_REQUIRED</dt><dd><p><code>"ChallengeName": "NEW_PASSWORD_REQUIRED", "ChallengeResponses": {"NEW_PASSWORD": "[new_password]", "USERNAME": "[username]"}</code></p><p>To set any required attributes that <code>InitiateAuth</code> returned in an <code>requiredAttributes</code> parameter, add <code>"userAttributes.[attribute_name]": "[attribute_value]"</code>. This parameter can also set values for writable attributes that aren't required by your user pool.</p><note><p>In a <code>NEW_PASSWORD_REQUIRED</code> challenge response, you can't modify a required attribute that already has a value. In <code>RespondToAuthChallenge</code>, set a value for any keys that Amazon Cognito returned in the <code>requiredAttributes</code> parameter, then use the <code>UpdateUserAttributes</code> API operation to modify the value of any additional attributes.</p></note></dd><dt>SOFTWARE_TOKEN_MFA</dt><dd><p><code>"ChallengeName": "SOFTWARE_TOKEN_MFA", "ChallengeResponses": {"USERNAME": "[username]", "SOFTWARE_TOKEN_MFA_CODE": [authenticator_code]}</code></p></dd><dt>DEVICE_SRP_AUTH</dt><dd><p><code>"ChallengeName": "DEVICE_SRP_AUTH", "ChallengeResponses": {"USERNAME": "[username]", "DEVICE_KEY": "[device_key]", "SRP_A": "[srp_a]"}</code></p></dd><dt>DEVICE_PASSWORD_VERIFIER</dt><dd><p><code>"ChallengeName": "DEVICE_PASSWORD_VERIFIER", "ChallengeResponses": {"DEVICE_KEY": "[device_key]", "PASSWORD_CLAIM_SIGNATURE": "[claim_signature]", "PASSWORD_CLAIM_SECRET_BLOCK": "[secret_block]", "TIMESTAMP": [timestamp], "USERNAME": "[username]"}</code></p></dd><dt>MFA_SETUP</dt><dd><p><code>"ChallengeName": "MFA_SETUP", "ChallengeResponses": {"USERNAME": "[username]"}, "SESSION": "[Session ID from VerifySoftwareToken]"</code></p></dd><dt>SELECT_MFA_TYPE</dt><dd><p><code>"ChallengeName": "SELECT_MFA_TYPE", "ChallengeResponses": {"USERNAME": "[username]", "ANSWER": "[SMS_MFA or SOFTWARE_TOKEN_MFA]"}</code></p></dd></dl><p>For more information about <code>SECRET_HASH</code>, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash">Computing secret hash values</a>. For information about <code>DEVICE_KEY</code>, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html">Working with user devices in your user pool</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeResponses;

/**
 <p>The app client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers.</p><p>You create custom workflows by assigning Lambda functions to user pool triggers. When you use the RespondToAuthChallenge API action, Amazon Cognito invokes any functions that are assigned to the following triggers: <i>post authentication</i>, <i>pre token generation</i>, <i>define auth challenge</i>, <i>create auth challenge</i>, and <i>verify auth challenge</i>. When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your RespondToAuthChallenge request. In your function code in Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 <p>The session that should be passed both ways in challenge-response calls to the service. If <code>InitiateAuth</code> or <code>RespondToAuthChallenge</code> API call determines that the caller must pass another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

/**
 <p>Contextual data about your user session, such as the device fingerprint, IP address, or location. Amazon Cognito advanced security evaluates the risk of an authentication event based on the context that your app generates and passes to Amazon Cognito when it makes API requests.</p>
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
 <p>The challenge name. For more information, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_InitiateAuth.html">InitiateAuth</a>.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge parameters. For more information, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_InitiateAuth.html">InitiateAuth</a>.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeParameters;

/**
 <p>The session that should be passed both ways in challenge-response calls to the service. If the caller must pass another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderRevokeTokenRequest : AWSRequest


/**
 <p>The client ID for the token that you want to revoke.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The secret for the client ID. This is required only if the client ID has a secret.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientSecret;

/**
 <p>The refresh token that you want to revoke.</p>
 */
@property (nonatomic, strong) NSString * _Nullable token;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderRevokeTokenResponse : AWSModel


@end

/**
 <p>The risk configuration type.</p>
 */
@interface AWSCognitoIdentityProviderRiskConfigurationType : AWSModel


/**
 <p>The account takeover risk configuration object, including the <code>NotifyConfiguration</code> object and <code>Actions</code> to take if there is an account takeover.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountTakeoverRiskConfigurationType * _Nullable accountTakeoverRiskConfiguration;

/**
 <p>The app client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The compromised credentials risk configuration object, including the <code>EventFilter</code> and the <code>EventAction</code>.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCompromisedCredentialsRiskConfigurationType * _Nullable compromisedCredentialsRiskConfiguration;

/**
 <p>The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The configuration to override the risk decision.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderRiskExceptionConfigurationType * _Nullable riskExceptionConfiguration;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>The type of the configuration to override the risk decision.</p>
 */
@interface AWSCognitoIdentityProviderRiskExceptionConfigurationType : AWSModel


/**
 <p>Overrides the risk decision to always block the pre-authentication requests. The IP range is in CIDR notation, a compact representation of an IP address and its routing prefix.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable blockedIPRangeList;

/**
 <p>Risk detection isn't performed on the IP addresses in this range list. The IP range is in CIDR notation.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable skippedIPRangeList;

@end

/**
 <p>The type used for enabling SMS multi-factor authentication (MFA) at the user level. Phone numbers don't need to be verified to be used for SMS MFA. If an MFA type is activated for a user, the user will be prompted for MFA during all sign-in attempts, unless device tracking is turned on and the device has been trusted. If you would like MFA to be applied selectively based on the assessed risk level of sign-in attempts, deactivate MFA for users and turn on Adaptive Authentication for the user pool.</p>
 */
@interface AWSCognitoIdentityProviderSMSMfaSettingsType : AWSModel


/**
 <p>Specifies whether SMS text message MFA is activated. If an MFA type is activated for a user, the user will be prompted for MFA during all sign-in attempts, unless device tracking is turned on and the device has been trusted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Specifies whether SMS is the preferred MFA method.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable preferredMfa;

@end

/**
 <p>A list of the user attributes and their properties in your user pool. The attribute schema contains standard attributes, custom attributes with a <code>custom:</code> prefix, and developer attributes with a <code>dev:</code> prefix. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-attributes.html">User pool attributes</a>.</p><p>Developer-only attributes are a legacy feature of user pools, are read-only to all app clients. You can create and update developer-only attributes only with IAM-authenticated API operations. Use app client read/write permissions instead.</p>
 */
@interface AWSCognitoIdentityProviderSchemaAttributeType : AWSModel


/**
 <p>The data format of the values for your attribute. When you choose an <code>AttributeDataType</code>, Amazon Cognito validates the input against the data type. A custom attribute value in your user's ID token is always a string, for example <code>"custom:isMember" : "true"</code> or <code>"custom:YearsAsMember" : "12"</code>. </p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderAttributeDataType attributeDataType;

/**
 <note><p>You should use <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UserPoolClientType.html#CognitoUserPools-Type-UserPoolClientType-WriteAttributes">WriteAttributes</a> in the user pool client to control how attributes can be mutated for new use cases instead of using <code>DeveloperOnlyAttribute</code>.</p></note><p>Specifies whether the attribute type is developer only. This attribute can only be modified by an administrator. Users won't be able to modify this attribute using their access token. For example, <code>DeveloperOnlyAttribute</code> can be modified using AdminUpdateUserAttributes but can't be updated using UpdateUserAttributes.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable developerOnlyAttribute;

/**
 <p>Specifies whether the value of the attribute can be changed.</p><p>Any user pool attribute whose value you map from an IdP attribute must be mutable, with a parameter value of <code>true</code>. Amazon Cognito updates mapped attributes when users sign in to your application through an IdP. If an attribute is immutable, Amazon Cognito throws an error when it attempts to update the attribute. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-specifying-attribute-mapping.html">Specifying Identity Provider Attribute Mappings for Your User Pool</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable varying;

/**
 <p>The name of your user pool attribute. When you create or update a user pool, adding a schema attribute creates a custom or developer-only attribute. When you add an attribute with a <code>Name</code> value of <code>MyAttribute</code>, Amazon Cognito creates the custom attribute <code>custom:MyAttribute</code>. When <code>DeveloperOnlyAttribute</code> is <code>true</code>, Amazon Cognito creates your attribute as <code>dev:MyAttribute</code>. In an operation that describes a user pool, Amazon Cognito returns this value as <code>value</code> for standard attributes, <code>custom:value</code> for custom attributes, and <code>dev:value</code> for developer-only attributes..</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 <p>Specifies the constraints for an attribute of the number type.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderNumberAttributeConstraintsType * _Nullable numberAttributeConstraints;

/**
 <p>Specifies whether a user pool attribute is required. If the attribute is required and the user doesn't provide a value, registration or sign-in will fail.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable required;

/**
 <p>Specifies the constraints for an attribute of the string type.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderStringAttributeConstraintsType * _Nullable stringAttributeConstraints;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetLogDeliveryConfigurationRequest : AWSRequest


/**
 <p>A collection of all of the detailed activity logging configurations for a user pool.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderLogConfigurationType *> * _Nullable logConfigurations;

/**
 <p>The ID of the user pool where you want to configure detailed activity logging .</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetLogDeliveryConfigurationResponse : AWSModel


/**
 <p>The detailed activity logging configuration that you applied to the requested user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLogDeliveryConfigurationType * _Nullable logDeliveryConfiguration;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetRiskConfigurationRequest : AWSRequest


/**
 <p>The account takeover risk configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountTakeoverRiskConfigurationType * _Nullable accountTakeoverRiskConfiguration;

/**
 <p>The app client ID. If <code>ClientId</code> is null, then the risk configuration is mapped to <code>userPoolId</code>. When the client ID is null, the same risk configuration is applied to all the clients in the userPool.</p><p>Otherwise, <code>ClientId</code> is mapped to the client. When the client ID isn't null, the user pool configuration is overridden and the risk configuration for the client is used instead.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The compromised credentials risk configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCompromisedCredentialsRiskConfigurationType * _Nullable compromisedCredentialsRiskConfiguration;

/**
 <p>The configuration to override the risk decision.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderRiskExceptionConfigurationType * _Nullable riskExceptionConfiguration;

/**
 <p>The user pool ID. </p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetRiskConfigurationResponse : AWSModel


/**
 <p>The risk configuration.</p>
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
 <p>A valid access token that Amazon Cognito issued to the user whose MFA preference you want to set.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The SMS text message multi-factor authentication (MFA) settings.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSMSMfaSettingsType * _Nullable SMSMfaSettings;

/**
 <p>The time-based one-time password (TOTP) software token MFA settings.</p>
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
 <p>The MFA configuration. If you set the MfaConfiguration value to ‘ON’, only users who have set up an MFA factor can sign in. To learn more, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-mfa.html">Adding Multi-Factor Authentication (MFA) to a user pool</a>. Valid values include:</p><ul><li><p><code>OFF</code> MFA won't be used for any users.</p></li><li><p><code>ON</code> MFA is required for all users to sign in.</p></li><li><p><code>OPTIONAL</code> MFA will be required only for individual users who have an MFA factor activated.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserPoolMfaType mfaConfiguration;

/**
 <p>The SMS text message MFA configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSmsMfaConfigType * _Nullable smsMfaConfiguration;

/**
 <p>The software token MFA configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSoftwareTokenMfaConfigType * _Nullable softwareTokenMfaConfiguration;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse : AWSModel


/**
 <p>The MFA configuration. Valid values include:</p><ul><li><p><code>OFF</code> MFA won't be used for any users.</p></li><li><p><code>ON</code> MFA is required for all users to sign in.</p></li><li><p><code>OPTIONAL</code> MFA will be required only for individual users who have an MFA factor enabled.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserPoolMfaType mfaConfiguration;

/**
 <p>The SMS text message MFA configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSmsMfaConfigType * _Nullable smsMfaConfiguration;

/**
 <p>The software token MFA configuration.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSoftwareTokenMfaConfigType * _Nullable softwareTokenMfaConfiguration;

@end

/**
 <p>Represents the request to set user settings.</p>
 Required parameters: [AccessToken, MFAOptions]
 */
@interface AWSCognitoIdentityProviderSetUserSettingsRequest : AWSRequest


/**
 <p>A valid access token that Amazon Cognito issued to the user whose user settings you want to configure.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>You can use this parameter only to set an SMS configuration that uses SMS for delivery.</p>
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
 <p>The Amazon Pinpoint analytics metadata that contributes to your metrics for <code>SignUp</code> calls.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsMetadataType * _Nullable analyticsMetadata;

/**
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers.</p><p>You create custom workflows by assigning Lambda functions to user pool triggers. When you use the SignUp API action, Amazon Cognito invokes any functions that are assigned to the following triggers: <i>pre sign-up</i>, <i>custom message</i>, and <i>post confirmation</i>. When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your SignUp request. In your function code in Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 <p>The password of the user you want to register.</p>
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
 <p>Contextual data about your user session, such as the device fingerprint, IP address, or location. Amazon Cognito advanced security evaluates the risk of an authentication event based on the context that your app generates and passes to Amazon Cognito when it makes API requests.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserContextDataType * _Nullable userContextData;

/**
 <p>The username of the user that you want to sign up. The value of this parameter is typically a username, but can be any alias attribute in your user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

/**
 <p>Temporary user attributes that contribute to the outcomes of your pre sign-up Lambda trigger. This set of key-value pairs are for custom validation of information that you collect from your users but don't need to retain.</p><p>Your Lambda function can analyze this additional data and act on it. Your function might perform external API operations like logging user attributes and validation data to Amazon CloudWatch Logs. Validation data might also affect the response that your function returns to Amazon Cognito, like automatically confirming the user if they sign up from within your network.</p><p>For more information about the pre sign-up Lambda trigger, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-pre-sign-up.html">Pre sign-up Lambda trigger</a>.</p>
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
 <p>The UUID of the authenticated user. This isn't the same as <code>username</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userSub;

@end

/**
 <p>The SMS configuration type is the settings that your Amazon Cognito user pool must use to send an SMS message from your Amazon Web Services account through Amazon Simple Notification Service. To send SMS messages with Amazon SNS in the Amazon Web Services Region that you want, the Amazon Cognito user pool uses an Identity and Access Management (IAM) role in your Amazon Web Services account.</p>
 Required parameters: [SnsCallerArn]
 */
@interface AWSCognitoIdentityProviderSmsConfigurationType : AWSModel


/**
 <p>The external ID provides additional security for your IAM role. You can use an <code>ExternalId</code> with the IAM role that you use with Amazon SNS to send SMS messages for your user pool. If you provide an <code>ExternalId</code>, your Amazon Cognito user pool includes it in the request to assume your IAM role. You can configure the role trust policy to require that Amazon Cognito, and any principal, provide the <code>ExternalID</code>. If you use the Amazon Cognito Management Console to create a role for SMS multi-factor authentication (MFA), Amazon Cognito creates a role with the required permissions and a trust policy that demonstrates use of the <code>ExternalId</code>.</p><p>For more information about the <code>ExternalId</code> of a role, see <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html">How to use an external ID when granting access to your Amazon Web Services resources to a third party</a></p>
 */
@property (nonatomic, strong) NSString * _Nullable externalId;

/**
 <p>The Amazon Resource Name (ARN) of the Amazon SNS caller. This is the ARN of the IAM role in your Amazon Web Services account that Amazon Cognito will use to send SMS messages. SMS messages are subject to a <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-email-phone-verification.html">spending limit</a>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable snsCallerArn;

/**
 <p>The Amazon Web Services Region to use with Amazon SNS integration. You can choose the same Region as your user pool, or a supported <b>Legacy Amazon SNS alternate Region</b>. </p><p> Amazon Cognito resources in the Asia Pacific (Seoul) Amazon Web Services Region must use your Amazon SNS configuration in the Asia Pacific (Tokyo) Region. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html">SMS message settings for Amazon Cognito user pools</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable snsRegion;

@end

/**
 <p>The SMS text message multi-factor authentication (MFA) configuration type.</p>
 */
@interface AWSCognitoIdentityProviderSmsMfaConfigType : AWSModel


/**
 <p>The SMS authentication message that will be sent to users with the code they must sign in. The message must contain the ‘{####}’ placeholder, which is replaced with the code. If the message isn't included, and default message will be used.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsAuthenticationMessage;

/**
 <p>The SMS configuration with the settings that your Amazon Cognito user pool must use to send an SMS message from your Amazon Web Services account through Amazon Simple Notification Service. To request Amazon SNS in the Amazon Web Services Region that you want, the Amazon Cognito user pool uses an Identity and Access Management (IAM) role that you provide for your Amazon Web Services account.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSmsConfigurationType * _Nullable smsConfiguration;

@end

/**
 <p>The type used for enabling software token MFA at the user pool level.</p>
 */
@interface AWSCognitoIdentityProviderSoftwareTokenMfaConfigType : AWSModel


/**
 <p>Specifies whether software token MFA is activated.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

@end

/**
 <p>The type used for enabling software token MFA at the user level. If an MFA type is activated for a user, the user will be prompted for MFA during all sign-in attempts, unless device tracking is turned on and the device has been trusted. If you want MFA to be applied selectively based on the assessed risk level of sign-in attempts, deactivate MFA for users and turn on Adaptive Authentication for the user pool.</p>
 */
@interface AWSCognitoIdentityProviderSoftwareTokenMfaSettingsType : AWSModel


/**
 <p>Specifies whether software token MFA is activated. If an MFA type is activated for a user, the user will be prompted for MFA during all sign-in attempts, unless device tracking is turned on and the device has been trusted.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 <p>Specifies whether software token MFA is the preferred MFA method.</p>
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
 <p>The maximum length of a string attribute value. Must be a number less than or equal to <code>2^1023</code>, represented as a string with a length of 131072 characters or fewer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxLength;

/**
 <p>The minimum length.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minLength;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the user pool to assign the tags to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The tags to assign to the user pool.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderTagResourceResponse : AWSModel


@end

/**
 <p>The data type TokenValidityUnits specifies the time units you use when you set the duration of ID, access, and refresh tokens.</p>
 */
@interface AWSCognitoIdentityProviderTokenValidityUnitsType : AWSModel


/**
 <p> A time unit of <code>seconds</code>, <code>minutes</code>, <code>hours</code>, or <code>days</code> for the value that you set in the <code>AccessTokenValidity</code> parameter. The default <code>AccessTokenValidity</code> time unit is hours. <code>AccessTokenValidity</code> duration can range from five minutes to one day.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderTimeUnitsType accessToken;

/**
 <p>A time unit of <code>seconds</code>, <code>minutes</code>, <code>hours</code>, or <code>days</code> for the value that you set in the <code>IdTokenValidity</code> parameter. The default <code>IdTokenValidity</code> time unit is hours. <code>IdTokenValidity</code> duration can range from five minutes to one day.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderTimeUnitsType idToken;

/**
 <p>A time unit of <code>seconds</code>, <code>minutes</code>, <code>hours</code>, or <code>days</code> for the value that you set in the <code>RefreshTokenValidity</code> parameter. The default <code>RefreshTokenValidity</code> time unit is days. <code>RefreshTokenValidity</code> duration can range from 60 minutes to 10 years.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderTimeUnitsType refreshToken;

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
 <p>The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The logo image for the UI customization.</p>
 */
@property (nonatomic, strong) NSString * _Nullable imageUrl;

/**
 <p>The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The user pool ID for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the user pool that the tags are assigned to.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The keys of the tags to remove from the user pool.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUntagResourceResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest : AWSRequest


/**
 <p>The event ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable eventId;

/**
 <p>The feedback token.</p>
 */
@property (nonatomic, strong) NSString * _Nullable feedbackToken;

/**
 <p>The authentication event feedback value. When you provide a <code>FeedbackValue</code> value of <code>valid</code>, you tell Amazon Cognito that you trust a user session where Amazon Cognito has evaluated some level of risk. When you provide a <code>FeedbackValue</code> value of <code>invalid</code>, you tell Amazon Cognito that you don't trust a user session, or you don't believe that Amazon Cognito evaluated a high-enough risk level.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderFeedbackValueType feedbackValue;

/**
 <p>The user pool ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The username of the user that you want to query or modify. The value of this parameter is typically your user's username, but it can be any of their alias attributes. If <code>username</code> isn't an alias attribute in your user pool, this value must be the <code>sub</code> of a local user or the username of a user from a third-party IdP.</p>
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
 <p>A valid access token that Amazon Cognito issued to the user whose device status you want to update.</p>
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
 <p>The new precedence value for the group. For more information about this parameter, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_CreateGroup.html">CreateGroup</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable precedence;

/**
 <p>The new role Amazon Resource Name (ARN) for the group. This is used for setting the <code>cognito:roles</code> and <code>cognito:preferred_role</code> claims in the token.</p>
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
 <p>The IdP attribute mapping to be changed.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable attributeMapping;

/**
 <p>A list of IdP identifiers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable idpIdentifiers;

/**
 <p>The scopes, URLs, and identifiers for your external identity provider. The following examples describe the provider detail keys for each IdP type. These values and their schema are subject to change. Social IdP <code>authorize_scopes</code> values must match the values listed here.</p><dl><dt>OpenID Connect (OIDC)</dt><dd><p>Amazon Cognito accepts the following elements when it can't discover endpoint URLs from <code>oidc_issuer</code>: <code>attributes_url</code>, <code>authorize_url</code>, <code>jwks_uri</code>, <code>token_url</code>.</p><p>Create or update request: <code>"ProviderDetails": { "attributes_request_method": "GET", "attributes_url": "https://auth.example.com/userInfo", "authorize_scopes": "openid profile email", "authorize_url": "https://auth.example.com/authorize", "client_id": "1example23456789", "client_secret": "provider-app-client-secret", "jwks_uri": "https://auth.example.com/.well-known/jwks.json", "oidc_issuer": "https://auth.example.com", "token_url": "https://example.com/token" }</code></p><p>Describe response: <code>"ProviderDetails": { "attributes_request_method": "GET", "attributes_url": "https://auth.example.com/userInfo", "attributes_url_add_attributes": "false", "authorize_scopes": "openid profile email", "authorize_url": "https://auth.example.com/authorize", "client_id": "1example23456789", "client_secret": "provider-app-client-secret", "jwks_uri": "https://auth.example.com/.well-known/jwks.json", "oidc_issuer": "https://auth.example.com", "token_url": "https://example.com/token" }</code></p></dd><dt>SAML</dt><dd><p>Create or update request with Metadata URL: <code>"ProviderDetails": { "IDPInit": "true", "IDPSignout": "true", "EncryptedResponses" : "true", "MetadataURL": "https://auth.example.com/sso/saml/metadata", "RequestSigningAlgorithm": "rsa-sha256" }</code></p><p>Create or update request with Metadata file: <code>"ProviderDetails": { "IDPInit": "true", "IDPSignout": "true", "EncryptedResponses" : "true", "MetadataFile": "[metadata XML]", "RequestSigningAlgorithm": "rsa-sha256" }</code></p><p>The value of <code>MetadataFile</code> must be the plaintext metadata document with all quote (") characters escaped by backslashes.</p><p>Describe response: <code>"ProviderDetails": { "IDPInit": "true", "IDPSignout": "true", "EncryptedResponses" : "true", "ActiveEncryptionCertificate": "[certificate]", "MetadataURL": "https://auth.example.com/sso/saml/metadata", "RequestSigningAlgorithm": "rsa-sha256", "SLORedirectBindingURI": "https://auth.example.com/slo/saml", "SSORedirectBindingURI": "https://auth.example.com/sso/saml" }</code></p></dd><dt>LoginWithAmazon</dt><dd><p>Create or update request: <code>"ProviderDetails": { "authorize_scopes": "profile postal_code", "client_id": "amzn1.application-oa2-client.1example23456789", "client_secret": "provider-app-client-secret"</code></p><p>Describe response: <code>"ProviderDetails": { "attributes_url": "https://api.amazon.com/user/profile", "attributes_url_add_attributes": "false", "authorize_scopes": "profile postal_code", "authorize_url": "https://www.amazon.com/ap/oa", "client_id": "amzn1.application-oa2-client.1example23456789", "client_secret": "provider-app-client-secret", "token_request_method": "POST", "token_url": "https://api.amazon.com/auth/o2/token" }</code></p></dd><dt>Google</dt><dd><p>Create or update request: <code>"ProviderDetails": { "authorize_scopes": "email profile openid", "client_id": "1example23456789.apps.googleusercontent.com", "client_secret": "provider-app-client-secret" }</code></p><p>Describe response: <code>"ProviderDetails": { "attributes_url": "https://people.googleapis.com/v1/people/me?personFields=", "attributes_url_add_attributes": "true", "authorize_scopes": "email profile openid", "authorize_url": "https://accounts.google.com/o/oauth2/v2/auth", "client_id": "1example23456789.apps.googleusercontent.com", "client_secret": "provider-app-client-secret", "oidc_issuer": "https://accounts.google.com", "token_request_method": "POST", "token_url": "https://www.googleapis.com/oauth2/v4/token" }</code></p></dd><dt>SignInWithApple</dt><dd><p>Create or update request: <code>"ProviderDetails": { "authorize_scopes": "email name", "client_id": "com.example.cognito", "private_key": "1EXAMPLE", "key_id": "2EXAMPLE", "team_id": "3EXAMPLE" }</code></p><p>Describe response: <code>"ProviderDetails": { "attributes_url_add_attributes": "false", "authorize_scopes": "email name", "authorize_url": "https://appleid.apple.com/auth/authorize", "client_id": "com.example.cognito", "key_id": "1EXAMPLE", "oidc_issuer": "https://appleid.apple.com", "team_id": "2EXAMPLE", "token_request_method": "POST", "token_url": "https://appleid.apple.com/auth/token" }</code></p></dd><dt>Facebook</dt><dd><p>Create or update request: <code>"ProviderDetails": { "api_version": "v17.0", "authorize_scopes": "public_profile, email", "client_id": "1example23456789", "client_secret": "provider-app-client-secret" }</code></p><p>Describe response: <code>"ProviderDetails": { "api_version": "v17.0", "attributes_url": "https://graph.facebook.com/v17.0/me?fields=", "attributes_url_add_attributes": "true", "authorize_scopes": "public_profile, email", "authorize_url": "https://www.facebook.com/v17.0/dialog/oauth", "client_id": "1example23456789", "client_secret": "provider-app-client-secret", "token_request_method": "GET", "token_url": "https://graph.facebook.com/v17.0/oauth/access_token" }</code></p></dd></dl>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable providerDetails;

/**
 <p>The IdP name.</p>
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
 <p>The identity provider details.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderIdentityProviderType * _Nullable identityProvider;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateResourceServerRequest : AWSRequest


/**
 <p>A unique resource server identifier for the resource server. The identifier can be an API friendly name like <code>solar-system-data</code>. You can also set an API URL like <code>https://solar-system-data-api.example.com</code> as your identifier.</p><p>Amazon Cognito represents scopes in the access token in the format <code>$resource-server-identifier/$scope</code>. Longer scope-identifier strings increase the size of your access tokens.</p>
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
 <p>A valid access token that Amazon Cognito issued to the user whose user attributes you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action initiates. </p><p>You create custom workflows by assigning Lambda functions to user pool triggers. When you use the UpdateUserAttributes API action, Amazon Cognito invokes the function that is assigned to the <i>custom message</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your UpdateUserAttributes request. In your function code in Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html"> Customizing user pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p><note><p>When you use the ClientMetadata parameter, remember that Amazon Cognito won't do the following:</p><ul><li><p>Store the ClientMetadata value. This data is available only to Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration doesn't include triggers, the ClientMetadata parameter serves no purpose.</p></li><li><p>Validate the ClientMetadata value.</p></li><li><p>Encrypt the ClientMetadata value. Don't use Amazon Cognito to provide sensitive information.</p></li></ul></note>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

/**
 <p>An array of name-value pairs representing user attributes.</p><p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p><p>If you have set an attribute to require verification before Amazon Cognito updates its value, this request doesn’t immediately update the value of that attribute. After your user receives and responds to a verification message to verify the new value, Amazon Cognito updates the attribute value. Your user can sign in and receive messages with the original attribute value until they verify the new value.</p>
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
 <p>The access token time limit. After this limit expires, your user can't use their access token. To specify the time unit for <code>AccessTokenValidity</code> as <code>seconds</code>, <code>minutes</code>, <code>hours</code>, or <code>days</code>, set a <code>TokenValidityUnits</code> value in your API request.</p><p>For example, when you set <code>AccessTokenValidity</code> to <code>10</code> and <code>TokenValidityUnits</code> to <code>hours</code>, your user can authorize access with their access token for 10 hours.</p><p>The default time unit for <code>AccessTokenValidity</code> in an API request is hours. <i>Valid range</i> is displayed below in seconds.</p><p>If you don't specify otherwise in the configuration of your app client, your access tokens are valid for one hour.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable accessTokenValidity;

/**
 <p>The allowed OAuth flows.</p><dl><dt>code</dt><dd><p>Use a code grant flow, which provides an authorization code as the response. This code can be exchanged for access tokens with the <code>/oauth2/token</code> endpoint.</p></dd><dt>implicit</dt><dd><p>Issue the access token (and, optionally, ID token, based on scopes) directly to your user.</p></dd><dt>client_credentials</dt><dd><p>Issue the access token from the <code>/oauth2/token</code> endpoint directly to a non-person user using a combination of the client ID and client secret.</p></dd></dl>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOAuthFlows;

/**
 <p>Set to <code>true</code> to use OAuth 2.0 features in your user pool app client.</p><p><code>AllowedOAuthFlowsUserPoolClient</code> must be <code>true</code> before you can configure the following features in your app client.</p><ul><li><p><code>CallBackURLs</code>: Callback URLs.</p></li><li><p><code>LogoutURLs</code>: Sign-out redirect URLs.</p></li><li><p><code>AllowedOAuthScopes</code>: OAuth 2.0 scopes.</p></li><li><p><code>AllowedOAuthFlows</code>: Support for authorization code, implicit, and client credentials OAuth 2.0 grants.</p></li></ul><p>To use OAuth 2.0 features, configure one of these features in the Amazon Cognito console or set <code>AllowedOAuthFlowsUserPoolClient</code> to <code>true</code> in a <code>CreateUserPoolClient</code> or <code>UpdateUserPoolClient</code> API request. If you don't set a value for <code>AllowedOAuthFlowsUserPoolClient</code> in a request with the CLI or SDKs, it defaults to <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowedOAuthFlowsUserPoolClient;

/**
 <p>The allowed OAuth scopes. Possible values provided by OAuth are <code>phone</code>, <code>email</code>, <code>openid</code>, and <code>profile</code>. Possible values provided by Amazon Web Services are <code>aws.cognito.signin.user.admin</code>. Custom scopes created in Resource Servers are also supported.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOAuthScopes;

/**
 <p>The Amazon Pinpoint analytics configuration necessary to collect metrics for this user pool.</p><note><p>In Amazon Web Services Regions where Amazon Pinpoint isn't available, user pools only support sending events to Amazon Pinpoint projects in us-east-1. In Regions where Amazon Pinpoint is available, user pools support sending events to Amazon Pinpoint projects within that same Region.</p></note>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsConfigurationType * _Nullable analyticsConfiguration;

/**
 <p>Amazon Cognito creates a session token for each API request in an authentication flow. <code>AuthSessionValidity</code> is the duration, in minutes, of that session token. Your user pool native user must respond to each authentication challenge before the session expires.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable authSessionValidity;

/**
 <p>A list of allowed redirect (callback) URLs for the IdPs.</p><p>A redirect URI must:</p><ul><li><p>Be an absolute URI.</p></li><li><p>Be registered with the authorization server.</p></li><li><p>Not include a fragment component.</p></li></ul><p>See <a href="https://tools.ietf.org/html/rfc6749#section-3.1.2">OAuth 2.0 - Redirection Endpoint</a>.</p><p>Amazon Cognito requires HTTPS over HTTP except for http://localhost for testing purposes only.</p><p>App callback URLs such as <code>myapp://example</code> are also supported.</p>
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
 <p>The default redirect URI. Must be in the <code>CallbackURLs</code> list.</p><p>A redirect URI must:</p><ul><li><p>Be an absolute URI.</p></li><li><p>Be registered with the authorization server.</p></li><li><p>Not include a fragment component.</p></li></ul><p>See <a href="https://tools.ietf.org/html/rfc6749#section-3.1.2">OAuth 2.0 - Redirection Endpoint</a>.</p><p>Amazon Cognito requires HTTPS over HTTP except for <code>http://localhost</code> for testing purposes only.</p><p>App callback URLs such as <code>myapp://example</code> are also supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultRedirectURI;

/**
 <p>Activates the propagation of additional user context data. For more information about propagation of user context data, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-advanced-security.html"> Adding advanced security to a user pool</a>. If you don’t include this parameter, you can't send device fingerprint information, including source IP address, to Amazon Cognito advanced security. You can only activate <code>EnablePropagateAdditionalUserContextData</code> in an app client that has a client secret.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enablePropagateAdditionalUserContextData;

/**
 <p>Activates or deactivates token revocation. For more information about revoking tokens, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_RevokeToken.html">RevokeToken</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableTokenRevocation;

/**
 <p>The authentication flows that you want your user pool client to support. For each app client in your user pool, you can sign in your users with any combination of one or more flows, including with a user name and Secure Remote Password (SRP), a user name and password, or a custom authentication process that you define with Lambda functions.</p><note><p>If you don't specify a value for <code>ExplicitAuthFlows</code>, your user client supports <code>ALLOW_REFRESH_TOKEN_AUTH</code>, <code>ALLOW_USER_SRP_AUTH</code>, and <code>ALLOW_CUSTOM_AUTH</code>.</p></note><p>Valid values include:</p><ul><li><p><code>ALLOW_ADMIN_USER_PASSWORD_AUTH</code>: Enable admin based user password authentication flow <code>ADMIN_USER_PASSWORD_AUTH</code>. This setting replaces the <code>ADMIN_NO_SRP_AUTH</code> setting. With this authentication flow, your app passes a user name and password to Amazon Cognito in the request, instead of using the Secure Remote Password (SRP) protocol to securely transmit the password.</p></li><li><p><code>ALLOW_CUSTOM_AUTH</code>: Enable Lambda trigger based authentication.</p></li><li><p><code>ALLOW_USER_PASSWORD_AUTH</code>: Enable user password-based authentication. In this flow, Amazon Cognito receives the password in the request instead of using the SRP protocol to verify passwords.</p></li><li><p><code>ALLOW_USER_SRP_AUTH</code>: Enable SRP-based authentication.</p></li><li><p><code>ALLOW_REFRESH_TOKEN_AUTH</code>: Enable authflow to refresh tokens.</p></li></ul><p>In some environments, you will see the values <code>ADMIN_NO_SRP_AUTH</code>, <code>CUSTOM_AUTH_FLOW_ONLY</code>, or <code>USER_PASSWORD_AUTH</code>. You can't assign these legacy <code>ExplicitAuthFlows</code> values to user pool clients at the same time as values that begin with <code>ALLOW_</code>, like <code>ALLOW_USER_SRP_AUTH</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable explicitAuthFlows;

/**
 <p>The ID token time limit. After this limit expires, your user can't use their ID token. To specify the time unit for <code>IdTokenValidity</code> as <code>seconds</code>, <code>minutes</code>, <code>hours</code>, or <code>days</code>, set a <code>TokenValidityUnits</code> value in your API request.</p><p>For example, when you set <code>IdTokenValidity</code> as <code>10</code> and <code>TokenValidityUnits</code> as <code>hours</code>, your user can authenticate their session with their ID token for 10 hours.</p><p>The default time unit for <code>IdTokenValidity</code> in an API request is hours. <i>Valid range</i> is displayed below in seconds.</p><p>If you don't specify otherwise in the configuration of your app client, your ID tokens are valid for one hour.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable idTokenValidity;

/**
 <p>A list of allowed logout URLs for the IdPs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logoutURLs;

/**
 <p>Errors and responses that you want Amazon Cognito APIs to return during authentication, account confirmation, and password recovery when the user doesn't exist in the user pool. When set to <code>ENABLED</code> and the user doesn't exist, authentication returns an error indicating either the username or password was incorrect. Account confirmation and password recovery return a response indicating a code was sent to a simulated destination. When set to <code>LEGACY</code>, those APIs return a <code>UserNotFoundException</code> exception if the user doesn't exist in the user pool.</p><p>Valid values include:</p><ul><li><p><code>ENABLED</code> - This prevents user existence-related errors.</p></li><li><p><code>LEGACY</code> - This represents the early behavior of Amazon Cognito where user existence related errors aren't prevented.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderPreventUserExistenceErrorTypes preventUserExistenceErrors;

/**
 <p>The list of user attributes that you want your app client to have read-only access to. After your user authenticates in your app, their access token authorizes them to read their own attribute value for any attribute in this list. An example of this kind of activity is when your user selects a link to view their profile information. Your app makes a <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_GetUser.html">GetUser</a> API request to retrieve and display your user's profile data.</p><p>When you don't specify the <code>ReadAttributes</code> for your app client, your app can read the values of <code>email_verified</code>, <code>phone_number_verified</code>, and the Standard attributes of your user pool. When your user pool has read access to these default attributes, <code>ReadAttributes</code> doesn't return any information. Amazon Cognito only populates <code>ReadAttributes</code> in the API response if you have specified your own custom set of read attributes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable readAttributes;

/**
 <p>The refresh token time limit. After this limit expires, your user can't use their refresh token. To specify the time unit for <code>RefreshTokenValidity</code> as <code>seconds</code>, <code>minutes</code>, <code>hours</code>, or <code>days</code>, set a <code>TokenValidityUnits</code> value in your API request.</p><p>For example, when you set <code>RefreshTokenValidity</code> as <code>10</code> and <code>TokenValidityUnits</code> as <code>days</code>, your user can refresh their session and retrieve new access and ID tokens for 10 days.</p><p>The default time unit for <code>RefreshTokenValidity</code> in an API request is days. You can't set <code>RefreshTokenValidity</code> to 0. If you do, Amazon Cognito overrides the value with the default value of 30 days. <i>Valid range</i> is displayed below in seconds.</p><p>If you don't specify otherwise in the configuration of your app client, your refresh tokens are valid for 30 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable refreshTokenValidity;

/**
 <p>A list of provider names for the IdPs that this client supports. The following are supported: <code>COGNITO</code>, <code>Facebook</code>, <code>Google</code>, <code>SignInWithApple</code>, <code>LoginWithAmazon</code>, and the names of your own SAML and OIDC providers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedIdentityProviders;

/**
 <p>The time units you use when you set the duration of ID, access, and refresh tokens. The default unit for RefreshToken is days, and the default for ID and access tokens is hours.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderTokenValidityUnitsType * _Nullable tokenValidityUnits;

/**
 <p>The user pool ID for the user pool where you want to update the user pool client.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The list of user attributes that you want your app client to have write access to. After your user authenticates in your app, their access token authorizes them to set or modify their own attribute value for any attribute in this list. An example of this kind of activity is when you present your user with a form to update their profile information and they change their last name. Your app then makes an <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UpdateUserAttributes.html">UpdateUserAttributes</a> API request and sets <code>family_name</code> to the new value. </p><p>When you don't specify the <code>WriteAttributes</code> for your app client, your app can write the values of the Standard attributes of your user pool. When your user pool has write access to these default attributes, <code>WriteAttributes</code> doesn't return any information. Amazon Cognito only populates <code>WriteAttributes</code> in the API response if you have specified your own custom set of write attributes.</p><p>If your app client allows users to sign in through an IdP, this array must include all attributes that you have mapped to IdP attributes. Amazon Cognito updates mapped attributes when users sign in to your application through an IdP. If your app client does not have write access to a mapped attribute, Amazon Cognito throws an error when it tries to update the attribute. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-specifying-attribute-mapping.html">Specifying IdP Attribute Mappings for Your user pool</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable writeAttributes;

@end

/**
 <p>Represents the response from the server to the request to update the user pool client.</p>
 */
@interface AWSCognitoIdentityProviderUpdateUserPoolClientResponse : AWSModel


/**
 <p>The user pool client value from the response from the server when you request to update the user pool client.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolClientType * _Nullable userPoolClient;

@end

/**
 <p>The UpdateUserPoolDomain request input.</p>
 Required parameters: [Domain, UserPoolId, CustomDomainConfig]
 */
@interface AWSCognitoIdentityProviderUpdateUserPoolDomainRequest : AWSRequest


/**
 <p>The configuration for a custom domain that hosts the sign-up and sign-in pages for your application. Use this object to specify an SSL certificate that is managed by ACM.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCustomDomainConfigType * _Nullable customDomainConfig;

/**
 <p>The domain name for the custom domain that hosts the sign-up and sign-in pages for your application. One example might be <code>auth.example.com</code>. </p><p>This string can include only lowercase letters, numbers, and hyphens. Don't use a hyphen for the first or last character. Use periods to separate subdomain names.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>The ID of the user pool that is associated with the custom domain whose certificate you're updating.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>The UpdateUserPoolDomain response output.</p>
 */
@interface AWSCognitoIdentityProviderUpdateUserPoolDomainResponse : AWSModel


/**
 <p>The Amazon CloudFront endpoint that Amazon Cognito set up when you added the custom domain to your user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable cloudFrontDomain;

@end

/**
 <p>Represents the request to update the user pool.</p>
 Required parameters: [UserPoolId]
 */
@interface AWSCognitoIdentityProviderUpdateUserPoolRequest : AWSRequest


/**
 <p>The available verified method a user can use to recover their password when they call <code>ForgotPassword</code>. You can use this setting to define a preferred method when a user has more than one method available. With this setting, SMS doesn't qualify for a valid password recovery mechanism if the user also has SMS multi-factor authentication (MFA) activated. In the absence of this setting, Amazon Cognito uses the legacy behavior to determine the recovery method where SMS is preferred through email.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountRecoverySettingType * _Nullable accountRecoverySetting;

/**
 <p>The configuration for <code>AdminCreateUser</code> requests.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAdminCreateUserConfigType * _Nullable adminCreateUserConfig;

/**
 <p>The attributes that are automatically verified when Amazon Cognito requests to update user pools.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoVerifiedAttributes;

/**
 <p>When active, <code>DeletionProtection</code> prevents accidental deletion of your user pool. Before you can delete a user pool that you have protected against deletion, you must deactivate this feature.</p><p>When you try to delete a protected user pool in a <code>DeleteUserPool</code> API request, Amazon Cognito returns an <code>InvalidParameterException</code> error. To delete a protected user pool, send a new <code>DeleteUserPool</code> request after you deactivate deletion protection in an <code>UpdateUserPool</code> API request.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderDeletionProtectionType deletionProtection;

/**
 <p>The device-remembering configuration for a user pool. A null value indicates that you have deactivated device remembering in your user pool.</p><note><p>When you provide a value for any <code>DeviceConfiguration</code> field, you activate the Amazon Cognito device-remembering feature.</p></note>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderDeviceConfigurationType * _Nullable deviceConfiguration;

/**
 <p>The email configuration of your user pool. The email configuration type sets your preferred sending method, Amazon Web Services Region, and sender for email invitation and verification messages from your user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderEmailConfigurationType * _Nullable emailConfiguration;

/**
 <p>This parameter is no longer used. See <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_VerificationMessageTemplateType.html">VerificationMessageTemplateType</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationMessage;

/**
 <p>This parameter is no longer used. See <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_VerificationMessageTemplateType.html">VerificationMessageTemplateType</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationSubject;

/**
 <p>The Lambda configuration information from the request to update the user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLambdaConfigType * _Nullable lambdaConfig;

/**
 <p>Possible values include:</p><ul><li><p><code>OFF</code> - MFA tokens aren't required and can't be specified during user registration.</p></li><li><p><code>ON</code> - MFA tokens are required for all user registrations. You can only specify ON when you're initially creating a user pool. You can use the <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_SetUserPoolMfaConfig.html">SetUserPoolMfaConfig</a> API operation to turn MFA "ON" for existing user pools. </p></li><li><p><code>OPTIONAL</code> - Users have the option when registering to create an MFA token.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserPoolMfaType mfaConfiguration;

/**
 <p>A container with the policies you want to update in a user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolPolicyType * _Nullable policies;

/**
 <p>The contents of the SMS authentication message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsAuthenticationMessage;

/**
 <p>The SMS configuration with the settings that your Amazon Cognito user pool must use to send an SMS message from your Amazon Web Services account through Amazon Simple Notification Service. To send SMS messages with Amazon SNS in the Amazon Web Services Region that you want, the Amazon Cognito user pool uses an Identity and Access Management (IAM) role in your Amazon Web Services account.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSmsConfigurationType * _Nullable smsConfiguration;

/**
 <p>This parameter is no longer used. See <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_VerificationMessageTemplateType.html">VerificationMessageTemplateType</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsVerificationMessage;

/**
 <p>The settings for updates to user attributes. These settings include the property <code>AttributesRequireVerificationBeforeUpdate</code>, a user-pool setting that tells Amazon Cognito how to handle changes to the value of your users' email address and phone number attributes. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-email-phone-verification.html#user-pool-settings-verifications-verify-attribute-updates"> Verifying updates to email addresses and phone numbers</a>.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserAttributeUpdateSettingsType * _Nullable userAttributeUpdateSettings;

/**
 <p>User pool add-ons. Contains settings for activation of advanced security features. To log user security information but take no action, set to <code>AUDIT</code>. To configure automatic security responses to risky traffic to your user pool, set to <code>ENFORCED</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-advanced-security.html">Adding advanced security to a user pool</a>.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolAddOnsType * _Nullable userPoolAddOns;

/**
 <p>The user pool ID for the user pool you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The tag keys and values to assign to the user pool. A tag is a label that you can use to categorize and manage user pools in different ways, such as by purpose, owner, environment, or other criteria.</p>
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
 <p>The settings for updates to user attributes. These settings include the property <code>AttributesRequireVerificationBeforeUpdate</code>, a user-pool setting that tells Amazon Cognito how to handle changes to the value of your users' email address and phone number attributes. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-email-phone-verification.html#user-pool-settings-verifications-verify-attribute-updates"> Verifying updates to email addresses and phone numbers</a>.</p>
 */
@interface AWSCognitoIdentityProviderUserAttributeUpdateSettingsType : AWSModel


/**
 <p>Requires that your user verifies their email address, phone number, or both before Amazon Cognito updates the value of that attribute. When you update a user attribute that has this option activated, Amazon Cognito sends a verification message to the new phone number or email address. Amazon Cognito doesn’t change the value of the attribute until your user responds to the verification message and confirms the new value.</p><p>You can verify an updated email address or phone number with a <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_VerifyUserAttribute.html">VerifyUserAttribute</a> API request. You can also call the <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminUpdateUserAttributes.html">AdminUpdateUserAttributes</a> API and set <code>email_verified</code> or <code>phone_number_verified</code> to true.</p><p>When <code>AttributesRequireVerificationBeforeUpdate</code> is false, your user pool doesn't require that your users verify attribute changes before Amazon Cognito updates them. In a user pool where <code>AttributesRequireVerificationBeforeUpdate</code> is false, API operations that change attribute values can immediately update a user’s <code>email</code> or <code>phone_number</code> attribute.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributesRequireVerificationBeforeUpdate;

@end

/**
 <p>Contextual data, such as the user's device fingerprint, IP address, or location, used for evaluating the risk of an unexpected event by Amazon Cognito advanced security.</p>
 */
@interface AWSCognitoIdentityProviderUserContextDataType : AWSModel


/**
 <p>Encoded device-fingerprint details that your app collected with the Amazon Cognito context data collection library. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-adaptive-authentication.html#user-pool-settings-adaptive-authentication-device-fingerprint">Adding user device and session data to API requests</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable encodedData;

/**
 <p>The source IP address of your user's device.</p>
 */
@property (nonatomic, strong) NSString * _Nullable ipAddress;

@end

/**
 <p>The user import job type.</p>
 */
@interface AWSCognitoIdentityProviderUserImportJobType : AWSModel


/**
 <p>The role Amazon Resource Name (ARN) for the Amazon CloudWatch Logging role for the user import job. For more information, see "Creating the CloudWatch Logs IAM Role" in the Amazon Cognito Developer Guide.</p>
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
 <p>The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The number of users that couldn't be imported.</p>
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
 <p>The status of the user import job. One of the following:</p><ul><li><p><code>Created</code> - The job was created but not started.</p></li><li><p><code>Pending</code> - A transition state. You have started the job, but it has not begun importing users yet.</p></li><li><p><code>InProgress</code> - The job has started, and users are being imported.</p></li><li><p><code>Stopping</code> - You have stopped the job, but the job has not stopped importing users yet.</p></li><li><p><code>Stopped</code> - You have stopped the job, and the job has stopped importing users.</p></li><li><p><code>Succeeded</code> - The job has completed successfully.</p></li><li><p><code>Failed</code> - The job has stopped due to an error.</p></li><li><p><code>Expired</code> - You created a job, but did not start the job within 24-48 hours. All data associated with the job was deleted, and the job can't be started.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserImportJobStatusType status;

/**
 <p>The user pool ID for the user pool that the users are being imported into.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>User pool add-ons. Contains settings for activation of advanced security features. To log user security information but take no action, set to <code>AUDIT</code>. To configure automatic security responses to risky traffic to your user pool, set to <code>ENFORCED</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-advanced-security.html">Adding advanced security to a user pool</a>.</p>
 Required parameters: [AdvancedSecurityMode]
 */
@interface AWSCognitoIdentityProviderUserPoolAddOnsType : AWSModel


/**
 <p>The operating mode of advanced security features in your user pool.</p>
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
 <p>The access token time limit. After this limit expires, your user can't use their access token. To specify the time unit for <code>AccessTokenValidity</code> as <code>seconds</code>, <code>minutes</code>, <code>hours</code>, or <code>days</code>, set a <code>TokenValidityUnits</code> value in your API request.</p><p>For example, when you set <code>AccessTokenValidity</code> to <code>10</code> and <code>TokenValidityUnits</code> to <code>hours</code>, your user can authorize access with their access token for 10 hours.</p><p>The default time unit for <code>AccessTokenValidity</code> in an API request is hours. <i>Valid range</i> is displayed below in seconds.</p><p>If you don't specify otherwise in the configuration of your app client, your access tokens are valid for one hour.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable accessTokenValidity;

/**
 <p>The allowed OAuth flows.</p><dl><dt>code</dt><dd><p>Use a code grant flow, which provides an authorization code as the response. This code can be exchanged for access tokens with the <code>/oauth2/token</code> endpoint.</p></dd><dt>implicit</dt><dd><p>Issue the access token (and, optionally, ID token, based on scopes) directly to your user.</p></dd><dt>client_credentials</dt><dd><p>Issue the access token from the <code>/oauth2/token</code> endpoint directly to a non-person user using a combination of the client ID and client secret.</p></dd></dl>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOAuthFlows;

/**
 <p>Set to <code>true</code> to use OAuth 2.0 features in your user pool app client.</p><p><code>AllowedOAuthFlowsUserPoolClient</code> must be <code>true</code> before you can configure the following features in your app client.</p><ul><li><p><code>CallBackURLs</code>: Callback URLs.</p></li><li><p><code>LogoutURLs</code>: Sign-out redirect URLs.</p></li><li><p><code>AllowedOAuthScopes</code>: OAuth 2.0 scopes.</p></li><li><p><code>AllowedOAuthFlows</code>: Support for authorization code, implicit, and client credentials OAuth 2.0 grants.</p></li></ul><p>To use OAuth 2.0 features, configure one of these features in the Amazon Cognito console or set <code>AllowedOAuthFlowsUserPoolClient</code> to <code>true</code> in a <code>CreateUserPoolClient</code> or <code>UpdateUserPoolClient</code> API request. If you don't set a value for <code>AllowedOAuthFlowsUserPoolClient</code> in a request with the CLI or SDKs, it defaults to <code>false</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowedOAuthFlowsUserPoolClient;

/**
 <p>The OAuth scopes that your app client supports. Possible values that OAuth provides are <code>phone</code>, <code>email</code>, <code>openid</code>, and <code>profile</code>. Possible values that Amazon Web Services provides are <code>aws.cognito.signin.user.admin</code>. Amazon Cognito also supports custom scopes that you create in Resource Servers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable allowedOAuthScopes;

/**
 <p>The Amazon Pinpoint analytics configuration for the user pool client.</p><note><p>Amazon Cognito user pools only support sending events to Amazon Pinpoint projects in the US East (N. Virginia) us-east-1 Region, regardless of the Region where the user pool resides.</p></note>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAnalyticsConfigurationType * _Nullable analyticsConfiguration;

/**
 <p>Amazon Cognito creates a session token for each API request in an authentication flow. <code>AuthSessionValidity</code> is the duration, in minutes, of that session token. Your user pool native user must respond to each authentication challenge before the session expires.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable authSessionValidity;

/**
 <p>A list of allowed redirect (callback) URLs for the IdPs.</p><p>A redirect URI must:</p><ul><li><p>Be an absolute URI.</p></li><li><p>Be registered with the authorization server.</p></li><li><p>Not include a fragment component.</p></li></ul><p>See <a href="https://tools.ietf.org/html/rfc6749#section-3.1.2">OAuth 2.0 - Redirection Endpoint</a>.</p><p>Amazon Cognito requires HTTPS over HTTP except for http://localhost for testing purposes only.</p><p>App callback URLs such as myapp://example are also supported.</p>
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
 <p>The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The default redirect URI. Must be in the <code>CallbackURLs</code> list.</p><p>A redirect URI must:</p><ul><li><p>Be an absolute URI.</p></li><li><p>Be registered with the authorization server.</p></li><li><p>Not include a fragment component.</p></li></ul><p>See <a href="https://tools.ietf.org/html/rfc6749#section-3.1.2">OAuth 2.0 - Redirection Endpoint</a>.</p><p>Amazon Cognito requires HTTPS over HTTP except for http://localhost for testing purposes only.</p><p>App callback URLs such as myapp://example are also supported.</p>
 */
@property (nonatomic, strong) NSString * _Nullable defaultRedirectURI;

/**
 <p>When <code>EnablePropagateAdditionalUserContextData</code> is true, Amazon Cognito accepts an <code>IpAddress</code> value that you send in the <code>UserContextData</code> parameter. The <code>UserContextData</code> parameter sends information to Amazon Cognito advanced security for risk analysis. You can send <code>UserContextData</code> when you sign in Amazon Cognito native users with the <code>InitiateAuth</code> and <code>RespondToAuthChallenge</code> API operations.</p><p>When <code>EnablePropagateAdditionalUserContextData</code> is false, you can't send your user's source IP address to Amazon Cognito advanced security with unauthenticated API operations. <code>EnablePropagateAdditionalUserContextData</code> doesn't affect whether you can send a source IP address in a <code>ContextData</code> parameter with the authenticated API operations <code>AdminInitiateAuth</code> and <code>AdminRespondToAuthChallenge</code>.</p><p>You can only activate <code>EnablePropagateAdditionalUserContextData</code> in an app client that has a client secret. For more information about propagation of user context data, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-adaptive-authentication.html#user-pool-settings-adaptive-authentication-device-fingerprint">Adding user device and session data to API requests</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enablePropagateAdditionalUserContextData;

/**
 <p>Indicates whether token revocation is activated for the user pool client. When you create a new user pool client, token revocation is activated by default. For more information about revoking tokens, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_RevokeToken.html">RevokeToken</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable enableTokenRevocation;

/**
 <p>The authentication flows that you want your user pool client to support. For each app client in your user pool, you can sign in your users with any combination of one or more flows, including with a user name and Secure Remote Password (SRP), a user name and password, or a custom authentication process that you define with Lambda functions.</p><note><p>If you don't specify a value for <code>ExplicitAuthFlows</code>, your user client supports <code>ALLOW_REFRESH_TOKEN_AUTH</code>, <code>ALLOW_USER_SRP_AUTH</code>, and <code>ALLOW_CUSTOM_AUTH</code>.</p></note><p>Valid values include:</p><ul><li><p><code>ALLOW_ADMIN_USER_PASSWORD_AUTH</code>: Enable admin based user password authentication flow <code>ADMIN_USER_PASSWORD_AUTH</code>. This setting replaces the <code>ADMIN_NO_SRP_AUTH</code> setting. With this authentication flow, your app passes a user name and password to Amazon Cognito in the request, instead of using the Secure Remote Password (SRP) protocol to securely transmit the password.</p></li><li><p><code>ALLOW_CUSTOM_AUTH</code>: Enable Lambda trigger based authentication.</p></li><li><p><code>ALLOW_USER_PASSWORD_AUTH</code>: Enable user password-based authentication. In this flow, Amazon Cognito receives the password in the request instead of using the SRP protocol to verify passwords.</p></li><li><p><code>ALLOW_USER_SRP_AUTH</code>: Enable SRP-based authentication.</p></li><li><p><code>ALLOW_REFRESH_TOKEN_AUTH</code>: Enable authflow to refresh tokens.</p></li></ul><p>In some environments, you will see the values <code>ADMIN_NO_SRP_AUTH</code>, <code>CUSTOM_AUTH_FLOW_ONLY</code>, or <code>USER_PASSWORD_AUTH</code>. You can't assign these legacy <code>ExplicitAuthFlows</code> values to user pool clients at the same time as values that begin with <code>ALLOW_</code>, like <code>ALLOW_USER_SRP_AUTH</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable explicitAuthFlows;

/**
 <p>The ID token time limit. After this limit expires, your user can't use their ID token. To specify the time unit for <code>IdTokenValidity</code> as <code>seconds</code>, <code>minutes</code>, <code>hours</code>, or <code>days</code>, set a <code>TokenValidityUnits</code> value in your API request.</p><p>For example, when you set <code>IdTokenValidity</code> as <code>10</code> and <code>TokenValidityUnits</code> as <code>hours</code>, your user can authenticate their session with their ID token for 10 hours.</p><p>The default time unit for <code>IdTokenValidity</code> in an API request is hours. <i>Valid range</i> is displayed below in seconds.</p><p>If you don't specify otherwise in the configuration of your app client, your ID tokens are valid for one hour.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable idTokenValidity;

/**
 <p>The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>A list of allowed logout URLs for the IdPs.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable logoutURLs;

/**
 <p>Errors and responses that you want Amazon Cognito APIs to return during authentication, account confirmation, and password recovery when the user doesn't exist in the user pool. When set to <code>ENABLED</code> and the user doesn't exist, authentication returns an error indicating either the username or password was incorrect. Account confirmation and password recovery return a response indicating a code was sent to a simulated destination. When set to <code>LEGACY</code>, those APIs return a <code>UserNotFoundException</code> exception if the user doesn't exist in the user pool.</p><p>Valid values include:</p><ul><li><p><code>ENABLED</code> - This prevents user existence-related errors.</p></li><li><p><code>LEGACY</code> - This represents the old behavior of Amazon Cognito where user existence related errors aren't prevented.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderPreventUserExistenceErrorTypes preventUserExistenceErrors;

/**
 <p>The list of user attributes that you want your app client to have read-only access to. After your user authenticates in your app, their access token authorizes them to read their own attribute value for any attribute in this list. An example of this kind of activity is when your user selects a link to view their profile information. Your app makes a <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_GetUser.html">GetUser</a> API request to retrieve and display your user's profile data.</p><p>When you don't specify the <code>ReadAttributes</code> for your app client, your app can read the values of <code>email_verified</code>, <code>phone_number_verified</code>, and the Standard attributes of your user pool. When your user pool has read access to these default attributes, <code>ReadAttributes</code> doesn't return any information. Amazon Cognito only populates <code>ReadAttributes</code> in the API response if you have specified your own custom set of read attributes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable readAttributes;

/**
 <p>The refresh token time limit. After this limit expires, your user can't use their refresh token. To specify the time unit for <code>RefreshTokenValidity</code> as <code>seconds</code>, <code>minutes</code>, <code>hours</code>, or <code>days</code>, set a <code>TokenValidityUnits</code> value in your API request.</p><p>For example, when you set <code>RefreshTokenValidity</code> as <code>10</code> and <code>TokenValidityUnits</code> as <code>days</code>, your user can refresh their session and retrieve new access and ID tokens for 10 days.</p><p>The default time unit for <code>RefreshTokenValidity</code> in an API request is days. You can't set <code>RefreshTokenValidity</code> to 0. If you do, Amazon Cognito overrides the value with the default value of 30 days. <i>Valid range</i> is displayed below in seconds.</p><p>If you don't specify otherwise in the configuration of your app client, your refresh tokens are valid for 30 days.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable refreshTokenValidity;

/**
 <p>A list of provider names for the IdPs that this client supports. The following are supported: <code>COGNITO</code>, <code>Facebook</code>, <code>Google</code>, <code>SignInWithApple</code>, <code>LoginWithAmazon</code>, and the names of your own SAML and OIDC providers.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable supportedIdentityProviders;

/**
 <p>The time units used to specify the token validity times of each token type: ID, access, and refresh.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderTokenValidityUnitsType * _Nullable tokenValidityUnits;

/**
 <p>The user pool ID for the user pool client.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 <p>The list of user attributes that you want your app client to have write access to. After your user authenticates in your app, their access token authorizes them to set or modify their own attribute value for any attribute in this list. An example of this kind of activity is when you present your user with a form to update their profile information and they change their last name. Your app then makes an <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UpdateUserAttributes.html">UpdateUserAttributes</a> API request and sets <code>family_name</code> to the new value. </p><p>When you don't specify the <code>WriteAttributes</code> for your app client, your app can write the values of the Standard attributes of your user pool. When your user pool has write access to these default attributes, <code>WriteAttributes</code> doesn't return any information. Amazon Cognito only populates <code>WriteAttributes</code> in the API response if you have specified your own custom set of write attributes.</p><p>If your app client allows users to sign in through an IdP, this array must include all attributes that you have mapped to IdP attributes. Amazon Cognito updates mapped attributes when users sign in to your application through an IdP. If your app client does not have write access to a mapped attribute, Amazon Cognito throws an error when it tries to update the attribute. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-specifying-attribute-mapping.html">Specifying IdP Attribute Mappings for Your user pool</a>.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable writeAttributes;

@end

/**
 <p>A user pool description.</p>
 */
@interface AWSCognitoIdentityProviderUserPoolDescriptionType : AWSModel


/**
 <p>The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The ID in a user pool description.</p>
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 <p>The Lambda configuration information in a user pool description.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLambdaConfigType * _Nullable lambdaConfig;

/**
 <p>The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
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
 <p>The available verified method a user can use to recover their password when they call <code>ForgotPassword</code>. You can use this setting to define a preferred method when a user has more than one method available. With this setting, SMS doesn't qualify for a valid password recovery mechanism if the user also has SMS multi-factor authentication (MFA) activated. In the absence of this setting, Amazon Cognito uses the legacy behavior to determine the recovery method where SMS is preferred through email.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAccountRecoverySettingType * _Nullable accountRecoverySetting;

/**
 <p>The configuration for <code>AdminCreateUser</code> requests.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAdminCreateUserConfigType * _Nullable adminCreateUserConfig;

/**
 <p>The attributes that are aliased in a user pool.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable aliasAttributes;

/**
 <p>The Amazon Resource Name (ARN) for the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable arn;

/**
 <p>The attributes that are auto-verified in a user pool.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoVerifiedAttributes;

/**
 <p>The date and time when the item was created. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>A custom domain name that you provide to Amazon Cognito. This parameter applies only if you use a custom domain to host the sign-up and sign-in pages for your application. An example of a custom domain name might be <code>auth.example.com</code>.</p><p>For more information about adding a custom domain to your user pool, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html">Using Your Own Domain for the Hosted UI</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable customDomain;

/**
 <p>When active, <code>DeletionProtection</code> prevents accidental deletion of your user pool. Before you can delete a user pool that you have protected against deletion, you must deactivate this feature.</p><p>When you try to delete a protected user pool in a <code>DeleteUserPool</code> API request, Amazon Cognito returns an <code>InvalidParameterException</code> error. To delete a protected user pool, send a new <code>DeleteUserPool</code> request after you deactivate deletion protection in an <code>UpdateUserPool</code> API request.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderDeletionProtectionType deletionProtection;

/**
 <p>The device-remembering configuration for a user pool. A null value indicates that you have deactivated device remembering in your user pool.</p><note><p>When you provide a value for any <code>DeviceConfiguration</code> field, you activate the Amazon Cognito device-remembering feature.</p></note>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderDeviceConfigurationType * _Nullable deviceConfiguration;

/**
 <p>The domain prefix, if the user pool has a domain associated with it.</p>
 */
@property (nonatomic, strong) NSString * _Nullable domain;

/**
 <p>The email configuration of your user pool. The email configuration type sets your preferred sending method, Amazon Web Services Region, and sender for messages from your user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderEmailConfigurationType * _Nullable emailConfiguration;

/**
 <p>Deprecated. Review error codes from API requests with <code>EventSource:cognito-idp.amazonaws.com</code> in CloudTrail for information about problems with user pool email configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailConfigurationFailure;

/**
 <p>This parameter is no longer used. See <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_VerificationMessageTemplateType.html">VerificationMessageTemplateType</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationMessage;

/**
 <p>This parameter is no longer used. See <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_VerificationMessageTemplateType.html">VerificationMessageTemplateType</a>.</p>
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
 <p>The Lambda triggers associated with the user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLambdaConfigType * _Nullable lambdaConfig;

/**
 <p>The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>Can be one of the following values:</p><ul><li><p><code>OFF</code> - MFA tokens aren't required and can't be specified during user registration.</p></li><li><p><code>ON</code> - MFA tokens are required for all user registrations. You can only specify required when you're initially creating a user pool.</p></li><li><p><code>OPTIONAL</code> - Users have the option when registering to create an MFA token.</p></li></ul>
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
 <p>A list of the user attributes and their properties in your user pool. The attribute schema contains standard attributes, custom attributes with a <code>custom:</code> prefix, and developer attributes with a <code>dev:</code> prefix. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-attributes.html">User pool attributes</a>.</p><p>Developer-only attributes are a legacy feature of user pools, are read-only to all app clients. You can create and update developer-only attributes only with IAM-authenticated API operations. Use app client read/write permissions instead.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderSchemaAttributeType *> * _Nullable schemaAttributes;

/**
 <p>The contents of the SMS authentication message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsAuthenticationMessage;

/**
 <p>The SMS configuration with the settings that your Amazon Cognito user pool must use to send an SMS message from your Amazon Web Services account through Amazon Simple Notification Service. To send SMS messages with Amazon SNS in the Amazon Web Services Region that you want, the Amazon Cognito user pool uses an Identity and Access Management (IAM) role in your Amazon Web Services account.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderSmsConfigurationType * _Nullable smsConfiguration;

/**
 <p>The reason why the SMS configuration can't send the messages to your users.</p><p>This message might include comma-separated values to describe why your SMS configuration can't send messages to user pool end users.</p><dl><dt>InvalidSmsRoleAccessPolicyException</dt><dd><p>The Identity and Access Management role that Amazon Cognito uses to send SMS messages isn't properly configured. For more information, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_SmsConfigurationType.html">SmsConfigurationType</a>.</p></dd><dt>SNSSandbox</dt><dd><p>The Amazon Web Services account is in the SNS SMS Sandbox and messages will only reach verified end users. This parameter won’t get populated with SNSSandbox if the user creating the user pool doesn’t have SNS permissions. To learn how to move your Amazon Web Services account out of the sandbox, see <a href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox-moving-to-production.html">Moving out of the SMS sandbox</a>.</p></dd></dl>
 */
@property (nonatomic, strong) NSString * _Nullable smsConfigurationFailure;

/**
 <p>This parameter is no longer used. See <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_VerificationMessageTemplateType.html">VerificationMessageTemplateType</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsVerificationMessage;

/**
 <p>This parameter is no longer used.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderStatusType status;

/**
 <p>The settings for updates to user attributes. These settings include the property <code>AttributesRequireVerificationBeforeUpdate</code>, a user-pool setting that tells Amazon Cognito how to handle changes to the value of your users' email address and phone number attributes. For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-email-phone-verification.html#user-pool-settings-verifications-verify-attribute-updates"> Verifying updates to email addresses and phone numbers</a>.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserAttributeUpdateSettingsType * _Nullable userAttributeUpdateSettings;

/**
 <p>User pool add-ons. Contains settings for activation of advanced security features. To log user security information but take no action, set to <code>AUDIT</code>. To configure automatic security responses to risky traffic to your user pool, set to <code>ENFORCED</code>.</p><p>For more information, see <a href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-advanced-security.html">Adding advanced security to a user pool</a>.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolAddOnsType * _Nullable userPoolAddOns;

/**
 <p>The tags that are assigned to the user pool. A tag is a label that you can apply to user pools to categorize and manage them in different ways, such as by purpose, owner, environment, or other criteria.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable userPoolTags;

/**
 <p>Specifies whether a user can use an email address or phone number as a username when they sign up.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable usernameAttributes;

/**
 <p>Case sensitivity of the username input for the selected sign-in option. For example, when case sensitivity is set to <code>False</code>, users can sign in using either "username" or "Username". This configuration is immutable once it has been set. For more information, see <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UsernameConfigurationType.html">UsernameConfigurationType</a>.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUsernameConfigurationType * _Nullable usernameConfiguration;

/**
 <p>The template for verification messages.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderVerificationMessageTemplateType * _Nullable verificationMessageTemplate;

@end

/**
 <p>A user profile in a Amazon Cognito user pool.</p>
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
 <p>The date and time when the item was modified. Amazon Cognito returns this timestamp in UNIX epoch time format. Your SDK might render the output in a human-readable format like ISO 8601 or a Java <code>Date</code> object.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable userLastModifiedDate;

/**
 <p>The user status. This can be one of the following:</p><ul><li><p>UNCONFIRMED - User has been created but not confirmed.</p></li><li><p>CONFIRMED - User has been confirmed.</p></li><li><p>EXTERNAL_PROVIDER - User signed in with a third-party IdP.</p></li><li><p>UNKNOWN - User status isn't known.</p></li><li><p>RESET_REQUIRED - User is confirmed, but the user must request a code and reset their password before they can sign in.</p></li><li><p>FORCE_CHANGE_PASSWORD - The user is confirmed and the user can sign in using a temporary password, but on first sign-in, the user must change their password to a new value before doing anything else. </p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserStatusType userStatus;

/**
 <p>The user name of the user you want to describe.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>The username configuration type. </p>
 Required parameters: [CaseSensitive]
 */
@interface AWSCognitoIdentityProviderUsernameConfigurationType : AWSModel


/**
 <p>Specifies whether user name case sensitivity will be applied for all users in the user pool through Amazon Cognito APIs. For most use cases, set case sensitivity to <code>False</code> (case insensitive) as a best practice. When usernames and email addresses are case insensitive, users can sign in as the same user when they enter a different capitalization of their user name.</p><p>Valid values include:</p><dl><dt>True</dt><dd><p>Enables case sensitivity for all username input. When this option is set to <code>True</code>, users must sign in using the exact capitalization of their given username, such as “UserName”. This is the default value.</p></dd><dt>False</dt><dd><p>Enables case insensitivity for all username input. For example, when this option is set to <code>False</code>, users can sign in using <code>username</code>, <code>USERNAME</code>, or <code>UserName</code>. This option also enables both <code>preferred_username</code> and <code>email</code> alias to be case insensitive, in addition to the <code>username</code> attribute.</p></dd></dl>
 */
@property (nonatomic, strong) NSNumber * _Nullable caseSensitive;

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
 <p>The template for email messages that Amazon Cognito sends to your users. You can set an <code>EmailMessage</code> template only if the value of <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount"> EmailSendingAccount</a> is <code>DEVELOPER</code>. When your <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount">EmailSendingAccount</a> is <code>DEVELOPER</code>, your user pool sends email messages with your own Amazon SES configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailMessage;

/**
 <p>The email message template for sending a confirmation link to the user. You can set an <code>EmailMessageByLink</code> template only if the value of <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount"> EmailSendingAccount</a> is <code>DEVELOPER</code>. When your <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount">EmailSendingAccount</a> is <code>DEVELOPER</code>, your user pool sends email messages with your own Amazon SES configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailMessageByLink;

/**
 <p>The subject line for the email message template. You can set an <code>EmailSubject</code> template only if the value of <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount"> EmailSendingAccount</a> is <code>DEVELOPER</code>. When your <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount">EmailSendingAccount</a> is <code>DEVELOPER</code>, your user pool sends email messages with your own Amazon SES configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailSubject;

/**
 <p>The subject line for the email message template for sending a confirmation link to the user. You can set an <code>EmailSubjectByLink</code> template only if the value of <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount"> EmailSendingAccount</a> is <code>DEVELOPER</code>. When your <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount">EmailSendingAccount</a> is <code>DEVELOPER</code>, your user pool sends email messages with your own Amazon SES configuration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable emailSubjectByLink;

/**
 <p>The template for SMS messages that Amazon Cognito sends to your users.</p>
 */
@property (nonatomic, strong) NSString * _Nullable smsMessage;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderVerifySoftwareTokenRequest : AWSRequest


/**
 <p>A valid access token that Amazon Cognito issued to the user whose software token you want to verify.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The friendly device name.</p>
 */
@property (nonatomic, strong) NSString * _Nullable friendlyDeviceName;

/**
 <p>The session that should be passed both ways in challenge-response calls to the service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

/**
 <p>The one- time password computed using the secret code returned by <a href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AssociateSoftwareToken.html">AssociateSoftwareToken</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userCode;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderVerifySoftwareTokenResponse : AWSModel


/**
 <p>The session that should be passed both ways in challenge-response calls to the service.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

/**
 <p>The status of the verify software token.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderVerifySoftwareTokenResponseType status;

@end

/**
 <p>Represents the request to verify user attributes.</p>
 Required parameters: [AccessToken, AttributeName, Code]
 */
@interface AWSCognitoIdentityProviderVerifyUserAttributeRequest : AWSRequest


/**
 <p>A valid access token that Amazon Cognito issued to the user whose user attributes you want to verify.</p>
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
