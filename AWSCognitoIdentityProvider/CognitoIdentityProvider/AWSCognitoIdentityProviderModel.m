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

#import "AWSCognitoIdentityProviderModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSCognitoIdentityProviderErrorDomain = @"com.amazonaws.AWSCognitoIdentityProviderErrorDomain";

@implementation AWSCognitoIdentityProviderAddCustomAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customAttributes" : @"CustomAttributes",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)customAttributesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderSchemaAttributeType class]];
}

@end

@implementation AWSCognitoIdentityProviderAddCustomAttributesResponse

@end

@implementation AWSCognitoIdentityProviderAdminConfirmSignUpRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminConfirmSignUpResponse

@end

@implementation AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userAttributeNames" : @"UserAttributeNames",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse

@end

@implementation AWSCognitoIdentityProviderAdminDeleteUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminDisableUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminDisableUserResponse

@end

@implementation AWSCognitoIdentityProviderAdminEnableUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminEnableUserResponse

@end

@implementation AWSCognitoIdentityProviderAdminForgetDeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceKey" : @"DeviceKey",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminGetDeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceKey" : @"DeviceKey",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminGetDeviceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"device" : @"Device",
             };
}

+ (NSValueTransformer *)deviceJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderDeviceType class]];
}

@end

@implementation AWSCognitoIdentityProviderAdminGetUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminGetUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"MFAOptions" : @"MFAOptions",
             @"userAttributes" : @"UserAttributes",
             @"userCreateDate" : @"UserCreateDate",
             @"userLastModifiedDate" : @"UserLastModifiedDate",
             @"userStatus" : @"UserStatus",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)MFAOptionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderMFAOptionType class]];
}

+ (NSValueTransformer *)userAttributesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

+ (NSValueTransformer *)userCreateDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)userLastModifiedDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)userStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"UNCONFIRMED"]) {
            return @(AWSCognitoIdentityProviderUserStatusTypeUnconfirmed);
        }
        if ([value isEqualToString:@"CONFIRMED"]) {
            return @(AWSCognitoIdentityProviderUserStatusTypeConfirmed);
        }
        if ([value isEqualToString:@"ARCHIVED"]) {
            return @(AWSCognitoIdentityProviderUserStatusTypeArchived);
        }
        if ([value isEqualToString:@"COMPROMISED"]) {
            return @(AWSCognitoIdentityProviderUserStatusTypeCompromised);
        }
        if ([value isEqualToString:@"UNKNOWN"]) {
            return @(AWSCognitoIdentityProviderUserStatusTypeUnknown);
        }
        if ([value isEqualToString:@"RESET_REQUIRED"]) {
            return @(AWSCognitoIdentityProviderUserStatusTypeResetRequired);
        }
        return @(AWSCognitoIdentityProviderUserStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderUserStatusTypeUnconfirmed:
                return @"UNCONFIRMED";
            case AWSCognitoIdentityProviderUserStatusTypeConfirmed:
                return @"CONFIRMED";
            case AWSCognitoIdentityProviderUserStatusTypeArchived:
                return @"ARCHIVED";
            case AWSCognitoIdentityProviderUserStatusTypeCompromised:
                return @"COMPROMISED";
            case AWSCognitoIdentityProviderUserStatusTypeUnknown:
                return @"UNKNOWN";
            case AWSCognitoIdentityProviderUserStatusTypeResetRequired:
                return @"RESET_REQUIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderAdminInitiateAuthRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authFlow" : @"AuthFlow",
             @"authParameters" : @"AuthParameters",
             @"clientId" : @"ClientId",
             @"clientMetadata" : @"ClientMetadata",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)authFlowJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"USER_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeUserSrpAuth);
        }
        if ([value isEqualToString:@"REFRESH_TOKEN_AUTH"]) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeRefreshTokenAuth);
        }
        if ([value isEqualToString:@"CUSTOM_AUTH"]) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeCustomAuth);
        }
        if ([value isEqualToString:@"ADMIN_NO_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeAdminNoSrpAuth);
        }
        return @(AWSCognitoIdentityProviderAuthFlowTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderAuthFlowTypeUserSrpAuth:
                return @"USER_SRP_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeRefreshTokenAuth:
                return @"REFRESH_TOKEN_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeCustomAuth:
                return @"CUSTOM_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeAdminNoSrpAuth:
                return @"ADMIN_NO_SRP_AUTH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderAdminInitiateAuthResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticationResult" : @"AuthenticationResult",
             @"challengeName" : @"ChallengeName",
             @"challengeParameters" : @"ChallengeParameters",
             @"session" : @"Session",
             };
}

+ (NSValueTransformer *)authenticationResultJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAuthenticationResultType class]];
}

+ (NSValueTransformer *)challengeNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"SMS_MFA"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSmsMfa);
        }
        if ([value isEqualToString:@"PASSWORD_VERIFIER"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier);
        }
        if ([value isEqualToString:@"CUSTOM_CHALLENGE"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge);
        }
        if ([value isEqualToString:@"DEVICE_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth);
        }
        if ([value isEqualToString:@"DEVICE_PASSWORD_VERIFIER"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier);
        }
        if ([value isEqualToString:@"ADMIN_NO_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth);
        }
        return @(AWSCognitoIdentityProviderChallengeNameTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderChallengeNameTypeSmsMfa:
                return @"SMS_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier:
                return @"PASSWORD_VERIFIER";
            case AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge:
                return @"CUSTOM_CHALLENGE";
            case AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth:
                return @"DEVICE_SRP_AUTH";
            case AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier:
                return @"DEVICE_PASSWORD_VERIFIER";
            case AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth:
                return @"ADMIN_NO_SRP_AUTH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderAdminListDevicesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"paginationToken" : @"PaginationToken",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminListDevicesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devices" : @"Devices",
             @"paginationToken" : @"PaginationToken",
             };
}

+ (NSValueTransformer *)devicesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderDeviceType class]];
}

