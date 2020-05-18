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

#import "AWSChimeModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSChimeErrorDomain = @"com.amazonaws.AWSChimeErrorDomain";

@implementation AWSChimeAccount

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"accountType" : @"AccountType",
             @"awsAccountId" : @"AwsAccountId",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"defaultLicense" : @"DefaultLicense",
             @"name" : @"Name",
             @"signinDelegateGroups" : @"SigninDelegateGroups",
             @"supportedLicenses" : @"SupportedLicenses",
             };
}

+ (NSValueTransformer *)accountTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Team"] == NSOrderedSame) {
            return @(AWSChimeAccountTypeTeam);
        }
        if ([value caseInsensitiveCompare:@"EnterpriseDirectory"] == NSOrderedSame) {
            return @(AWSChimeAccountTypeEnterpriseDirectory);
        }
        if ([value caseInsensitiveCompare:@"EnterpriseLWA"] == NSOrderedSame) {
            return @(AWSChimeAccountTypeEnterpriseLWA);
        }
        if ([value caseInsensitiveCompare:@"EnterpriseOIDC"] == NSOrderedSame) {
            return @(AWSChimeAccountTypeEnterpriseOIDC);
        }
        return @(AWSChimeAccountTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeAccountTypeTeam:
                return @"Team";
            case AWSChimeAccountTypeEnterpriseDirectory:
                return @"EnterpriseDirectory";
            case AWSChimeAccountTypeEnterpriseLWA:
                return @"EnterpriseLWA";
            case AWSChimeAccountTypeEnterpriseOIDC:
                return @"EnterpriseOIDC";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)defaultLicenseJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Basic"] == NSOrderedSame) {
            return @(AWSChimeLicenseBasic);
        }
        if ([value caseInsensitiveCompare:@"Plus"] == NSOrderedSame) {
            return @(AWSChimeLicensePlus);
        }
        if ([value caseInsensitiveCompare:@"Pro"] == NSOrderedSame) {
            return @(AWSChimeLicensePro);
        }
        if ([value caseInsensitiveCompare:@"ProTrial"] == NSOrderedSame) {
            return @(AWSChimeLicenseProTrial);
        }
        return @(AWSChimeLicenseUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeLicenseBasic:
                return @"Basic";
            case AWSChimeLicensePlus:
                return @"Plus";
            case AWSChimeLicensePro:
                return @"Pro";
            case AWSChimeLicenseProTrial:
                return @"ProTrial";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)signinDelegateGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSigninDelegateGroup class]];
}

@end

@implementation AWSChimeAccountSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disableRemoteControl" : @"DisableRemoteControl",
             @"enableDialOut" : @"EnableDialOut",
             };
}

@end

@implementation AWSChimeAlexaForBusinessMetadata

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alexaForBusinessRoomArn" : @"AlexaForBusinessRoomArn",
             @"isAlexaForBusinessEnabled" : @"IsAlexaForBusinessEnabled",
             };
}

@end

@implementation AWSChimeAssociatePhoneNumberWithUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"e164PhoneNumber" : @"E164PhoneNumber",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSChimeAssociatePhoneNumberWithUserResponse

@end

@implementation AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"e164PhoneNumbers" : @"E164PhoneNumbers",
             @"forceAssociate" : @"ForceAssociate",
             @"voiceConnectorGroupId" : @"VoiceConnectorGroupId",
             };
}

@end

@implementation AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberErrors" : @"PhoneNumberErrors",
             };
}

+ (NSValueTransformer *)phoneNumberErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimePhoneNumberError class]];
}

@end

@implementation AWSChimeAssociatePhoneNumbersWithVoiceConnectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"e164PhoneNumbers" : @"E164PhoneNumbers",
             @"forceAssociate" : @"ForceAssociate",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeAssociatePhoneNumbersWithVoiceConnectorResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberErrors" : @"PhoneNumberErrors",
             };
}

+ (NSValueTransformer *)phoneNumberErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimePhoneNumberError class]];
}

@end

@implementation AWSChimeAssociateSigninDelegateGroupsWithAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"signinDelegateGroups" : @"SigninDelegateGroups",
             };
}

+ (NSValueTransformer *)signinDelegateGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSigninDelegateGroup class]];
}

@end

@implementation AWSChimeAssociateSigninDelegateGroupsWithAccountResponse

@end

@implementation AWSChimeAttendee

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attendeeId" : @"AttendeeId",
             @"externalUserId" : @"ExternalUserId",
             @"joinToken" : @"JoinToken",
             };
}

@end

@implementation AWSChimeBatchCreateAttendeeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attendees" : @"Attendees",
             @"meetingId" : @"MeetingId",
             };
}

+ (NSValueTransformer *)attendeesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeCreateAttendeeRequestItem class]];
}

@end

@implementation AWSChimeBatchCreateAttendeeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attendees" : @"Attendees",
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)attendeesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeAttendee class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeCreateAttendeeError class]];
}

@end

@implementation AWSChimeBatchCreateRoomMembershipRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"membershipItemList" : @"MembershipItemList",
             @"roomId" : @"RoomId",
             };
}

+ (NSValueTransformer *)membershipItemListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeMembershipItem class]];
}

@end

@implementation AWSChimeBatchCreateRoomMembershipResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeMemberError class]];
}

@end

@implementation AWSChimeBatchDeletePhoneNumberRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberIds" : @"PhoneNumberIds",
             };
}

@end

@implementation AWSChimeBatchDeletePhoneNumberResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberErrors" : @"PhoneNumberErrors",
             };
}

+ (NSValueTransformer *)phoneNumberErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimePhoneNumberError class]];
}

@end

@implementation AWSChimeBatchSuspendUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"userIdList" : @"UserIdList",
             };
}

@end

@implementation AWSChimeBatchSuspendUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userErrors" : @"UserErrors",
             };
}

+ (NSValueTransformer *)userErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeUserError class]];
}

@end

@implementation AWSChimeBatchUnsuspendUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"userIdList" : @"UserIdList",
             };
}

@end

@implementation AWSChimeBatchUnsuspendUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userErrors" : @"UserErrors",
             };
}

+ (NSValueTransformer *)userErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeUserError class]];
}

@end

@implementation AWSChimeBatchUpdatePhoneNumberRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"updatePhoneNumberRequestItems" : @"UpdatePhoneNumberRequestItems",
             };
}

+ (NSValueTransformer *)updatePhoneNumberRequestItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeUpdatePhoneNumberRequestItem class]];
}

@end

@implementation AWSChimeBatchUpdatePhoneNumberResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberErrors" : @"PhoneNumberErrors",
             };
}

+ (NSValueTransformer *)phoneNumberErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimePhoneNumberError class]];
}

@end

@implementation AWSChimeBatchUpdateUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"updateUserRequestItems" : @"UpdateUserRequestItems",
             };
}

+ (NSValueTransformer *)updateUserRequestItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeUpdateUserRequestItem class]];
}

@end

@implementation AWSChimeBatchUpdateUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userErrors" : @"UserErrors",
             };
}

+ (NSValueTransformer *)userErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeUserError class]];
}

@end

@implementation AWSChimeBot

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botEmail" : @"BotEmail",
             @"botId" : @"BotId",
             @"botType" : @"BotType",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"disabled" : @"Disabled",
             @"displayName" : @"DisplayName",
             @"securityToken" : @"SecurityToken",
             @"updatedTimestamp" : @"UpdatedTimestamp",
             @"userId" : @"UserId",
             };
}

+ (NSValueTransformer *)botTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ChatBot"] == NSOrderedSame) {
            return @(AWSChimeBotTypeChatBot);
        }
        return @(AWSChimeBotTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeBotTypeChatBot:
                return @"ChatBot";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeBusinessCallingSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cdrBucket" : @"CdrBucket",
             };
}

@end

@implementation AWSChimeCreateAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeCreateAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"account" : @"Account",
             };
}

+ (NSValueTransformer *)accountJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeAccount class]];
}

@end

@implementation AWSChimeCreateAttendeeError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"externalUserId" : @"ExternalUserId",
             };
}

@end

@implementation AWSChimeCreateAttendeeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"externalUserId" : @"ExternalUserId",
             @"meetingId" : @"MeetingId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeTag class]];
}

@end

@implementation AWSChimeCreateAttendeeRequestItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"externalUserId" : @"ExternalUserId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeTag class]];
}

@end

@implementation AWSChimeCreateAttendeeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attendee" : @"Attendee",
             };
}

+ (NSValueTransformer *)attendeeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeAttendee class]];
}

@end

@implementation AWSChimeCreateBotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"displayName" : @"DisplayName",
             @"domain" : @"Domain",
             };
}

@end

@implementation AWSChimeCreateBotResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bot" : @"Bot",
             };
}

+ (NSValueTransformer *)botJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeBot class]];
}

@end

@implementation AWSChimeCreateMeetingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"externalMeetingId" : @"ExternalMeetingId",
             @"mediaRegion" : @"MediaRegion",
             @"meetingHostId" : @"MeetingHostId",
             @"notificationsConfiguration" : @"NotificationsConfiguration",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)notificationsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeMeetingNotificationConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeTag class]];
}

@end

@implementation AWSChimeCreateMeetingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meeting" : @"Meeting",
             };
}

+ (NSValueTransformer *)meetingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeMeeting class]];
}

@end

@implementation AWSChimeCreatePhoneNumberOrderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"e164PhoneNumbers" : @"E164PhoneNumbers",
             @"productType" : @"ProductType",
             };
}

