//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

@implementation AWSCognitoIdentityProviderAccountRecoverySettingType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recoveryMechanisms" : @"RecoveryMechanisms",
             };
}

+ (NSValueTransformer *)recoveryMechanismsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderRecoveryOptionType class]];
}

@end

@implementation AWSCognitoIdentityProviderAccountTakeoverActionType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventAction" : @"EventAction",
             @"notify" : @"Notify",
             };
}

+ (NSValueTransformer *)eventActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAccountTakeoverEventActionTypeBlock);
        }
        if ([value caseInsensitiveCompare:@"MFA_IF_CONFIGURED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAccountTakeoverEventActionTypeMfaIfConfigured);
        }
        if ([value caseInsensitiveCompare:@"MFA_REQUIRED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAccountTakeoverEventActionTypeMfaRequired);
        }
        if ([value caseInsensitiveCompare:@"NO_ACTION"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAccountTakeoverEventActionTypeNoAction);
        }
        return @(AWSCognitoIdentityProviderAccountTakeoverEventActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderAccountTakeoverEventActionTypeBlock:
                return @"BLOCK";
            case AWSCognitoIdentityProviderAccountTakeoverEventActionTypeMfaIfConfigured:
                return @"MFA_IF_CONFIGURED";
            case AWSCognitoIdentityProviderAccountTakeoverEventActionTypeMfaRequired:
                return @"MFA_REQUIRED";
            case AWSCognitoIdentityProviderAccountTakeoverEventActionTypeNoAction:
                return @"NO_ACTION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderAccountTakeoverActionsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"highAction" : @"HighAction",
             @"lowAction" : @"LowAction",
             @"mediumAction" : @"MediumAction",
             };
}

+ (NSValueTransformer *)highActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAccountTakeoverActionType class]];
}

+ (NSValueTransformer *)lowActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAccountTakeoverActionType class]];
}

+ (NSValueTransformer *)mediumActionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAccountTakeoverActionType class]];
}

@end

@implementation AWSCognitoIdentityProviderAccountTakeoverRiskConfigurationType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"notifyConfiguration" : @"NotifyConfiguration",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAccountTakeoverActionsType class]];
}

+ (NSValueTransformer *)notifyConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderNotifyConfigurationType class]];
}

@end

@implementation AWSCognitoIdentityProviderAddCustomAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAdminAddUserToGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminConfirmSignUpRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientMetadata" : @"ClientMetadata",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminConfirmSignUpResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAdminCreateUserConfigType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowAdminCreateUserOnly" : @"AllowAdminCreateUserOnly",
             @"inviteMessageTemplate" : @"InviteMessageTemplate",
             @"unusedAccountValidityDays" : @"UnusedAccountValidityDays",
             };
}

+ (NSValueTransformer *)inviteMessageTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderMessageTemplateType class]];
}

@end

@implementation AWSCognitoIdentityProviderAdminCreateUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientMetadata" : @"ClientMetadata",
             @"desiredDeliveryMediums" : @"DesiredDeliveryMediums",
             @"forceAliasCreation" : @"ForceAliasCreation",
             @"messageAction" : @"MessageAction",
             @"temporaryPassword" : @"TemporaryPassword",
             @"userAttributes" : @"UserAttributes",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             @"validationData" : @"ValidationData",
             };
}

+ (NSValueTransformer *)messageActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"RESEND"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderMessageActionTypeResend);
        }
        if ([value caseInsensitiveCompare:@"SUPPRESS"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderMessageActionTypeSuppress);
        }
        return @(AWSCognitoIdentityProviderMessageActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderMessageActionTypeResend:
                return @"RESEND";
            case AWSCognitoIdentityProviderMessageActionTypeSuppress:
                return @"SUPPRESS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)userAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

+ (NSValueTransformer *)validationDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

@end

@implementation AWSCognitoIdentityProviderAdminCreateUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserType class]];
}

@end

@implementation AWSCognitoIdentityProviderAdminDeleteUserAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userAttributeNames" : @"UserAttributeNames",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminDeleteUserAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAdminDeleteUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminDisableProviderForUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"user" : @"User",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderProviderUserIdentifierType class]];
}

@end

@implementation AWSCognitoIdentityProviderAdminDisableProviderForUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAdminDisableUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminDisableUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAdminEnableUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminEnableUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAdminForgetDeviceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceKey" : @"DeviceKey",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminGetDeviceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceKey" : @"DeviceKey",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminGetDeviceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminGetUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"MFAOptions" : @"MFAOptions",
             @"preferredMfaSetting" : @"PreferredMfaSetting",
             @"userAttributes" : @"UserAttributes",
             @"userCreateDate" : @"UserCreateDate",
             @"userLastModifiedDate" : @"UserLastModifiedDate",
             @"userMFASettingList" : @"UserMFASettingList",
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
        if ([value caseInsensitiveCompare:@"UNCONFIRMED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserStatusTypeUnconfirmed);
        }
        if ([value caseInsensitiveCompare:@"CONFIRMED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserStatusTypeConfirmed);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserStatusTypeArchived);
        }
        if ([value caseInsensitiveCompare:@"COMPROMISED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserStatusTypeCompromised);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserStatusTypeUnknown);
        }
        if ([value caseInsensitiveCompare:@"RESET_REQUIRED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserStatusTypeResetRequired);
        }
        if ([value caseInsensitiveCompare:@"FORCE_CHANGE_PASSWORD"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserStatusTypeForceChangePassword);
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
            case AWSCognitoIdentityProviderUserStatusTypeForceChangePassword:
                return @"FORCE_CHANGE_PASSWORD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderAdminInitiateAuthRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyticsMetadata" : @"AnalyticsMetadata",
             @"authFlow" : @"AuthFlow",
             @"authParameters" : @"AuthParameters",
             @"clientId" : @"ClientId",
             @"clientMetadata" : @"ClientMetadata",
             @"contextData" : @"ContextData",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)analyticsMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAnalyticsMetadataType class]];
}

+ (NSValueTransformer *)authFlowJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeUserSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"REFRESH_TOKEN_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeRefreshTokenAuth);
        }
        if ([value caseInsensitiveCompare:@"REFRESH_TOKEN"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeRefreshToken);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeCustomAuth);
        }
        if ([value caseInsensitiveCompare:@"ADMIN_NO_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeAdminNoSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"USER_PASSWORD_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeUserPasswordAuth);
        }
        if ([value caseInsensitiveCompare:@"ADMIN_USER_PASSWORD_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeAdminUserPasswordAuth);
        }
        return @(AWSCognitoIdentityProviderAuthFlowTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderAuthFlowTypeUserSrpAuth:
                return @"USER_SRP_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeRefreshTokenAuth:
                return @"REFRESH_TOKEN_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeRefreshToken:
                return @"REFRESH_TOKEN";
            case AWSCognitoIdentityProviderAuthFlowTypeCustomAuth:
                return @"CUSTOM_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeAdminNoSrpAuth:
                return @"ADMIN_NO_SRP_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeUserPasswordAuth:
                return @"USER_PASSWORD_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeAdminUserPasswordAuth:
                return @"ADMIN_USER_PASSWORD_AUTH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)contextDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderContextDataType class]];
}

@end

@implementation AWSCognitoIdentityProviderAdminInitiateAuthResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"SMS_MFA"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSmsMfa);
        }
        if ([value caseInsensitiveCompare:@"SOFTWARE_TOKEN_MFA"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa);
        }
        if ([value caseInsensitiveCompare:@"SELECT_MFA_TYPE"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType);
        }
        if ([value caseInsensitiveCompare:@"MFA_SETUP"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeMfaSetup);
        }
        if ([value caseInsensitiveCompare:@"PASSWORD_VERIFIER"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM_CHALLENGE"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_PASSWORD_VERIFIER"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier);
        }
        if ([value caseInsensitiveCompare:@"ADMIN_NO_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"NEW_PASSWORD_REQUIRED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired);
        }
        return @(AWSCognitoIdentityProviderChallengeNameTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderChallengeNameTypeSmsMfa:
                return @"SMS_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa:
                return @"SOFTWARE_TOKEN_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType:
                return @"SELECT_MFA_TYPE";
            case AWSCognitoIdentityProviderChallengeNameTypeMfaSetup:
                return @"MFA_SETUP";
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
            case AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired:
                return @"NEW_PASSWORD_REQUIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderAdminLinkProviderForUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationUser" : @"DestinationUser",
             @"sourceUser" : @"SourceUser",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)destinationUserJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderProviderUserIdentifierType class]];
}

+ (NSValueTransformer *)sourceUserJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderProviderUserIdentifierType class]];
}

@end

@implementation AWSCognitoIdentityProviderAdminLinkProviderForUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAdminListDevicesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSCognitoIdentityProviderAdminListGroupsForUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextToken" : @"NextToken",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminListGroupsForUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groups" : @"Groups",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderGroupType class]];
}

@end

@implementation AWSCognitoIdentityProviderAdminListUserAuthEventsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminListUserAuthEventsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"authEvents" : @"AuthEvents",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)authEventsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAuthEventType class]];
}

@end

@implementation AWSCognitoIdentityProviderAdminRemoveUserFromGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminResetUserPasswordRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientMetadata" : @"ClientMetadata",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminResetUserPasswordResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAdminRespondToAuthChallengeRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyticsMetadata" : @"AnalyticsMetadata",
             @"challengeName" : @"ChallengeName",
             @"challengeResponses" : @"ChallengeResponses",
             @"clientId" : @"ClientId",
             @"clientMetadata" : @"ClientMetadata",
             @"contextData" : @"ContextData",
             @"session" : @"Session",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)analyticsMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAnalyticsMetadataType class]];
}

+ (NSValueTransformer *)challengeNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SMS_MFA"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSmsMfa);
        }
        if ([value caseInsensitiveCompare:@"SOFTWARE_TOKEN_MFA"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa);
        }
        if ([value caseInsensitiveCompare:@"SELECT_MFA_TYPE"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType);
        }
        if ([value caseInsensitiveCompare:@"MFA_SETUP"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeMfaSetup);
        }
        if ([value caseInsensitiveCompare:@"PASSWORD_VERIFIER"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM_CHALLENGE"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_PASSWORD_VERIFIER"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier);
        }
        if ([value caseInsensitiveCompare:@"ADMIN_NO_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"NEW_PASSWORD_REQUIRED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired);
        }
        return @(AWSCognitoIdentityProviderChallengeNameTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderChallengeNameTypeSmsMfa:
                return @"SMS_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa:
                return @"SOFTWARE_TOKEN_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType:
                return @"SELECT_MFA_TYPE";
            case AWSCognitoIdentityProviderChallengeNameTypeMfaSetup:
                return @"MFA_SETUP";
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
            case AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired:
                return @"NEW_PASSWORD_REQUIRED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)contextDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderContextDataType class]];
}