@end

@implementation AWSCognitoIdentityProviderAdminResetUserPasswordRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminResetUserPasswordResponse

@end

@implementation AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"challengeName" : @"ChallengeName",
             @"challengeResponses" : @"ChallengeResponses",
             @"clientId" : @"ClientId",
             @"session" : @"Session",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)challengeNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"SMS_MFA"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSmsMfa);
        }
        if ([value isEqualToString:@"PASSWORD_VERIFIER"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier);
        }
        if ([value isEqualToString:@"CUSTOM_CHALLENGE"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge);
        }
        if ([value isEqualToString:@"DEVICE_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth);
        }
        if ([value isEqualToString:@"DEVICE_PASSWORD_VERIFIER"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier);
        }
        if ([value isEqualToString:@"ADMIN_NO_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth);
        }
        return @(AWSCognitoIdentityProviderChallengeNameTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderChallengeNameTypeSmsMfa:
                return @"SMS_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier:
                return @"PASSWORD_VERIFIER";
            case AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge:
                return @"CUSTOM_CHALLENGE";
            case AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth:
                return @"DEVICE_SRP_AUTH";
            case AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier:
                return @"DEVICE_PASSWORD_VERIFIER";
            case AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth:
                return @"ADMIN_NO_SRP_AUTH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticationResult" : @"AuthenticationResult",
             @"challengeName" : @"ChallengeName",
             @"challengeParameters" : @"ChallengeParameters",
             @"session" : @"Session",
             };
}

+ (NSValueTransformer *)authenticationResultJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAuthenticationResultType class]];
}

+ (NSValueTransformer *)challengeNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"SMS_MFA"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSmsMfa);
        }
        if ([value isEqualToString:@"PASSWORD_VERIFIER"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier);
        }
        if ([value isEqualToString:@"CUSTOM_CHALLENGE"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge);
        }
        if ([value isEqualToString:@"DEVICE_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth);
        }
        if ([value isEqualToString:@"DEVICE_PASSWORD_VERIFIER"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier);
        }
        if ([value isEqualToString:@"ADMIN_NO_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth);
        }
        return @(AWSCognitoIdentityProviderChallengeNameTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderChallengeNameTypeSmsMfa:
                return @"SMS_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier:
                return @"PASSWORD_VERIFIER";
            case AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge:
                return @"CUSTOM_CHALLENGE";
            case AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth:
                return @"DEVICE_SRP_AUTH";
            case AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier:
                return @"DEVICE_PASSWORD_VERIFIER";
            case AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth:
                return @"ADMIN_NO_SRP_AUTH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderAdminSetUserSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MFAOptions" : @"MFAOptions",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)MFAOptionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderMFAOptionType class]];
}

@end

@implementation AWSCognitoIdentityProviderAdminSetUserSettingsResponse

@end

@implementation AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceKey" : @"DeviceKey",
             @"deviceRememberedStatus" : @"DeviceRememberedStatus",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)deviceRememberedStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"remembered"]) {
            return @(AWSCognitoIdentityProviderDeviceRememberedStatusTypeRemembered);
        }
        if ([value isEqualToString:@"not_remembered"]) {
            return @(AWSCognitoIdentityProviderDeviceRememberedStatusTypeNotRemembered);
        }
        return @(AWSCognitoIdentityProviderDeviceRememberedStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderDeviceRememberedStatusTypeRemembered:
                return @"remembered";
            case AWSCognitoIdentityProviderDeviceRememberedStatusTypeNotRemembered:
                return @"not_remembered";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderAdminUpdateDeviceStatusResponse

@end

@implementation AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userAttributes" : @"UserAttributes",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)userAttributesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

@end

@implementation AWSCognitoIdentityProviderAdminUpdateUserAttributesResponse

@end

@implementation AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse

@end

@implementation AWSCognitoIdentityProviderAttributeType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSCognitoIdentityProviderAuthenticateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"passwordClaim" : @"PasswordClaim",
             @"secretHash" : @"SecretHash",
             @"timestamp" : @"Timestamp",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)passwordClaimJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderPasswordClaimType class]];
}

+ (NSValueTransformer *)timestampJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCognitoIdentityProviderAuthenticateResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authState" : @"AuthState",
             @"authenticationResult" : @"AuthenticationResult",
             @"codeDeliveryDetails" : @"CodeDeliveryDetails",
             };
}

+ (NSValueTransformer *)authenticationResultJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAuthenticationResultType class]];
}

+ (NSValueTransformer *)codeDeliveryDetailsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCodeDeliveryDetailsType class]];
}

@end

@implementation AWSCognitoIdentityProviderAuthenticationResultType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"expiresIn" : @"ExpiresIn",
             @"idToken" : @"IdToken",
             @"latestDeviceMetadata" : @"NewDeviceMetadata",
             @"refreshToken" : @"RefreshToken",
             @"tokenType" : @"TokenType",
             };
}

