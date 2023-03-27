//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSChimeSDKIdentityModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSChimeSDKIdentityErrorDomain = @"com.amazonaws.AWSChimeSDKIdentityErrorDomain";

@implementation AWSChimeSDKIdentityAppInstance

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeSDKIdentityAppInstanceAdmin

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"admin" : @"Admin",
             @"appInstanceArn" : @"AppInstanceArn",
             @"createdTimestamp" : @"CreatedTimestamp",
             };
}

+ (NSValueTransformer *)adminJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityIdentity class]];
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeSDKIdentityAppInstanceAdminSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"admin" : @"Admin",
             };
}

+ (NSValueTransformer *)adminJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityIdentity class]];
}

@end

@implementation AWSChimeSDKIdentityAppInstanceBot

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceBotArn" : @"AppInstanceBotArn",
             @"configuration" : @"Configuration",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)configurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityConfiguration class]];
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastUpdatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeSDKIdentityAppInstanceBotSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceBotArn" : @"AppInstanceBotArn",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeSDKIdentityAppInstanceRetentionSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelRetentionSettings" : @"ChannelRetentionSettings",
             };
}

+ (NSValueTransformer *)channelRetentionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityChannelRetentionSettings class]];
}

@end

@implementation AWSChimeSDKIdentityAppInstanceSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeSDKIdentityAppInstanceUser

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"expirationSettings" : @"ExpirationSettings",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)expirationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityExpirationSettings class]];
}

+ (NSValueTransformer *)lastUpdatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeSDKIdentityAppInstanceUserEndpoint

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowMessages" : @"AllowMessages",
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"endpointAttributes" : @"EndpointAttributes",
             @"endpointId" : @"EndpointId",
             @"endpointState" : @"EndpointState",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"name" : @"Name",
             @"resourceArn" : @"ResourceArn",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)allowMessagesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAllowMessagesAll);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAllowMessagesNone);
        }
        return @(AWSChimeSDKIdentityAllowMessagesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKIdentityAllowMessagesAll:
                return @"ALL";
            case AWSChimeSDKIdentityAllowMessagesNone:
                return @"NONE";
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

+ (NSValueTransformer *)endpointAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityEndpointAttributes class]];
}

+ (NSValueTransformer *)endpointStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityEndpointState class]];
}

+ (NSValueTransformer *)lastUpdatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAppInstanceUserEndpointTypeApns);
        }
        if ([value caseInsensitiveCompare:@"APNS_SANDBOX"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAppInstanceUserEndpointTypeApnsSandbox);
        }
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAppInstanceUserEndpointTypeGcm);
        }
        return @(AWSChimeSDKIdentityAppInstanceUserEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKIdentityAppInstanceUserEndpointTypeApns:
                return @"APNS";
            case AWSChimeSDKIdentityAppInstanceUserEndpointTypeApnsSandbox:
                return @"APNS_SANDBOX";
            case AWSChimeSDKIdentityAppInstanceUserEndpointTypeGcm:
                return @"GCM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKIdentityAppInstanceUserEndpointSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowMessages" : @"AllowMessages",
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"endpointId" : @"EndpointId",
             @"endpointState" : @"EndpointState",
             @"name" : @"Name",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)allowMessagesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAllowMessagesAll);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAllowMessagesNone);
        }
        return @(AWSChimeSDKIdentityAllowMessagesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKIdentityAllowMessagesAll:
                return @"ALL";
            case AWSChimeSDKIdentityAllowMessagesNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)endpointStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityEndpointState class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAppInstanceUserEndpointTypeApns);
        }
        if ([value caseInsensitiveCompare:@"APNS_SANDBOX"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAppInstanceUserEndpointTypeApnsSandbox);
        }
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAppInstanceUserEndpointTypeGcm);
        }
        return @(AWSChimeSDKIdentityAppInstanceUserEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKIdentityAppInstanceUserEndpointTypeApns:
                return @"APNS";
            case AWSChimeSDKIdentityAppInstanceUserEndpointTypeApnsSandbox:
                return @"APNS_SANDBOX";
            case AWSChimeSDKIdentityAppInstanceUserEndpointTypeGcm:
                return @"GCM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKIdentityAppInstanceUserSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeSDKIdentityChannelRetentionSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"retentionDays" : @"RetentionDays",
             };
}

@end

@implementation AWSChimeSDKIdentityConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lex" : @"Lex",
             };
}

+ (NSValueTransformer *)lexJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityLexConfiguration class]];
}

@end

@implementation AWSChimeSDKIdentityCreateAppInstanceAdminRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceAdminArn" : @"AppInstanceAdminArn",
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityCreateAppInstanceAdminResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceAdmin" : @"AppInstanceAdmin",
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

+ (NSValueTransformer *)appInstanceAdminJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityIdentity class]];
}

@end