@end

@implementation AWSCognitoIdentityProviderAdminRespondToAuthChallengeResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"SMS_MFA"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSmsMfa);
        }
        if ([value caseInsensitiveCompare:@"SOFTWARE_TOKEN_MFA"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa);
        }
        if ([value caseInsensitiveCompare:@"SELECT_MFA_TYPE"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType);
        }
        if ([value caseInsensitiveCompare:@"MFA_SETUP"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeMfaSetup);
        }
        if ([value caseInsensitiveCompare:@"PASSWORD_VERIFIER"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM_CHALLENGE"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_PASSWORD_VERIFIER"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier);
        }
        if ([value caseInsensitiveCompare:@"ADMIN_NO_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"NEW_PASSWORD_REQUIRED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired);
        }
        return @(AWSCognitoIdentityProviderChallengeNameTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderChallengeNameTypeSmsMfa:
                return @"SMS_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa:
                return @"SOFTWARE_TOKEN_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType:
                return @"SELECT_MFA_TYPE";
            case AWSCognitoIdentityProviderChallengeNameTypeMfaSetup:
                return @"MFA_SETUP";
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
            case AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired:
                return @"NEW_PASSWORD_REQUIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderAdminSetUserMFAPreferenceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SMSMfaSettings" : @"SMSMfaSettings",
             @"softwareTokenMfaSettings" : @"SoftwareTokenMfaSettings",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)SMSMfaSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSMSMfaSettingsType class]];
}

+ (NSValueTransformer *)softwareTokenMfaSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSoftwareTokenMfaSettingsType class]];
}

@end

@implementation AWSCognitoIdentityProviderAdminSetUserMFAPreferenceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAdminSetUserPasswordRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"password" : @"Password",
             @"permanent" : @"Permanent",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminSetUserPasswordResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAdminSetUserSettingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventId" : @"EventId",
             @"feedbackValue" : @"FeedbackValue",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)feedbackValueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Valid"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderFeedbackValueTypeValid);
        }
        if ([value caseInsensitiveCompare:@"Invalid"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderFeedbackValueTypeInvalid);
        }
        return @(AWSCognitoIdentityProviderFeedbackValueTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderFeedbackValueTypeValid:
                return @"Valid";
            case AWSCognitoIdentityProviderFeedbackValueTypeInvalid:
                return @"Invalid";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderAdminUpdateAuthEventFeedbackResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAdminUpdateDeviceStatusRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"remembered"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderDeviceRememberedStatusTypeRemembered);
        }
        if ([value caseInsensitiveCompare:@"not_remembered"] == NSOrderedSame) {
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAdminUpdateUserAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientMetadata" : @"ClientMetadata",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAdminUserGlobalSignOutRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

@end

@implementation AWSCognitoIdentityProviderAdminUserGlobalSignOutResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderAnalyticsConfigurationType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationArn" : @"ApplicationArn",
             @"applicationId" : @"ApplicationId",
             @"externalId" : @"ExternalId",
             @"roleArn" : @"RoleArn",
             @"userDataShared" : @"UserDataShared",
             };
}

@end

@implementation AWSCognitoIdentityProviderAnalyticsMetadataType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyticsEndpointId" : @"AnalyticsEndpointId",
             };
}

@end

@implementation AWSCognitoIdentityProviderAssociateSoftwareTokenRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"session" : @"Session",
             };
}

@end

@implementation AWSCognitoIdentityProviderAssociateSoftwareTokenResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"secretCode" : @"SecretCode",
             @"session" : @"Session",
             };
}

@end

@implementation AWSCognitoIdentityProviderAttributeType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

@end

@implementation AWSCognitoIdentityProviderAuthEventType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"challengeResponses" : @"ChallengeResponses",
             @"creationDate" : @"CreationDate",
             @"eventContextData" : @"EventContextData",
             @"eventFeedback" : @"EventFeedback",
             @"eventId" : @"EventId",
             @"eventResponse" : @"EventResponse",
             @"eventRisk" : @"EventRisk",
             @"eventType" : @"EventType",
             };
}

+ (NSValueTransformer *)challengeResponsesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderChallengeResponseType class]];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)eventContextDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderEventContextDataType class]];
}

+ (NSValueTransformer *)eventFeedbackJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderEventFeedbackType class]];
}

+ (NSValueTransformer *)eventResponseJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderEventResponseTypeSuccess);
        }
        if ([value caseInsensitiveCompare:@"Failure"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderEventResponseTypeFailure);
        }
        return @(AWSCognitoIdentityProviderEventResponseTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderEventResponseTypeSuccess:
                return @"Success";
            case AWSCognitoIdentityProviderEventResponseTypeFailure:
                return @"Failure";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)eventRiskJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderEventRiskType class]];
}

+ (NSValueTransformer *)eventTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SignIn"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderEventTypeSignIn);
        }
        if ([value caseInsensitiveCompare:@"SignUp"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderEventTypeSignUp);
        }
        if ([value caseInsensitiveCompare:@"ForgotPassword"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderEventTypeForgotPassword);
        }
        return @(AWSCognitoIdentityProviderEventTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderEventTypeSignIn:
                return @"SignIn";
            case AWSCognitoIdentityProviderEventTypeSignUp:
                return @"SignUp";
            case AWSCognitoIdentityProviderEventTypeForgotPassword:
                return @"ForgotPassword";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderAuthenticationResultType

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSCognitoIdentityProviderChallengeResponseType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"challengeName" : @"ChallengeName",
             @"challengeResponse" : @"ChallengeResponse",
             };
}

+ (NSValueTransformer *)challengeNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Password"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNamePassword);
        }
        if ([value caseInsensitiveCompare:@"Mfa"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameMfa);
        }
        return @(AWSCognitoIdentityProviderChallengeNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderChallengeNamePassword:
                return @"Password";
            case AWSCognitoIdentityProviderChallengeNameMfa:
                return @"Mfa";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)challengeResponseJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Success"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeResponseSuccess);
        }
        if ([value caseInsensitiveCompare:@"Failure"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeResponseFailure);
        }
        return @(AWSCognitoIdentityProviderChallengeResponseUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderChallengeResponseSuccess:
                return @"Success";
            case AWSCognitoIdentityProviderChallengeResponseFailure:
                return @"Failure";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderChangePasswordRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"previousPassword" : @"PreviousPassword",
             @"proposedPassword" : @"ProposedPassword",
             };
}

@end

@implementation AWSCognitoIdentityProviderChangePasswordResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderCodeDeliveryDetailsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"deliveryMedium" : @"DeliveryMedium",
             @"destination" : @"Destination",
             };
}

+ (NSValueTransformer *)deliveryMediumJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderDeliveryMediumTypeSms);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
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

@implementation AWSCognitoIdentityProviderCompromisedCredentialsActionsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventAction" : @"EventAction",
             };
}

+ (NSValueTransformer *)eventActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderCompromisedCredentialsEventActionTypeBlock);
        }
        if ([value caseInsensitiveCompare:@"NO_ACTION"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderCompromisedCredentialsEventActionTypeNoAction);
        }
        return @(AWSCognitoIdentityProviderCompromisedCredentialsEventActionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderCompromisedCredentialsEventActionTypeBlock:
                return @"BLOCK";
            case AWSCognitoIdentityProviderCompromisedCredentialsEventActionTypeNoAction:
                return @"NO_ACTION";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderCompromisedCredentialsRiskConfigurationType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"actions" : @"Actions",
             @"eventFilter" : @"EventFilter",
             };
}

+ (NSValueTransformer *)actionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCompromisedCredentialsActionsType class]];
}

@end

@implementation AWSCognitoIdentityProviderConfirmDeviceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userConfirmationNecessary" : @"UserConfirmationNecessary",
             };
}

@end

@implementation AWSCognitoIdentityProviderConfirmForgotPasswordRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyticsMetadata" : @"AnalyticsMetadata",
             @"clientId" : @"ClientId",
             @"clientMetadata" : @"ClientMetadata",
             @"confirmationCode" : @"ConfirmationCode",
             @"password" : @"Password",
             @"secretHash" : @"SecretHash",
             @"userContextData" : @"UserContextData",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)analyticsMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAnalyticsMetadataType class]];
}

+ (NSValueTransformer *)userContextDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserContextDataType class]];
}

@end

@implementation AWSCognitoIdentityProviderConfirmForgotPasswordResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderConfirmSignUpRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyticsMetadata" : @"AnalyticsMetadata",
             @"clientId" : @"ClientId",
             @"clientMetadata" : @"ClientMetadata",
             @"confirmationCode" : @"ConfirmationCode",
             @"forceAliasCreation" : @"ForceAliasCreation",
             @"secretHash" : @"SecretHash",
             @"userContextData" : @"UserContextData",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)analyticsMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAnalyticsMetadataType class]];
}

+ (NSValueTransformer *)userContextDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserContextDataType class]];
}

@end

@implementation AWSCognitoIdentityProviderConfirmSignUpResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderContextDataType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encodedData" : @"EncodedData",
             @"httpHeaders" : @"HttpHeaders",
             @"ipAddress" : @"IpAddress",
             @"serverName" : @"ServerName",
             @"serverPath" : @"ServerPath",
             };
}

+ (NSValueTransformer *)httpHeadersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderHttpHeader class]];
}

@end

@implementation AWSCognitoIdentityProviderCreateGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"groupName" : @"GroupName",
             @"precedence" : @"Precedence",
             @"roleArn" : @"RoleArn",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderCreateGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"group" : @"Group",
             };
}

+ (NSValueTransformer *)groupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderGroupType class]];
}

@end