+ (NSValueTransformer *)productTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BusinessCalling"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberProductTypeBusinessCalling);
        }
        if ([value caseInsensitiveCompare:@"VoiceConnector"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberProductTypeVoiceConnector);
        }
        return @(AWSChimePhoneNumberProductTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimePhoneNumberProductTypeBusinessCalling:
                return @"BusinessCalling";
            case AWSChimePhoneNumberProductTypeVoiceConnector:
                return @"VoiceConnector";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeCreatePhoneNumberOrderResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberOrder" : @"PhoneNumberOrder",
             };
}

+ (NSValueTransformer *)phoneNumberOrderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimePhoneNumberOrder class]];
}

@end

@implementation AWSChimeCreateProxySessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilities" : @"Capabilities",
             @"expiryMinutes" : @"ExpiryMinutes",
             @"geoMatchLevel" : @"GeoMatchLevel",
             @"geoMatchParams" : @"GeoMatchParams",
             @"name" : @"Name",
             @"numberSelectionBehavior" : @"NumberSelectionBehavior",
             @"participantPhoneNumbers" : @"ParticipantPhoneNumbers",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

+ (NSValueTransformer *)geoMatchLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Country"] == NSOrderedSame) {
            return @(AWSChimeGeoMatchLevelCountry);
        }
        if ([value caseInsensitiveCompare:@"AreaCode"] == NSOrderedSame) {
            return @(AWSChimeGeoMatchLevelAreaCode);
        }
        return @(AWSChimeGeoMatchLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeGeoMatchLevelCountry:
                return @"Country";
            case AWSChimeGeoMatchLevelAreaCode:
                return @"AreaCode";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)geoMatchParamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeGeoMatchParams class]];
}

+ (NSValueTransformer *)numberSelectionBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PreferSticky"] == NSOrderedSame) {
            return @(AWSChimeNumberSelectionBehaviorPreferSticky);
        }
        if ([value caseInsensitiveCompare:@"AvoidSticky"] == NSOrderedSame) {
            return @(AWSChimeNumberSelectionBehaviorAvoidSticky);
        }
        return @(AWSChimeNumberSelectionBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeNumberSelectionBehaviorPreferSticky:
                return @"PreferSticky";
            case AWSChimeNumberSelectionBehaviorAvoidSticky:
                return @"AvoidSticky";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeCreateProxySessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"proxySession" : @"ProxySession",
             };
}

+ (NSValueTransformer *)proxySessionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeProxySession class]];
}

@end

@implementation AWSChimeCreateRoomMembershipRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"memberId" : @"MemberId",
             @"role" : @"Role",
             @"roomId" : @"RoomId",
             };
}

+ (NSValueTransformer *)roleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Administrator"] == NSOrderedSame) {
            return @(AWSChimeRoomMembershipRoleAdministrator);
        }
        if ([value caseInsensitiveCompare:@"Member"] == NSOrderedSame) {
            return @(AWSChimeRoomMembershipRoleMember);
        }
        return @(AWSChimeRoomMembershipRoleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeRoomMembershipRoleAdministrator:
                return @"Administrator";
            case AWSChimeRoomMembershipRoleMember:
                return @"Member";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeCreateRoomMembershipResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roomMembership" : @"RoomMembership",
             };
}

+ (NSValueTransformer *)roomMembershipJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeRoomMembership class]];
}

@end

@implementation AWSChimeCreateRoomRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"clientRequestToken" : @"ClientRequestToken",
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeCreateRoomResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"room" : @"Room",
             };
}

+ (NSValueTransformer *)roomJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeRoom class]];
}

@end

@implementation AWSChimeCreateUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"email" : @"Email",
             @"userType" : @"UserType",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)userTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PrivateUser"] == NSOrderedSame) {
            return @(AWSChimeUserTypePrivateUser);
        }
        if ([value caseInsensitiveCompare:@"SharedDevice"] == NSOrderedSame) {
            return @(AWSChimeUserTypeSharedDevice);
        }
        return @(AWSChimeUserTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeUserTypePrivateUser:
                return @"PrivateUser";
            case AWSChimeUserTypeSharedDevice:
                return @"SharedDevice";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeCreateUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeUser class]];
}

@end

@implementation AWSChimeCreateVoiceConnectorGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"voiceConnectorItems" : @"VoiceConnectorItems",
             };
}

+ (NSValueTransformer *)voiceConnectorItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeVoiceConnectorItem class]];
}

@end

@implementation AWSChimeCreateVoiceConnectorGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorGroup" : @"VoiceConnectorGroup",
             };
}

+ (NSValueTransformer *)voiceConnectorGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeVoiceConnectorGroup class]];
}

@end

@implementation AWSChimeCreateVoiceConnectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsRegion" : @"AwsRegion",
             @"name" : @"Name",
             @"requireEncryption" : @"RequireEncryption",
             };
}

+ (NSValueTransformer *)awsRegionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"us-east-1"] == NSOrderedSame) {
            return @(AWSChimeVoiceConnectorAwsRegionUsEast1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSChimeVoiceConnectorAwsRegionUsWest2);
        }
        return @(AWSChimeVoiceConnectorAwsRegionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeVoiceConnectorAwsRegionUsEast1:
                return @"us-east-1";
            case AWSChimeVoiceConnectorAwsRegionUsWest2:
                return @"us-west-2";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeCreateVoiceConnectorResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnector" : @"VoiceConnector",
             };
}

+ (NSValueTransformer *)voiceConnectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeVoiceConnector class]];
}

@end

@implementation AWSChimeCredential

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"password" : @"Password",
             @"username" : @"Username",
             };
}

@end

@implementation AWSChimeDeleteAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             };
}

@end

@implementation AWSChimeDeleteAccountResponse

@end

@implementation AWSChimeDeleteAttendeeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attendeeId" : @"AttendeeId",
             @"meetingId" : @"MeetingId",
             };
}

@end

@implementation AWSChimeDeleteEventsConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"botId" : @"BotId",
             };
}

@end

@implementation AWSChimeDeleteMeetingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meetingId" : @"MeetingId",
             };
}

@end

@implementation AWSChimeDeletePhoneNumberRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberId" : @"PhoneNumberId",
             };
}

@end

@implementation AWSChimeDeleteProxySessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"proxySessionId" : @"ProxySessionId",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeDeleteRoomMembershipRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"memberId" : @"MemberId",
             @"roomId" : @"RoomId",
             };
}

@end

@implementation AWSChimeDeleteRoomRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"roomId" : @"RoomId",
             };
}

@end

@implementation AWSChimeDeleteVoiceConnectorGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorGroupId" : @"VoiceConnectorGroupId",
             };
}

@end

@implementation AWSChimeDeleteVoiceConnectorOriginationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeDeleteVoiceConnectorProxyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeDeleteVoiceConnectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeDeleteVoiceConnectorStreamingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeDeleteVoiceConnectorTerminationCredentialsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"usernames" : @"Usernames",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeDeleteVoiceConnectorTerminationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeDisassociatePhoneNumberFromUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSChimeDisassociatePhoneNumberFromUserResponse

@end

@implementation AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"e164PhoneNumbers" : @"E164PhoneNumbers",
             @"voiceConnectorGroupId" : @"VoiceConnectorGroupId",
             };
}

@end

@implementation AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberErrors" : @"PhoneNumberErrors",
             };
}

+ (NSValueTransformer *)phoneNumberErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimePhoneNumberError class]];
}

@end

@implementation AWSChimeDisassociatePhoneNumbersFromVoiceConnectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"e164PhoneNumbers" : @"E164PhoneNumbers",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeDisassociatePhoneNumbersFromVoiceConnectorResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberErrors" : @"PhoneNumberErrors",
             };
}

+ (NSValueTransformer *)phoneNumberErrorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimePhoneNumberError class]];
}

@end

@implementation AWSChimeDisassociateSigninDelegateGroupsFromAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"groupNames" : @"GroupNames",
             };
}

@end

@implementation AWSChimeDisassociateSigninDelegateGroupsFromAccountResponse

@end

@implementation AWSChimeEventsConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"botId" : @"BotId",
             @"lambdaFunctionArn" : @"LambdaFunctionArn",
             @"outboundEventsHTTPSEndpoint" : @"OutboundEventsHTTPSEndpoint",
             };
}

@end

@implementation AWSChimeGeoMatchParams

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"areaCode" : @"AreaCode",
             @"country" : @"Country",
             };
}

@end

@implementation AWSChimeGetAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             };
}

@end

@implementation AWSChimeGetAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"account" : @"Account",
             };
}

+ (NSValueTransformer *)accountJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeAccount class]];
}

@end

@implementation AWSChimeGetAccountSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             };
}

@end

@implementation AWSChimeGetAccountSettingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountSettings" : @"AccountSettings",
             };
}

+ (NSValueTransformer *)accountSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeAccountSettings class]];
}

@end

@implementation AWSChimeGetAttendeeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attendeeId" : @"AttendeeId",
             @"meetingId" : @"MeetingId",
             };
}

@end

@implementation AWSChimeGetAttendeeResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attendee" : @"Attendee",
             };
}

+ (NSValueTransformer *)attendeeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeAttendee class]];
}

@end

@implementation AWSChimeGetBotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"botId" : @"BotId",
             };
}

@end

@implementation AWSChimeGetBotResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bot" : @"Bot",
             };
}

+ (NSValueTransformer *)botJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeBot class]];
}

@end

@implementation AWSChimeGetEventsConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"botId" : @"BotId",
             };
}