+ (NSValueTransformer *)latestDeviceMetadataJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderLatestDeviceMetadataType class]];
}

@end

@implementation AWSCognitoIdentityProviderChangePasswordRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"previousPassword" : @"PreviousPassword",
             @"proposedPassword" : @"ProposedPassword",
             };
}

@end

@implementation AWSCognitoIdentityProviderChangePasswordResponse

@end

@implementation AWSCognitoIdentityProviderCodeDeliveryDetailsType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"deliveryMedium" : @"DeliveryMedium",
             @"destination" : @"Destination",
             };
}

+ (NSValueTransformer *)deliveryMediumJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"SMS"]) {
            return @(AWSCognitoIdentityProviderDeliveryMediumTypeSms);
        }
        if ([value isEqualToString:@"EMAIL"]) {
            return @(AWSCognitoIdentityProviderDeliveryMediumTypeEmail);
        }
        return @(AWSCognitoIdentityProviderDeliveryMediumTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderDeliveryMediumTypeSms:
                return @"SMS";
            case AWSCognitoIdentityProviderDeliveryMediumTypeEmail:
                return @"EMAIL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderConfirmDeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"deviceKey" : @"DeviceKey",
             @"deviceName" : @"DeviceName",
             @"deviceSecretVerifierConfig" : @"DeviceSecretVerifierConfig",
             };
}

+ (NSValueTransformer *)deviceSecretVerifierConfigJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderDeviceSecretVerifierConfigType class]];
}

@end

@implementation AWSCognitoIdentityProviderConfirmDeviceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userConfirmationNecessary" : @"UserConfirmationNecessary",
             };
}

@end

@implementation AWSCognitoIdentityProviderConfirmForgotPasswordRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"confirmationCode" : @"ConfirmationCode",
             @"password" : @"Password",
             @"secretHash" : @"SecretHash",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderConfirmForgotPasswordResponse

@end

@implementation AWSCognitoIdentityProviderConfirmSignUpRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"confirmationCode" : @"ConfirmationCode",
             @"forceAliasCreation" : @"ForceAliasCreation",
             @"secretHash" : @"SecretHash",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderConfirmSignUpResponse

@end

@implementation AWSCognitoIdentityProviderCreateUserPoolClientRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientName" : @"ClientName",
             @"explicitAuthFlows" : @"ExplicitAuthFlows",
             @"generateSecret" : @"GenerateSecret",
             @"readAttributes" : @"ReadAttributes",
             @"refreshTokenValidity" : @"RefreshTokenValidity",
             @"userPoolId" : @"UserPoolId",
             @"writeAttributes" : @"WriteAttributes",
             };
}

@end

@implementation AWSCognitoIdentityProviderCreateUserPoolClientResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolClient" : @"UserPoolClient",
             };
}

+ (NSValueTransformer *)userPoolClientJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolClientType class]];
}

@end

@implementation AWSCognitoIdentityProviderCreateUserPoolRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasAttributes" : @"AliasAttributes",
             @"autoVerifiedAttributes" : @"AutoVerifiedAttributes",
             @"deviceConfiguration" : @"DeviceConfiguration",
             @"emailConfiguration" : @"EmailConfiguration",
             @"emailVerificationMessage" : @"EmailVerificationMessage",
             @"emailVerificationSubject" : @"EmailVerificationSubject",
             @"lambdaConfig" : @"LambdaConfig",
             @"mfaConfiguration" : @"MfaConfiguration",
             @"policies" : @"Policies",
             @"poolName" : @"PoolName",
             @"smsAuthenticationMessage" : @"SmsAuthenticationMessage",
             @"smsConfiguration" : @"SmsConfiguration",
             @"smsVerificationMessage" : @"SmsVerificationMessage",
             };
}

+ (NSValueTransformer *)deviceConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderDeviceConfigurationType class]];
}

+ (NSValueTransformer *)emailConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderEmailConfigurationType class]];
}

+ (NSValueTransformer *)lambdaConfigJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderLambdaConfigType class]];
}

+ (NSValueTransformer *)mfaConfigurationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"OFF"]) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOff);
        }
        if ([value isEqualToString:@"ON"]) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOn);
        }
        if ([value isEqualToString:@"OPTIONAL"]) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOptional);
        }
        return @(AWSCognitoIdentityProviderUserPoolMfaTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderUserPoolMfaTypeOff:
                return @"OFF";
            case AWSCognitoIdentityProviderUserPoolMfaTypeOn:
                return @"ON";
            case AWSCognitoIdentityProviderUserPoolMfaTypeOptional:
                return @"OPTIONAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)policiesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolPolicyType class]];
}

+ (NSValueTransformer *)smsConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSmsConfigurationType class]];
}

@end

@implementation AWSCognitoIdentityProviderCreateUserPoolResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPool" : @"UserPool",
             };
}

+ (NSValueTransformer *)userPoolJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolType class]];
}

@end

@implementation AWSCognitoIdentityProviderDeleteUserAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"userAttributeNames" : @"UserAttributeNames",
             };
}

@end

@implementation AWSCognitoIdentityProviderDeleteUserAttributesResponse

@end

@implementation AWSCognitoIdentityProviderDeleteUserPoolClientRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDeleteUserPoolRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDeleteUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             };
}

@end

