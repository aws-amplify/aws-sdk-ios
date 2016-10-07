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
    AWSCognitoIdentityProviderErrorExpiredCode,
    AWSCognitoIdentityProviderErrorInternalError,
    AWSCognitoIdentityProviderErrorInvalidEmailRoleAccessPolicy,
    AWSCognitoIdentityProviderErrorInvalidLambdaResponse,
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
    AWSCognitoIdentityProviderErrorTooManyFailedAttempts,
    AWSCognitoIdentityProviderErrorTooManyRequests,
    AWSCognitoIdentityProviderErrorUnexpectedLambda,
    AWSCognitoIdentityProviderErrorUnsupportedUserState,
    AWSCognitoIdentityProviderErrorUserImportInProgress,
    AWSCognitoIdentityProviderErrorUserLambdaValidation,
    AWSCognitoIdentityProviderErrorUserNotConfirmed,
    AWSCognitoIdentityProviderErrorUserNotFound,
    AWSCognitoIdentityProviderErrorUsernameExists,
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

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderChallengeNameType) {
    AWSCognitoIdentityProviderChallengeNameTypeUnknown,
    AWSCognitoIdentityProviderChallengeNameTypeSmsMfa,
    AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier,
    AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge,
    AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth,
    AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier,
    AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth,
    AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired,
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

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderExplicitAuthFlowsType) {
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeUnknown,
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeAdminNoSrpAuth,
    AWSCognitoIdentityProviderExplicitAuthFlowsTypeCustomAuthFlowOnly,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderMessageActionType) {
    AWSCognitoIdentityProviderMessageActionTypeUnknown,
    AWSCognitoIdentityProviderMessageActionTypeResend,
    AWSCognitoIdentityProviderMessageActionTypeSuppress,
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

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderVerifiedAttributeType) {
    AWSCognitoIdentityProviderVerifiedAttributeTypeUnknown,
    AWSCognitoIdentityProviderVerifiedAttributeTypePhoneNumber,
    AWSCognitoIdentityProviderVerifiedAttributeTypeEmail,
};