@end

@implementation AWSChimeGetEventsConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventsConfiguration" : @"EventsConfiguration",
             };
}

+ (NSValueTransformer *)eventsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeEventsConfiguration class]];
}

@end

@implementation AWSChimeGetGlobalSettingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"businessCalling" : @"BusinessCalling",
             @"voiceConnector" : @"VoiceConnector",
             };
}

+ (NSValueTransformer *)businessCallingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeBusinessCallingSettings class]];
}

+ (NSValueTransformer *)voiceConnectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeVoiceConnectorSettings class]];
}

@end

@implementation AWSChimeGetMeetingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meetingId" : @"MeetingId",
             };
}

@end

@implementation AWSChimeGetMeetingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meeting" : @"Meeting",
             };
}

+ (NSValueTransformer *)meetingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeMeeting class]];
}

@end

@implementation AWSChimeGetPhoneNumberOrderRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberOrderId" : @"PhoneNumberOrderId",
             };
}

@end

@implementation AWSChimeGetPhoneNumberOrderResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberOrder" : @"PhoneNumberOrder",
             };
}

+ (NSValueTransformer *)phoneNumberOrderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimePhoneNumberOrder class]];
}

@end

@implementation AWSChimeGetPhoneNumberRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberId" : @"PhoneNumberId",
             };
}

@end

@implementation AWSChimeGetPhoneNumberResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumber" : @"PhoneNumber",
             };
}

+ (NSValueTransformer *)phoneNumberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimePhoneNumber class]];
}

@end

@implementation AWSChimeGetPhoneNumberSettingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callingName" : @"CallingName",
             @"callingNameUpdatedTimestamp" : @"CallingNameUpdatedTimestamp",
             };
}

+ (NSValueTransformer *)callingNameUpdatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeGetProxySessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"proxySessionId" : @"ProxySessionId",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeGetProxySessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"proxySession" : @"ProxySession",
             };
}

+ (NSValueTransformer *)proxySessionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeProxySession class]];
}

@end

@implementation AWSChimeGetRoomRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"roomId" : @"RoomId",
             };
}

@end

@implementation AWSChimeGetRoomResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"room" : @"Room",
             };
}

+ (NSValueTransformer *)roomJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeRoom class]];
}

@end

@implementation AWSChimeGetUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSChimeGetUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeUser class]];
}

@end

@implementation AWSChimeGetUserSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSChimeGetUserSettingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userSettings" : @"UserSettings",
             };
}

+ (NSValueTransformer *)userSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeUserSettings class]];
}

@end

@implementation AWSChimeGetVoiceConnectorGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorGroupId" : @"VoiceConnectorGroupId",
             };
}

@end

@implementation AWSChimeGetVoiceConnectorGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorGroup" : @"VoiceConnectorGroup",
             };
}

+ (NSValueTransformer *)voiceConnectorGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeVoiceConnectorGroup class]];
}

@end

@implementation AWSChimeGetVoiceConnectorLoggingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeGetVoiceConnectorLoggingConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingConfiguration" : @"LoggingConfiguration",
             };
}

+ (NSValueTransformer *)loggingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeLoggingConfiguration class]];
}

@end

@implementation AWSChimeGetVoiceConnectorOriginationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeGetVoiceConnectorOriginationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"origination" : @"Origination",
             };
}

+ (NSValueTransformer *)originationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeOrigination class]];
}

@end

@implementation AWSChimeGetVoiceConnectorProxyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeGetVoiceConnectorProxyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"proxy" : @"Proxy",
             };
}

+ (NSValueTransformer *)proxyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeProxy class]];
}

@end

@implementation AWSChimeGetVoiceConnectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeGetVoiceConnectorResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnector" : @"VoiceConnector",
             };
}

+ (NSValueTransformer *)voiceConnectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeVoiceConnector class]];
}

@end

@implementation AWSChimeGetVoiceConnectorStreamingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeGetVoiceConnectorStreamingConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamingConfiguration" : @"StreamingConfiguration",
             };
}

+ (NSValueTransformer *)streamingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeStreamingConfiguration class]];
}

@end

@implementation AWSChimeGetVoiceConnectorTerminationHealthRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeGetVoiceConnectorTerminationHealthResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"terminationHealth" : @"TerminationHealth",
             };
}

+ (NSValueTransformer *)terminationHealthJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeTerminationHealth class]];
}

@end

@implementation AWSChimeGetVoiceConnectorTerminationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeGetVoiceConnectorTerminationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"termination" : @"Termination",
             };
}

+ (NSValueTransformer *)terminationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeTermination class]];
}

@end

@implementation AWSChimeInvite

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailAddress" : @"EmailAddress",
             @"emailStatus" : @"EmailStatus",
             @"inviteId" : @"InviteId",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)emailStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"NotSent"] == NSOrderedSame) {
            return @(AWSChimeEmailStatusNotSent);
        }
        if ([value caseInsensitiveCompare:@"Sent"] == NSOrderedSame) {
            return @(AWSChimeEmailStatusSent);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSChimeEmailStatusFailed);
        }
        return @(AWSChimeEmailStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeEmailStatusNotSent:
                return @"NotSent";
            case AWSChimeEmailStatusSent:
                return @"Sent";
            case AWSChimeEmailStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSChimeInviteStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Accepted"] == NSOrderedSame) {
            return @(AWSChimeInviteStatusAccepted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSChimeInviteStatusFailed);
        }
        return @(AWSChimeInviteStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeInviteStatusPending:
                return @"Pending";
            case AWSChimeInviteStatusAccepted:
                return @"Accepted";
            case AWSChimeInviteStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeInviteUsersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"userEmailList" : @"UserEmailList",
             @"userType" : @"UserType",
             };
}

+ (NSValueTransformer *)userTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PrivateUser"] == NSOrderedSame) {
            return @(AWSChimeUserTypePrivateUser);
        }
        if ([value caseInsensitiveCompare:@"SharedDevice"] == NSOrderedSame) {
            return @(AWSChimeUserTypeSharedDevice);
        }
        return @(AWSChimeUserTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeUserTypePrivateUser:
                return @"PrivateUser";
            case AWSChimeUserTypeSharedDevice:
                return @"SharedDevice";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeInviteUsersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invites" : @"Invites",
             };
}

+ (NSValueTransformer *)invitesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeInvite class]];
}

@end

@implementation AWSChimeListAccountsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"name" : @"Name",
             @"nextToken" : @"NextToken",
             @"userEmail" : @"UserEmail",
             };
}

@end

@implementation AWSChimeListAccountsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accounts" : @"Accounts",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)accountsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeAccount class]];
}

@end

@implementation AWSChimeListAttendeeTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attendeeId" : @"AttendeeId",
             @"meetingId" : @"MeetingId",
             };
}

@end

@implementation AWSChimeListAttendeeTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeTag class]];
}

@end

@implementation AWSChimeListAttendeesRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"meetingId" : @"MeetingId",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeListAttendeesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attendees" : @"Attendees",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)attendeesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeAttendee class]];
}

@end

@implementation AWSChimeListBotsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeListBotsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bots" : @"Bots",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)botsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeBot class]];
}

@end

@implementation AWSChimeListMeetingTagsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meetingId" : @"MeetingId",
             };
}

@end

@implementation AWSChimeListMeetingTagsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeTag class]];
}

@end

@implementation AWSChimeListMeetingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeListMeetingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meetings" : @"Meetings",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)meetingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeMeeting class]];
}

@end

@implementation AWSChimeListPhoneNumberOrdersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeListPhoneNumberOrdersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"phoneNumberOrders" : @"PhoneNumberOrders",
             };
}

+ (NSValueTransformer *)phoneNumberOrdersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimePhoneNumberOrder class]];
}

@end

@implementation AWSChimeListPhoneNumbersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"filterName" : @"FilterName",
             @"filterValue" : @"FilterValue",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"productType" : @"ProductType",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)filterNameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AccountId"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberAssociationNameAccountId);
        }
        if ([value caseInsensitiveCompare:@"UserId"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberAssociationNameUserId);
        }
        if ([value caseInsensitiveCompare:@"VoiceConnectorId"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberAssociationNameVoiceConnectorId);
        }
        if ([value caseInsensitiveCompare:@"VoiceConnectorGroupId"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberAssociationNameVoiceConnectorGroupId);
        }
        return @(AWSChimePhoneNumberAssociationNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimePhoneNumberAssociationNameAccountId:
                return @"AccountId";
            case AWSChimePhoneNumberAssociationNameUserId:
                return @"UserId";
            case AWSChimePhoneNumberAssociationNameVoiceConnectorId:
                return @"VoiceConnectorId";
            case AWSChimePhoneNumberAssociationNameVoiceConnectorGroupId:
                return @"VoiceConnectorGroupId";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)productTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BusinessCalling"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberProductTypeBusinessCalling);
        }
        if ([value caseInsensitiveCompare:@"VoiceConnector"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberProductTypeVoiceConnector);
        }
        return @(AWSChimePhoneNumberProductTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimePhoneNumberProductTypeBusinessCalling:
                return @"BusinessCalling";
            case AWSChimePhoneNumberProductTypeVoiceConnector:
                return @"VoiceConnector";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AcquireInProgress"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusAcquireInProgress);
        }
        if ([value caseInsensitiveCompare:@"AcquireFailed"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusAcquireFailed);
        }
        if ([value caseInsensitiveCompare:@"Unassigned"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusUnassigned);
        }
        if ([value caseInsensitiveCompare:@"Assigned"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusAssigned);
        }
        if ([value caseInsensitiveCompare:@"ReleaseInProgress"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusReleaseInProgress);
        }
        if ([value caseInsensitiveCompare:@"DeleteInProgress"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusDeleteInProgress);
        }
        if ([value caseInsensitiveCompare:@"ReleaseFailed"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusReleaseFailed);
        }
        if ([value caseInsensitiveCompare:@"DeleteFailed"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusDeleteFailed);
        }
        return @(AWSChimePhoneNumberStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimePhoneNumberStatusAcquireInProgress:
                return @"AcquireInProgress";
            case AWSChimePhoneNumberStatusAcquireFailed:
                return @"AcquireFailed";
            case AWSChimePhoneNumberStatusUnassigned:
                return @"Unassigned";
            case AWSChimePhoneNumberStatusAssigned:
                return @"Assigned";
            case AWSChimePhoneNumberStatusReleaseInProgress:
                return @"ReleaseInProgress";
            case AWSChimePhoneNumberStatusDeleteInProgress:
                return @"DeleteInProgress";
            case AWSChimePhoneNumberStatusReleaseFailed:
                return @"ReleaseFailed";
            case AWSChimePhoneNumberStatusDeleteFailed:
                return @"DeleteFailed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeListPhoneNumbersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"phoneNumbers" : @"PhoneNumbers",
             };
}