@implementation AWSCognitoIdentityProviderDescribeUserPoolClientRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDescribeUserPoolClientResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolClient" : @"UserPoolClient",
             };
}

+ (NSValueTransformer *)userPoolClientJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolClientType class]];
}

@end

@implementation AWSCognitoIdentityProviderDescribeUserPoolRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDescribeUserPoolResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPool" : @"UserPool",
             };
}

+ (NSValueTransformer *)userPoolJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolType class]];
}

@end

@implementation AWSCognitoIdentityProviderDeviceConfigurationType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"challengeRequiredOnNewDevice" : @"ChallengeRequiredOnNewDevice",
             @"deviceOnlyRememberedOnUserPrompt" : @"DeviceOnlyRememberedOnUserPrompt",
             };
}

@end

@implementation AWSCognitoIdentityProviderDeviceSecretVerifierConfigType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"passwordVerifier" : @"PasswordVerifier",
             @"salt" : @"Salt",
             };
}

@end

@implementation AWSCognitoIdentityProviderDeviceType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceAttributes" : @"DeviceAttributes",
             @"deviceCreateDate" : @"DeviceCreateDate",
             @"deviceKey" : @"DeviceKey",
             @"deviceLastAuthenticatedDate" : @"DeviceLastAuthenticatedDate",
             @"deviceLastModifiedDate" : @"DeviceLastModifiedDate",
             };
}

+ (NSValueTransformer *)deviceAttributesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

+ (NSValueTransformer *)deviceCreateDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deviceLastAuthenticatedDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deviceLastModifiedDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCognitoIdentityProviderEmailConfigurationType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"replyToEmailAddress" : @"ReplyToEmailAddress",
             @"sourceArn" : @"SourceArn",
             };
}

@end

@implementation AWSCognitoIdentityProviderEnhanceAuthRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authState" : @"AuthState",
             @"clientId" : @"ClientId",
             @"code" : @"Code",
             @"secretHash" : @"SecretHash",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderEnhanceAuthResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticationResult" : @"AuthenticationResult",
             };
}

+ (NSValueTransformer *)authenticationResultJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAuthenticationResultType class]];
}

@end

@implementation AWSCognitoIdentityProviderForgetDeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"deviceKey" : @"DeviceKey",
             };
}

@end

@implementation AWSCognitoIdentityProviderForgotPasswordRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"secretHash" : @"SecretHash",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderForgotPasswordResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeDeliveryDetails" : @"CodeDeliveryDetails",
             };
}

+ (NSValueTransformer *)codeDeliveryDetailsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCodeDeliveryDetailsType class]];
}

@end

@implementation AWSCognitoIdentityProviderGetAuthenticationDetailsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"secretHash" : @"SecretHash",
             @"srpA" : @"SrpA",
             @"username" : @"Username",
             @"validationData" : @"ValidationData",
             };
}

+ (NSValueTransformer *)validationDataJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

@end

@implementation AWSCognitoIdentityProviderGetAuthenticationDetailsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"salt" : @"Salt",
             @"secretBlock" : @"SecretBlock",
             @"srpB" : @"SrpB",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetDeviceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"deviceKey" : @"DeviceKey",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetDeviceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"device" : @"Device",
             };
}

+ (NSValueTransformer *)deviceJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderDeviceType class]];
}

@end

@implementation AWSCognitoIdentityProviderGetJWKSRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetJWKSResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"keys" : @"keys",
             };
}

+ (NSValueTransformer *)keysJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderKeyType class]];
}

@end

@implementation AWSCognitoIdentityProviderGetOpenIdConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetOpenIdConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authorization_endpoint" : @"authorization_endpoint",
             @"id_token_signing_alg_values_supported" : @"id_token_signing_alg_values_supported",
             @"issuer" : @"issuer",
             @"jwks_uri" : @"jwks_uri",
             @"response_types_supported" : @"response_types_supported",
             @"subject_types_supported" : @"subject_types_supported",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"attributeName" : @"AttributeName",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeDeliveryDetails" : @"CodeDeliveryDetails",
             };
}

+ (NSValueTransformer *)codeDeliveryDetailsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCodeDeliveryDetailsType class]];
}

@end

@implementation AWSCognitoIdentityProviderGetUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MFAOptions" : @"MFAOptions",
             @"userAttributes" : @"UserAttributes",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)MFAOptionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderMFAOptionType class]];
}

+ (NSValueTransformer *)userAttributesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

@end

@implementation AWSCognitoIdentityProviderGlobalSignOutRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             };
}

@end

@implementation AWSCognitoIdentityProviderGlobalSignOutResponse

@end

@implementation AWSCognitoIdentityProviderInitiateAuthRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authFlow" : @"AuthFlow",
             @"authParameters" : @"AuthParameters",
             @"clientId" : @"ClientId",
             @"clientMetadata" : @"ClientMetadata",
             };
}

+ (NSValueTransformer *)authFlowJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"USER_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeUserSrpAuth);
        }
        if ([value isEqualToString:@"REFRESH_TOKEN_AUTH"]) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeRefreshTokenAuth);
        }
        if ([value isEqualToString:@"CUSTOM_AUTH"]) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeCustomAuth);
        }
        if ([value isEqualToString:@"ADMIN_NO_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeAdminNoSrpAuth);
        }
        return @(AWSCognitoIdentityProviderAuthFlowTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderAuthFlowTypeUserSrpAuth:
                return @"USER_SRP_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeRefreshTokenAuth:
                return @"REFRESH_TOKEN_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeCustomAuth:
                return @"CUSTOM_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeAdminNoSrpAuth:
                return @"ADMIN_NO_SRP_AUTH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderInitiateAuthResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticationResult" : @"AuthenticationResult",
             @"challengeName" : @"ChallengeName",
             @"challengeParameters" : @"ChallengeParameters",
             @"session" : @"Session",
             };
}