@implementation AWSCognitoIdentityProviderCreateIdentityProviderRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeMapping" : @"AttributeMapping",
             @"idpIdentifiers" : @"IdpIdentifiers",
             @"providerDetails" : @"ProviderDetails",
             @"providerName" : @"ProviderName",
             @"providerType" : @"ProviderType",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)providerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAML"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeSaml);
        }
        if ([value caseInsensitiveCompare:@"Facebook"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeFacebook);
        }
        if ([value caseInsensitiveCompare:@"Google"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeGoogle);
        }
        if ([value caseInsensitiveCompare:@"LoginWithAmazon"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeLoginWithAmazon);
        }
        if ([value caseInsensitiveCompare:@"SignInWithApple"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeSignInWithApple);
        }
        if ([value caseInsensitiveCompare:@"OIDC"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeOidc);
        }
        return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeSaml:
                return @"SAML";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeFacebook:
                return @"Facebook";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeGoogle:
                return @"Google";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeLoginWithAmazon:
                return @"LoginWithAmazon";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeSignInWithApple:
                return @"SignInWithApple";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeOidc:
                return @"OIDC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderCreateIdentityProviderResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityProvider" : @"IdentityProvider",
             };
}

+ (NSValueTransformer *)identityProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderIdentityProviderType class]];
}

@end

@implementation AWSCognitoIdentityProviderCreateResourceServerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Identifier",
             @"name" : @"Name",
             @"scopes" : @"Scopes",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)scopesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderResourceServerScopeType class]];
}

@end

@implementation AWSCognitoIdentityProviderCreateResourceServerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceServer" : @"ResourceServer",
             };
}

+ (NSValueTransformer *)resourceServerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderResourceServerType class]];
}

@end

@implementation AWSCognitoIdentityProviderCreateUserImportJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogsRoleArn" : @"CloudWatchLogsRoleArn",
             @"jobName" : @"JobName",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderCreateUserImportJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userImportJob" : @"UserImportJob",
             };
}

+ (NSValueTransformer *)userImportJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserImportJobType class]];
}

@end

@implementation AWSCognitoIdentityProviderCreateUserPoolClientRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessTokenValidity" : @"AccessTokenValidity",
             @"allowedOAuthFlows" : @"AllowedOAuthFlows",
             @"allowedOAuthFlowsUserPoolClient" : @"AllowedOAuthFlowsUserPoolClient",
             @"allowedOAuthScopes" : @"AllowedOAuthScopes",
             @"analyticsConfiguration" : @"AnalyticsConfiguration",
             @"callbackURLs" : @"CallbackURLs",
             @"clientName" : @"ClientName",
             @"defaultRedirectURI" : @"DefaultRedirectURI",
             @"enableTokenRevocation" : @"EnableTokenRevocation",
             @"explicitAuthFlows" : @"ExplicitAuthFlows",
             @"generateSecret" : @"GenerateSecret",
             @"idTokenValidity" : @"IdTokenValidity",
             @"logoutURLs" : @"LogoutURLs",
             @"preventUserExistenceErrors" : @"PreventUserExistenceErrors",
             @"readAttributes" : @"ReadAttributes",
             @"refreshTokenValidity" : @"RefreshTokenValidity",
             @"supportedIdentityProviders" : @"SupportedIdentityProviders",
             @"tokenValidityUnits" : @"TokenValidityUnits",
             @"userPoolId" : @"UserPoolId",
             @"writeAttributes" : @"WriteAttributes",
             };
}

+ (NSValueTransformer *)analyticsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAnalyticsConfigurationType class]];
}

+ (NSValueTransformer *)preventUserExistenceErrorsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LEGACY"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderPreventUserExistenceErrorTypesLegacy);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderPreventUserExistenceErrorTypesEnabled);
        }
        return @(AWSCognitoIdentityProviderPreventUserExistenceErrorTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderPreventUserExistenceErrorTypesLegacy:
                return @"LEGACY";
            case AWSCognitoIdentityProviderPreventUserExistenceErrorTypesEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tokenValidityUnitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderTokenValidityUnitsType class]];
}

@end

@implementation AWSCognitoIdentityProviderCreateUserPoolClientResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolClient" : @"UserPoolClient",
             };
}

+ (NSValueTransformer *)userPoolClientJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolClientType class]];
}

@end

@implementation AWSCognitoIdentityProviderCreateUserPoolDomainRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customDomainConfig" : @"CustomDomainConfig",
             @"domain" : @"Domain",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)customDomainConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCustomDomainConfigType class]];
}

@end

@implementation AWSCognitoIdentityProviderCreateUserPoolDomainResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudFrontDomain" : @"CloudFrontDomain",
             };
}

@end

@implementation AWSCognitoIdentityProviderCreateUserPoolRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountRecoverySetting" : @"AccountRecoverySetting",
             @"adminCreateUserConfig" : @"AdminCreateUserConfig",
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
             @"schema" : @"Schema",
             @"smsAuthenticationMessage" : @"SmsAuthenticationMessage",
             @"smsConfiguration" : @"SmsConfiguration",
             @"smsVerificationMessage" : @"SmsVerificationMessage",
             @"userPoolAddOns" : @"UserPoolAddOns",
             @"userPoolTags" : @"UserPoolTags",
             @"usernameAttributes" : @"UsernameAttributes",
             @"usernameConfiguration" : @"UsernameConfiguration",
             @"verificationMessageTemplate" : @"VerificationMessageTemplate",
             };
}

+ (NSValueTransformer *)accountRecoverySettingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAccountRecoverySettingType class]];
}

+ (NSValueTransformer *)adminCreateUserConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAdminCreateUserConfigType class]];
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
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOff);
        }
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOn);
        }
        if ([value caseInsensitiveCompare:@"OPTIONAL"] == NSOrderedSame) {
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

+ (NSValueTransformer *)schemaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderSchemaAttributeType class]];
}

+ (NSValueTransformer *)smsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSmsConfigurationType class]];
}

+ (NSValueTransformer *)userPoolAddOnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolAddOnsType class]];
}

+ (NSValueTransformer *)usernameConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUsernameConfigurationType class]];
}

+ (NSValueTransformer *)verificationMessageTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderVerificationMessageTemplateType class]];
}

@end

@implementation AWSCognitoIdentityProviderCreateUserPoolResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPool" : @"UserPool",
             };
}

+ (NSValueTransformer *)userPoolJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolType class]];
}

@end

@implementation AWSCognitoIdentityProviderCustomDomainConfigType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificateArn" : @"CertificateArn",
             };
}

@end

@implementation AWSCognitoIdentityProviderCustomEmailLambdaVersionConfigType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lambdaArn" : @"LambdaArn",
             @"lambdaVersion" : @"LambdaVersion",
             };
}

+ (NSValueTransformer *)lambdaVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"V1_0"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderCustomEmailSenderLambdaVersionTypeV10);
        }
        return @(AWSCognitoIdentityProviderCustomEmailSenderLambdaVersionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderCustomEmailSenderLambdaVersionTypeV10:
                return @"V1_0";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderCustomSMSLambdaVersionConfigType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lambdaArn" : @"LambdaArn",
             @"lambdaVersion" : @"LambdaVersion",
             };
}

+ (NSValueTransformer *)lambdaVersionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"V1_0"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderCustomSMSSenderLambdaVersionTypeV10);
        }
        return @(AWSCognitoIdentityProviderCustomSMSSenderLambdaVersionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderCustomSMSSenderLambdaVersionTypeV10:
                return @"V1_0";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderDeleteGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDeleteIdentityProviderRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"providerName" : @"ProviderName",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDeleteResourceServerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Identifier",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDeleteUserAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"userAttributeNames" : @"UserAttributeNames",
             };
}

@end

@implementation AWSCognitoIdentityProviderDeleteUserAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderDeleteUserPoolClientRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDeleteUserPoolDomainRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDeleteUserPoolDomainResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderDeleteUserPoolRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDeleteUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             };
}

@end

@implementation AWSCognitoIdentityProviderDescribeIdentityProviderRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"providerName" : @"ProviderName",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDescribeIdentityProviderResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityProvider" : @"IdentityProvider",
             };
}

+ (NSValueTransformer *)identityProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderIdentityProviderType class]];
}

@end

@implementation AWSCognitoIdentityProviderDescribeResourceServerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Identifier",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDescribeResourceServerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceServer" : @"ResourceServer",
             };
}

+ (NSValueTransformer *)resourceServerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderResourceServerType class]];
}

@end

@implementation AWSCognitoIdentityProviderDescribeRiskConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDescribeRiskConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"riskConfiguration" : @"RiskConfiguration",
             };
}

+ (NSValueTransformer *)riskConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderRiskConfigurationType class]];
}

@end

@implementation AWSCognitoIdentityProviderDescribeUserImportJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDescribeUserImportJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userImportJob" : @"UserImportJob",
             };
}

+ (NSValueTransformer *)userImportJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserImportJobType class]];
}

@end

@implementation AWSCognitoIdentityProviderDescribeUserPoolClientRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDescribeUserPoolClientResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolClient" : @"UserPoolClient",
             };
}

+ (NSValueTransformer *)userPoolClientJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolClientType class]];
}

@end

@implementation AWSCognitoIdentityProviderDescribeUserPoolDomainRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domain" : @"Domain",
             };
}

@end

@implementation AWSCognitoIdentityProviderDescribeUserPoolDomainResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"domainDescription" : @"DomainDescription",
             };
}

+ (NSValueTransformer *)domainDescriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderDomainDescriptionType class]];
}

@end

@implementation AWSCognitoIdentityProviderDescribeUserPoolRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderDescribeUserPoolResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"challengeRequiredOnNewDevice" : @"ChallengeRequiredOnNewDevice",
             @"deviceOnlyRememberedOnUserPrompt" : @"DeviceOnlyRememberedOnUserPrompt",
             };
}

@end

@implementation AWSCognitoIdentityProviderDeviceSecretVerifierConfigType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"passwordVerifier" : @"PasswordVerifier",
             @"salt" : @"Salt",
             };
}

@end