+ (NSValueTransformer *)phoneNumbersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimePhoneNumber class]];
}

@end

@implementation AWSChimeListProxySessionsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"status" : @"Status",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Open"] == NSOrderedSame) {
            return @(AWSChimeProxySessionStatusOpen);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSChimeProxySessionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Closed"] == NSOrderedSame) {
            return @(AWSChimeProxySessionStatusClosed);
        }
        return @(AWSChimeProxySessionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeProxySessionStatusOpen:
                return @"Open";
            case AWSChimeProxySessionStatusInProgress:
                return @"InProgress";
            case AWSChimeProxySessionStatusClosed:
                return @"Closed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeListProxySessionsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"proxySessions" : @"ProxySessions",
             };
}

+ (NSValueTransformer *)proxySessionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeProxySession class]];
}

@end

@implementation AWSChimeListRoomMembershipsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"roomId" : @"RoomId",
             };
}

@end

@implementation AWSChimeListRoomMembershipsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"roomMemberships" : @"RoomMemberships",
             };
}

+ (NSValueTransformer *)roomMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeRoomMembership class]];
}

@end

@implementation AWSChimeListRoomsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"maxResults" : @"MaxResults",
             @"memberId" : @"MemberId",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeListRoomsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"rooms" : @"Rooms",
             };
}

+ (NSValueTransformer *)roomsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeRoom class]];
}

@end

@implementation AWSChimeListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSChimeListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeTag class]];
}

@end

@implementation AWSChimeListUsersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"userEmail" : @"UserEmail",
             @"userType" : @"UserType",
             };
}

+ (NSValueTransformer *)userTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PrivateUser"] == NSOrderedSame) {
            return @(AWSChimeUserTypePrivateUser);
        }
        if ([value caseInsensitiveCompare:@"SharedDevice"] == NSOrderedSame) {
            return @(AWSChimeUserTypeSharedDevice);
        }
        return @(AWSChimeUserTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeUserTypePrivateUser:
                return @"PrivateUser";
            case AWSChimeUserTypeSharedDevice:
                return @"SharedDevice";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeListUsersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"users" : @"Users",
             };
}

+ (NSValueTransformer *)usersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeUser class]];
}

@end

@implementation AWSChimeListVoiceConnectorGroupsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeListVoiceConnectorGroupsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"voiceConnectorGroups" : @"VoiceConnectorGroups",
             };
}

+ (NSValueTransformer *)voiceConnectorGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeVoiceConnectorGroup class]];
}

@end

@implementation AWSChimeListVoiceConnectorTerminationCredentialsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeListVoiceConnectorTerminationCredentialsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"usernames" : @"Usernames",
             };
}

@end

@implementation AWSChimeListVoiceConnectorsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeListVoiceConnectorsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"voiceConnectors" : @"VoiceConnectors",
             };
}

+ (NSValueTransformer *)voiceConnectorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeVoiceConnector class]];
}

@end

@implementation AWSChimeLoggingConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enableSIPLogs" : @"EnableSIPLogs",
             };
}

@end

@implementation AWSChimeLogoutUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSChimeLogoutUserResponse

@end

@implementation AWSChimeMediaPlacement

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"audioFallbackUrl" : @"AudioFallbackUrl",
             @"audioHostUrl" : @"AudioHostUrl",
             @"screenDataUrl" : @"ScreenDataUrl",
             @"screenSharingUrl" : @"ScreenSharingUrl",
             @"screenViewingUrl" : @"ScreenViewingUrl",
             @"signalingUrl" : @"SignalingUrl",
             @"turnControlUrl" : @"TurnControlUrl",
             };
}

@end

@implementation AWSChimeMeeting

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"externalMeetingId" : @"ExternalMeetingId",
             @"mediaPlacement" : @"MediaPlacement",
             @"mediaRegion" : @"MediaRegion",
             @"meetingId" : @"MeetingId",
             };
}

+ (NSValueTransformer *)mediaPlacementJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeMediaPlacement class]];
}

@end

@implementation AWSChimeMeetingNotificationConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"snsTopicArn" : @"SnsTopicArn",
             @"sqsQueueArn" : @"SqsQueueArn",
             };
}

@end

@implementation AWSChimeMember

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"email" : @"Email",
             @"fullName" : @"FullName",
             @"memberId" : @"MemberId",
             @"memberType" : @"MemberType",
             };
}

+ (NSValueTransformer *)memberTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"User"] == NSOrderedSame) {
            return @(AWSChimeMemberTypeUser);
        }
        if ([value caseInsensitiveCompare:@"Bot"] == NSOrderedSame) {
            return @(AWSChimeMemberTypeBot);
        }
        if ([value caseInsensitiveCompare:@"Webhook"] == NSOrderedSame) {
            return @(AWSChimeMemberTypeWebhook);
        }
        return @(AWSChimeMemberTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeMemberTypeUser:
                return @"User";
            case AWSChimeMemberTypeBot:
                return @"Bot";
            case AWSChimeMemberTypeWebhook:
                return @"Webhook";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeMemberError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"memberId" : @"MemberId",
             };
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BadRequest"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeBadRequest);
        }
        if ([value caseInsensitiveCompare:@"Conflict"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeConflict);
        }
        if ([value caseInsensitiveCompare:@"Forbidden"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeForbidden);
        }
        if ([value caseInsensitiveCompare:@"NotFound"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeNotFound);
        }
        if ([value caseInsensitiveCompare:@"PreconditionFailed"] == NSOrderedSame) {
            return @(AWSChimeErrorCodePreconditionFailed);
        }
        if ([value caseInsensitiveCompare:@"ResourceLimitExceeded"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeResourceLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"ServiceFailure"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeServiceFailure);
        }
        if ([value caseInsensitiveCompare:@"AccessDenied"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"ServiceUnavailable"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeServiceUnavailable);
        }
        if ([value caseInsensitiveCompare:@"Throttled"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeThrottled);
        }
        if ([value caseInsensitiveCompare:@"Unauthorized"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeUnauthorized);
        }
        if ([value caseInsensitiveCompare:@"Unprocessable"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeUnprocessable);
        }
        if ([value caseInsensitiveCompare:@"VoiceConnectorGroupAssociationsExist"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeVoiceConnectorGroupAssociationsExist);
        }
        if ([value caseInsensitiveCompare:@"PhoneNumberAssociationsExist"] == NSOrderedSame) {
            return @(AWSChimeErrorCodePhoneNumberAssociationsExist);
        }
        return @(AWSChimeErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeErrorCodeBadRequest:
                return @"BadRequest";
            case AWSChimeErrorCodeConflict:
                return @"Conflict";
            case AWSChimeErrorCodeForbidden:
                return @"Forbidden";
            case AWSChimeErrorCodeNotFound:
                return @"NotFound";
            case AWSChimeErrorCodePreconditionFailed:
                return @"PreconditionFailed";
            case AWSChimeErrorCodeResourceLimitExceeded:
                return @"ResourceLimitExceeded";
            case AWSChimeErrorCodeServiceFailure:
                return @"ServiceFailure";
            case AWSChimeErrorCodeAccessDenied:
                return @"AccessDenied";
            case AWSChimeErrorCodeServiceUnavailable:
                return @"ServiceUnavailable";
            case AWSChimeErrorCodeThrottled:
                return @"Throttled";
            case AWSChimeErrorCodeUnauthorized:
                return @"Unauthorized";
            case AWSChimeErrorCodeUnprocessable:
                return @"Unprocessable";
            case AWSChimeErrorCodeVoiceConnectorGroupAssociationsExist:
                return @"VoiceConnectorGroupAssociationsExist";
            case AWSChimeErrorCodePhoneNumberAssociationsExist:
                return @"PhoneNumberAssociationsExist";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeMembershipItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"memberId" : @"MemberId",
             @"role" : @"Role",
             };
}