+ (NSValueTransformer *)authenticationResultJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAuthenticationResultType class]];
}

+ (NSValueTransformer *)challengeNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"SMS_MFA"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSmsMfa);
        }
        if ([value isEqualToString:@"PASSWORD_VERIFIER"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier);
        }
        if ([value isEqualToString:@"CUSTOM_CHALLENGE"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge);
        }
        if ([value isEqualToString:@"DEVICE_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth);
        }
        if ([value isEqualToString:@"DEVICE_PASSWORD_VERIFIER"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier);
        }
        if ([value isEqualToString:@"ADMIN_NO_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth);
        }
        return @(AWSCognitoIdentityProviderChallengeNameTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderChallengeNameTypeSmsMfa:
                return @"SMS_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier:
                return @"PASSWORD_VERIFIER";
            case AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge:
                return @"CUSTOM_CHALLENGE";
            case AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth:
                return @"DEVICE_SRP_AUTH";
            case AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier:
                return @"DEVICE_PASSWORD_VERIFIER";
            case AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth:
                return @"ADMIN_NO_SRP_AUTH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderKeyType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alg" : @"alg",
             @"e" : @"e",
             @"kid" : @"kid",
             @"kty" : @"kty",
             @"n" : @"n",
             @"use" : @"use",
             };
}

@end

@implementation AWSCognitoIdentityProviderLambdaConfigType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createAuthChallenge" : @"CreateAuthChallenge",
             @"customMessage" : @"CustomMessage",
             @"defineAuthChallenge" : @"DefineAuthChallenge",
             @"postAuthentication" : @"PostAuthentication",
             @"postConfirmation" : @"PostConfirmation",
             @"preAuthentication" : @"PreAuthentication",
             @"preSignUp" : @"PreSignUp",
             @"verifyAuthChallengeResponse" : @"VerifyAuthChallengeResponse",
             };
}

@end

@implementation AWSCognitoIdentityProviderLatestDeviceMetadataType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceGroupKey" : @"DeviceGroupKey",
             @"deviceKey" : @"DeviceKey",
             };
}

@end

@implementation AWSCognitoIdentityProviderListDevicesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"limit" : @"Limit",
             @"paginationToken" : @"PaginationToken",
             };
}

@end

@implementation AWSCognitoIdentityProviderListDevicesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"devices" : @"Devices",
             @"paginationToken" : @"PaginationToken",
             };
}

+ (NSValueTransformer *)devicesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderDeviceType class]];
}

@end

@implementation AWSCognitoIdentityProviderListUserPoolClientsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderListUserPoolClientsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"userPoolClients" : @"UserPoolClients",
             };
}

+ (NSValueTransformer *)userPoolClientsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolClientDescription class]];
}

@end

@implementation AWSCognitoIdentityProviderListUserPoolsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCognitoIdentityProviderListUserPoolsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"userPools" : @"UserPools",
             };
}

+ (NSValueTransformer *)userPoolsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolDescriptionType class]];
}

@end

@implementation AWSCognitoIdentityProviderListUsersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributesToGet" : @"AttributesToGet",
             @"filter" : @"Filter",
             @"limit" : @"Limit",
             @"paginationToken" : @"PaginationToken",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderListUsersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"paginationToken" : @"PaginationToken",
             @"users" : @"Users",
             };
}

+ (NSValueTransformer *)usersJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderUserType class]];
}

@end

@implementation AWSCognitoIdentityProviderMFAOptionType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"deliveryMedium" : @"DeliveryMedium",
             };
}

+ (NSValueTransformer *)deliveryMediumJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"SMS"]) {
            return @(AWSCognitoIdentityProviderDeliveryMediumTypeSms);
        }
        if ([value isEqualToString:@"EMAIL"]) {
            return @(AWSCognitoIdentityProviderDeliveryMediumTypeEmail);
        }
        return @(AWSCognitoIdentityProviderDeliveryMediumTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderDeliveryMediumTypeSms:
                return @"SMS";
            case AWSCognitoIdentityProviderDeliveryMediumTypeEmail:
                return @"EMAIL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderNumberAttributeConstraintsType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxValue" : @"MaxValue",
             @"minValue" : @"MinValue",
             };
}

@end

@implementation AWSCognitoIdentityProviderPasswordClaimType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"secretBlock" : @"SecretBlock",
             @"signature" : @"Signature",
             };
}

@end

@implementation AWSCognitoIdentityProviderPasswordPolicyType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"minimumLength" : @"MinimumLength",
             @"requireLowercase" : @"RequireLowercase",
             @"requireNumbers" : @"RequireNumbers",
             @"requireSymbols" : @"RequireSymbols",
             @"requireUppercase" : @"RequireUppercase",
             };
}

@end

@implementation AWSCognitoIdentityProviderRefreshTokensRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"clientSecret" : @"ClientSecret",
             @"refreshToken" : @"RefreshToken",
             };
}

@end

@implementation AWSCognitoIdentityProviderRefreshTokensResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticationResult" : @"AuthenticationResult",
             };
}