@implementation AWSCognitoIdentityProviderDeviceType

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSCognitoIdentityProviderDomainDescriptionType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"AWSAccountId" : @"AWSAccountId",
             @"cloudFrontDistribution" : @"CloudFrontDistribution",
             @"customDomainConfig" : @"CustomDomainConfig",
             @"domain" : @"Domain",
             @"s3Bucket" : @"S3Bucket",
             @"status" : @"Status",
             @"userPoolId" : @"UserPoolId",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)customDomainConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCustomDomainConfigType class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATING"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderDomainStatusTypeCreating);
        }
        if ([value caseInsensitiveCompare:@"DELETING"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderDomainStatusTypeDeleting);
        }
        if ([value caseInsensitiveCompare:@"UPDATING"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderDomainStatusTypeUpdating);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderDomainStatusTypeActive);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderDomainStatusTypeFailed);
        }
        return @(AWSCognitoIdentityProviderDomainStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderDomainStatusTypeCreating:
                return @"CREATING";
            case AWSCognitoIdentityProviderDomainStatusTypeDeleting:
                return @"DELETING";
            case AWSCognitoIdentityProviderDomainStatusTypeUpdating:
                return @"UPDATING";
            case AWSCognitoIdentityProviderDomainStatusTypeActive:
                return @"ACTIVE";
            case AWSCognitoIdentityProviderDomainStatusTypeFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderEmailConfigurationType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSet" : @"ConfigurationSet",
             @"emailSendingAccount" : @"EmailSendingAccount",
             @"from" : @"From",
             @"replyToEmailAddress" : @"ReplyToEmailAddress",
             @"sourceArn" : @"SourceArn",
             };
}

+ (NSValueTransformer *)emailSendingAccountJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"COGNITO_DEFAULT"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderEmailSendingAccountTypeCognitoDefault);
        }
        if ([value caseInsensitiveCompare:@"DEVELOPER"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderEmailSendingAccountTypeDeveloper);
        }
        return @(AWSCognitoIdentityProviderEmailSendingAccountTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderEmailSendingAccountTypeCognitoDefault:
                return @"COGNITO_DEFAULT";
            case AWSCognitoIdentityProviderEmailSendingAccountTypeDeveloper:
                return @"DEVELOPER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderEventContextDataType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"city" : @"City",
             @"country" : @"Country",
             @"deviceName" : @"DeviceName",
             @"ipAddress" : @"IpAddress",
             @"timezone" : @"Timezone",
             };
}

@end

@implementation AWSCognitoIdentityProviderEventFeedbackType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"feedbackDate" : @"FeedbackDate",
             @"feedbackValue" : @"FeedbackValue",
             @"provider" : @"Provider",
             };
}

+ (NSValueTransformer *)feedbackDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)feedbackValueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Valid"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderFeedbackValueTypeValid);
        }
        if ([value caseInsensitiveCompare:@"Invalid"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderFeedbackValueTypeInvalid);
        }
        return @(AWSCognitoIdentityProviderFeedbackValueTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderFeedbackValueTypeValid:
                return @"Valid";
            case AWSCognitoIdentityProviderFeedbackValueTypeInvalid:
                return @"Invalid";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderEventRiskType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"compromisedCredentialsDetected" : @"CompromisedCredentialsDetected",
             @"riskDecision" : @"RiskDecision",
             @"riskLevel" : @"RiskLevel",
             };
}

+ (NSValueTransformer *)riskDecisionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NoRisk"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderRiskDecisionTypeNoRisk);
        }
        if ([value caseInsensitiveCompare:@"AccountTakeover"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderRiskDecisionTypeAccountTakeover);
        }
        if ([value caseInsensitiveCompare:@"Block"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderRiskDecisionTypeBlock);
        }
        return @(AWSCognitoIdentityProviderRiskDecisionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderRiskDecisionTypeNoRisk:
                return @"NoRisk";
            case AWSCognitoIdentityProviderRiskDecisionTypeAccountTakeover:
                return @"AccountTakeover";
            case AWSCognitoIdentityProviderRiskDecisionTypeBlock:
                return @"Block";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)riskLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Low"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderRiskLevelTypeLow);
        }
        if ([value caseInsensitiveCompare:@"Medium"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderRiskLevelTypeMedium);
        }
        if ([value caseInsensitiveCompare:@"High"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderRiskLevelTypeHigh);
        }
        return @(AWSCognitoIdentityProviderRiskLevelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderRiskLevelTypeLow:
                return @"Low";
            case AWSCognitoIdentityProviderRiskLevelTypeMedium:
                return @"Medium";
            case AWSCognitoIdentityProviderRiskLevelTypeHigh:
                return @"High";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderForgetDeviceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"deviceKey" : @"DeviceKey",
             };
}

@end

@implementation AWSCognitoIdentityProviderForgotPasswordRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyticsMetadata" : @"AnalyticsMetadata",
             @"clientId" : @"ClientId",
             @"clientMetadata" : @"ClientMetadata",
             @"secretHash" : @"SecretHash",
             @"userContextData" : @"UserContextData",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)analyticsMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAnalyticsMetadataType class]];
}

+ (NSValueTransformer *)userContextDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserContextDataType class]];
}

@end

@implementation AWSCognitoIdentityProviderForgotPasswordResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeDeliveryDetails" : @"CodeDeliveryDetails",
             };
}

+ (NSValueTransformer *)codeDeliveryDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCodeDeliveryDetailsType class]];
}

@end

@implementation AWSCognitoIdentityProviderGetCSVHeaderRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetCSVHeaderResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CSVHeader" : @"CSVHeader",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetDeviceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"deviceKey" : @"DeviceKey",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetDeviceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"device" : @"Device",
             };
}

+ (NSValueTransformer *)deviceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderDeviceType class]];
}

@end

@implementation AWSCognitoIdentityProviderGetGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"group" : @"Group",
             };
}

+ (NSValueTransformer *)groupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderGroupType class]];
}

@end

@implementation AWSCognitoIdentityProviderGetIdentityProviderByIdentifierRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"idpIdentifier" : @"IdpIdentifier",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetIdentityProviderByIdentifierResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityProvider" : @"IdentityProvider",
             };
}

+ (NSValueTransformer *)identityProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderIdentityProviderType class]];
}

@end

@implementation AWSCognitoIdentityProviderGetSigningCertificateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetSigningCertificateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"certificate" : @"Certificate",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetUICustomizationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetUICustomizationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"UICustomization" : @"UICustomization",
             };
}

+ (NSValueTransformer *)UICustomizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUICustomizationType class]];
}

@end

@implementation AWSCognitoIdentityProviderGetUserAttributeVerificationCodeRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"attributeName" : @"AttributeName",
             @"clientMetadata" : @"ClientMetadata",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetUserAttributeVerificationCodeResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeDeliveryDetails" : @"CodeDeliveryDetails",
             };
}

+ (NSValueTransformer *)codeDeliveryDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCodeDeliveryDetailsType class]];
}

@end

@implementation AWSCognitoIdentityProviderGetUserPoolMfaConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetUserPoolMfaConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mfaConfiguration" : @"MfaConfiguration",
             @"smsMfaConfiguration" : @"SmsMfaConfiguration",
             @"softwareTokenMfaConfiguration" : @"SoftwareTokenMfaConfiguration",
             };
}

+ (NSValueTransformer *)mfaConfigurationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOff);
        }
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOn);
        }
        if ([value caseInsensitiveCompare:@"OPTIONAL"] == NSOrderedSame) {
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

+ (NSValueTransformer *)smsMfaConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSmsMfaConfigType class]];
}

+ (NSValueTransformer *)softwareTokenMfaConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSoftwareTokenMfaConfigType class]];
}

@end

@implementation AWSCognitoIdentityProviderGetUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             };
}

@end

@implementation AWSCognitoIdentityProviderGetUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"MFAOptions" : @"MFAOptions",
             @"preferredMfaSetting" : @"PreferredMfaSetting",
             @"userAttributes" : @"UserAttributes",
             @"userMFASettingList" : @"UserMFASettingList",
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             };
}

@end

@implementation AWSCognitoIdentityProviderGlobalSignOutResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderGroupType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"CreationDate",
             @"detail" : @"Description",
             @"groupName" : @"GroupName",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"precedence" : @"Precedence",
             @"roleArn" : @"RoleArn",
             @"userPoolId" : @"UserPoolId",
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

@implementation AWSCognitoIdentityProviderHttpHeader

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"headerName" : @"headerName",
             @"headerValue" : @"headerValue",
             };
}

@end

@implementation AWSCognitoIdentityProviderIdentityProviderType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeMapping" : @"AttributeMapping",
             @"creationDate" : @"CreationDate",
             @"idpIdentifiers" : @"IdpIdentifiers",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"providerDetails" : @"ProviderDetails",
             @"providerName" : @"ProviderName",
             @"providerType" : @"ProviderType",
             @"userPoolId" : @"UserPoolId",
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

+ (NSValueTransformer *)providerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAML"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeSaml);
        }
        if ([value caseInsensitiveCompare:@"Facebook"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeFacebook);
        }
        if ([value caseInsensitiveCompare:@"Google"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeGoogle);
        }
        if ([value caseInsensitiveCompare:@"LoginWithAmazon"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeLoginWithAmazon);
        }
        if ([value caseInsensitiveCompare:@"SignInWithApple"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeSignInWithApple);
        }
        if ([value caseInsensitiveCompare:@"OIDC"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeOidc);
        }
        return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeSaml:
                return @"SAML";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeFacebook:
                return @"Facebook";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeGoogle:
                return @"Google";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeLoginWithAmazon:
                return @"LoginWithAmazon";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeSignInWithApple:
                return @"SignInWithApple";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeOidc:
                return @"OIDC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderInitiateAuthRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyticsMetadata" : @"AnalyticsMetadata",
             @"authFlow" : @"AuthFlow",
             @"authParameters" : @"AuthParameters",
             @"clientId" : @"ClientId",
             @"clientMetadata" : @"ClientMetadata",
             @"userContextData" : @"UserContextData",
             };
}

+ (NSValueTransformer *)analyticsMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAnalyticsMetadataType class]];
}