+ (NSValueTransformer *)roleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Administrator"] == NSOrderedSame) {
            return @(AWSChimeRoomMembershipRoleAdministrator);
        }
        if ([value caseInsensitiveCompare:@"Member"] == NSOrderedSame) {
            return @(AWSChimeRoomMembershipRoleMember);
        }
        return @(AWSChimeRoomMembershipRoleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeRoomMembershipRoleAdministrator:
                return @"Administrator";
            case AWSChimeRoomMembershipRoleMember:
                return @"Member";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeOrderedPhoneNumber

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"e164PhoneNumber" : @"E164PhoneNumber",
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Processing"] == NSOrderedSame) {
            return @(AWSChimeOrderedPhoneNumberStatusProcessing);
        }
        if ([value caseInsensitiveCompare:@"Acquired"] == NSOrderedSame) {
            return @(AWSChimeOrderedPhoneNumberStatusAcquired);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSChimeOrderedPhoneNumberStatusFailed);
        }
        return @(AWSChimeOrderedPhoneNumberStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeOrderedPhoneNumberStatusProcessing:
                return @"Processing";
            case AWSChimeOrderedPhoneNumberStatusAcquired:
                return @"Acquired";
            case AWSChimeOrderedPhoneNumberStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeOrigination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"disabled" : @"Disabled",
             @"routes" : @"Routes",
             };
}

+ (NSValueTransformer *)routesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeOriginationRoute class]];
}

@end

@implementation AWSChimeOriginationRoute

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"host" : @"Host",
             @"port" : @"Port",
             @"priority" : @"Priority",
             @"protocols" : @"Protocol",
             @"weight" : @"Weight",
             };
}

+ (NSValueTransformer *)protocolsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TCP"] == NSOrderedSame) {
            return @(AWSChimeOriginationRouteProtocolTcp);
        }
        if ([value caseInsensitiveCompare:@"UDP"] == NSOrderedSame) {
            return @(AWSChimeOriginationRouteProtocolUdp);
        }
        return @(AWSChimeOriginationRouteProtocolUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeOriginationRouteProtocolTcp:
                return @"TCP";
            case AWSChimeOriginationRouteProtocolUdp:
                return @"UDP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeParticipant

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumber" : @"PhoneNumber",
             @"proxyPhoneNumber" : @"ProxyPhoneNumber",
             };
}

@end

@implementation AWSChimePhoneNumber

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associations" : @"Associations",
             @"callingName" : @"CallingName",
             @"callingNameStatus" : @"CallingNameStatus",
             @"capabilities" : @"Capabilities",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"deletionTimestamp" : @"DeletionTimestamp",
             @"e164PhoneNumber" : @"E164PhoneNumber",
             @"phoneNumberId" : @"PhoneNumberId",
             @"productType" : @"ProductType",
             @"status" : @"Status",
             @"types" : @"Type",
             @"updatedTimestamp" : @"UpdatedTimestamp",
             };
}

+ (NSValueTransformer *)associationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimePhoneNumberAssociation class]];
}

+ (NSValueTransformer *)callingNameStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Unassigned"] == NSOrderedSame) {
            return @(AWSChimeCallingNameStatusUnassigned);
        }
        if ([value caseInsensitiveCompare:@"UpdateInProgress"] == NSOrderedSame) {
            return @(AWSChimeCallingNameStatusUpdateInProgress);
        }
        if ([value caseInsensitiveCompare:@"UpdateSucceeded"] == NSOrderedSame) {
            return @(AWSChimeCallingNameStatusUpdateSucceeded);
        }
        if ([value caseInsensitiveCompare:@"UpdateFailed"] == NSOrderedSame) {
            return @(AWSChimeCallingNameStatusUpdateFailed);
        }
        return @(AWSChimeCallingNameStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeCallingNameStatusUnassigned:
                return @"Unassigned";
            case AWSChimeCallingNameStatusUpdateInProgress:
                return @"UpdateInProgress";
            case AWSChimeCallingNameStatusUpdateSucceeded:
                return @"UpdateSucceeded";
            case AWSChimeCallingNameStatusUpdateFailed:
                return @"UpdateFailed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)capabilitiesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimePhoneNumberCapabilities class]];
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)deletionTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)productTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BusinessCalling"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberProductTypeBusinessCalling);
        }
        if ([value caseInsensitiveCompare:@"VoiceConnector"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberProductTypeVoiceConnector);
        }
        return @(AWSChimePhoneNumberProductTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimePhoneNumberProductTypeBusinessCalling:
                return @"BusinessCalling";
            case AWSChimePhoneNumberProductTypeVoiceConnector:
                return @"VoiceConnector";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AcquireInProgress"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusAcquireInProgress);
        }
        if ([value caseInsensitiveCompare:@"AcquireFailed"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusAcquireFailed);
        }
        if ([value caseInsensitiveCompare:@"Unassigned"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusUnassigned);
        }
        if ([value caseInsensitiveCompare:@"Assigned"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusAssigned);
        }
        if ([value caseInsensitiveCompare:@"ReleaseInProgress"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusReleaseInProgress);
        }
        if ([value caseInsensitiveCompare:@"DeleteInProgress"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusDeleteInProgress);
        }
        if ([value caseInsensitiveCompare:@"ReleaseFailed"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusReleaseFailed);
        }
        if ([value caseInsensitiveCompare:@"DeleteFailed"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberStatusDeleteFailed);
        }
        return @(AWSChimePhoneNumberStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimePhoneNumberStatusAcquireInProgress:
                return @"AcquireInProgress";
            case AWSChimePhoneNumberStatusAcquireFailed:
                return @"AcquireFailed";
            case AWSChimePhoneNumberStatusUnassigned:
                return @"Unassigned";
            case AWSChimePhoneNumberStatusAssigned:
                return @"Assigned";
            case AWSChimePhoneNumberStatusReleaseInProgress:
                return @"ReleaseInProgress";
            case AWSChimePhoneNumberStatusDeleteInProgress:
                return @"DeleteInProgress";
            case AWSChimePhoneNumberStatusReleaseFailed:
                return @"ReleaseFailed";
            case AWSChimePhoneNumberStatusDeleteFailed:
                return @"DeleteFailed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Local"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberTypeLocal);
        }
        if ([value caseInsensitiveCompare:@"TollFree"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberTypeTollFree);
        }
        return @(AWSChimePhoneNumberTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimePhoneNumberTypeLocal:
                return @"Local";
            case AWSChimePhoneNumberTypeTollFree:
                return @"TollFree";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimePhoneNumberAssociation

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"associatedTimestamp" : @"AssociatedTimestamp",
             @"name" : @"Name",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)associatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)nameJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"AccountId"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberAssociationNameAccountId);
        }
        if ([value caseInsensitiveCompare:@"UserId"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberAssociationNameUserId);
        }
        if ([value caseInsensitiveCompare:@"VoiceConnectorId"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberAssociationNameVoiceConnectorId);
        }
        if ([value caseInsensitiveCompare:@"VoiceConnectorGroupId"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberAssociationNameVoiceConnectorGroupId);
        }
        return @(AWSChimePhoneNumberAssociationNameUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimePhoneNumberAssociationNameAccountId:
                return @"AccountId";
            case AWSChimePhoneNumberAssociationNameUserId:
                return @"UserId";
            case AWSChimePhoneNumberAssociationNameVoiceConnectorId:
                return @"VoiceConnectorId";
            case AWSChimePhoneNumberAssociationNameVoiceConnectorGroupId:
                return @"VoiceConnectorGroupId";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimePhoneNumberCapabilities

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inboundCall" : @"InboundCall",
             @"inboundMMS" : @"InboundMMS",
             @"inboundSMS" : @"InboundSMS",
             @"outboundCall" : @"OutboundCall",
             @"outboundMMS" : @"OutboundMMS",
             @"outboundSMS" : @"OutboundSMS",
             };
}

@end

@implementation AWSChimePhoneNumberError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"phoneNumberId" : @"PhoneNumberId",
             };
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BadRequest"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeBadRequest);
        }
        if ([value caseInsensitiveCompare:@"Conflict"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeConflict);
        }
        if ([value caseInsensitiveCompare:@"Forbidden"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeForbidden);
        }
        if ([value caseInsensitiveCompare:@"NotFound"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeNotFound);
        }
        if ([value caseInsensitiveCompare:@"PreconditionFailed"] == NSOrderedSame) {
            return @(AWSChimeErrorCodePreconditionFailed);
        }
        if ([value caseInsensitiveCompare:@"ResourceLimitExceeded"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeResourceLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"ServiceFailure"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeServiceFailure);
        }
        if ([value caseInsensitiveCompare:@"AccessDenied"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"ServiceUnavailable"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeServiceUnavailable);
        }
        if ([value caseInsensitiveCompare:@"Throttled"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeThrottled);
        }
        if ([value caseInsensitiveCompare:@"Unauthorized"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeUnauthorized);
        }
        if ([value caseInsensitiveCompare:@"Unprocessable"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeUnprocessable);
        }
        if ([value caseInsensitiveCompare:@"VoiceConnectorGroupAssociationsExist"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeVoiceConnectorGroupAssociationsExist);
        }
        if ([value caseInsensitiveCompare:@"PhoneNumberAssociationsExist"] == NSOrderedSame) {
            return @(AWSChimeErrorCodePhoneNumberAssociationsExist);
        }
        return @(AWSChimeErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeErrorCodeBadRequest:
                return @"BadRequest";
            case AWSChimeErrorCodeConflict:
                return @"Conflict";
            case AWSChimeErrorCodeForbidden:
                return @"Forbidden";
            case AWSChimeErrorCodeNotFound:
                return @"NotFound";
            case AWSChimeErrorCodePreconditionFailed:
                return @"PreconditionFailed";
            case AWSChimeErrorCodeResourceLimitExceeded:
                return @"ResourceLimitExceeded";
            case AWSChimeErrorCodeServiceFailure:
                return @"ServiceFailure";
            case AWSChimeErrorCodeAccessDenied:
                return @"AccessDenied";
            case AWSChimeErrorCodeServiceUnavailable:
                return @"ServiceUnavailable";
            case AWSChimeErrorCodeThrottled:
                return @"Throttled";
            case AWSChimeErrorCodeUnauthorized:
                return @"Unauthorized";
            case AWSChimeErrorCodeUnprocessable:
                return @"Unprocessable";
            case AWSChimeErrorCodeVoiceConnectorGroupAssociationsExist:
                return @"VoiceConnectorGroupAssociationsExist";
            case AWSChimeErrorCodePhoneNumberAssociationsExist:
                return @"PhoneNumberAssociationsExist";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimePhoneNumberOrder

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTimestamp" : @"CreatedTimestamp",
             @"orderedPhoneNumbers" : @"OrderedPhoneNumbers",
             @"phoneNumberOrderId" : @"PhoneNumberOrderId",
             @"productType" : @"ProductType",
             @"status" : @"Status",
             @"updatedTimestamp" : @"UpdatedTimestamp",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)orderedPhoneNumbersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeOrderedPhoneNumber class]];
}