@class AWSCognitoIdentityProviderAddCustomAttributesRequest;
@class AWSCognitoIdentityProviderAddCustomAttributesResponse;
@class AWSCognitoIdentityProviderAdminConfirmSignUpRequest;
@class AWSCognitoIdentityProviderAdminConfirmSignUpResponse;
@class AWSCognitoIdentityProviderAdminCreateUserConfigType;
@class AWSCognitoIdentityProviderAdminCreateUserRequest;
@class AWSCognitoIdentityProviderAdminCreateUserResponse;
@class AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest;
@class AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse;
@class AWSCognitoIdentityProviderAdminDeleteUserRequest;
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
@class AWSCognitoIdentityProviderAdminListDevicesRequest;
@class AWSCognitoIdentityProviderAdminListDevicesResponse;
@class AWSCognitoIdentityProviderAdminResetUserPasswordRequest;
@class AWSCognitoIdentityProviderAdminResetUserPasswordResponse;
@class AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest;
@class AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse;
@class AWSCognitoIdentityProviderAdminSetUserSettingsRequest;
@class AWSCognitoIdentityProviderAdminSetUserSettingsResponse;
@class AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest;
@class AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse;
@class AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest;
@class AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse;
@class AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest;
@class AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse;
@class AWSCognitoIdentityProviderAttributeType;
@class AWSCognitoIdentityProviderAuthenticationResultType;
@class AWSCognitoIdentityProviderChangePasswordRequest;
@class AWSCognitoIdentityProviderChangePasswordResponse;
@class AWSCognitoIdentityProviderCodeDeliveryDetailsType;
@class AWSCognitoIdentityProviderConfirmDeviceRequest;
@class AWSCognitoIdentityProviderConfirmDeviceResponse;
@class AWSCognitoIdentityProviderConfirmForgotPasswordRequest;
@class AWSCognitoIdentityProviderConfirmForgotPasswordResponse;
@class AWSCognitoIdentityProviderConfirmSignUpRequest;
@class AWSCognitoIdentityProviderConfirmSignUpResponse;
@class AWSCognitoIdentityProviderCreateUserImportJobRequest;
@class AWSCognitoIdentityProviderCreateUserImportJobResponse;
@class AWSCognitoIdentityProviderCreateUserPoolClientRequest;
@class AWSCognitoIdentityProviderCreateUserPoolClientResponse;
@class AWSCognitoIdentityProviderCreateUserPoolRequest;
@class AWSCognitoIdentityProviderCreateUserPoolResponse;
@class AWSCognitoIdentityProviderDeleteUserAttributesRequest;
@class AWSCognitoIdentityProviderDeleteUserAttributesResponse;
@class AWSCognitoIdentityProviderDeleteUserPoolClientRequest;
@class AWSCognitoIdentityProviderDeleteUserPoolRequest;
@class AWSCognitoIdentityProviderDeleteUserRequest;
@class AWSCognitoIdentityProviderDescribeUserImportJobRequest;
@class AWSCognitoIdentityProviderDescribeUserImportJobResponse;
@class AWSCognitoIdentityProviderDescribeUserPoolClientRequest;
@class AWSCognitoIdentityProviderDescribeUserPoolClientResponse;
@class AWSCognitoIdentityProviderDescribeUserPoolRequest;
@class AWSCognitoIdentityProviderDescribeUserPoolResponse;
@class AWSCognitoIdentityProviderDeviceConfigurationType;
@class AWSCognitoIdentityProviderDeviceSecretVerifierConfigType;
@class AWSCognitoIdentityProviderDeviceType;
@class AWSCognitoIdentityProviderEmailConfigurationType;
@class AWSCognitoIdentityProviderForgetDeviceRequest;
@class AWSCognitoIdentityProviderForgotPasswordRequest;
@class AWSCognitoIdentityProviderForgotPasswordResponse;
@class AWSCognitoIdentityProviderGetCSVHeaderRequest;
@class AWSCognitoIdentityProviderGetCSVHeaderResponse;
@class AWSCognitoIdentityProviderGetDeviceRequest;
@class AWSCognitoIdentityProviderGetDeviceResponse;
@class AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest;
@class AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse;
@class AWSCognitoIdentityProviderGetUserRequest;
@class AWSCognitoIdentityProviderGetUserResponse;
@class AWSCognitoIdentityProviderGlobalSignOutRequest;
@class AWSCognitoIdentityProviderGlobalSignOutResponse;
@class AWSCognitoIdentityProviderInitiateAuthRequest;
@class AWSCognitoIdentityProviderInitiateAuthResponse;
@class AWSCognitoIdentityProviderLambdaConfigType;
@class AWSCognitoIdentityProviderListDevicesRequest;
@class AWSCognitoIdentityProviderListDevicesResponse;
@class AWSCognitoIdentityProviderListUserImportJobsRequest;
@class AWSCognitoIdentityProviderListUserImportJobsResponse;
@class AWSCognitoIdentityProviderListUserPoolClientsRequest;
@class AWSCognitoIdentityProviderListUserPoolClientsResponse;
@class AWSCognitoIdentityProviderListUserPoolsRequest;
@class AWSCognitoIdentityProviderListUserPoolsResponse;
@class AWSCognitoIdentityProviderListUsersRequest;
@class AWSCognitoIdentityProviderListUsersResponse;
@class AWSCognitoIdentityProviderMFAOptionType;
@class AWSCognitoIdentityProviderMessageTemplateType;
@class AWSCognitoIdentityProviderLatestDeviceMetadataType;
@class AWSCognitoIdentityProviderNumberAttributeConstraintsType;
@class AWSCognitoIdentityProviderPasswordPolicyType;
@class AWSCognitoIdentityProviderResendConfirmationCodeRequest;
@class AWSCognitoIdentityProviderResendConfirmationCodeResponse;
@class AWSCognitoIdentityProviderRespondToAuthChallengeRequest;
@class AWSCognitoIdentityProviderRespondToAuthChallengeResponse;
@class AWSCognitoIdentityProviderSchemaAttributeType;
@class AWSCognitoIdentityProviderSetUserSettingsRequest;
@class AWSCognitoIdentityProviderSetUserSettingsResponse;
@class AWSCognitoIdentityProviderSignUpRequest;
@class AWSCognitoIdentityProviderSignUpResponse;
@class AWSCognitoIdentityProviderSmsConfigurationType;
@class AWSCognitoIdentityProviderStartUserImportJobRequest;
@class AWSCognitoIdentityProviderStartUserImportJobResponse;
@class AWSCognitoIdentityProviderStopUserImportJobRequest;
@class AWSCognitoIdentityProviderStopUserImportJobResponse;
@class AWSCognitoIdentityProviderStringAttributeConstraintsType;
@class AWSCognitoIdentityProviderUpdateDeviceStatusRequest;
@class AWSCognitoIdentityProviderUpdateDeviceStatusResponse;
@class AWSCognitoIdentityProviderUpdateUserAttributesRequest;
@class AWSCognitoIdentityProviderUpdateUserAttributesResponse;
@class AWSCognitoIdentityProviderUpdateUserPoolClientRequest;
@class AWSCognitoIdentityProviderUpdateUserPoolClientResponse;
@class AWSCognitoIdentityProviderUpdateUserPoolRequest;
@class AWSCognitoIdentityProviderUpdateUserPoolResponse;
@class AWSCognitoIdentityProviderUserImportJobType;
@class AWSCognitoIdentityProviderUserPoolClientDescription;
@class AWSCognitoIdentityProviderUserPoolClientType;
@class AWSCognitoIdentityProviderUserPoolDescriptionType;
@class AWSCognitoIdentityProviderUserPoolPolicyType;
@class AWSCognitoIdentityProviderUserPoolType;
@class AWSCognitoIdentityProviderUserType;
@class AWSCognitoIdentityProviderVerifyUserAttributeRequest;
@class AWSCognitoIdentityProviderVerifyUserAttributeResponse;

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
 <p>The type of configuration for creating a new user profile.</p>
 */