+ (NSValueTransformer *)authFlowJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"USER_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeUserSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"REFRESH_TOKEN_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeRefreshTokenAuth);
        }
        if ([value caseInsensitiveCompare:@"REFRESH_TOKEN"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeRefreshToken);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeCustomAuth);
        }
        if ([value caseInsensitiveCompare:@"ADMIN_NO_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeAdminNoSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"USER_PASSWORD_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeUserPasswordAuth);
        }
        if ([value caseInsensitiveCompare:@"ADMIN_USER_PASSWORD_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAuthFlowTypeAdminUserPasswordAuth);
        }
        return @(AWSCognitoIdentityProviderAuthFlowTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderAuthFlowTypeUserSrpAuth:
                return @"USER_SRP_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeRefreshTokenAuth:
                return @"REFRESH_TOKEN_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeRefreshToken:
                return @"REFRESH_TOKEN";
            case AWSCognitoIdentityProviderAuthFlowTypeCustomAuth:
                return @"CUSTOM_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeAdminNoSrpAuth:
                return @"ADMIN_NO_SRP_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeUserPasswordAuth:
                return @"USER_PASSWORD_AUTH";
            case AWSCognitoIdentityProviderAuthFlowTypeAdminUserPasswordAuth:
                return @"ADMIN_USER_PASSWORD_AUTH";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)userContextDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserContextDataType class]];
}

@end

@implementation AWSCognitoIdentityProviderInitiateAuthResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"SMS_MFA"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSmsMfa);
        }
        if ([value caseInsensitiveCompare:@"SOFTWARE_TOKEN_MFA"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa);
        }
        if ([value caseInsensitiveCompare:@"SELECT_MFA_TYPE"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType);
        }
        if ([value caseInsensitiveCompare:@"MFA_SETUP"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeMfaSetup);
        }
        if ([value caseInsensitiveCompare:@"PASSWORD_VERIFIER"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM_CHALLENGE"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_PASSWORD_VERIFIER"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier);
        }
        if ([value caseInsensitiveCompare:@"ADMIN_NO_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"NEW_PASSWORD_REQUIRED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired);
        }
        return @(AWSCognitoIdentityProviderChallengeNameTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderChallengeNameTypeSmsMfa:
                return @"SMS_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa:
                return @"SOFTWARE_TOKEN_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType:
                return @"SELECT_MFA_TYPE";
            case AWSCognitoIdentityProviderChallengeNameTypeMfaSetup:
                return @"MFA_SETUP";
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
            case AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired:
                return @"NEW_PASSWORD_REQUIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderLambdaConfigType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createAuthChallenge" : @"CreateAuthChallenge",
             @"customEmailSender" : @"CustomEmailSender",
             @"customMessage" : @"CustomMessage",
             @"customSMSSender" : @"CustomSMSSender",
             @"defineAuthChallenge" : @"DefineAuthChallenge",
             @"KMSKeyID" : @"KMSKeyID",
             @"postAuthentication" : @"PostAuthentication",
             @"postConfirmation" : @"PostConfirmation",
             @"preAuthentication" : @"PreAuthentication",
             @"preSignUp" : @"PreSignUp",
             @"preTokenGeneration" : @"PreTokenGeneration",
             @"userMigration" : @"UserMigration",
             @"verifyAuthChallengeResponse" : @"VerifyAuthChallengeResponse",
             };
}

+ (NSValueTransformer *)customEmailSenderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCustomEmailLambdaVersionConfigType class]];
}

+ (NSValueTransformer *)customSMSSenderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCustomSMSLambdaVersionConfigType class]];
}

@end

@implementation AWSCognitoIdentityProviderListDevicesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"limit" : @"Limit",
             @"paginationToken" : @"PaginationToken",
             };
}

@end

@implementation AWSCognitoIdentityProviderListDevicesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSCognitoIdentityProviderListGroupsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"limit" : @"Limit",
             @"nextToken" : @"NextToken",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderListGroupsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groups" : @"Groups",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderGroupType class]];
}

@end

@implementation AWSCognitoIdentityProviderListIdentityProvidersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderListIdentityProvidersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"providers" : @"Providers",
             };
}

+ (NSValueTransformer *)providersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderProviderDescription class]];
}

@end

@implementation AWSCognitoIdentityProviderListResourceServersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderListResourceServersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"resourceServers" : @"ResourceServers",
             };
}

+ (NSValueTransformer *)resourceServersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderResourceServerType class]];
}

@end

@implementation AWSCognitoIdentityProviderListTagsForResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSCognitoIdentityProviderListTagsForResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSCognitoIdentityProviderListUserImportJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"paginationToken" : @"PaginationToken",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderListUserImportJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"paginationToken" : @"PaginationToken",
             @"userImportJobs" : @"UserImportJobs",
             };
}

+ (NSValueTransformer *)userImportJobsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderUserImportJobType class]];
}

@end

@implementation AWSCognitoIdentityProviderListUserPoolClientsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderListUserPoolClientsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSCognitoIdentityProviderListUserPoolsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

@implementation AWSCognitoIdentityProviderListUsersInGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             @"limit" : @"Limit",
             @"nextToken" : @"NextToken",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderListUsersInGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"users" : @"Users",
             };
}

+ (NSValueTransformer *)usersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderUserType class]];
}

@end

@implementation AWSCognitoIdentityProviderListUsersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeName" : @"AttributeName",
             @"deliveryMedium" : @"DeliveryMedium",
             };
}

+ (NSValueTransformer *)deliveryMediumJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderDeliveryMediumTypeSms);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
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

@implementation AWSCognitoIdentityProviderMessageTemplateType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailMessage" : @"EmailMessage",
             @"emailSubject" : @"EmailSubject",
             @"SMSMessage" : @"SMSMessage",
             };
}

@end

@implementation AWSCognitoIdentityProviderLatestDeviceMetadataType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceGroupKey" : @"DeviceGroupKey",
             @"deviceKey" : @"DeviceKey",
             };
}

@end

@implementation AWSCognitoIdentityProviderNotifyConfigurationType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockEmail" : @"BlockEmail",
             @"from" : @"From",
             @"mfaEmail" : @"MfaEmail",
             @"noActionEmail" : @"NoActionEmail",
             @"replyTo" : @"ReplyTo",
             @"sourceArn" : @"SourceArn",
             };
}

+ (NSValueTransformer *)blockEmailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderNotifyEmailType class]];
}

+ (NSValueTransformer *)mfaEmailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderNotifyEmailType class]];
}

+ (NSValueTransformer *)noActionEmailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderNotifyEmailType class]];
}

@end

@implementation AWSCognitoIdentityProviderNotifyEmailType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"htmlBody" : @"HtmlBody",
             @"subject" : @"Subject",
             @"textBody" : @"TextBody",
             };
}

@end

@implementation AWSCognitoIdentityProviderNumberAttributeConstraintsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxValue" : @"MaxValue",
             @"minValue" : @"MinValue",
             };
}

@end

@implementation AWSCognitoIdentityProviderPasswordPolicyType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"minimumLength" : @"MinimumLength",
             @"requireLowercase" : @"RequireLowercase",
             @"requireNumbers" : @"RequireNumbers",
             @"requireSymbols" : @"RequireSymbols",
             @"requireUppercase" : @"RequireUppercase",
             @"temporaryPasswordValidityDays" : @"TemporaryPasswordValidityDays",
             };
}

@end

@implementation AWSCognitoIdentityProviderProviderDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"CreationDate",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"providerName" : @"ProviderName",
             @"providerType" : @"ProviderType",
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

+ (NSValueTransformer *)providerTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SAML"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeSaml);
        }
        if ([value caseInsensitiveCompare:@"Facebook"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeFacebook);
        }
        if ([value caseInsensitiveCompare:@"Google"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeGoogle);
        }
        if ([value caseInsensitiveCompare:@"LoginWithAmazon"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeLoginWithAmazon);
        }
        if ([value caseInsensitiveCompare:@"SignInWithApple"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeSignInWithApple);
        }
        if ([value caseInsensitiveCompare:@"OIDC"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeOidc);
        }
        return @(AWSCognitoIdentityProviderIdentityProviderTypeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeSaml:
                return @"SAML";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeFacebook:
                return @"Facebook";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeGoogle:
                return @"Google";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeLoginWithAmazon:
                return @"LoginWithAmazon";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeSignInWithApple:
                return @"SignInWithApple";
            case AWSCognitoIdentityProviderIdentityProviderTypeTypeOidc:
                return @"OIDC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderProviderUserIdentifierType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"providerAttributeName" : @"ProviderAttributeName",
             @"providerAttributeValue" : @"ProviderAttributeValue",
             @"providerName" : @"ProviderName",
             };
}

@end

@implementation AWSCognitoIdentityProviderRecoveryOptionType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"priority" : @"Priority",
             };
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"verified_email"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderRecoveryOptionNameTypeVerifiedEmail);
        }
        if ([value caseInsensitiveCompare:@"verified_phone_number"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderRecoveryOptionNameTypeVerifiedPhoneNumber);
        }
        if ([value caseInsensitiveCompare:@"admin_only"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderRecoveryOptionNameTypeAdminOnly);
        }
        return @(AWSCognitoIdentityProviderRecoveryOptionNameTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderRecoveryOptionNameTypeVerifiedEmail:
                return @"verified_email";
            case AWSCognitoIdentityProviderRecoveryOptionNameTypeVerifiedPhoneNumber:
                return @"verified_phone_number";
            case AWSCognitoIdentityProviderRecoveryOptionNameTypeAdminOnly:
                return @"admin_only";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderResendConfirmationCodeRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyticsMetadata" : @"AnalyticsMetadata",
             @"clientId" : @"ClientId",
             @"clientMetadata" : @"ClientMetadata",
             @"secretHash" : @"SecretHash",
             @"userContextData" : @"UserContextData",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)analyticsMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAnalyticsMetadataType class]];
}

+ (NSValueTransformer *)userContextDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserContextDataType class]];
}

@end

@implementation AWSCognitoIdentityProviderResendConfirmationCodeResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeDeliveryDetails" : @"CodeDeliveryDetails",
             };
}

+ (NSValueTransformer *)codeDeliveryDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCodeDeliveryDetailsType class]];
}

@end

@implementation AWSCognitoIdentityProviderResourceServerScopeType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"scopeDescription" : @"ScopeDescription",
             @"scopeName" : @"ScopeName",
             };
}

@end

@implementation AWSCognitoIdentityProviderResourceServerType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Identifier",
             @"name" : @"Name",
             @"scopes" : @"Scopes",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)scopesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderResourceServerScopeType class]];
}

@end

@implementation AWSCognitoIdentityProviderRespondToAuthChallengeRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyticsMetadata" : @"AnalyticsMetadata",
             @"challengeName" : @"ChallengeName",
             @"challengeResponses" : @"ChallengeResponses",
             @"clientId" : @"ClientId",
             @"clientMetadata" : @"ClientMetadata",
             @"session" : @"Session",
             @"userContextData" : @"UserContextData",
             };
}