+ (NSValueTransformer *)authenticationResultJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAuthenticationResultType class]];
}

@end

@implementation AWSCognitoIdentityProviderResendConfirmationCodeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"secretHash" : @"SecretHash",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderResendConfirmationCodeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeDeliveryDetails" : @"CodeDeliveryDetails",
             };
}

+ (NSValueTransformer *)codeDeliveryDetailsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCodeDeliveryDetailsType class]];
}

@end

@implementation AWSCognitoIdentityProviderRespondToAuthChallengeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"challengeName" : @"ChallengeName",
             @"challengeResponses" : @"ChallengeResponses",
             @"clientId" : @"ClientId",
             @"session" : @"Session",
             };
}

+ (NSValueTransformer *)challengeNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"SMS_MFA"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSmsMfa);
        }
        if ([value isEqualToString:@"PASSWORD_VERIFIER"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier);
        }
        if ([value isEqualToString:@"CUSTOM_CHALLENGE"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge);
        }
        if ([value isEqualToString:@"DEVICE_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth);
        }
        if ([value isEqualToString:@"DEVICE_PASSWORD_VERIFIER"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier);
        }
        if ([value isEqualToString:@"ADMIN_NO_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth);
        }
        return @(AWSCognitoIdentityProviderChallengeNameTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderChallengeNameTypeSmsMfa:
                return @"SMS_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier:
                return @"PASSWORD_VERIFIER";
            case AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge:
                return @"CUSTOM_CHALLENGE";
            case AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth:
                return @"DEVICE_SRP_AUTH";
            case AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier:
                return @"DEVICE_PASSWORD_VERIFIER";
            case AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth:
                return @"ADMIN_NO_SRP_AUTH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderRespondToAuthChallengeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authenticationResult" : @"AuthenticationResult",
             @"challengeName" : @"ChallengeName",
             @"challengeParameters" : @"ChallengeParameters",
             @"session" : @"Session",
             };
}

+ (NSValueTransformer *)authenticationResultJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAuthenticationResultType class]];
}

+ (NSValueTransformer *)challengeNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"SMS_MFA"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSmsMfa);
        }
        if ([value isEqualToString:@"PASSWORD_VERIFIER"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier);
        }
        if ([value isEqualToString:@"CUSTOM_CHALLENGE"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge);
        }
        if ([value isEqualToString:@"DEVICE_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth);
        }
        if ([value isEqualToString:@"DEVICE_PASSWORD_VERIFIER"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier);
        }
        if ([value isEqualToString:@"ADMIN_NO_SRP_AUTH"]) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth);
        }
        return @(AWSCognitoIdentityProviderChallengeNameTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderChallengeNameTypeSmsMfa:
                return @"SMS_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier:
                return @"PASSWORD_VERIFIER";
            case AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge:
                return @"CUSTOM_CHALLENGE";
            case AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth:
                return @"DEVICE_SRP_AUTH";
            case AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier:
                return @"DEVICE_PASSWORD_VERIFIER";
            case AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth:
                return @"ADMIN_NO_SRP_AUTH";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderSchemaAttributeType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeDataType" : @"AttributeDataType",
             @"developerOnlyAttribute" : @"DeveloperOnlyAttribute",
             @"modifiable" : @"Mutable",
             @"name" : @"Name",
             @"numberAttributeConstraints" : @"NumberAttributeConstraints",
             @"required" : @"Required",
             @"stringAttributeConstraints" : @"StringAttributeConstraints",
             };
}

+ (NSValueTransformer *)attributeDataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"String"]) {
            return @(AWSCognitoIdentityProviderAttributeDataTypeString);
        }
        if ([value isEqualToString:@"Number"]) {
            return @(AWSCognitoIdentityProviderAttributeDataTypeNumber);
        }
        if ([value isEqualToString:@"DateTime"]) {
            return @(AWSCognitoIdentityProviderAttributeDataTypeDateTime);
        }
        if ([value isEqualToString:@"Boolean"]) {
            return @(AWSCognitoIdentityProviderAttributeDataTypeBoolean);
        }
        return @(AWSCognitoIdentityProviderAttributeDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderAttributeDataTypeString:
                return @"String";
            case AWSCognitoIdentityProviderAttributeDataTypeNumber:
                return @"Number";
            case AWSCognitoIdentityProviderAttributeDataTypeDateTime:
                return @"DateTime";
            case AWSCognitoIdentityProviderAttributeDataTypeBoolean:
                return @"Boolean";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)numberAttributeConstraintsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderNumberAttributeConstraintsType class]];
}

+ (NSValueTransformer *)stringAttributeConstraintsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderStringAttributeConstraintsType class]];
}

@end

@implementation AWSCognitoIdentityProviderSetUserSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"MFAOptions" : @"MFAOptions",
             };
}

+ (NSValueTransformer *)MFAOptionsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderMFAOptionType class]];
}

@end

@implementation AWSCognitoIdentityProviderSetUserSettingsResponse

@end

@implementation AWSCognitoIdentityProviderSignUpRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"password" : @"Password",
             @"secretHash" : @"SecretHash",
             @"userAttributes" : @"UserAttributes",
             @"username" : @"Username",
             @"validationData" : @"ValidationData",
             };
}

+ (NSValueTransformer *)userAttributesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

+ (NSValueTransformer *)validationDataJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

@end