@interface AWSCognitoIdentityProviderAdminCreateUserConfigType : AWSModel


/**
 <p>Set to True if only the administrator is allowed to create user profiles. Set to False if users can sign themselves up via an app.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable allowAdminCreateUserOnly;

/**
 <p>The message template to be used for the welcome message to new users.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderMessageTemplateType * _Nullable inviteMessageTemplate;

/**
 <p>The user account expiration limit, in days, after which the account is no longer usable. To reset the account after that time limit, you must call AdminCreateUser again, specifying "RESEND" for the MessageAction parameter.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable unusedAccountValidityDays;

@end

/**
 <p>Represents the request to create a user in the specified user pool.</p>
 Required parameters: [UserPoolId, Username]
 */
@interface AWSCognitoIdentityProviderAdminCreateUserRequest : AWSRequest


/**
 <p>Specify "EMAIL" if email will be used to send the welcome message. Specify "SMS" if the phone number will be used. The default value is "SMS". More than one value can be specified.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable desiredDeliveryMediums;

/**
 <p>This parameter is only used if the phone_number_verified or email_verified attribute is set to True. Otherwise, it is ignored.</p><p>If this parameter is set to True and the phone number or email address specified in the UserAttributes parameter already exists as an alias with a different user, the API call will migrate the alias from the previous user to the newly created user. The previous user will no longer be able to log in using that alias.</p><p>If this parameter is set to False, the API throws an AliasExistsException error if the alias already exists. The default value is False.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceAliasCreation;

/**
 <p>Set to "RESEND" to resend the invitation message to a user that already exists and reset the expiration limit on the user's account. Set to "SUPPRESS" to suppress sending the message. Only one value can be specified.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderMessageActionType messageAction;

/**
 <p>The user's temporary password. This password must conform to the password policy that you specified when you created the user pool.</p><p>The temporary password is valid only once. To complete the Admin Create User flow, the user must enter the temporary password in the sign-in page along with a new password to be used in all future sign-ins.</p><p>This parameter is not required. If you do not specify a value, Amazon Cognito generates one for you.</p><p>The temporary password can only be used until the user account expiration limit that you specified when you created the user pool. To reset the account after that time limit, you must call AdminCreateUser again, specifying "RESEND" for the MessageAction parameter.</p>
 */
@property (nonatomic, strong) NSString * _Nullable temporaryPassword;

/**
 <p>An array of name-value pairs that contain user attributes and attribute values to be set for the user to be created. You can create a user without specifying any attributes other than Username. However, any attributes that you specify as required (in CreateUserPool or in the <b>Attributes</b> tab of the console) must be supplied either by you (in your call to AdminCreateUser) or by the user (when he or she signs up in response to your welcome message).</p><p>To send a message inviting the user to sign up, you must specify the user's email address or phone number. This can be done in your call to AdminCreateUser or in the <b>Users</b> tab of the Amazon Cognito console for managing your user pools.</p><p>In your call to AdminCreateUser, you can set the email_verified attribute to True, and you can set the phone_number_verified attribute to True. (You cannot do this by calling other operations such as AdminUpdateUserAttributes.)</p><ul><li><p><b>email</b>: The email address of the user to whom the message that contains the code and username will be sent. Required if the email_verified attribute is set to True, or if "EMAIL" is specified in the DesiredDeliveryMediums parameter.</p></li><li><p><b>phone_number</b>: The phone number of the user to whom the message that contains the code and username will be sent. Required if the phone_number_verified attribute is set to True, or if "SMS" is specified in the DesiredDeliveryMediums parameter.</p></li></ul>
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
 <p>The user returned in the request to create a new user.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserType * _Nullable user;

@end

/**
 <p>Represents the request to delete user attributes as an administrator.</p>
 Required parameters: [UserPoolId, Username, UserAttributeNames]
 */