+ (NSValueTransformer *)analyticsMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAnalyticsMetadataType class]];
}

+ (NSValueTransformer *)challengeNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SMS_MFA"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSmsMfa);
        }
        if ([value caseInsensitiveCompare:@"SOFTWARE_TOKEN_MFA"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa);
        }
        if ([value caseInsensitiveCompare:@"SELECT_MFA_TYPE"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType);
        }
        if ([value caseInsensitiveCompare:@"MFA_SETUP"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeMfaSetup);
        }
        if ([value caseInsensitiveCompare:@"PASSWORD_VERIFIER"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM_CHALLENGE"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_PASSWORD_VERIFIER"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier);
        }
        if ([value caseInsensitiveCompare:@"ADMIN_NO_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"NEW_PASSWORD_REQUIRED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired);
        }
        return @(AWSCognitoIdentityProviderChallengeNameTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderChallengeNameTypeSmsMfa:
                return @"SMS_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa:
                return @"SOFTWARE_TOKEN_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType:
                return @"SELECT_MFA_TYPE";
            case AWSCognitoIdentityProviderChallengeNameTypeMfaSetup:
                return @"MFA_SETUP";
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
            case AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired:
                return @"NEW_PASSWORD_REQUIRED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)userContextDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserContextDataType class]];
}

@end

@implementation AWSCognitoIdentityProviderRespondToAuthChallengeResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"SMS_MFA"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSmsMfa);
        }
        if ([value caseInsensitiveCompare:@"SOFTWARE_TOKEN_MFA"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa);
        }
        if ([value caseInsensitiveCompare:@"SELECT_MFA_TYPE"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType);
        }
        if ([value caseInsensitiveCompare:@"MFA_SETUP"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeMfaSetup);
        }
        if ([value caseInsensitiveCompare:@"PASSWORD_VERIFIER"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypePasswordVerifier);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM_CHALLENGE"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeCustomChallenge);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDeviceSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"DEVICE_PASSWORD_VERIFIER"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeDevicePasswordVerifier);
        }
        if ([value caseInsensitiveCompare:@"ADMIN_NO_SRP_AUTH"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeAdminNoSrpAuth);
        }
        if ([value caseInsensitiveCompare:@"NEW_PASSWORD_REQUIRED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired);
        }
        return @(AWSCognitoIdentityProviderChallengeNameTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderChallengeNameTypeSmsMfa:
                return @"SMS_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypeSoftwareTokenMfa:
                return @"SOFTWARE_TOKEN_MFA";
            case AWSCognitoIdentityProviderChallengeNameTypeSelectMfaType:
                return @"SELECT_MFA_TYPE";
            case AWSCognitoIdentityProviderChallengeNameTypeMfaSetup:
                return @"MFA_SETUP";
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
            case AWSCognitoIdentityProviderChallengeNameTypeNewPasswordRequired:
                return @"NEW_PASSWORD_REQUIRED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderRevokeTokenRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"clientSecret" : @"ClientSecret",
             @"token" : @"Token",
             };
}

@end

@implementation AWSCognitoIdentityProviderRevokeTokenResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderRiskConfigurationType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountTakeoverRiskConfiguration" : @"AccountTakeoverRiskConfiguration",
             @"clientId" : @"ClientId",
             @"compromisedCredentialsRiskConfiguration" : @"CompromisedCredentialsRiskConfiguration",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"riskExceptionConfiguration" : @"RiskExceptionConfiguration",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)accountTakeoverRiskConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAccountTakeoverRiskConfigurationType class]];
}

+ (NSValueTransformer *)compromisedCredentialsRiskConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCompromisedCredentialsRiskConfigurationType class]];
}

+ (NSValueTransformer *)lastModifiedDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)riskExceptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderRiskExceptionConfigurationType class]];
}

@end

@implementation AWSCognitoIdentityProviderRiskExceptionConfigurationType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blockedIPRangeList" : @"BlockedIPRangeList",
             @"skippedIPRangeList" : @"SkippedIPRangeList",
             };
}

@end

@implementation AWSCognitoIdentityProviderSMSMfaSettingsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"preferredMfa" : @"PreferredMfa",
             };
}

@end

@implementation AWSCognitoIdentityProviderSchemaAttributeType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeDataType" : @"AttributeDataType",
             @"developerOnlyAttribute" : @"DeveloperOnlyAttribute",
             @"varying" : @"Mutable",
             @"name" : @"Name",
             @"numberAttributeConstraints" : @"NumberAttributeConstraints",
             @"required" : @"Required",
             @"stringAttributeConstraints" : @"StringAttributeConstraints",
             };
}

+ (NSValueTransformer *)attributeDataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"String"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAttributeDataTypeString);
        }
        if ([value caseInsensitiveCompare:@"Number"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAttributeDataTypeNumber);
        }
        if ([value caseInsensitiveCompare:@"DateTime"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAttributeDataTypeDateTime);
        }
        if ([value caseInsensitiveCompare:@"Boolean"] == NSOrderedSame) {
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

@implementation AWSCognitoIdentityProviderSetRiskConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountTakeoverRiskConfiguration" : @"AccountTakeoverRiskConfiguration",
             @"clientId" : @"ClientId",
             @"compromisedCredentialsRiskConfiguration" : @"CompromisedCredentialsRiskConfiguration",
             @"riskExceptionConfiguration" : @"RiskExceptionConfiguration",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)accountTakeoverRiskConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAccountTakeoverRiskConfigurationType class]];
}

+ (NSValueTransformer *)compromisedCredentialsRiskConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCompromisedCredentialsRiskConfigurationType class]];
}

+ (NSValueTransformer *)riskExceptionConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderRiskExceptionConfigurationType class]];
}

@end

@implementation AWSCognitoIdentityProviderSetRiskConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"riskConfiguration" : @"RiskConfiguration",
             };
}

+ (NSValueTransformer *)riskConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderRiskConfigurationType class]];
}

@end

@implementation AWSCognitoIdentityProviderSetUICustomizationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CSS" : @"CSS",
             @"clientId" : @"ClientId",
             @"imageFile" : @"ImageFile",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderSetUICustomizationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"UICustomization" : @"UICustomization",
             };
}

+ (NSValueTransformer *)UICustomizationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUICustomizationType class]];
}

@end

@implementation AWSCognitoIdentityProviderSetUserMFAPreferenceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"SMSMfaSettings" : @"SMSMfaSettings",
             @"softwareTokenMfaSettings" : @"SoftwareTokenMfaSettings",
             };
}

+ (NSValueTransformer *)SMSMfaSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSMSMfaSettingsType class]];
}

+ (NSValueTransformer *)softwareTokenMfaSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSoftwareTokenMfaSettingsType class]];
}

@end

@implementation AWSCognitoIdentityProviderSetUserMFAPreferenceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderSetUserPoolMfaConfigRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mfaConfiguration" : @"MfaConfiguration",
             @"smsMfaConfiguration" : @"SmsMfaConfiguration",
             @"softwareTokenMfaConfiguration" : @"SoftwareTokenMfaConfiguration",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)mfaConfigurationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOff);
        }
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOn);
        }
        if ([value caseInsensitiveCompare:@"OPTIONAL"] == NSOrderedSame) {
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

+ (NSValueTransformer *)smsMfaConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSmsMfaConfigType class]];
}

+ (NSValueTransformer *)softwareTokenMfaConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSoftwareTokenMfaConfigType class]];
}

@end

@implementation AWSCognitoIdentityProviderSetUserPoolMfaConfigResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mfaConfiguration" : @"MfaConfiguration",
             @"smsMfaConfiguration" : @"SmsMfaConfiguration",
             @"softwareTokenMfaConfiguration" : @"SoftwareTokenMfaConfiguration",
             };
}

+ (NSValueTransformer *)mfaConfigurationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOff);
        }
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOn);
        }
        if ([value caseInsensitiveCompare:@"OPTIONAL"] == NSOrderedSame) {
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

+ (NSValueTransformer *)smsMfaConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSmsMfaConfigType class]];
}

+ (NSValueTransformer *)softwareTokenMfaConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSoftwareTokenMfaConfigType class]];
}

@end

@implementation AWSCognitoIdentityProviderSetUserSettingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderSignUpRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"analyticsMetadata" : @"AnalyticsMetadata",
             @"clientId" : @"ClientId",
             @"clientMetadata" : @"ClientMetadata",
             @"password" : @"Password",
             @"secretHash" : @"SecretHash",
             @"userAttributes" : @"UserAttributes",
             @"userContextData" : @"UserContextData",
             @"username" : @"Username",
             @"validationData" : @"ValidationData",
             };
}

+ (NSValueTransformer *)analyticsMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAnalyticsMetadataType class]];
}

+ (NSValueTransformer *)userAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

+ (NSValueTransformer *)userContextDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserContextDataType class]];
}

+ (NSValueTransformer *)validationDataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

@end

@implementation AWSCognitoIdentityProviderSignUpResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"codeDeliveryDetails" : @"CodeDeliveryDetails",
             @"userConfirmed" : @"UserConfirmed",
             @"userSub" : @"UserSub",
             };
}

+ (NSValueTransformer *)codeDeliveryDetailsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCodeDeliveryDetailsType class]];
}

@end

@implementation AWSCognitoIdentityProviderSmsConfigurationType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"externalId" : @"ExternalId",
             @"snsCallerArn" : @"SnsCallerArn",
             @"snsRegion" : @"SnsRegion",
             };
}

@end

@implementation AWSCognitoIdentityProviderSmsMfaConfigType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"smsAuthenticationMessage" : @"SmsAuthenticationMessage",
             @"smsConfiguration" : @"SmsConfiguration",
             };
}

+ (NSValueTransformer *)smsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderSmsConfigurationType class]];
}

@end

@implementation AWSCognitoIdentityProviderSoftwareTokenMfaConfigType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSCognitoIdentityProviderSoftwareTokenMfaSettingsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"preferredMfa" : @"PreferredMfa",
             };
}

@end

@implementation AWSCognitoIdentityProviderStartUserImportJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderStartUserImportJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userImportJob" : @"UserImportJob",
             };
}

+ (NSValueTransformer *)userImportJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserImportJobType class]];
}

@end