@implementation AWSCognitoIdentityProviderSignUpResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeDeliveryDetails" : @"CodeDeliveryDetails",
             @"userConfirmed" : @"UserConfirmed",
             };
}

+ (NSValueTransformer *)codeDeliveryDetailsJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCodeDeliveryDetailsType class]];
}

@end

@implementation AWSCognitoIdentityProviderSmsConfigurationType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"externalId" : @"ExternalId",
             @"snsCallerArn" : @"SnsCallerArn",
             };
}

@end

@implementation AWSCognitoIdentityProviderStringAttributeConstraintsType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxLength" : @"MaxLength",
             @"minLength" : @"MinLength",
             };
}

@end

@implementation AWSCognitoIdentityProviderUpdateDeviceStatusRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"deviceKey" : @"DeviceKey",
             @"deviceRememberedStatus" : @"DeviceRememberedStatus",
             };
}

+ (NSValueTransformer *)deviceRememberedStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"remembered"]) {
            return @(AWSCognitoIdentityProviderDeviceRememberedStatusTypeRemembered);
        }
        if ([value isEqualToString:@"not_remembered"]) {
            return @(AWSCognitoIdentityProviderDeviceRememberedStatusTypeNotRemembered);
        }
        return @(AWSCognitoIdentityProviderDeviceRememberedStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderDeviceRememberedStatusTypeRemembered:
                return @"remembered";
            case AWSCognitoIdentityProviderDeviceRememberedStatusTypeNotRemembered:
                return @"not_remembered";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderUpdateDeviceStatusResponse

@end

@implementation AWSCognitoIdentityProviderUpdateUserAttributesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"userAttributes" : @"UserAttributes",
             };
}

+ (NSValueTransformer *)userAttributesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

@end

@implementation AWSCognitoIdentityProviderUpdateUserAttributesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeDeliveryDetailsList" : @"CodeDeliveryDetailsList",
             };
}

+ (NSValueTransformer *)codeDeliveryDetailsListJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderCodeDeliveryDetailsType class]];
}

@end

@implementation AWSCognitoIdentityProviderUpdateUserPoolClientRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"clientName" : @"ClientName",
             @"explicitAuthFlows" : @"ExplicitAuthFlows",
             @"readAttributes" : @"ReadAttributes",
             @"refreshTokenValidity" : @"RefreshTokenValidity",
             @"userPoolId" : @"UserPoolId",
             @"writeAttributes" : @"WriteAttributes",
             };
}

@end

@implementation AWSCognitoIdentityProviderUpdateUserPoolClientResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolClient" : @"UserPoolClient",
             };
}

+ (NSValueTransformer *)userPoolClientJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolClientType class]];
}

@end

@implementation AWSCognitoIdentityProviderUpdateUserPoolRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"autoVerifiedAttributes" : @"AutoVerifiedAttributes",
             @"deviceConfiguration" : @"DeviceConfiguration",
             @"emailConfiguration" : @"EmailConfiguration",
             @"emailVerificationMessage" : @"EmailVerificationMessage",
             @"emailVerificationSubject" : @"EmailVerificationSubject",
             @"lambdaConfig" : @"LambdaConfig",
             @"mfaConfiguration" : @"MfaConfiguration",
             @"policies" : @"Policies",
             @"smsAuthenticationMessage" : @"SmsAuthenticationMessage",
             @"smsConfiguration" : @"SmsConfiguration",
             @"smsVerificationMessage" : @"SmsVerificationMessage",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)deviceConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderDeviceConfigurationType class]];
}

+ (NSValueTransformer *)emailConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderEmailConfigurationType class]];
}

+ (NSValueTransformer *)lambdaConfigJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderLambdaConfigType class]];
}

+ (NSValueTransformer *)mfaConfigurationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"OFF"]) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOff);
        }
        if ([value isEqualToString:@"ON"]) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOn);
        }
        if ([value isEqualToString:@"OPTIONAL"]) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOptional);
        }
        return @(AWSCognitoIdentityProviderUserPoolMfaTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderUserPoolMfaTypeOff:
                return @"OFF";
            case AWSCognitoIdentityProviderUserPoolMfaTypeOn:
                return @"ON";
            case AWSCognitoIdentityProviderUserPoolMfaTypeOptional:
                return @"OPTIONAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)policiesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolPolicyType class]];
}

+ (NSValueTransformer *)smsConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSmsConfigurationType class]];
}

@end

@implementation AWSCognitoIdentityProviderUpdateUserPoolResponse

@end

@implementation AWSCognitoIdentityProviderUserPoolClientDescription

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"clientName" : @"ClientName",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderUserPoolClientType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"clientName" : @"ClientName",
             @"clientSecret" : @"ClientSecret",
             @"creationDate" : @"CreationDate",
             @"explicitAuthFlows" : @"ExplicitAuthFlows",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"readAttributes" : @"ReadAttributes",
             @"refreshTokenValidity" : @"RefreshTokenValidity",
             @"userPoolId" : @"UserPoolId",
             @"writeAttributes" : @"WriteAttributes",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSCognitoIdentityProviderUserPoolDescriptionType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"CreationDate",
             @"identifier" : @"Id",
             @"lambdaConfig" : @"LambdaConfig",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"name" : @"Name",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lambdaConfigJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderLambdaConfigType class]];
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Enabled"]) {
            return @(AWSCognitoIdentityProviderStatusTypeEnabled);
        }
        if ([value isEqualToString:@"Disabled"]) {
            return @(AWSCognitoIdentityProviderStatusTypeDisabled);
        }
        return @(AWSCognitoIdentityProviderStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderStatusTypeEnabled:
                return @"Enabled";
            case AWSCognitoIdentityProviderStatusTypeDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderUserPoolPolicyType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"passwordPolicy" : @"PasswordPolicy",
             };
}