@interface AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest : AWSRequest


/**
 <p>An array of strings representing the user attribute names you wish to delete.</p>
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
 <p>The user name of the user you wish to ebable.</p>
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
 <p>The authentication flow.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderAuthFlowType authFlow;

/**
 <p>The authentication parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable authParameters;

/**
 <p>The client app ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The client app metadata.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

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
 <p>The result type of the authentication result.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAuthenticationResultType * _Nullable authenticationResult;

/**
 <p>The name of the challenge.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeParameters;

/**
 <p>The session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

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
 <p>The name of the challenge.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge response.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeResponses;

/**
 <p>The client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The session.</p>
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
 <p>The result type of the authentication result.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAuthenticationResultType * _Nullable authenticationResult;

/**
 <p>The name of the challenge.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeParameters;

/**
 <p>The session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

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
 <p>The user pool ID&gt;</p>
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
 <p>An array of name-value pairs representing user attributes.</p>
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
 <p>The result type of the authentication result.</p>
 */
@interface AWSCognitoIdentityProviderAuthenticationResultType : AWSModel


/**
 <p>The access token of the authentication result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The expiration period of the authentication result.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable expiresIn;

/**
 <p>The ID token of the authentication result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable idToken;

/**
 <p>The new device metadata from an authentication result.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLatestDeviceMetadataType * _Nullable latestDeviceMetadata;

/**
 <p>The refresh token of the authentication result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable refreshToken;

/**
 <p>The token type of the authentication result.</p>
 */
@property (nonatomic, strong) NSString * _Nullable tokenType;

@end

/**
 <p>Represents the request to change a user password.</p>
 Required parameters: [PreviousPassword, ProposedPassword]
 */
@interface AWSCognitoIdentityProviderChangePasswordRequest : AWSRequest


/**
 <p>The access token in the change password request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>The old password in the change password request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable previousPassword;

/**
 <p>The new password in the change password request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable proposedPassword;

@end

/**
 <p>The response from the server to the change password request.</p>
 */
@interface AWSCognitoIdentityProviderChangePasswordResponse : AWSModel


@end

/**
 <p>The type of code delivery details being returned from the server.</p>
 */
@interface AWSCognitoIdentityProviderCodeDeliveryDetailsType : AWSModel


/**
 <p>The name of the attribute in the code delivery details type.</p>
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
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The confirmation code sent by a user's request to retrieve a forgotten password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable confirmationCode;

/**
 <p>The password sent by sent by a user's request to retrieve a forgotten password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 <p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

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
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The confirmation code sent by a user's request to confirm registration.</p>
 */
@property (nonatomic, strong) NSString * _Nullable confirmationCode;

/**
 <p>Boolean to be specified to force user confirmation irrespective of existing alias. By default set to False. If this parameter is set to True and the phone number/email used for sign up confirmation already exists as an alias with a different user, the API call will migrate the alias from the previous user to the newly created user being confirmed. If set to False, the API will throw an <b>AliasExistsException</b> error.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable forceAliasCreation;

/**
 <p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

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
 <p>The client name for the user pool client you would like to create.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientName;

/**
 <p>The explicit authentication flows.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable explicitAuthFlows;

/**
 <p>Boolean to specify whether you want to generate a secret for the user pool client being created.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable generateSecret;

/**
 <p>The read attributes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable readAttributes;

/**
 <p>Refreshes the token validity.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable refreshTokenValidity;

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
 <p>Represents the request to create a user pool.</p>
 Required parameters: [PoolName]
 */
@interface AWSCognitoIdentityProviderCreateUserPoolRequest : AWSRequest


/**
 <p>The configuration for AdminCreateUser requests.</p>
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
 <p>Represents the request to delete user attributes.</p>
 Required parameters: [UserAttributeNames]
 */
@interface AWSCognitoIdentityProviderDeleteUserAttributesRequest : AWSRequest


