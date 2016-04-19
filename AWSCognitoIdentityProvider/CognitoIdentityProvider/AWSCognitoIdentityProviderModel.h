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
    AWSCognitoIdentityProviderErrorIncompleteSignature,
    AWSCognitoIdentityProviderErrorInvalidClientTokenId,
    AWSCognitoIdentityProviderErrorMissingAuthenticationToken,
    AWSCognitoIdentityProviderErrorAliasExists,
    AWSCognitoIdentityProviderErrorCodeMismatch,
    AWSCognitoIdentityProviderErrorConcurrentModification,
    AWSCognitoIdentityProviderErrorExpiredCode,
    AWSCognitoIdentityProviderErrorInternalError,
    AWSCognitoIdentityProviderErrorInvalidLambdaResponse,
    AWSCognitoIdentityProviderErrorInvalidParameter,
    AWSCognitoIdentityProviderErrorInvalidPassword,
    AWSCognitoIdentityProviderErrorNotAuthorized,
    AWSCognitoIdentityProviderErrorResourceNotFound,
    AWSCognitoIdentityProviderErrorTooManyFailedAttempts,
    AWSCognitoIdentityProviderErrorTooManyRequests,
    AWSCognitoIdentityProviderErrorUnexpectedLambda,
    AWSCognitoIdentityProviderErrorUserLambdaValidation,
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

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderDeliveryMediumType) {
    AWSCognitoIdentityProviderDeliveryMediumTypeUnknown,
    AWSCognitoIdentityProviderDeliveryMediumTypeSms,
    AWSCognitoIdentityProviderDeliveryMediumTypeEmail,
};