+ (NSValueTransformer *)productTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BusinessCalling"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberProductTypeBusinessCalling);
        }
        if ([value caseInsensitiveCompare:@"VoiceConnector"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberProductTypeVoiceConnector);
        }
        return @(AWSChimePhoneNumberProductTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimePhoneNumberProductTypeBusinessCalling:
                return @"BusinessCalling";
            case AWSChimePhoneNumberProductTypeVoiceConnector:
                return @"VoiceConnector";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Processing"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberOrderStatusProcessing);
        }
        if ([value caseInsensitiveCompare:@"Successful"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberOrderStatusSuccessful);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberOrderStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"Partial"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberOrderStatusPartial);
        }
        return @(AWSChimePhoneNumberOrderStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimePhoneNumberOrderStatusProcessing:
                return @"Processing";
            case AWSChimePhoneNumberOrderStatusSuccessful:
                return @"Successful";
            case AWSChimePhoneNumberOrderStatusFailed:
                return @"Failed";
            case AWSChimePhoneNumberOrderStatusPartial:
                return @"Partial";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeProxy

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultSessionExpiryMinutes" : @"DefaultSessionExpiryMinutes",
             @"disabled" : @"Disabled",
             @"fallBackPhoneNumber" : @"FallBackPhoneNumber",
             @"phoneNumberCountries" : @"PhoneNumberCountries",
             };
}

@end

@implementation AWSChimeProxySession

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilities" : @"Capabilities",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"endedTimestamp" : @"EndedTimestamp",
             @"expiryMinutes" : @"ExpiryMinutes",
             @"geoMatchLevel" : @"GeoMatchLevel",
             @"geoMatchParams" : @"GeoMatchParams",
             @"name" : @"Name",
             @"numberSelectionBehavior" : @"NumberSelectionBehavior",
             @"participants" : @"Participants",
             @"proxySessionId" : @"ProxySessionId",
             @"status" : @"Status",
             @"updatedTimestamp" : @"UpdatedTimestamp",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)endedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)geoMatchLevelJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Country"] == NSOrderedSame) {
            return @(AWSChimeGeoMatchLevelCountry);
        }
        if ([value caseInsensitiveCompare:@"AreaCode"] == NSOrderedSame) {
            return @(AWSChimeGeoMatchLevelAreaCode);
        }
        return @(AWSChimeGeoMatchLevelUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeGeoMatchLevelCountry:
                return @"Country";
            case AWSChimeGeoMatchLevelAreaCode:
                return @"AreaCode";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)geoMatchParamsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeGeoMatchParams class]];
}

+ (NSValueTransformer *)numberSelectionBehaviorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PreferSticky"] == NSOrderedSame) {
            return @(AWSChimeNumberSelectionBehaviorPreferSticky);
        }
        if ([value caseInsensitiveCompare:@"AvoidSticky"] == NSOrderedSame) {
            return @(AWSChimeNumberSelectionBehaviorAvoidSticky);
        }
        return @(AWSChimeNumberSelectionBehaviorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeNumberSelectionBehaviorPreferSticky:
                return @"PreferSticky";
            case AWSChimeNumberSelectionBehaviorAvoidSticky:
                return @"AvoidSticky";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)participantsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeParticipant class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Open"] == NSOrderedSame) {
            return @(AWSChimeProxySessionStatusOpen);
        }
        if ([value caseInsensitiveCompare:@"InProgress"] == NSOrderedSame) {
            return @(AWSChimeProxySessionStatusInProgress);
        }
        if ([value caseInsensitiveCompare:@"Closed"] == NSOrderedSame) {
            return @(AWSChimeProxySessionStatusClosed);
        }
        return @(AWSChimeProxySessionStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeProxySessionStatusOpen:
                return @"Open";
            case AWSChimeProxySessionStatusInProgress:
                return @"InProgress";
            case AWSChimeProxySessionStatusClosed:
                return @"Closed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimePutEventsConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"botId" : @"BotId",
             @"lambdaFunctionArn" : @"LambdaFunctionArn",
             @"outboundEventsHTTPSEndpoint" : @"OutboundEventsHTTPSEndpoint",
             };
}

@end

@implementation AWSChimePutEventsConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventsConfiguration" : @"EventsConfiguration",
             };
}

+ (NSValueTransformer *)eventsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeEventsConfiguration class]];
}

@end

@implementation AWSChimePutVoiceConnectorLoggingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingConfiguration" : @"LoggingConfiguration",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

+ (NSValueTransformer *)loggingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeLoggingConfiguration class]];
}

@end

@implementation AWSChimePutVoiceConnectorLoggingConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"loggingConfiguration" : @"LoggingConfiguration",
             };
}

+ (NSValueTransformer *)loggingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeLoggingConfiguration class]];
}

@end

@implementation AWSChimePutVoiceConnectorOriginationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"origination" : @"Origination",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

+ (NSValueTransformer *)originationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeOrigination class]];
}

@end

@implementation AWSChimePutVoiceConnectorOriginationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"origination" : @"Origination",
             };
}

+ (NSValueTransformer *)originationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeOrigination class]];
}

@end

@implementation AWSChimePutVoiceConnectorProxyRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultSessionExpiryMinutes" : @"DefaultSessionExpiryMinutes",
             @"disabled" : @"Disabled",
             @"fallBackPhoneNumber" : @"FallBackPhoneNumber",
             @"phoneNumberPoolCountries" : @"PhoneNumberPoolCountries",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimePutVoiceConnectorProxyResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"proxy" : @"Proxy",
             };
}

+ (NSValueTransformer *)proxyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeProxy class]];
}

@end

@implementation AWSChimePutVoiceConnectorStreamingConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamingConfiguration" : @"StreamingConfiguration",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

+ (NSValueTransformer *)streamingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeStreamingConfiguration class]];
}

@end

@implementation AWSChimePutVoiceConnectorStreamingConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamingConfiguration" : @"StreamingConfiguration",
             };
}

+ (NSValueTransformer *)streamingConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeStreamingConfiguration class]];
}

@end

@implementation AWSChimePutVoiceConnectorTerminationCredentialsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"credentials" : @"Credentials",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

+ (NSValueTransformer *)credentialsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeCredential class]];
}

@end

@implementation AWSChimePutVoiceConnectorTerminationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"termination" : @"Termination",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

+ (NSValueTransformer *)terminationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeTermination class]];
}

@end

@implementation AWSChimePutVoiceConnectorTerminationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"termination" : @"Termination",
             };
}

+ (NSValueTransformer *)terminationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeTermination class]];
}

@end

@implementation AWSChimeRedactConversationMessageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"conversationId" : @"ConversationId",
             @"messageId" : @"MessageId",
             };
}

@end

@implementation AWSChimeRedactConversationMessageResponse

@end

@implementation AWSChimeRedactRoomMessageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"messageId" : @"MessageId",
             @"roomId" : @"RoomId",
             };
}

@end

@implementation AWSChimeRedactRoomMessageResponse

@end

@implementation AWSChimeRegenerateSecurityTokenRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"botId" : @"BotId",
             };
}

@end

@implementation AWSChimeRegenerateSecurityTokenResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bot" : @"Bot",
             };
}

+ (NSValueTransformer *)botJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeBot class]];
}

@end

@implementation AWSChimeResetPersonalPINRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSChimeResetPersonalPINResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeUser class]];
}

@end

@implementation AWSChimeRestorePhoneNumberRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumberId" : @"PhoneNumberId",
             };
}

@end

@implementation AWSChimeRestorePhoneNumberResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumber" : @"PhoneNumber",
             };
}

+ (NSValueTransformer *)phoneNumberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimePhoneNumber class]];
}

@end

@implementation AWSChimeRoom

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"createdBy" : @"CreatedBy",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"name" : @"Name",
             @"roomId" : @"RoomId",
             @"updatedTimestamp" : @"UpdatedTimestamp",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeRoomMembership

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invitedBy" : @"InvitedBy",
             @"member" : @"Member",
             @"role" : @"Role",
             @"roomId" : @"RoomId",
             @"updatedTimestamp" : @"UpdatedTimestamp",
             };
}

+ (NSValueTransformer *)memberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeMember class]];
}