/**
 <p>The access token used in the request to delete user attributes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>An array of strings representing the user attribute names you wish to delete.</p>
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
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The user pool ID for the user pool where you want to delete the client.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

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
 */
@interface AWSCognitoIdentityProviderDeleteUserRequest : AWSRequest


/**
 <p>The access token from a request to delete a user.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

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
 <p>The ID of the client associated with the user pool.</p>
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
 <p>The type of configuration for the user pool's device tracking.</p>
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
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 <p>The user name of the user for whom you want to enter a code to retrieve a forgotten password.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Respresents the response from the server regarding the request to reset a password.</p>
 */
@interface AWSCognitoIdentityProviderForgotPasswordResponse : AWSModel


/**
 <p>The type of code delivery details being returned from the server.</p>
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
 <p>Represents the request to get user attribute verification.</p>
 Required parameters: [AttributeName]
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
 <p>The code delivery details returned by the server response to get the user attribute verification code.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCodeDeliveryDetailsType * _Nullable codeDeliveryDetails;

@end

/**
 <p>Represents the request to get information about the user.</p>
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
 <p>An array of name-value pairs representing user attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

/**
 <p>The user name of the user you wish to retrieve from the get user request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>Represents the request to sign out all devices.</p>
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
 <p>Initiates the authentication request.</p>
 Required parameters: [AuthFlow, ClientId]
 */
@interface AWSCognitoIdentityProviderInitiateAuthRequest : AWSRequest


/**
 <p>The authentication flow.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderAuthFlowType authFlow;

/**
 <p>The authentication parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable authParameters;

/**
 <p>The client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The client app's metadata.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable clientMetadata;

@end

/**
 <p>Initiates the authentication response.</p>
 */
@interface AWSCognitoIdentityProviderInitiateAuthResponse : AWSModel


/**
 <p>The result type of the authentication result.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAuthenticationResultType * _Nullable authenticationResult;

/**
 <p>The name of the challenge.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeParameters;

/**
 <p>The session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

@end

/**
 <p>Specifies the type of configuration for AWS Lambda triggers.</p>
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
 <p>Represents the request to list the user import jobs.</p>
 Required parameters: [UserPoolId, MaxResults]
 */
@interface AWSCognitoIdentityProviderListUserImportJobsRequest : AWSRequest


/**
 <p>The maximum number of import jobs you want the request to return.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>An identifier that was returned from the previous call to ListUserImportJobs, which can be used to return the next set of import jobs in the list.</p>
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
 <p>Represents the request to list users.</p>
 Required parameters: [UserPoolId]
 */
@interface AWSCognitoIdentityProviderListUsersRequest : AWSRequest


/**
 <p>The attributes to get from the request to list users.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributesToGet;

/**
 <p>The filter for the list users request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filter;

/**
 <p>The limit of the request to list users.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 <p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 <p>The user pool ID for which you want to list users.</p>
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
 <p>Represents the request to resend the confirmation code.</p>
 Required parameters: [ClientId, Username]
 */
@interface AWSCognitoIdentityProviderResendConfirmationCodeRequest : AWSRequest


/**
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 <p>The user name of the user to whom you wish to resend a confirmation code.</p>
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 <p>The response from the server when the Amazon Cognito service makes the request to resend a confirmation code.</p>
 */
@interface AWSCognitoIdentityProviderResendConfirmationCodeResponse : AWSModel


/**
 <p>The type of code delivery details being returned from the server.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCodeDeliveryDetailsType * _Nullable codeDeliveryDetails;

@end

/**
 <p>The request to respond to an authentication challenge.</p>
 Required parameters: [ClientId, ChallengeName]
 */
@interface AWSCognitoIdentityProviderRespondToAuthChallengeRequest : AWSRequest


/**
 <p>The name of the challenge.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The responses to the authentication challenge.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeResponses;

/**
 <p>The client ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

@end

/**
 <p>The response to respond to the authentication challenge.</p>
 */
@interface AWSCognitoIdentityProviderRespondToAuthChallengeResponse : AWSModel


/**
 <p>The result type of the authentication result.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAuthenticationResultType * _Nullable authenticationResult;

/**
 <p>The challenge name.</p>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderChallengeNameType challengeName;

/**
 <p>The challenge parameters.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable challengeParameters;

/**
 <p>The session.</p>
 */
@property (nonatomic, strong) NSString * _Nullable session;

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
@property (nonatomic, strong) NSNumber * _Nullable mutable;

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
 <p>An array of name-value pairs representing user attributes.</p>
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

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
 */