@implementation AWSCognitoIdentityProviderStopUserImportJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"jobId" : @"JobId",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderStopUserImportJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userImportJob" : @"UserImportJob",
             };
}

+ (NSValueTransformer *)userImportJobJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserImportJobType class]];
}

@end

@implementation AWSCognitoIdentityProviderStringAttributeConstraintsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxLength" : @"MaxLength",
             @"minLength" : @"MinLength",
             };
}

@end

@implementation AWSCognitoIdentityProviderTagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSCognitoIdentityProviderTagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderTokenValidityUnitsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"idToken" : @"IdToken",
             @"refreshToken" : @"RefreshToken",
             };
}

+ (NSValueTransformer *)accessTokenJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"seconds"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderTimeUnitsTypeSeconds);
        }
        if ([value caseInsensitiveCompare:@"minutes"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderTimeUnitsTypeMinutes);
        }
        if ([value caseInsensitiveCompare:@"hours"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderTimeUnitsTypeHours);
        }
        if ([value caseInsensitiveCompare:@"days"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderTimeUnitsTypeDays);
        }
        return @(AWSCognitoIdentityProviderTimeUnitsTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderTimeUnitsTypeSeconds:
                return @"seconds";
            case AWSCognitoIdentityProviderTimeUnitsTypeMinutes:
                return @"minutes";
            case AWSCognitoIdentityProviderTimeUnitsTypeHours:
                return @"hours";
            case AWSCognitoIdentityProviderTimeUnitsTypeDays:
                return @"days";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)idTokenJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"seconds"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderTimeUnitsTypeSeconds);
        }
        if ([value caseInsensitiveCompare:@"minutes"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderTimeUnitsTypeMinutes);
        }
        if ([value caseInsensitiveCompare:@"hours"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderTimeUnitsTypeHours);
        }
        if ([value caseInsensitiveCompare:@"days"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderTimeUnitsTypeDays);
        }
        return @(AWSCognitoIdentityProviderTimeUnitsTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderTimeUnitsTypeSeconds:
                return @"seconds";
            case AWSCognitoIdentityProviderTimeUnitsTypeMinutes:
                return @"minutes";
            case AWSCognitoIdentityProviderTimeUnitsTypeHours:
                return @"hours";
            case AWSCognitoIdentityProviderTimeUnitsTypeDays:
                return @"days";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)refreshTokenJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"seconds"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderTimeUnitsTypeSeconds);
        }
        if ([value caseInsensitiveCompare:@"minutes"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderTimeUnitsTypeMinutes);
        }
        if ([value caseInsensitiveCompare:@"hours"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderTimeUnitsTypeHours);
        }
        if ([value caseInsensitiveCompare:@"days"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderTimeUnitsTypeDays);
        }
        return @(AWSCognitoIdentityProviderTimeUnitsTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderTimeUnitsTypeSeconds:
                return @"seconds";
            case AWSCognitoIdentityProviderTimeUnitsTypeMinutes:
                return @"minutes";
            case AWSCognitoIdentityProviderTimeUnitsTypeHours:
                return @"hours";
            case AWSCognitoIdentityProviderTimeUnitsTypeDays:
                return @"days";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderUICustomizationType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CSS" : @"CSS",
             @"CSSVersion" : @"CSSVersion",
             @"clientId" : @"ClientId",
             @"creationDate" : @"CreationDate",
             @"imageUrl" : @"ImageUrl",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"userPoolId" : @"UserPoolId",
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

@implementation AWSCognitoIdentityProviderUntagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSCognitoIdentityProviderUntagResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderUpdateAuthEventFeedbackRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventId" : @"EventId",
             @"feedbackToken" : @"FeedbackToken",
             @"feedbackValue" : @"FeedbackValue",
             @"userPoolId" : @"UserPoolId",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)feedbackValueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Valid"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderFeedbackValueTypeValid);
        }
        if ([value caseInsensitiveCompare:@"Invalid"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderFeedbackValueTypeInvalid);
        }
        return @(AWSCognitoIdentityProviderFeedbackValueTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderFeedbackValueTypeValid:
                return @"Valid";
            case AWSCognitoIdentityProviderFeedbackValueTypeInvalid:
                return @"Invalid";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderUpdateAuthEventFeedbackResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderUpdateDeviceStatusRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"deviceKey" : @"DeviceKey",
             @"deviceRememberedStatus" : @"DeviceRememberedStatus",
             };
}

+ (NSValueTransformer *)deviceRememberedStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"remembered"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderDeviceRememberedStatusTypeRemembered);
        }
        if ([value caseInsensitiveCompare:@"not_remembered"] == NSOrderedSame) {
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderUpdateGroupRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"groupName" : @"GroupName",
             @"precedence" : @"Precedence",
             @"roleArn" : @"RoleArn",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderUpdateGroupResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"group" : @"Group",
             };
}

+ (NSValueTransformer *)groupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderGroupType class]];
}

@end

@implementation AWSCognitoIdentityProviderUpdateIdentityProviderRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeMapping" : @"AttributeMapping",
             @"idpIdentifiers" : @"IdpIdentifiers",
             @"providerDetails" : @"ProviderDetails",
             @"providerName" : @"ProviderName",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderUpdateIdentityProviderResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identityProvider" : @"IdentityProvider",
             };
}

+ (NSValueTransformer *)identityProviderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderIdentityProviderType class]];
}

@end

@implementation AWSCognitoIdentityProviderUpdateResourceServerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Identifier",
             @"name" : @"Name",
             @"scopes" : @"Scopes",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)scopesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderResourceServerScopeType class]];
}

@end

@implementation AWSCognitoIdentityProviderUpdateResourceServerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceServer" : @"ResourceServer",
             };
}

+ (NSValueTransformer *)resourceServerJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderResourceServerType class]];
}

@end

@implementation AWSCognitoIdentityProviderUpdateUserAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"clientMetadata" : @"ClientMetadata",
             @"userAttributes" : @"UserAttributes",
             };
}

+ (NSValueTransformer *)userAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

@end

@implementation AWSCognitoIdentityProviderUpdateUserAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessTokenValidity" : @"AccessTokenValidity",
             @"allowedOAuthFlows" : @"AllowedOAuthFlows",
             @"allowedOAuthFlowsUserPoolClient" : @"AllowedOAuthFlowsUserPoolClient",
             @"allowedOAuthScopes" : @"AllowedOAuthScopes",
             @"analyticsConfiguration" : @"AnalyticsConfiguration",
             @"callbackURLs" : @"CallbackURLs",
             @"clientId" : @"ClientId",
             @"clientName" : @"ClientName",
             @"defaultRedirectURI" : @"DefaultRedirectURI",
             @"enableTokenRevocation" : @"EnableTokenRevocation",
             @"explicitAuthFlows" : @"ExplicitAuthFlows",
             @"idTokenValidity" : @"IdTokenValidity",
             @"logoutURLs" : @"LogoutURLs",
             @"preventUserExistenceErrors" : @"PreventUserExistenceErrors",
             @"readAttributes" : @"ReadAttributes",
             @"refreshTokenValidity" : @"RefreshTokenValidity",
             @"supportedIdentityProviders" : @"SupportedIdentityProviders",
             @"tokenValidityUnits" : @"TokenValidityUnits",
             @"userPoolId" : @"UserPoolId",
             @"writeAttributes" : @"WriteAttributes",
             };
}

+ (NSValueTransformer *)analyticsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAnalyticsConfigurationType class]];
}

+ (NSValueTransformer *)preventUserExistenceErrorsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LEGACY"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderPreventUserExistenceErrorTypesLegacy);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderPreventUserExistenceErrorTypesEnabled);
        }
        return @(AWSCognitoIdentityProviderPreventUserExistenceErrorTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderPreventUserExistenceErrorTypesLegacy:
                return @"LEGACY";
            case AWSCognitoIdentityProviderPreventUserExistenceErrorTypesEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tokenValidityUnitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderTokenValidityUnitsType class]];
}

@end

@implementation AWSCognitoIdentityProviderUpdateUserPoolClientResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userPoolClient" : @"UserPoolClient",
             };
}

+ (NSValueTransformer *)userPoolClientJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolClientType class]];
}

@end

@implementation AWSCognitoIdentityProviderUpdateUserPoolDomainRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customDomainConfig" : @"CustomDomainConfig",
             @"domain" : @"Domain",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)customDomainConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderCustomDomainConfigType class]];
}

@end

@implementation AWSCognitoIdentityProviderUpdateUserPoolDomainResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudFrontDomain" : @"CloudFrontDomain",
             };
}

@end

@implementation AWSCognitoIdentityProviderUpdateUserPoolRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountRecoverySetting" : @"AccountRecoverySetting",
             @"adminCreateUserConfig" : @"AdminCreateUserConfig",
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
             @"userPoolAddOns" : @"UserPoolAddOns",
             @"userPoolId" : @"UserPoolId",
             @"userPoolTags" : @"UserPoolTags",
             @"verificationMessageTemplate" : @"VerificationMessageTemplate",
             };
}

+ (NSValueTransformer *)accountRecoverySettingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAccountRecoverySettingType class]];
}

+ (NSValueTransformer *)adminCreateUserConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAdminCreateUserConfigType class]];
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
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOff);
        }
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOn);
        }
        if ([value caseInsensitiveCompare:@"OPTIONAL"] == NSOrderedSame) {
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

+ (NSValueTransformer *)userPoolAddOnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolAddOnsType class]];
}

+ (NSValueTransformer *)verificationMessageTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderVerificationMessageTemplateType class]];
}

@end

@implementation AWSCognitoIdentityProviderUpdateUserPoolResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSCognitoIdentityProviderUserContextDataType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"encodedData" : @"EncodedData",
             };
}

@end

@implementation AWSCognitoIdentityProviderUserImportJobType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cloudWatchLogsRoleArn" : @"CloudWatchLogsRoleArn",
             @"completionDate" : @"CompletionDate",
             @"completionMessage" : @"CompletionMessage",
             @"creationDate" : @"CreationDate",
             @"failedUsers" : @"FailedUsers",
             @"importedUsers" : @"ImportedUsers",
             @"jobId" : @"JobId",
             @"jobName" : @"JobName",
             @"preSignedUrl" : @"PreSignedUrl",
             @"skippedUsers" : @"SkippedUsers",
             @"startDate" : @"StartDate",
             @"status" : @"Status",
             @"userPoolId" : @"UserPoolId",
             };
}