+ (NSValueTransformer *)roleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Administrator"] == NSOrderedSame) {
            return @(AWSChimeRoomMembershipRoleAdministrator);
        }
        if ([value caseInsensitiveCompare:@"Member"] == NSOrderedSame) {
            return @(AWSChimeRoomMembershipRoleMember);
        }
        return @(AWSChimeRoomMembershipRoleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeRoomMembershipRoleAdministrator:
                return @"Administrator";
            case AWSChimeRoomMembershipRoleMember:
                return @"Member";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)updatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeSearchAvailablePhoneNumbersRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"areaCode" : @"AreaCode",
             @"city" : @"City",
             @"country" : @"Country",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"state" : @"State",
             @"tollFreePrefix" : @"TollFreePrefix",
             };
}

@end

@implementation AWSChimeSearchAvailablePhoneNumbersResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"e164PhoneNumbers" : @"E164PhoneNumbers",
             };
}

@end

@implementation AWSChimeSigninDelegateGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupName" : @"GroupName",
             };
}

@end

@implementation AWSChimeStreamingConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataRetentionInHours" : @"DataRetentionInHours",
             @"disabled" : @"Disabled",
             };
}

@end

@implementation AWSChimeTag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSChimeTagAttendeeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attendeeId" : @"AttendeeId",
             @"meetingId" : @"MeetingId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeTag class]];
}

@end

@implementation AWSChimeTagMeetingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meetingId" : @"MeetingId",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeTag class]];
}

@end

@implementation AWSChimeTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeTag class]];
}

@end

@implementation AWSChimeTelephonySettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inboundCalling" : @"InboundCalling",
             @"outboundCalling" : @"OutboundCalling",
             @"SMS" : @"SMS",
             };
}

@end

@implementation AWSChimeTermination

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callingRegions" : @"CallingRegions",
             @"cidrAllowedList" : @"CidrAllowedList",
             @"cpsLimit" : @"CpsLimit",
             @"defaultPhoneNumber" : @"DefaultPhoneNumber",
             @"disabled" : @"Disabled",
             };
}

@end

@implementation AWSChimeTerminationHealth

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"source" : @"Source",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)timestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeUntagAttendeeRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attendeeId" : @"AttendeeId",
             @"meetingId" : @"MeetingId",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSChimeUntagMeetingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"meetingId" : @"MeetingId",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSChimeUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSChimeUpdateAccountRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeUpdateAccountResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"account" : @"Account",
             };
}

+ (NSValueTransformer *)accountJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeAccount class]];
}

@end

@implementation AWSChimeUpdateAccountSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"accountSettings" : @"AccountSettings",
             };
}

+ (NSValueTransformer *)accountSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeAccountSettings class]];
}

@end

@implementation AWSChimeUpdateAccountSettingsResponse

@end

@implementation AWSChimeUpdateBotRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"botId" : @"BotId",
             @"disabled" : @"Disabled",
             };
}

@end

@implementation AWSChimeUpdateBotResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bot" : @"Bot",
             };
}

+ (NSValueTransformer *)botJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeBot class]];
}

@end

@implementation AWSChimeUpdateGlobalSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"businessCalling" : @"BusinessCalling",
             @"voiceConnector" : @"VoiceConnector",
             };
}

+ (NSValueTransformer *)businessCallingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeBusinessCallingSettings class]];
}

+ (NSValueTransformer *)voiceConnectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeVoiceConnectorSettings class]];
}

@end

@implementation AWSChimeUpdatePhoneNumberRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callingName" : @"CallingName",
             @"phoneNumberId" : @"PhoneNumberId",
             @"productType" : @"ProductType",
             };
}

+ (NSValueTransformer *)productTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BusinessCalling"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberProductTypeBusinessCalling);
        }
        if ([value caseInsensitiveCompare:@"VoiceConnector"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberProductTypeVoiceConnector);
        }
        return @(AWSChimePhoneNumberProductTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimePhoneNumberProductTypeBusinessCalling:
                return @"BusinessCalling";
            case AWSChimePhoneNumberProductTypeVoiceConnector:
                return @"VoiceConnector";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeUpdatePhoneNumberRequestItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callingName" : @"CallingName",
             @"phoneNumberId" : @"PhoneNumberId",
             @"productType" : @"ProductType",
             };
}

+ (NSValueTransformer *)productTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BusinessCalling"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberProductTypeBusinessCalling);
        }
        if ([value caseInsensitiveCompare:@"VoiceConnector"] == NSOrderedSame) {
            return @(AWSChimePhoneNumberProductTypeVoiceConnector);
        }
        return @(AWSChimePhoneNumberProductTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimePhoneNumberProductTypeBusinessCalling:
                return @"BusinessCalling";
            case AWSChimePhoneNumberProductTypeVoiceConnector:
                return @"VoiceConnector";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeUpdatePhoneNumberResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"phoneNumber" : @"PhoneNumber",
             };
}

+ (NSValueTransformer *)phoneNumberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimePhoneNumber class]];
}

@end

@implementation AWSChimeUpdatePhoneNumberSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callingName" : @"CallingName",
             };
}

@end

@implementation AWSChimeUpdateProxySessionRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"capabilities" : @"Capabilities",
             @"expiryMinutes" : @"ExpiryMinutes",
             @"proxySessionId" : @"ProxySessionId",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeUpdateProxySessionResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"proxySession" : @"ProxySession",
             };
}

+ (NSValueTransformer *)proxySessionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeProxySession class]];
}

@end

@implementation AWSChimeUpdateRoomMembershipRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"memberId" : @"MemberId",
             @"role" : @"Role",
             @"roomId" : @"RoomId",
             };
}

+ (NSValueTransformer *)roleJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Administrator"] == NSOrderedSame) {
            return @(AWSChimeRoomMembershipRoleAdministrator);
        }
        if ([value caseInsensitiveCompare:@"Member"] == NSOrderedSame) {
            return @(AWSChimeRoomMembershipRoleMember);
        }
        return @(AWSChimeRoomMembershipRoleUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeRoomMembershipRoleAdministrator:
                return @"Administrator";
            case AWSChimeRoomMembershipRoleMember:
                return @"Member";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeUpdateRoomMembershipResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roomMembership" : @"RoomMembership",
             };
}

+ (NSValueTransformer *)roomMembershipJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeRoomMembership class]];
}

@end

@implementation AWSChimeUpdateRoomRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"name" : @"Name",
             @"roomId" : @"RoomId",
             };
}

@end

@implementation AWSChimeUpdateRoomResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"room" : @"Room",
             };
}

+ (NSValueTransformer *)roomJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeRoom class]];
}

@end

@implementation AWSChimeUpdateUserRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"alexaForBusinessMetadata" : @"AlexaForBusinessMetadata",
             @"licenseType" : @"LicenseType",
             @"userId" : @"UserId",
             @"userType" : @"UserType",
             };
}

+ (NSValueTransformer *)alexaForBusinessMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeAlexaForBusinessMetadata class]];
}

+ (NSValueTransformer *)licenseTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Basic"] == NSOrderedSame) {
            return @(AWSChimeLicenseBasic);
        }
        if ([value caseInsensitiveCompare:@"Plus"] == NSOrderedSame) {
            return @(AWSChimeLicensePlus);
        }
        if ([value caseInsensitiveCompare:@"Pro"] == NSOrderedSame) {
            return @(AWSChimeLicensePro);
        }
        if ([value caseInsensitiveCompare:@"ProTrial"] == NSOrderedSame) {
            return @(AWSChimeLicenseProTrial);
        }
        return @(AWSChimeLicenseUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeLicenseBasic:
                return @"Basic";
            case AWSChimeLicensePlus:
                return @"Plus";
            case AWSChimeLicensePro:
                return @"Pro";
            case AWSChimeLicenseProTrial:
                return @"ProTrial";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)userTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PrivateUser"] == NSOrderedSame) {
            return @(AWSChimeUserTypePrivateUser);
        }
        if ([value caseInsensitiveCompare:@"SharedDevice"] == NSOrderedSame) {
            return @(AWSChimeUserTypeSharedDevice);
        }
        return @(AWSChimeUserTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeUserTypePrivateUser:
                return @"PrivateUser";
            case AWSChimeUserTypeSharedDevice:
                return @"SharedDevice";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeUpdateUserRequestItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alexaForBusinessMetadata" : @"AlexaForBusinessMetadata",
             @"licenseType" : @"LicenseType",
             @"userId" : @"UserId",
             @"userType" : @"UserType",
             };
}

+ (NSValueTransformer *)alexaForBusinessMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeAlexaForBusinessMetadata class]];
}

+ (NSValueTransformer *)licenseTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Basic"] == NSOrderedSame) {
            return @(AWSChimeLicenseBasic);
        }
        if ([value caseInsensitiveCompare:@"Plus"] == NSOrderedSame) {
            return @(AWSChimeLicensePlus);
        }
        if ([value caseInsensitiveCompare:@"Pro"] == NSOrderedSame) {
            return @(AWSChimeLicensePro);
        }
        if ([value caseInsensitiveCompare:@"ProTrial"] == NSOrderedSame) {
            return @(AWSChimeLicenseProTrial);
        }
        return @(AWSChimeLicenseUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeLicenseBasic:
                return @"Basic";
            case AWSChimeLicensePlus:
                return @"Plus";
            case AWSChimeLicensePro:
                return @"Pro";
            case AWSChimeLicenseProTrial:
                return @"ProTrial";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)userTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PrivateUser"] == NSOrderedSame) {
            return @(AWSChimeUserTypePrivateUser);
        }
        if ([value caseInsensitiveCompare:@"SharedDevice"] == NSOrderedSame) {
            return @(AWSChimeUserTypeSharedDevice);
        }
        return @(AWSChimeUserTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeUserTypePrivateUser:
                return @"PrivateUser";
            case AWSChimeUserTypeSharedDevice:
                return @"SharedDevice";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeUpdateUserResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeUser class]];
}