@interface AWSCognitoIdentityProviderSignUpResponse : AWSModel


/**
 <p>The type of code delivery details being returned from the server.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCodeDeliveryDetailsType * _Nullable codeDeliveryDetails;

/**
 <p>A response from the server indicating that a user registration has been confirmed.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable userConfirmed;

@end

/**
 <p>The SMS configuratoin type.</p>
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
 <p>The type of constraints associated with an attribute of the string type.</p>
 */
@interface AWSCognitoIdentityProviderStringAttributeConstraintsType : AWSModel


/**
 <p>The maximum length of an attribute value of the string type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable maxLength;

/**
 <p>The minimum length of an attribute value of the string type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable minLength;

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
 <p>Represents the request to update user attributes.</p>
 Required parameters: [UserAttributes]
 */
@interface AWSCognitoIdentityProviderUpdateUserAttributesRequest : AWSRequest


/**
 <p>The access token for the request to update user attributes.</p>
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 <p>An array of name-value pairs representing user attributes.</p>
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
 <p>The ID of the client associated with the user pool.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 <p>The client name from the update user pool client request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable clientName;

/**
 <p>Explicit authentication flows.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable explicitAuthFlows;

/**
 <p>The read-only attributes of the user pool.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable readAttributes;

/**
 <p>The validity of the refresh token.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable refreshTokenValidity;

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
 <p>The configuration for AdminCreateUser requests.</p>
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
 <p>The subject of the email verfication message.</p>
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
 <p>The user pool ID for the user pool you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>Represents the response from the server when you make a request to update the user pool.</p>
 */
@interface AWSCognitoIdentityProviderUpdateUserPoolResponse : AWSModel


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
 <p>The date when the user imoprt job was completed.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable completionDate;

/**
 <p>The message returned when the user import job is completed.</p>
 */
@property (nonatomic, strong) NSString * _Nullable completionMessage;

/**
 <p>The date when the user import job was created.</p>
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
 <p>The pre-signed URL to be used to upload the .csv file.</p>
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
 <p>The status of the user import job. One of the following:</p><ul><li><p>Created - The job was created but not started.</p></li><li><p>Pending - A transition state. You have started the job, but it has not begun importing users yet.</p></li><li><p>InProgress - The job has started, and users are being imported.</p></li><li><p>Stopping - You have stopped the job, but the job has not stopped importing users yet.</p></li><li><p>Stopped - You have stopped the job, and the job has stopped importing users.</p></li><li><p>Succeeded - The job has completed successfully.</p></li><li><p>Failed - The job has stopped due to an error.</p></li><li><p>Expired - You created a job, but did not start the job within 24-48 hours. All data associated with the job was deleted, and the job cannot be started.</p></li></ul>
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserImportJobStatusType status;

/**
 <p>The user pool ID for the user pool that the users are being imported into.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 <p>The description of the user poool client.</p>
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
 <p>A user pool of the client type.</p>
 */
@interface AWSCognitoIdentityProviderUserPoolClientType : AWSModel


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
 <p>The creation date from the user pool request of the client type.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 <p>The explicit authentication flows.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable explicitAuthFlows;

/**
 <p>The last modified date from the user pool request of the client type.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 <p>The Read-only attributes.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable readAttributes;

/**
 <p>The validity of the refresh token.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable refreshTokenValidity;

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
 <p>The creation date in a user pool description.</p>
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
 <p>The last modified date in a user pool description.</p>
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
 <p>The type of policy in a user pool.</p>
 */
@interface AWSCognitoIdentityProviderUserPoolPolicyType : AWSModel


/**
 <p>A container with information about the user pool password policy.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderPasswordPolicyType * _Nullable passwordPolicy;

@end

/**
 <p>A container with information about the user pool type.</p>
 */
@interface AWSCognitoIdentityProviderUserPoolType : AWSModel


/**
 <p>The configuration for AdminCreateUser requests.</p>
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
 <p>The creation date of a user pool.</p>
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
 <p>A container describing the AWS Lambda triggers associated with a user pool.</p>
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLambdaConfigType * _Nullable lambdaConfig;

/**
 <p>The last modified date of a user pool.</p>
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
 <p>A container describing the policies associated with a user pool.</p>
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
 <p>The reason why the SMS configuration cannot send the message(s) to your users.</p>
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
 <p>Represents the request to verify user attributes.</p>
 Required parameters: [AttributeName, Code]
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