+ (NSValueTransformer *)passwordPolicyJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderPasswordPolicyType class]];
}

@end

@implementation AWSCognitoIdentityProviderUserPoolType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"aliasAttributes" : @"AliasAttributes",
             @"autoVerifiedAttributes" : @"AutoVerifiedAttributes",
             @"creationDate" : @"CreationDate",
             @"deviceConfiguration" : @"DeviceConfiguration",
             @"emailConfiguration" : @"EmailConfiguration",
             @"emailConfigurationFailure" : @"EmailConfigurationFailure",
             @"emailVerificationMessage" : @"EmailVerificationMessage",
             @"emailVerificationSubject" : @"EmailVerificationSubject",
             @"estimatedNumberOfUsers" : @"EstimatedNumberOfUsers",
             @"identifier" : @"Id",
             @"lambdaConfig" : @"LambdaConfig",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"mfaConfiguration" : @"MfaConfiguration",
             @"name" : @"Name",
             @"policies" : @"Policies",
             @"schemaAttributes" : @"SchemaAttributes",
             @"smsAuthenticationMessage" : @"SmsAuthenticationMessage",
             @"smsConfiguration" : @"SmsConfiguration",
             @"smsConfigurationFailure" : @"SmsConfigurationFailure",
             @"smsVerificationMessage" : @"SmsVerificationMessage",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)creationDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deviceConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderDeviceConfigurationType class]];
}

+ (NSValueTransformer *)emailConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderEmailConfigurationType class]];
}

+ (NSValueTransformer *)lambdaConfigJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderLambdaConfigType class]];
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)mfaConfigurationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"OFF"]) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOff);
        }
        if ([value isEqualToString:@"ON"]) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOn);
        }
        if ([value isEqualToString:@"OPTIONAL"]) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOptional);
        }
        return @(AWSCognitoIdentityProviderUserPoolMfaTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderUserPoolMfaTypeOff:
                return @"OFF";
            case AWSCognitoIdentityProviderUserPoolMfaTypeOn:
                return @"ON";
            case AWSCognitoIdentityProviderUserPoolMfaTypeOptional:
                return @"OPTIONAL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)policiesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolPolicyType class]];
}

+ (NSValueTransformer *)schemaAttributesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderSchemaAttributeType class]];
}

+ (NSValueTransformer *)smsConfigurationJSONTransformer {
	return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSmsConfigurationType class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"Enabled"]) {
            return @(AWSCognitoIdentityProviderStatusTypeEnabled);
        }
        if ([value isEqualToString:@"Disabled"]) {
            return @(AWSCognitoIdentityProviderStatusTypeDisabled);
        }
        return @(AWSCognitoIdentityProviderStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderStatusTypeEnabled:
                return @"Enabled";
            case AWSCognitoIdentityProviderStatusTypeDisabled:
                return @"Disabled";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderUserType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"enabled" : @"Enabled",
             @"userCreateDate" : @"UserCreateDate",
             @"userLastModifiedDate" : @"UserLastModifiedDate",
             @"userStatus" : @"UserStatus",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
	return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

+ (NSValueTransformer *)userCreateDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)userLastModifiedDateJSONTransformer {
	return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)userStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value isEqualToString:@"UNCONFIRMED"]) {
            return @(AWSCognitoIdentityProviderUserStatusTypeUnconfirmed);
        }
        if ([value isEqualToString:@"CONFIRMED"]) {
            return @(AWSCognitoIdentityProviderUserStatusTypeConfirmed);
        }
        if ([value isEqualToString:@"ARCHIVED"]) {
            return @(AWSCognitoIdentityProviderUserStatusTypeArchived);
        }
        if ([value isEqualToString:@"COMPROMISED"]) {
            return @(AWSCognitoIdentityProviderUserStatusTypeCompromised);
        }
        if ([value isEqualToString:@"UNKNOWN"]) {
            return @(AWSCognitoIdentityProviderUserStatusTypeUnknown);
        }
        if ([value isEqualToString:@"RESET_REQUIRED"]) {
            return @(AWSCognitoIdentityProviderUserStatusTypeResetRequired);
        }
        return @(AWSCognitoIdentityProviderUserStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderUserStatusTypeUnconfirmed:
                return @"UNCONFIRMED";
            case AWSCognitoIdentityProviderUserStatusTypeConfirmed:
                return @"CONFIRMED";
            case AWSCognitoIdentityProviderUserStatusTypeArchived:
                return @"ARCHIVED";
            case AWSCognitoIdentityProviderUserStatusTypeCompromised:
                return @"COMPROMISED";
            case AWSCognitoIdentityProviderUserStatusTypeUnknown:
                return @"UNKNOWN";
            case AWSCognitoIdentityProviderUserStatusTypeResetRequired:
                return @"RESET_REQUIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderVerifyUserAttributeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"attributeName" : @"AttributeName",
             @"code" : @"Code",
             };
}

@end

@implementation AWSCognitoIdentityProviderVerifyUserAttributeResponse

@end