+ (NSValueTransformer *)completionDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)creationDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startDateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Created"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserImportJobStatusTypeCreated);
        }
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserImportJobStatusTypePending);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserImportJobStatusTypeInProgress);
        }
        if ([value caseInsensitiveCompare:@"Stopping"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserImportJobStatusTypeStopping);
        }
        if ([value caseInsensitiveCompare:@"Expired"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserImportJobStatusTypeExpired);
        }
        if ([value caseInsensitiveCompare:@"Stopped"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserImportJobStatusTypeStopped);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserImportJobStatusTypeFailed);
        }
        if ([value caseInsensitiveCompare:@"Succeeded"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserImportJobStatusTypeSucceeded);
        }
        return @(AWSCognitoIdentityProviderUserImportJobStatusTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderUserImportJobStatusTypeCreated:
                return @"Created";
            case AWSCognitoIdentityProviderUserImportJobStatusTypePending:
                return @"Pending";
            case AWSCognitoIdentityProviderUserImportJobStatusTypeInProgress:
                return @"InProgress";
            case AWSCognitoIdentityProviderUserImportJobStatusTypeStopping:
                return @"Stopping";
            case AWSCognitoIdentityProviderUserImportJobStatusTypeExpired:
                return @"Expired";
            case AWSCognitoIdentityProviderUserImportJobStatusTypeStopped:
                return @"Stopped";
            case AWSCognitoIdentityProviderUserImportJobStatusTypeFailed:
                return @"Failed";
            case AWSCognitoIdentityProviderUserImportJobStatusTypeSucceeded:
                return @"Succeeded";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderUserPoolAddOnsType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"advancedSecurityMode" : @"AdvancedSecurityMode",
             };
}

+ (NSValueTransformer *)advancedSecurityModeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAdvancedSecurityModeTypeOff);
        }
        if ([value caseInsensitiveCompare:@"AUDIT"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAdvancedSecurityModeTypeAudit);
        }
        if ([value caseInsensitiveCompare:@"ENFORCED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderAdvancedSecurityModeTypeEnforced);
        }
        return @(AWSCognitoIdentityProviderAdvancedSecurityModeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderAdvancedSecurityModeTypeOff:
                return @"OFF";
            case AWSCognitoIdentityProviderAdvancedSecurityModeTypeAudit:
                return @"AUDIT";
            case AWSCognitoIdentityProviderAdvancedSecurityModeTypeEnforced:
                return @"ENFORCED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderUserPoolClientDescription

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"clientName" : @"ClientName",
             @"userPoolId" : @"UserPoolId",
             };
}

@end

@implementation AWSCognitoIdentityProviderUserPoolClientType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessTokenValidity" : @"AccessTokenValidity",
             @"allowedOAuthFlows" : @"AllowedOAuthFlows",
             @"allowedOAuthFlowsUserPoolClient" : @"AllowedOAuthFlowsUserPoolClient",
             @"allowedOAuthScopes" : @"AllowedOAuthScopes",
             @"analyticsConfiguration" : @"AnalyticsConfiguration",
             @"callbackURLs" : @"CallbackURLs",
             @"clientId" : @"ClientId",
             @"clientName" : @"ClientName",
             @"clientSecret" : @"ClientSecret",
             @"creationDate" : @"CreationDate",
             @"defaultRedirectURI" : @"DefaultRedirectURI",
             @"enableTokenRevocation" : @"EnableTokenRevocation",
             @"explicitAuthFlows" : @"ExplicitAuthFlows",
             @"idTokenValidity" : @"IdTokenValidity",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"logoutURLs" : @"LogoutURLs",
             @"preventUserExistenceErrors" : @"PreventUserExistenceErrors",
             @"readAttributes" : @"ReadAttributes",
             @"refreshTokenValidity" : @"RefreshTokenValidity",
             @"supportedIdentityProviders" : @"SupportedIdentityProviders",
             @"tokenValidityUnits" : @"TokenValidityUnits",
             @"userPoolId" : @"UserPoolId",
             @"writeAttributes" : @"WriteAttributes",
             };
}

+ (NSValueTransformer *)analyticsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAnalyticsConfigurationType class]];
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

+ (NSValueTransformer *)preventUserExistenceErrorsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LEGACY"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderPreventUserExistenceErrorTypesLegacy);
        }
        if ([value caseInsensitiveCompare:@"ENABLED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderPreventUserExistenceErrorTypesEnabled);
        }
        return @(AWSCognitoIdentityProviderPreventUserExistenceErrorTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderPreventUserExistenceErrorTypesLegacy:
                return @"LEGACY";
            case AWSCognitoIdentityProviderPreventUserExistenceErrorTypesEnabled:
                return @"ENABLED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tokenValidityUnitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderTokenValidityUnitsType class]];
}

@end

@implementation AWSCognitoIdentityProviderUserPoolDescriptionType

+ (BOOL)supportsSecureCoding {
    return YES;
}

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
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderStatusTypeEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountRecoverySetting" : @"AccountRecoverySetting",
             @"adminCreateUserConfig" : @"AdminCreateUserConfig",
             @"aliasAttributes" : @"AliasAttributes",
             @"arn" : @"Arn",
             @"autoVerifiedAttributes" : @"AutoVerifiedAttributes",
             @"creationDate" : @"CreationDate",
             @"customDomain" : @"CustomDomain",
             @"deviceConfiguration" : @"DeviceConfiguration",
             @"domain" : @"Domain",
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
             @"userPoolAddOns" : @"UserPoolAddOns",
             @"userPoolTags" : @"UserPoolTags",
             @"usernameAttributes" : @"UsernameAttributes",
             @"usernameConfiguration" : @"UsernameConfiguration",
             @"verificationMessageTemplate" : @"VerificationMessageTemplate",
             };
}

+ (NSValueTransformer *)accountRecoverySettingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAccountRecoverySettingType class]];
}

+ (NSValueTransformer *)adminCreateUserConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderAdminCreateUserConfigType class]];
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
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOff);
        }
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserPoolMfaTypeOn);
        }
        if ([value caseInsensitiveCompare:@"OPTIONAL"] == NSOrderedSame) {
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
        if ([value caseInsensitiveCompare:@"Enabled"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderStatusTypeEnabled);
        }
        if ([value caseInsensitiveCompare:@"Disabled"] == NSOrderedSame) {
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

+ (NSValueTransformer *)userPoolAddOnsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUserPoolAddOnsType class]];
}

+ (NSValueTransformer *)usernameConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderUsernameConfigurationType class]];
}

+ (NSValueTransformer *)verificationMessageTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSCognitoIdentityProviderVerificationMessageTemplateType class]];
}

@end

@implementation AWSCognitoIdentityProviderUserType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"enabled" : @"Enabled",
             @"MFAOptions" : @"MFAOptions",
             @"userCreateDate" : @"UserCreateDate",
             @"userLastModifiedDate" : @"UserLastModifiedDate",
             @"userStatus" : @"UserStatus",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderAttributeType class]];
}

+ (NSValueTransformer *)MFAOptionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSCognitoIdentityProviderMFAOptionType class]];
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
        if ([value caseInsensitiveCompare:@"UNCONFIRMED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserStatusTypeUnconfirmed);
        }
        if ([value caseInsensitiveCompare:@"CONFIRMED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserStatusTypeConfirmed);
        }
        if ([value caseInsensitiveCompare:@"ARCHIVED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserStatusTypeArchived);
        }
        if ([value caseInsensitiveCompare:@"COMPROMISED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserStatusTypeCompromised);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserStatusTypeUnknown);
        }
        if ([value caseInsensitiveCompare:@"RESET_REQUIRED"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserStatusTypeResetRequired);
        }
        if ([value caseInsensitiveCompare:@"FORCE_CHANGE_PASSWORD"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderUserStatusTypeForceChangePassword);
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
            case AWSCognitoIdentityProviderUserStatusTypeForceChangePassword:
                return @"FORCE_CHANGE_PASSWORD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderUsernameConfigurationType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"caseSensitive" : @"CaseSensitive",
             };
}

@end

@implementation AWSCognitoIdentityProviderVerificationMessageTemplateType

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultEmailOption" : @"DefaultEmailOption",
             @"emailMessage" : @"EmailMessage",
             @"emailMessageByLink" : @"EmailMessageByLink",
             @"emailSubject" : @"EmailSubject",
             @"emailSubjectByLink" : @"EmailSubjectByLink",
             @"smsMessage" : @"SmsMessage",
             };
}

+ (NSValueTransformer *)defaultEmailOptionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONFIRM_WITH_LINK"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderDefaultEmailOptionTypeConfirmWithLink);
        }
        if ([value caseInsensitiveCompare:@"CONFIRM_WITH_CODE"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderDefaultEmailOptionTypeConfirmWithCode);
        }
        return @(AWSCognitoIdentityProviderDefaultEmailOptionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderDefaultEmailOptionTypeConfirmWithLink:
                return @"CONFIRM_WITH_LINK";
            case AWSCognitoIdentityProviderDefaultEmailOptionTypeConfirmWithCode:
                return @"CONFIRM_WITH_CODE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderVerifySoftwareTokenRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"friendlyDeviceName" : @"FriendlyDeviceName",
             @"session" : @"Session",
             @"userCode" : @"UserCode",
             };
}

@end

@implementation AWSCognitoIdentityProviderVerifySoftwareTokenResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"session" : @"Session",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCESS"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderVerifySoftwareTokenResponseTypeSuccess);
        }
        if ([value caseInsensitiveCompare:@"ERROR"] == NSOrderedSame) {
            return @(AWSCognitoIdentityProviderVerifySoftwareTokenResponseTypeError);
        }
        return @(AWSCognitoIdentityProviderVerifySoftwareTokenResponseTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSCognitoIdentityProviderVerifySoftwareTokenResponseTypeSuccess:
                return @"SUCCESS";
            case AWSCognitoIdentityProviderVerifySoftwareTokenResponseTypeError:
                return @"ERROR";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSCognitoIdentityProviderVerifyUserAttributeRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accessToken" : @"AccessToken",
             @"attributeName" : @"AttributeName",
             @"code" : @"Code",
             };
}

@end

@implementation AWSCognitoIdentityProviderVerifyUserAttributeResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