@implementation AWSChimeSDKIdentityCreateAppInstanceBotRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"clientRequestToken" : @"ClientRequestToken",
             @"configuration" : @"Configuration",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)configurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityConfiguration class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityTag class]];
}

@end

@implementation AWSChimeSDKIdentityCreateAppInstanceBotResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceBotArn" : @"AppInstanceBotArn",
             };
}

@end

@implementation AWSChimeSDKIdentityCreateAppInstanceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientRequestToken" : @"ClientRequestToken",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityTag class]];
}

@end

@implementation AWSChimeSDKIdentityCreateAppInstanceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityCreateAppInstanceUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"appInstanceUserId" : @"AppInstanceUserId",
             @"clientRequestToken" : @"ClientRequestToken",
             @"expirationSettings" : @"ExpirationSettings",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)expirationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityExpirationSettings class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityTag class]];
}

@end

@implementation AWSChimeSDKIdentityCreateAppInstanceUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDeleteAppInstanceAdminRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceAdminArn" : @"AppInstanceAdminArn",
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDeleteAppInstanceBotRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceBotArn" : @"AppInstanceBotArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDeleteAppInstanceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDeleteAppInstanceUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDeregisterAppInstanceUserEndpointRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"endpointId" : @"EndpointId",
             };
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceAdminRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceAdminArn" : @"AppInstanceAdminArn",
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceAdminResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceAdmin" : @"AppInstanceAdmin",
             };
}

+ (NSValueTransformer *)appInstanceAdminJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceAdmin class]];
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceBotRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceBotArn" : @"AppInstanceBotArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceBotResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceBot" : @"AppInstanceBot",
             };
}

+ (NSValueTransformer *)appInstanceBotJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceBot class]];
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstance" : @"AppInstance",
             };
}

+ (NSValueTransformer *)appInstanceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityAppInstance class]];
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceUserEndpointRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"endpointId" : @"EndpointId",
             };
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserEndpoint" : @"AppInstanceUserEndpoint",
             };
}

+ (NSValueTransformer *)appInstanceUserEndpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceUserEndpoint class]];
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             };
}

@end

@implementation AWSChimeSDKIdentityDescribeAppInstanceUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUser" : @"AppInstanceUser",
             };
}

+ (NSValueTransformer *)appInstanceUserJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceUser class]];
}

@end

@implementation AWSChimeSDKIdentityEndpointAttributes

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deviceToken" : @"DeviceToken",
             @"voipDeviceToken" : @"VoipDeviceToken",
             };
}

@end

@implementation AWSChimeSDKIdentityEndpointState

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             @"statusReason" : @"StatusReason",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityEndpointStatusActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityEndpointStatusInactive);
        }
        return @(AWSChimeSDKIdentityEndpointStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKIdentityEndpointStatusActive:
                return @"ACTIVE";
            case AWSChimeSDKIdentityEndpointStatusInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)statusReasonJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INVALID_DEVICE_TOKEN"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityEndpointStatusReasonInvalidDeviceToken);
        }
        if ([value caseInsensitiveCompare:@"INVALID_PINPOINT_ARN"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityEndpointStatusReasonInvalidPinpointArn);
        }
        return @(AWSChimeSDKIdentityEndpointStatusReasonUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKIdentityEndpointStatusReasonInvalidDeviceToken:
                return @"INVALID_DEVICE_TOKEN";
            case AWSChimeSDKIdentityEndpointStatusReasonInvalidPinpointArn:
                return @"INVALID_PINPOINT_ARN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKIdentityExpirationSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"expirationCriterion" : @"ExpirationCriterion",
             @"expirationDays" : @"ExpirationDays",
             };
}

+ (NSValueTransformer *)expirationCriterionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityExpirationCriterionCreatedTimestamp);
        }
        return @(AWSChimeSDKIdentityExpirationCriterionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKIdentityExpirationCriterionCreatedTimestamp:
                return @"CREATED_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceRetentionSettings" : @"AppInstanceRetentionSettings",
             @"initiateDeletionTimestamp" : @"InitiateDeletionTimestamp",
             };
}

+ (NSValueTransformer *)appInstanceRetentionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceRetentionSettings class]];
}

+ (NSValueTransformer *)initiateDeletionTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeSDKIdentityIdentity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeSDKIdentityLexConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lexBotAliasArn" : @"LexBotAliasArn",
             @"localeId" : @"LocaleId",
             @"respondsTo" : @"RespondsTo",
             @"welcomeIntent" : @"WelcomeIntent",
             };
}

+ (NSValueTransformer *)respondsToJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD_MESSAGES"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityRespondsToStandardMessages);
        }
        return @(AWSChimeSDKIdentityRespondsToUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKIdentityRespondsToStandardMessages:
                return @"STANDARD_MESSAGES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKIdentityListAppInstanceAdminsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeSDKIdentityListAppInstanceAdminsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceAdmins" : @"AppInstanceAdmins",
             @"appInstanceArn" : @"AppInstanceArn",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)appInstanceAdminsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceAdminSummary class]];
}