@end

@implementation AWSChimeUpdateUserSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"userId" : @"UserId",
             @"userSettings" : @"UserSettings",
             };
}

+ (NSValueTransformer *)userSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeUserSettings class]];
}

@end

@implementation AWSChimeUpdateVoiceConnectorGroupRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"voiceConnectorGroupId" : @"VoiceConnectorGroupId",
             @"voiceConnectorItems" : @"VoiceConnectorItems",
             };
}

+ (NSValueTransformer *)voiceConnectorItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeVoiceConnectorItem class]];
}

@end

@implementation AWSChimeUpdateVoiceConnectorGroupResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnectorGroup" : @"VoiceConnectorGroup",
             };
}

+ (NSValueTransformer *)voiceConnectorGroupJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeVoiceConnectorGroup class]];
}

@end

@implementation AWSChimeUpdateVoiceConnectorRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"requireEncryption" : @"RequireEncryption",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeUpdateVoiceConnectorResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceConnector" : @"VoiceConnector",
             };
}

+ (NSValueTransformer *)voiceConnectorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeVoiceConnector class]];
}

@end

@implementation AWSChimeUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"accountId" : @"AccountId",
             @"alexaForBusinessMetadata" : @"AlexaForBusinessMetadata",
             @"displayName" : @"DisplayName",
             @"invitedOn" : @"InvitedOn",
             @"licenseType" : @"LicenseType",
             @"personalPIN" : @"PersonalPIN",
             @"primaryEmail" : @"PrimaryEmail",
             @"primaryProvisionedNumber" : @"PrimaryProvisionedNumber",
             @"registeredOn" : @"RegisteredOn",
             @"userId" : @"UserId",
             @"userInvitationStatus" : @"UserInvitationStatus",
             @"userRegistrationStatus" : @"UserRegistrationStatus",
             @"userType" : @"UserType",
             };
}

+ (NSValueTransformer *)alexaForBusinessMetadataJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeAlexaForBusinessMetadata class]];
}

+ (NSValueTransformer *)invitedOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)licenseTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Basic"] == NSOrderedSame) {
            return @(AWSChimeLicenseBasic);
        }
        if ([value caseInsensitiveCompare:@"Plus"] == NSOrderedSame) {
            return @(AWSChimeLicensePlus);
        }
        if ([value caseInsensitiveCompare:@"Pro"] == NSOrderedSame) {
            return @(AWSChimeLicensePro);
        }
        if ([value caseInsensitiveCompare:@"ProTrial"] == NSOrderedSame) {
            return @(AWSChimeLicenseProTrial);
        }
        return @(AWSChimeLicenseUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeLicenseBasic:
                return @"Basic";
            case AWSChimeLicensePlus:
                return @"Plus";
            case AWSChimeLicensePro:
                return @"Pro";
            case AWSChimeLicenseProTrial:
                return @"ProTrial";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)registeredOnJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)userInvitationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Pending"] == NSOrderedSame) {
            return @(AWSChimeInviteStatusPending);
        }
        if ([value caseInsensitiveCompare:@"Accepted"] == NSOrderedSame) {
            return @(AWSChimeInviteStatusAccepted);
        }
        if ([value caseInsensitiveCompare:@"Failed"] == NSOrderedSame) {
            return @(AWSChimeInviteStatusFailed);
        }
        return @(AWSChimeInviteStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeInviteStatusPending:
                return @"Pending";
            case AWSChimeInviteStatusAccepted:
                return @"Accepted";
            case AWSChimeInviteStatusFailed:
                return @"Failed";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)userRegistrationStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Unregistered"] == NSOrderedSame) {
            return @(AWSChimeRegistrationStatusUnregistered);
        }
        if ([value caseInsensitiveCompare:@"Registered"] == NSOrderedSame) {
            return @(AWSChimeRegistrationStatusRegistered);
        }
        if ([value caseInsensitiveCompare:@"Suspended"] == NSOrderedSame) {
            return @(AWSChimeRegistrationStatusSuspended);
        }
        return @(AWSChimeRegistrationStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeRegistrationStatusUnregistered:
                return @"Unregistered";
            case AWSChimeRegistrationStatusRegistered:
                return @"Registered";
            case AWSChimeRegistrationStatusSuspended:
                return @"Suspended";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)userTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PrivateUser"] == NSOrderedSame) {
            return @(AWSChimeUserTypePrivateUser);
        }
        if ([value caseInsensitiveCompare:@"SharedDevice"] == NSOrderedSame) {
            return @(AWSChimeUserTypeSharedDevice);
        }
        return @(AWSChimeUserTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeUserTypePrivateUser:
                return @"PrivateUser";
            case AWSChimeUserTypeSharedDevice:
                return @"SharedDevice";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeUserError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"userId" : @"UserId",
             };
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BadRequest"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeBadRequest);
        }
        if ([value caseInsensitiveCompare:@"Conflict"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeConflict);
        }
        if ([value caseInsensitiveCompare:@"Forbidden"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeForbidden);
        }
        if ([value caseInsensitiveCompare:@"NotFound"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeNotFound);
        }
        if ([value caseInsensitiveCompare:@"PreconditionFailed"] == NSOrderedSame) {
            return @(AWSChimeErrorCodePreconditionFailed);
        }
        if ([value caseInsensitiveCompare:@"ResourceLimitExceeded"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeResourceLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"ServiceFailure"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeServiceFailure);
        }
        if ([value caseInsensitiveCompare:@"AccessDenied"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"ServiceUnavailable"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeServiceUnavailable);
        }
        if ([value caseInsensitiveCompare:@"Throttled"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeThrottled);
        }
        if ([value caseInsensitiveCompare:@"Unauthorized"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeUnauthorized);
        }
        if ([value caseInsensitiveCompare:@"Unprocessable"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeUnprocessable);
        }
        if ([value caseInsensitiveCompare:@"VoiceConnectorGroupAssociationsExist"] == NSOrderedSame) {
            return @(AWSChimeErrorCodeVoiceConnectorGroupAssociationsExist);
        }
        if ([value caseInsensitiveCompare:@"PhoneNumberAssociationsExist"] == NSOrderedSame) {
            return @(AWSChimeErrorCodePhoneNumberAssociationsExist);
        }
        return @(AWSChimeErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeErrorCodeBadRequest:
                return @"BadRequest";
            case AWSChimeErrorCodeConflict:
                return @"Conflict";
            case AWSChimeErrorCodeForbidden:
                return @"Forbidden";
            case AWSChimeErrorCodeNotFound:
                return @"NotFound";
            case AWSChimeErrorCodePreconditionFailed:
                return @"PreconditionFailed";
            case AWSChimeErrorCodeResourceLimitExceeded:
                return @"ResourceLimitExceeded";
            case AWSChimeErrorCodeServiceFailure:
                return @"ServiceFailure";
            case AWSChimeErrorCodeAccessDenied:
                return @"AccessDenied";
            case AWSChimeErrorCodeServiceUnavailable:
                return @"ServiceUnavailable";
            case AWSChimeErrorCodeThrottled:
                return @"Throttled";
            case AWSChimeErrorCodeUnauthorized:
                return @"Unauthorized";
            case AWSChimeErrorCodeUnprocessable:
                return @"Unprocessable";
            case AWSChimeErrorCodeVoiceConnectorGroupAssociationsExist:
                return @"VoiceConnectorGroupAssociationsExist";
            case AWSChimeErrorCodePhoneNumberAssociationsExist:
                return @"PhoneNumberAssociationsExist";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeUserSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"telephony" : @"Telephony",
             };
}

+ (NSValueTransformer *)telephonyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeTelephonySettings class]];
}

@end

@implementation AWSChimeVoiceConnector

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"awsRegion" : @"AwsRegion",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"name" : @"Name",
             @"outboundHostName" : @"OutboundHostName",
             @"requireEncryption" : @"RequireEncryption",
             @"updatedTimestamp" : @"UpdatedTimestamp",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

+ (NSValueTransformer *)awsRegionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"us-east-1"] == NSOrderedSame) {
            return @(AWSChimeVoiceConnectorAwsRegionUsEast1);
        }
        if ([value caseInsensitiveCompare:@"us-west-2"] == NSOrderedSame) {
            return @(AWSChimeVoiceConnectorAwsRegionUsWest2);
        }
        return @(AWSChimeVoiceConnectorAwsRegionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeVoiceConnectorAwsRegionUsEast1:
                return @"us-east-1";
            case AWSChimeVoiceConnectorAwsRegionUsWest2:
                return @"us-west-2";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeVoiceConnectorGroup

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createdTimestamp" : @"CreatedTimestamp",
             @"name" : @"Name",
             @"updatedTimestamp" : @"UpdatedTimestamp",
             @"voiceConnectorGroupId" : @"VoiceConnectorGroupId",
             @"voiceConnectorItems" : @"VoiceConnectorItems",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)updatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)voiceConnectorItemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeVoiceConnectorItem class]];
}

@end

@implementation AWSChimeVoiceConnectorItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"priority" : @"Priority",
             @"voiceConnectorId" : @"VoiceConnectorId",
             };
}

@end

@implementation AWSChimeVoiceConnectorSettings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"cdrBucket" : @"CdrBucket",
             };
}

@end