typedef NS_ENUM(NSInteger, AWSCognitoIdentityProviderStatusType) {
    AWSCognitoIdentityProviderStatusTypeUnknown,
    AWSCognitoIdentityProviderStatusTypeEnabled,
    AWSCognitoIdentityProviderStatusTypeDisabled,
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
@class AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest;
@class AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse;
@class AWSCognitoIdentityProviderAdminDeleteUserRequest;
@class AWSCognitoIdentityProviderAdminDisableUserRequest;
@class AWSCognitoIdentityProviderAdminDisableUserResponse;
@class AWSCognitoIdentityProviderAdminEnableUserRequest;
@class AWSCognitoIdentityProviderAdminEnableUserResponse;
@class AWSCognitoIdentityProviderAdminGetUserRequest;
@class AWSCognitoIdentityProviderAdminGetUserResponse;
@class AWSCognitoIdentityProviderAdminResetUserPasswordRequest;
@class AWSCognitoIdentityProviderAdminResetUserPasswordResponse;
@class AWSCognitoIdentityProviderAdminSetUserSettingsRequest;
@class AWSCognitoIdentityProviderAdminSetUserSettingsResponse;
@class AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest;
@class AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse;
@class AWSCognitoIdentityProviderAttributeType;
@class AWSCognitoIdentityProviderAuthenticateRequest;
@class AWSCognitoIdentityProviderAuthenticateResponse;
@class AWSCognitoIdentityProviderAuthenticationResultType;
@class AWSCognitoIdentityProviderChangePasswordRequest;
@class AWSCognitoIdentityProviderChangePasswordResponse;
@class AWSCognitoIdentityProviderCodeDeliveryDetailsType;
@class AWSCognitoIdentityProviderConfirmForgotPasswordRequest;
@class AWSCognitoIdentityProviderConfirmForgotPasswordResponse;
@class AWSCognitoIdentityProviderConfirmSignUpRequest;
@class AWSCognitoIdentityProviderConfirmSignUpResponse;
@class AWSCognitoIdentityProviderCreateUserPoolClientRequest;
@class AWSCognitoIdentityProviderCreateUserPoolClientResponse;
@class AWSCognitoIdentityProviderCreateUserPoolRequest;
@class AWSCognitoIdentityProviderCreateUserPoolResponse;
@class AWSCognitoIdentityProviderDeleteUserAttributesRequest;
@class AWSCognitoIdentityProviderDeleteUserAttributesResponse;
@class AWSCognitoIdentityProviderDeleteUserPoolClientRequest;
@class AWSCognitoIdentityProviderDeleteUserPoolRequest;
@class AWSCognitoIdentityProviderDeleteUserRequest;
@class AWSCognitoIdentityProviderDescribeUserPoolClientRequest;
@class AWSCognitoIdentityProviderDescribeUserPoolClientResponse;
@class AWSCognitoIdentityProviderDescribeUserPoolRequest;
@class AWSCognitoIdentityProviderDescribeUserPoolResponse;
@class AWSCognitoIdentityProviderEnhanceAuthRequest;
@class AWSCognitoIdentityProviderEnhanceAuthResponse;
@class AWSCognitoIdentityProviderForgotPasswordRequest;
@class AWSCognitoIdentityProviderForgotPasswordResponse;
@class AWSCognitoIdentityProviderGetAuthenticationDetailsRequest;
@class AWSCognitoIdentityProviderGetAuthenticationDetailsResponse;
@class AWSCognitoIdentityProviderGetJWKSRequest;
@class AWSCognitoIdentityProviderGetJWKSResponse;
@class AWSCognitoIdentityProviderGetOpenIdConfigurationRequest;
@class AWSCognitoIdentityProviderGetOpenIdConfigurationResponse;
@class AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest;
@class AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse;
@class AWSCognitoIdentityProviderGetUserRequest;
@class AWSCognitoIdentityProviderGetUserResponse;
@class AWSCognitoIdentityProviderKeyType;
@class AWSCognitoIdentityProviderLambdaConfigType;
@class AWSCognitoIdentityProviderListUserPoolClientsRequest;
@class AWSCognitoIdentityProviderListUserPoolClientsResponse;
@class AWSCognitoIdentityProviderListUserPoolsRequest;
@class AWSCognitoIdentityProviderListUserPoolsResponse;
@class AWSCognitoIdentityProviderListUsersRequest;
@class AWSCognitoIdentityProviderListUsersResponse;
@class AWSCognitoIdentityProviderMFAOptionType;
@class AWSCognitoIdentityProviderNumberAttributeConstraintsType;
@class AWSCognitoIdentityProviderPasswordClaimType;
@class AWSCognitoIdentityProviderPasswordPolicyType;
@class AWSCognitoIdentityProviderRefreshTokensRequest;
@class AWSCognitoIdentityProviderRefreshTokensResponse;
@class AWSCognitoIdentityProviderResendConfirmationCodeRequest;
@class AWSCognitoIdentityProviderResendConfirmationCodeResponse;
@class AWSCognitoIdentityProviderSchemaAttributeType;
@class AWSCognitoIdentityProviderSetUserSettingsRequest;
@class AWSCognitoIdentityProviderSetUserSettingsResponse;
@class AWSCognitoIdentityProviderSignUpRequest;
@class AWSCognitoIdentityProviderSignUpResponse;
@class AWSCognitoIdentityProviderStringAttributeConstraintsType;
@class AWSCognitoIdentityProviderUpdateUserAttributesRequest;
@class AWSCognitoIdentityProviderUpdateUserAttributesResponse;
@class AWSCognitoIdentityProviderUpdateUserPoolClientRequest;
@class AWSCognitoIdentityProviderUpdateUserPoolClientResponse;
@class AWSCognitoIdentityProviderUpdateUserPoolRequest;
@class AWSCognitoIdentityProviderUpdateUserPoolResponse;
@class AWSCognitoIdentityProviderUserPoolClientDescription;
@class AWSCognitoIdentityProviderUserPoolClientType;
@class AWSCognitoIdentityProviderUserPoolDescriptionType;
@class AWSCognitoIdentityProviderUserPoolPolicyType;
@class AWSCognitoIdentityProviderUserPoolType;
@class AWSCognitoIdentityProviderUserType;
@class AWSCognitoIdentityProviderVerifyUserAttributeRequest;
@class AWSCognitoIdentityProviderVerifyUserAttributeResponse;

/**
 
 */
@interface AWSCognitoIdentityProviderAddCustomAttributesRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderSchemaAttributeType *> * _Nullable customAttributes;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAddCustomAttributesResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminConfirmSignUpRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminConfirmSignUpResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userAttributeNames;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminDeleteUserRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminDisableUserRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminDisableUserResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminEnableUserRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminEnableUserResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminGetUserRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminGetUserResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderMFAOptionType *> * _Nullable MFAOptions;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable userCreateDate;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable userLastModifiedDate;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserStatusType userStatus;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminResetUserPasswordRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminResetUserPasswordResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminSetUserSettingsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderMFAOptionType *> * _Nullable MFAOptions;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminSetUserSettingsResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderAttributeType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable value;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAuthenticateRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderPasswordClaimType * _Nullable passwordClaim;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable timestamp;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAuthenticateResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable authState;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAuthenticationResultType * _Nullable authenticationResult;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCodeDeliveryDetailsType * _Nullable codeDeliveryDetails;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderAuthenticationResultType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable expiresIn;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable idToken;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable refreshToken;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable tokenType;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderChangePasswordRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable previousPassword;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable proposedPassword;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderChangePasswordResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderCodeDeliveryDetailsType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderDeliveryMediumType deliveryMedium;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable destination;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderConfirmForgotPasswordRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable confirmationCode;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderConfirmForgotPasswordResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderConfirmSignUpRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable confirmationCode;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable forceAliasCreation;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderConfirmSignUpResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderCreateUserPoolClientRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientName;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable generateSecret;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderCreateUserPoolClientResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolClientType * _Nullable userPoolClient;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderCreateUserPoolRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable aliasAttributes;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoVerifiedAttributes;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationMessage;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationSubject;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLambdaConfigType * _Nullable lambdaConfig;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserPoolMfaType mfaConfiguration;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolPolicyType * _Nullable policies;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable poolName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable smsAuthenticationMessage;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable smsVerificationMessage;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderCreateUserPoolResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolType * _Nullable userPool;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDeleteUserAttributesRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable userAttributeNames;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDeleteUserAttributesResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderDeleteUserPoolClientRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDeleteUserPoolRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDeleteUserRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeUserPoolClientRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeUserPoolClientResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolClientType * _Nullable userPoolClient;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeUserPoolRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderDescribeUserPoolResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolType * _Nullable userPool;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderEnhanceAuthRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable authState;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable code;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderEnhanceAuthResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAuthenticationResultType * _Nullable authenticationResult;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderForgotPasswordRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderForgotPasswordResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCodeDeliveryDetailsType * _Nullable codeDeliveryDetails;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetAuthenticationDetailsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable srpA;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable validationData;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetAuthenticationDetailsResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable salt;

/**
 
 */
@property (nonatomic, strong) NSData * _Nullable secretBlock;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable srpB;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetJWKSRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetJWKSResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderKeyType *> * _Nullable keys;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetOpenIdConfigurationRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetOpenIdConfigurationResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable authorization_endpoint;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable id_token_signing_alg_values_supported;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable issuer;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable jwks_uri;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable response_types_supported;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable subject_types_supported;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCodeDeliveryDetailsType * _Nullable codeDeliveryDetails;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetUserRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderGetUserResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderMFAOptionType *> * _Nullable MFAOptions;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderKeyType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable alg;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable e;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable kid;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable kty;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable n;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable use;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderLambdaConfigType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable customMessage;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable postAuthentication;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable postConfirmation;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable preAuthentication;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable preSignUp;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListUserPoolClientsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListUserPoolClientsResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderUserPoolClientDescription *> * _Nullable userPoolClients;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListUserPoolsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListUserPoolsResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderUserPoolDescriptionType *> * _Nullable userPools;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListUsersRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable attributesToGet;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable limit;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserStatusType userStatus;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderListUsersResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable paginationToken;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderUserType *> * _Nullable users;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderMFAOptionType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderDeliveryMediumType deliveryMedium;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderNumberAttributeConstraintsType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable maxValue;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable minValue;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderPasswordClaimType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSData * _Nullable secretBlock;

/**
 
 */
@property (nonatomic, strong) NSData * _Nullable signature;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderPasswordPolicyType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable minimumLength;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable requireLowercase;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable requireNumbers;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable requireSymbols;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable requireUppercase;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderRefreshTokensRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientSecret;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable refreshToken;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderRefreshTokensResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderAuthenticationResultType * _Nullable authenticationResult;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderResendConfirmationCodeRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderResendConfirmationCodeResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCodeDeliveryDetailsType * _Nullable codeDeliveryDetails;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSchemaAttributeType : AWSModel


/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderAttributeDataType attributeDataType;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable developerOnlyAttribute;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable mutable;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderNumberAttributeConstraintsType * _Nullable numberAttributeConstraints;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable required;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderStringAttributeConstraintsType * _Nullable stringAttributeConstraints;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetUserSettingsRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderMFAOptionType *> * _Nullable MFAOptions;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSetUserSettingsResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderSignUpRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable password;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable secretHash;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable validationData;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderSignUpResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderCodeDeliveryDetailsType * _Nullable codeDeliveryDetails;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable userConfirmed;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderStringAttributeConstraintsType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable maxLength;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable minLength;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateUserAttributesRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable userAttributes;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateUserAttributesResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderCodeDeliveryDetailsType *> * _Nullable codeDeliveryDetailsList;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateUserPoolClientRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateUserPoolClientResponse : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolClientType * _Nullable userPoolClient;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateUserPoolRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoVerifiedAttributes;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationMessage;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationSubject;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLambdaConfigType * _Nullable lambdaConfig;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserPoolMfaType mfaConfiguration;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolPolicyType * _Nullable policies;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable smsAuthenticationMessage;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable smsVerificationMessage;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUpdateUserPoolResponse : AWSModel


@end

/**
 
 */
@interface AWSCognitoIdentityProviderUserPoolClientDescription : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUserPoolClientType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientId;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable clientSecret;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable userPoolId;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUserPoolDescriptionType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLambdaConfigType * _Nullable lambdaConfig;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderStatusType status;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUserPoolPolicyType : AWSModel


/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderPasswordPolicyType * _Nullable passwordPolicy;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUserPoolType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable aliasAttributes;

/**
 
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable autoVerifiedAttributes;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable creationDate;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationMessage;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable emailVerificationSubject;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable identifier;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderLambdaConfigType * _Nullable lambdaConfig;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable lastModifiedDate;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserPoolMfaType mfaConfiguration;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable name;

/**
 
 */
@property (nonatomic, strong) AWSCognitoIdentityProviderUserPoolPolicyType * _Nullable policies;

/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderSchemaAttributeType *> * _Nullable schemaAttributes;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable smsAuthenticationMessage;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable smsVerificationMessage;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderStatusType status;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderUserType : AWSModel


/**
 
 */
@property (nonatomic, strong) NSArray<AWSCognitoIdentityProviderAttributeType *> * _Nullable attributes;

/**
 
 */
@property (nonatomic, strong) NSNumber * _Nullable enabled;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable userCreateDate;

/**
 
 */
@property (nonatomic, strong) NSDate * _Nullable userLastModifiedDate;

/**
 
 */
@property (nonatomic, assign) AWSCognitoIdentityProviderUserStatusType userStatus;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable username;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderVerifyUserAttributeRequest : AWSRequest


/**
 
 */
@property (nonatomic, strong) NSString * _Nullable accessToken;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable attributeName;

/**
 
 */
@property (nonatomic, strong) NSString * _Nullable code;

@end

/**
 
 */
@interface AWSCognitoIdentityProviderVerifyUserAttributeResponse : AWSModel


@end

NS_ASSUME_NONNULL_END