@end

@implementation AWSChimeSDKIdentityListAppInstanceBotsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeSDKIdentityListAppInstanceBotsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"appInstanceBots" : @"AppInstanceBots",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)appInstanceBotsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceBotSummary class]];
}

@end

@implementation AWSChimeSDKIdentityListAppInstanceUserEndpointsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserEndpoints" : @"AppInstanceUserEndpoints",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)appInstanceUserEndpointsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceUserEndpointSummary class]];
}

@end

@implementation AWSChimeSDKIdentityListAppInstanceUsersRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeSDKIdentityListAppInstanceUsersResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"appInstanceUsers" : @"AppInstanceUsers",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)appInstanceUsersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceUserSummary class]];
}

@end

@implementation AWSChimeSDKIdentityListAppInstancesRequest

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

@implementation AWSChimeSDKIdentityListAppInstancesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstances" : @"AppInstances",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)appInstancesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceSummary class]];
}

@end

@implementation AWSChimeSDKIdentityListTagsForResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSChimeSDKIdentityListTagsForResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityTag class]];
}

@end

@implementation AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"appInstanceRetentionSettings" : @"AppInstanceRetentionSettings",
             };
}

+ (NSValueTransformer *)appInstanceRetentionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceRetentionSettings class]];
}

@end

@implementation AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceRetentionSettings" : @"AppInstanceRetentionSettings",
             @"initiateDeletionTimestamp" : @"InitiateDeletionTimestamp",
             };
}

+ (NSValueTransformer *)appInstanceRetentionSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityAppInstanceRetentionSettings class]];
}

+ (NSValueTransformer *)initiateDeletionTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"expirationSettings" : @"ExpirationSettings",
             };
}

+ (NSValueTransformer *)expirationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityExpirationSettings class]];
}

@end

@implementation AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"expirationSettings" : @"ExpirationSettings",
             };
}

+ (NSValueTransformer *)expirationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityExpirationSettings class]];
}

@end

@implementation AWSChimeSDKIdentityRegisterAppInstanceUserEndpointRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowMessages" : @"AllowMessages",
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"clientRequestToken" : @"ClientRequestToken",
             @"endpointAttributes" : @"EndpointAttributes",
             @"name" : @"Name",
             @"resourceArn" : @"ResourceArn",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)allowMessagesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAllowMessagesAll);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAllowMessagesNone);
        }
        return @(AWSChimeSDKIdentityAllowMessagesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKIdentityAllowMessagesAll:
                return @"ALL";
            case AWSChimeSDKIdentityAllowMessagesNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)endpointAttributesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKIdentityEndpointAttributes class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAppInstanceUserEndpointTypeApns);
        }
        if ([value caseInsensitiveCompare:@"APNS_SANDBOX"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAppInstanceUserEndpointTypeApnsSandbox);
        }
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAppInstanceUserEndpointTypeGcm);
        }
        return @(AWSChimeSDKIdentityAppInstanceUserEndpointTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKIdentityAppInstanceUserEndpointTypeApns:
                return @"APNS";
            case AWSChimeSDKIdentityAppInstanceUserEndpointTypeApnsSandbox:
                return @"APNS_SANDBOX";
            case AWSChimeSDKIdentityAppInstanceUserEndpointTypeGcm:
                return @"GCM";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"endpointId" : @"EndpointId",
             };
}

@end

@implementation AWSChimeSDKIdentityTag

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"value" : @"Value",
             };
}

@end

@implementation AWSChimeSDKIdentityTagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKIdentityTag class]];
}

@end

@implementation AWSChimeSDKIdentityUntagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSChimeSDKIdentityUpdateAppInstanceBotRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceBotArn" : @"AppInstanceBotArn",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeSDKIdentityUpdateAppInstanceBotResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceBotArn" : @"AppInstanceBotArn",
             };
}

@end

@implementation AWSChimeSDKIdentityUpdateAppInstanceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeSDKIdentityUpdateAppInstanceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKIdentityUpdateAppInstanceUserEndpointRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowMessages" : @"AllowMessages",
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"endpointId" : @"EndpointId",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)allowMessagesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAllowMessagesAll);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSChimeSDKIdentityAllowMessagesNone);
        }
        return @(AWSChimeSDKIdentityAllowMessagesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKIdentityAllowMessagesAll:
                return @"ALL";
            case AWSChimeSDKIdentityAllowMessagesNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"endpointId" : @"EndpointId",
             };
}

@end

@implementation AWSChimeSDKIdentityUpdateAppInstanceUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"metadata" : @"Metadata",
             @"name" : @"Name",
             };
}

@end

@implementation AWSChimeSDKIdentityUpdateAppInstanceUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             };
}

@end
