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

#import "AWSChimeSDKMessagingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSChimeSDKMessagingErrorDomain = @"com.amazonaws.AWSChimeSDKMessagingErrorDomain";

@implementation AWSChimeSDKMessagingAppInstanceUserMembershipSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"readMarkerTimestamp" : @"ReadMarkerTimestamp",
             @"subChannelId" : @"SubChannelId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)readMarkerTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMembershipTypeDefault);
        }
        if ([value caseInsensitiveCompare:@"HIDDEN"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMembershipTypeHidden);
        }
        return @(AWSChimeSDKMessagingChannelMembershipTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelMembershipTypeDefault:
                return @"DEFAULT";
            case AWSChimeSDKMessagingChannelMembershipTypeHidden:
                return @"HIDDEN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingAssociateChannelFlowRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"channelFlowArn" : @"ChannelFlowArn",
             @"chimeBearer" : @"ChimeBearer",
             };
}

@end

@implementation AWSChimeSDKMessagingBatchChannelMemberships

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"invitedBy" : @"InvitedBy",
             @"members" : @"Members",
             @"subChannelId" : @"SubChannelId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)invitedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

+ (NSValueTransformer *)membersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMembershipTypeDefault);
        }
        if ([value caseInsensitiveCompare:@"HIDDEN"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMembershipTypeHidden);
        }
        return @(AWSChimeSDKMessagingChannelMembershipTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelMembershipTypeDefault:
                return @"DEFAULT";
            case AWSChimeSDKMessagingChannelMembershipTypeHidden:
                return @"HIDDEN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingBatchCreateChannelMembershipError

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"errorCode" : @"ErrorCode",
             @"errorMessage" : @"ErrorMessage",
             @"memberArn" : @"MemberArn",
             };
}

+ (NSValueTransformer *)errorCodeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BadRequest"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodeBadRequest);
        }
        if ([value caseInsensitiveCompare:@"Conflict"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodeConflict);
        }
        if ([value caseInsensitiveCompare:@"Forbidden"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodeForbidden);
        }
        if ([value caseInsensitiveCompare:@"NotFound"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodeNotFound);
        }
        if ([value caseInsensitiveCompare:@"PreconditionFailed"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodePreconditionFailed);
        }
        if ([value caseInsensitiveCompare:@"ResourceLimitExceeded"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodeResourceLimitExceeded);
        }
        if ([value caseInsensitiveCompare:@"ServiceFailure"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodeServiceFailure);
        }
        if ([value caseInsensitiveCompare:@"AccessDenied"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodeAccessDenied);
        }
        if ([value caseInsensitiveCompare:@"ServiceUnavailable"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodeServiceUnavailable);
        }
        if ([value caseInsensitiveCompare:@"Throttled"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodeThrottled);
        }
        if ([value caseInsensitiveCompare:@"Throttling"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodeThrottling);
        }
        if ([value caseInsensitiveCompare:@"Unauthorized"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodeUnauthorized);
        }
        if ([value caseInsensitiveCompare:@"Unprocessable"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodeUnprocessable);
        }
        if ([value caseInsensitiveCompare:@"VoiceConnectorGroupAssociationsExist"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodeVoiceConnectorGroupAssociationsExist);
        }
        if ([value caseInsensitiveCompare:@"PhoneNumberAssociationsExist"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingErrorCodePhoneNumberAssociationsExist);
        }
        return @(AWSChimeSDKMessagingErrorCodeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingErrorCodeBadRequest:
                return @"BadRequest";
            case AWSChimeSDKMessagingErrorCodeConflict:
                return @"Conflict";
            case AWSChimeSDKMessagingErrorCodeForbidden:
                return @"Forbidden";
            case AWSChimeSDKMessagingErrorCodeNotFound:
                return @"NotFound";
            case AWSChimeSDKMessagingErrorCodePreconditionFailed:
                return @"PreconditionFailed";
            case AWSChimeSDKMessagingErrorCodeResourceLimitExceeded:
                return @"ResourceLimitExceeded";
            case AWSChimeSDKMessagingErrorCodeServiceFailure:
                return @"ServiceFailure";
            case AWSChimeSDKMessagingErrorCodeAccessDenied:
                return @"AccessDenied";
            case AWSChimeSDKMessagingErrorCodeServiceUnavailable:
                return @"ServiceUnavailable";
            case AWSChimeSDKMessagingErrorCodeThrottled:
                return @"Throttled";
            case AWSChimeSDKMessagingErrorCodeThrottling:
                return @"Throttling";
            case AWSChimeSDKMessagingErrorCodeUnauthorized:
                return @"Unauthorized";
            case AWSChimeSDKMessagingErrorCodeUnprocessable:
                return @"Unprocessable";
            case AWSChimeSDKMessagingErrorCodeVoiceConnectorGroupAssociationsExist:
                return @"VoiceConnectorGroupAssociationsExist";
            case AWSChimeSDKMessagingErrorCodePhoneNumberAssociationsExist:
                return @"PhoneNumberAssociationsExist";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingBatchCreateChannelMembershipRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"memberArns" : @"MemberArns",
             @"subChannelId" : @"SubChannelId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMembershipTypeDefault);
        }
        if ([value caseInsensitiveCompare:@"HIDDEN"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMembershipTypeHidden);
        }
        return @(AWSChimeSDKMessagingChannelMembershipTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelMembershipTypeDefault:
                return @"DEFAULT";
            case AWSChimeSDKMessagingChannelMembershipTypeHidden:
                return @"HIDDEN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingBatchCreateChannelMembershipResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchChannelMemberships" : @"BatchChannelMemberships",
             @"errors" : @"Errors",
             };
}

+ (NSValueTransformer *)batchChannelMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingBatchChannelMemberships class]];
}

+ (NSValueTransformer *)errorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingBatchCreateChannelMembershipError class]];
}

@end

@implementation AWSChimeSDKMessagingChannel

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"channelFlowArn" : @"ChannelFlowArn",
             @"createdBy" : @"CreatedBy",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"elasticChannelConfiguration" : @"ElasticChannelConfiguration",
             @"expirationSettings" : @"ExpirationSettings",
             @"lastMessageTimestamp" : @"LastMessageTimestamp",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"metadata" : @"Metadata",
             @"mode" : @"Mode",
             @"name" : @"Name",
             @"privacy" : @"Privacy",
             };
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)elasticChannelConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingElasticChannelConfiguration class]];
}

+ (NSValueTransformer *)expirationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingExpirationSettings class]];
}

+ (NSValueTransformer *)lastMessageTimestampJSONTransformer {
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

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNRESTRICTED"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelModeUnrestricted);
        }
        if ([value caseInsensitiveCompare:@"RESTRICTED"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelModeRestricted);
        }
        return @(AWSChimeSDKMessagingChannelModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelModeUnrestricted:
                return @"UNRESTRICTED";
            case AWSChimeSDKMessagingChannelModeRestricted:
                return @"RESTRICTED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)privacyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelPrivacyPublic);
        }
        if ([value caseInsensitiveCompare:@"PRIVATE"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelPrivacyPrivate);
        }
        return @(AWSChimeSDKMessagingChannelPrivacyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelPrivacyPublic:
                return @"PUBLIC";
            case AWSChimeSDKMessagingChannelPrivacyPrivate:
                return @"PRIVATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingChannelAssociatedWithFlowSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"metadata" : @"Metadata",
             @"mode" : @"Mode",
             @"name" : @"Name",
             @"privacy" : @"Privacy",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNRESTRICTED"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelModeUnrestricted);
        }
        if ([value caseInsensitiveCompare:@"RESTRICTED"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelModeRestricted);
        }
        return @(AWSChimeSDKMessagingChannelModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelModeUnrestricted:
                return @"UNRESTRICTED";
            case AWSChimeSDKMessagingChannelModeRestricted:
                return @"RESTRICTED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)privacyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelPrivacyPublic);
        }
        if ([value caseInsensitiveCompare:@"PRIVATE"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelPrivacyPrivate);
        }
        return @(AWSChimeSDKMessagingChannelPrivacyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelPrivacyPublic:
                return @"PUBLIC";
            case AWSChimeSDKMessagingChannelPrivacyPrivate:
                return @"PRIVATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingChannelBan

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"createdBy" : @"CreatedBy",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"member" : @"Member",
             };
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)memberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

@end

@implementation AWSChimeSDKMessagingChannelBanSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"member" : @"Member",
             };
}

+ (NSValueTransformer *)memberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

@end

@implementation AWSChimeSDKMessagingChannelFlow

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelFlowArn" : @"ChannelFlowArn",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"name" : @"Name",
             @"processors" : @"Processors",
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

+ (NSValueTransformer *)processorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingProcessor class]];
}

@end

@implementation AWSChimeSDKMessagingChannelFlowCallbackRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callbackId" : @"CallbackId",
             @"channelArn" : @"ChannelArn",
             @"channelMessage" : @"ChannelMessage",
             @"deleteResource" : @"DeleteResource",
             };
}

+ (NSValueTransformer *)channelMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelMessageCallback class]];
}

@end

@implementation AWSChimeSDKMessagingChannelFlowCallbackResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"callbackId" : @"CallbackId",
             @"channelArn" : @"ChannelArn",
             };
}

@end

@implementation AWSChimeSDKMessagingChannelFlowSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelFlowArn" : @"ChannelFlowArn",
             @"name" : @"Name",
             @"processors" : @"Processors",
             };
}

+ (NSValueTransformer *)processorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingProcessor class]];
}

@end

@implementation AWSChimeSDKMessagingChannelMembership

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"invitedBy" : @"InvitedBy",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"member" : @"Member",
             @"subChannelId" : @"SubChannelId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)invitedByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

+ (NSValueTransformer *)lastUpdatedTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)memberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMembershipTypeDefault);
        }
        if ([value caseInsensitiveCompare:@"HIDDEN"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMembershipTypeHidden);
        }
        return @(AWSChimeSDKMessagingChannelMembershipTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelMembershipTypeDefault:
                return @"DEFAULT";
            case AWSChimeSDKMessagingChannelMembershipTypeHidden:
                return @"HIDDEN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingChannelMembershipForAppInstanceUserSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserMembershipSummary" : @"AppInstanceUserMembershipSummary",
             @"channelSummary" : @"ChannelSummary",
             };
}

+ (NSValueTransformer *)appInstanceUserMembershipSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingAppInstanceUserMembershipSummary class]];
}

+ (NSValueTransformer *)channelSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelSummary class]];
}

@end

@implementation AWSChimeSDKMessagingChannelMembershipPreferences

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pushNotifications" : @"PushNotifications",
             };
}

+ (NSValueTransformer *)pushNotificationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingPushNotificationPreferences class]];
}

@end

@implementation AWSChimeSDKMessagingChannelMembershipSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"member" : @"Member",
             };
}

+ (NSValueTransformer *)memberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

@end

@implementation AWSChimeSDKMessagingChannelMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"content" : @"Content",
             @"contentType" : @"ContentType",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"lastEditedTimestamp" : @"LastEditedTimestamp",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"messageAttributes" : @"MessageAttributes",
             @"messageId" : @"MessageId",
             @"metadata" : @"Metadata",
             @"persistence" : @"Persistence",
             @"redacted" : @"Redacted",
             @"sender" : @"Sender",
             @"status" : @"Status",
             @"subChannelId" : @"SubChannelId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastEditedTimestampJSONTransformer {
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

+ (NSValueTransformer *)messageAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSChimeSDKMessagingMessageAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)persistenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PERSISTENT"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMessagePersistenceTypePersistent);
        }
        if ([value caseInsensitiveCompare:@"NON_PERSISTENT"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMessagePersistenceTypeNonPersistent);
        }
        return @(AWSChimeSDKMessagingChannelMessagePersistenceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelMessagePersistenceTypePersistent:
                return @"PERSISTENT";
            case AWSChimeSDKMessagingChannelMessagePersistenceTypeNonPersistent:
                return @"NON_PERSISTENT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)senderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelMessageStatusStructure class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMessageTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"CONTROL"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMessageTypeControl);
        }
        return @(AWSChimeSDKMessagingChannelMessageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelMessageTypeStandard:
                return @"STANDARD";
            case AWSChimeSDKMessagingChannelMessageTypeControl:
                return @"CONTROL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingChannelMessageCallback

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"contentType" : @"ContentType",
             @"messageAttributes" : @"MessageAttributes",
             @"messageId" : @"MessageId",
             @"metadata" : @"Metadata",
             @"pushNotification" : @"PushNotification",
             @"subChannelId" : @"SubChannelId",
             };
}

+ (NSValueTransformer *)messageAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSChimeSDKMessagingMessageAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)pushNotificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingPushNotificationConfiguration class]];
}

@end

@implementation AWSChimeSDKMessagingChannelMessageStatusStructure

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Detail",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)valueJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SENT"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMessageStatusSent);
        }
        if ([value caseInsensitiveCompare:@"PENDING"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMessageStatusPending);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMessageStatusFailed);
        }
        if ([value caseInsensitiveCompare:@"DENIED"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMessageStatusDenied);
        }
        return @(AWSChimeSDKMessagingChannelMessageStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelMessageStatusSent:
                return @"SENT";
            case AWSChimeSDKMessagingChannelMessageStatusPending:
                return @"PENDING";
            case AWSChimeSDKMessagingChannelMessageStatusFailed:
                return @"FAILED";
            case AWSChimeSDKMessagingChannelMessageStatusDenied:
                return @"DENIED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingChannelMessageSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"contentType" : @"ContentType",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"lastEditedTimestamp" : @"LastEditedTimestamp",
             @"lastUpdatedTimestamp" : @"LastUpdatedTimestamp",
             @"messageAttributes" : @"MessageAttributes",
             @"messageId" : @"MessageId",
             @"metadata" : @"Metadata",
             @"redacted" : @"Redacted",
             @"sender" : @"Sender",
             @"status" : @"Status",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)lastEditedTimestampJSONTransformer {
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

+ (NSValueTransformer *)messageAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSChimeSDKMessagingMessageAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)senderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelMessageStatusStructure class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMessageTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"CONTROL"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMessageTypeControl);
        }
        return @(AWSChimeSDKMessagingChannelMessageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelMessageTypeStandard:
                return @"STANDARD";
            case AWSChimeSDKMessagingChannelMessageTypeControl:
                return @"CONTROL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingChannelModeratedByAppInstanceUserSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelSummary" : @"ChannelSummary",
             };
}

+ (NSValueTransformer *)channelSummaryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelSummary class]];
}

@end

@implementation AWSChimeSDKMessagingChannelModerator

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"createdBy" : @"CreatedBy",
             @"createdTimestamp" : @"CreatedTimestamp",
             @"moderator" : @"Moderator",
             };
}

+ (NSValueTransformer *)createdByJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

+ (NSValueTransformer *)createdTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)moderatorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

@end

@implementation AWSChimeSDKMessagingChannelModeratorSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"moderator" : @"Moderator",
             };
}

+ (NSValueTransformer *)moderatorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

@end

@implementation AWSChimeSDKMessagingChannelSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"lastMessageTimestamp" : @"LastMessageTimestamp",
             @"metadata" : @"Metadata",
             @"mode" : @"Mode",
             @"name" : @"Name",
             @"privacy" : @"Privacy",
             };
}

+ (NSValueTransformer *)lastMessageTimestampJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNRESTRICTED"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelModeUnrestricted);
        }
        if ([value caseInsensitiveCompare:@"RESTRICTED"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelModeRestricted);
        }
        return @(AWSChimeSDKMessagingChannelModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelModeUnrestricted:
                return @"UNRESTRICTED";
            case AWSChimeSDKMessagingChannelModeRestricted:
                return @"RESTRICTED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)privacyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelPrivacyPublic);
        }
        if ([value caseInsensitiveCompare:@"PRIVATE"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelPrivacyPrivate);
        }
        return @(AWSChimeSDKMessagingChannelPrivacyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelPrivacyPublic:
                return @"PUBLIC";
            case AWSChimeSDKMessagingChannelPrivacyPrivate:
                return @"PRIVATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingCreateChannelBanRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"memberArn" : @"MemberArn",
             };
}

@end

@implementation AWSChimeSDKMessagingCreateChannelBanResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"member" : @"Member",
             };
}

+ (NSValueTransformer *)memberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

@end

@implementation AWSChimeSDKMessagingCreateChannelFlowRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"clientRequestToken" : @"ClientRequestToken",
             @"name" : @"Name",
             @"processors" : @"Processors",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)processorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingProcessor class]];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingTag class]];
}

@end

@implementation AWSChimeSDKMessagingCreateChannelFlowResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelFlowArn" : @"ChannelFlowArn",
             };
}

@end

@implementation AWSChimeSDKMessagingCreateChannelMembershipRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"memberArn" : @"MemberArn",
             @"subChannelId" : @"SubChannelId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMembershipTypeDefault);
        }
        if ([value caseInsensitiveCompare:@"HIDDEN"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMembershipTypeHidden);
        }
        return @(AWSChimeSDKMessagingChannelMembershipTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelMembershipTypeDefault:
                return @"DEFAULT";
            case AWSChimeSDKMessagingChannelMembershipTypeHidden:
                return @"HIDDEN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingCreateChannelMembershipResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"member" : @"Member",
             @"subChannelId" : @"SubChannelId",
             };
}

+ (NSValueTransformer *)memberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

@end

@implementation AWSChimeSDKMessagingCreateChannelModeratorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"channelModeratorArn" : @"ChannelModeratorArn",
             @"chimeBearer" : @"ChimeBearer",
             };
}

@end

@implementation AWSChimeSDKMessagingCreateChannelModeratorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"channelModerator" : @"ChannelModerator",
             };
}

+ (NSValueTransformer *)channelModeratorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

@end

@implementation AWSChimeSDKMessagingCreateChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"channelId" : @"ChannelId",
             @"chimeBearer" : @"ChimeBearer",
             @"clientRequestToken" : @"ClientRequestToken",
             @"elasticChannelConfiguration" : @"ElasticChannelConfiguration",
             @"expirationSettings" : @"ExpirationSettings",
             @"memberArns" : @"MemberArns",
             @"metadata" : @"Metadata",
             @"mode" : @"Mode",
             @"moderatorArns" : @"ModeratorArns",
             @"name" : @"Name",
             @"privacy" : @"Privacy",
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)elasticChannelConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingElasticChannelConfiguration class]];
}

+ (NSValueTransformer *)expirationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingExpirationSettings class]];
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNRESTRICTED"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelModeUnrestricted);
        }
        if ([value caseInsensitiveCompare:@"RESTRICTED"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelModeRestricted);
        }
        return @(AWSChimeSDKMessagingChannelModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelModeUnrestricted:
                return @"UNRESTRICTED";
            case AWSChimeSDKMessagingChannelModeRestricted:
                return @"RESTRICTED";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)privacyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelPrivacyPublic);
        }
        if ([value caseInsensitiveCompare:@"PRIVATE"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelPrivacyPrivate);
        }
        return @(AWSChimeSDKMessagingChannelPrivacyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelPrivacyPublic:
                return @"PUBLIC";
            case AWSChimeSDKMessagingChannelPrivacyPrivate:
                return @"PRIVATE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingTag class]];
}

@end

@implementation AWSChimeSDKMessagingCreateChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             };
}

@end

@implementation AWSChimeSDKMessagingDeleteChannelBanRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"memberArn" : @"MemberArn",
             };
}

@end

@implementation AWSChimeSDKMessagingDeleteChannelFlowRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelFlowArn" : @"ChannelFlowArn",
             };
}

@end

@implementation AWSChimeSDKMessagingDeleteChannelMembershipRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"memberArn" : @"MemberArn",
             @"subChannelId" : @"SubChannelId",
             };
}

@end

@implementation AWSChimeSDKMessagingDeleteChannelMessageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"messageId" : @"MessageId",
             @"subChannelId" : @"SubChannelId",
             };
}

@end

@implementation AWSChimeSDKMessagingDeleteChannelModeratorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"channelModeratorArn" : @"ChannelModeratorArn",
             @"chimeBearer" : @"ChimeBearer",
             };
}

@end

@implementation AWSChimeSDKMessagingDeleteChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"subChannelId" : @"SubChannelId",
             };
}

@end

@implementation AWSChimeSDKMessagingDeleteMessagingStreamingConfigurationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKMessagingDescribeChannelBanRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"memberArn" : @"MemberArn",
             };
}

@end

@implementation AWSChimeSDKMessagingDescribeChannelBanResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelBan" : @"ChannelBan",
             };
}

+ (NSValueTransformer *)channelBanJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelBan class]];
}

@end

@implementation AWSChimeSDKMessagingDescribeChannelFlowRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelFlowArn" : @"ChannelFlowArn",
             };
}

@end

@implementation AWSChimeSDKMessagingDescribeChannelFlowResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelFlow" : @"ChannelFlow",
             };
}

+ (NSValueTransformer *)channelFlowJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelFlow class]];
}

@end

@implementation AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             };
}

@end

@implementation AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelMembership" : @"ChannelMembership",
             };
}

+ (NSValueTransformer *)channelMembershipJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelMembershipForAppInstanceUserSummary class]];
}

@end

@implementation AWSChimeSDKMessagingDescribeChannelMembershipRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"memberArn" : @"MemberArn",
             @"subChannelId" : @"SubChannelId",
             };
}

@end

@implementation AWSChimeSDKMessagingDescribeChannelMembershipResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelMembership" : @"ChannelMembership",
             };
}

+ (NSValueTransformer *)channelMembershipJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelMembership class]];
}

@end

@implementation AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             };
}

@end

@implementation AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelModeratedByAppInstanceUserSummary class]];
}

@end

@implementation AWSChimeSDKMessagingDescribeChannelModeratorRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"channelModeratorArn" : @"ChannelModeratorArn",
             @"chimeBearer" : @"ChimeBearer",
             };
}

@end

@implementation AWSChimeSDKMessagingDescribeChannelModeratorResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelModerator" : @"ChannelModerator",
             };
}

+ (NSValueTransformer *)channelModeratorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelModerator class]];
}

@end

@implementation AWSChimeSDKMessagingDescribeChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             };
}

@end

@implementation AWSChimeSDKMessagingDescribeChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channel" : @"Channel",
             };
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannel class]];
}

@end

@implementation AWSChimeSDKMessagingDisassociateChannelFlowRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"channelFlowArn" : @"ChannelFlowArn",
             @"chimeBearer" : @"ChimeBearer",
             };
}

@end

@implementation AWSChimeSDKMessagingElasticChannelConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maximumSubChannels" : @"MaximumSubChannels",
             @"minimumMembershipPercentage" : @"MinimumMembershipPercentage",
             @"targetMembershipsPerSubChannel" : @"TargetMembershipsPerSubChannel",
             };
}

@end

@implementation AWSChimeSDKMessagingExpirationSettings

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
            return @(AWSChimeSDKMessagingExpirationCriterionCreatedTimestamp);
        }
        if ([value caseInsensitiveCompare:@"LAST_MESSAGE_TIMESTAMP"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingExpirationCriterionLastMessageTimestamp);
        }
        return @(AWSChimeSDKMessagingExpirationCriterionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingExpirationCriterionCreatedTimestamp:
                return @"CREATED_TIMESTAMP";
            case AWSChimeSDKMessagingExpirationCriterionLastMessageTimestamp:
                return @"LAST_MESSAGE_TIMESTAMP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingGetChannelMembershipPreferencesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"memberArn" : @"MemberArn",
             };
}

@end

@implementation AWSChimeSDKMessagingGetChannelMembershipPreferencesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"member" : @"Member",
             @"preferences" : @"Preferences",
             };
}

+ (NSValueTransformer *)memberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

+ (NSValueTransformer *)preferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelMembershipPreferences class]];
}

@end

@implementation AWSChimeSDKMessagingGetChannelMessageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"messageId" : @"MessageId",
             @"subChannelId" : @"SubChannelId",
             };
}

@end

@implementation AWSChimeSDKMessagingGetChannelMessageResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelMessage" : @"ChannelMessage",
             };
}

+ (NSValueTransformer *)channelMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelMessage class]];
}

@end

@implementation AWSChimeSDKMessagingGetChannelMessageStatusRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"messageId" : @"MessageId",
             @"subChannelId" : @"SubChannelId",
             };
}

@end

@implementation AWSChimeSDKMessagingGetChannelMessageStatusResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"Status",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelMessageStatusStructure class]];
}

@end

@implementation AWSChimeSDKMessagingGetMessagingSessionEndpointRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation AWSChimeSDKMessagingGetMessagingSessionEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             };
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingMessagingSessionEndpoint class]];
}

@end

@implementation AWSChimeSDKMessagingGetMessagingStreamingConfigurationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             };
}

@end

@implementation AWSChimeSDKMessagingGetMessagingStreamingConfigurationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamingConfigurations" : @"StreamingConfigurations",
             };
}

+ (NSValueTransformer *)streamingConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingStreamingConfiguration class]];
}

@end

@implementation AWSChimeSDKMessagingIdentity

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

@implementation AWSChimeSDKMessagingLambdaConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"invocationType" : @"InvocationType",
             @"resourceArn" : @"ResourceArn",
             };
}

+ (NSValueTransformer *)invocationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASYNC"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingInvocationTypeAsync);
        }
        return @(AWSChimeSDKMessagingInvocationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingInvocationTypeAsync:
                return @"ASYNC";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingListChannelBansRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeSDKMessagingListChannelBansResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"channelBans" : @"ChannelBans",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelBansJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingChannelBanSummary class]];
}

@end

@implementation AWSChimeSDKMessagingListChannelFlowsRequest

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

@implementation AWSChimeSDKMessagingListChannelFlowsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelFlows" : @"ChannelFlows",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelFlowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingChannelFlowSummary class]];
}

@end

@implementation AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"chimeBearer" : @"ChimeBearer",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelMemberships" : @"ChannelMemberships",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingChannelMembershipForAppInstanceUserSummary class]];
}

@end

@implementation AWSChimeSDKMessagingListChannelMembershipsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"subChannelId" : @"SubChannelId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMembershipTypeDefault);
        }
        if ([value caseInsensitiveCompare:@"HIDDEN"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMembershipTypeHidden);
        }
        return @(AWSChimeSDKMessagingChannelMembershipTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelMembershipTypeDefault:
                return @"DEFAULT";
            case AWSChimeSDKMessagingChannelMembershipTypeHidden:
                return @"HIDDEN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingListChannelMembershipsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"channelMemberships" : @"ChannelMemberships",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelMembershipsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingChannelMembershipSummary class]];
}

@end

@implementation AWSChimeSDKMessagingListChannelMessagesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"notAfter" : @"NotAfter",
             @"notBefore" : @"NotBefore",
             @"sortOrder" : @"SortOrder",
             @"subChannelId" : @"SubChannelId",
             };
}

+ (NSValueTransformer *)notAfterJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)notBeforeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sortOrderJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ASCENDING"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingSortOrderAscending);
        }
        if ([value caseInsensitiveCompare:@"DESCENDING"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingSortOrderDescending);
        }
        return @(AWSChimeSDKMessagingSortOrderUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingSortOrderAscending:
                return @"ASCENDING";
            case AWSChimeSDKMessagingSortOrderDescending:
                return @"DESCENDING";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingListChannelMessagesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"channelMessages" : @"ChannelMessages",
             @"nextToken" : @"NextToken",
             @"subChannelId" : @"SubChannelId",
             };
}

+ (NSValueTransformer *)channelMessagesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingChannelMessageSummary class]];
}

@end

@implementation AWSChimeSDKMessagingListChannelModeratorsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeSDKMessagingListChannelModeratorsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"channelModerators" : @"ChannelModerators",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelModeratorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingChannelModeratorSummary class]];
}

@end

@implementation AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelFlowArn" : @"ChannelFlowArn",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channels" : @"Channels",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingChannelAssociatedWithFlowSummary class]];
}

@end

@implementation AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceUserArn" : @"AppInstanceUserArn",
             @"chimeBearer" : @"ChimeBearer",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channels" : @"Channels",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingChannelModeratedByAppInstanceUserSummary class]];
}

@end

@implementation AWSChimeSDKMessagingListChannelsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"chimeBearer" : @"ChimeBearer",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             @"privacy" : @"Privacy",
             };
}

+ (NSValueTransformer *)privacyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUBLIC"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelPrivacyPublic);
        }
        if ([value caseInsensitiveCompare:@"PRIVATE"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelPrivacyPrivate);
        }
        return @(AWSChimeSDKMessagingChannelPrivacyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelPrivacyPublic:
                return @"PUBLIC";
            case AWSChimeSDKMessagingChannelPrivacyPrivate:
                return @"PRIVATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingListChannelsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channels" : @"Channels",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingChannelSummary class]];
}

@end

@implementation AWSChimeSDKMessagingListSubChannelsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSChimeSDKMessagingListSubChannelsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"nextToken" : @"NextToken",
             @"subChannels" : @"SubChannels",
             };
}

+ (NSValueTransformer *)subChannelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingSubChannelSummary class]];
}

@end

@implementation AWSChimeSDKMessagingListTagsForResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceARN" : @"ResourceARN",
             };
}

@end

@implementation AWSChimeSDKMessagingListTagsForResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

+ (NSValueTransformer *)tagsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingTag class]];
}

@end

@implementation AWSChimeSDKMessagingMessageAttributeValue

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"stringValues" : @"StringValues",
             };
}

@end

@implementation AWSChimeSDKMessagingMessagingSessionEndpoint

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"url" : @"Url",
             };
}

@end

@implementation AWSChimeSDKMessagingProcessor

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configuration" : @"Configuration",
             @"executionOrder" : @"ExecutionOrder",
             @"fallbackAction" : @"FallbackAction",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)configurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingProcessorConfiguration class]];
}

+ (NSValueTransformer *)fallbackActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CONTINUE"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingFallbackActionContinue);
        }
        if ([value caseInsensitiveCompare:@"ABORT"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingFallbackActionAbort);
        }
        return @(AWSChimeSDKMessagingFallbackActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingFallbackActionContinue:
                return @"CONTINUE";
            case AWSChimeSDKMessagingFallbackActionAbort:
                return @"ABORT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingProcessorConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lambda" : @"Lambda",
             };
}

+ (NSValueTransformer *)lambdaJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingLambdaConfiguration class]];
}

@end

@implementation AWSChimeSDKMessagingPushNotificationConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"title" : @"Title",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DEFAULT"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingPushNotificationTypeDefault);
        }
        if ([value caseInsensitiveCompare:@"VOIP"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingPushNotificationTypeVoip);
        }
        return @(AWSChimeSDKMessagingPushNotificationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingPushNotificationTypeDefault:
                return @"DEFAULT";
            case AWSChimeSDKMessagingPushNotificationTypeVoip:
                return @"VOIP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingPushNotificationPreferences

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowNotifications" : @"AllowNotifications",
             @"filterRule" : @"FilterRule",
             };
}

+ (NSValueTransformer *)allowNotificationsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingAllowNotificationsAll);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingAllowNotificationsNone);
        }
        if ([value caseInsensitiveCompare:@"FILTERED"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingAllowNotificationsFiltered);
        }
        return @(AWSChimeSDKMessagingAllowNotificationsUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingAllowNotificationsAll:
                return @"ALL";
            case AWSChimeSDKMessagingAllowNotificationsNone:
                return @"NONE";
            case AWSChimeSDKMessagingAllowNotificationsFiltered:
                return @"FILTERED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingPutChannelExpirationSettingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"expirationSettings" : @"ExpirationSettings",
             };
}

+ (NSValueTransformer *)expirationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingExpirationSettings class]];
}

@end

@implementation AWSChimeSDKMessagingPutChannelExpirationSettingsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"expirationSettings" : @"ExpirationSettings",
             };
}

+ (NSValueTransformer *)expirationSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingExpirationSettings class]];
}

@end

@implementation AWSChimeSDKMessagingPutChannelMembershipPreferencesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"memberArn" : @"MemberArn",
             @"preferences" : @"Preferences",
             };
}

+ (NSValueTransformer *)preferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelMembershipPreferences class]];
}

@end

@implementation AWSChimeSDKMessagingPutChannelMembershipPreferencesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"member" : @"Member",
             @"preferences" : @"Preferences",
             };
}

+ (NSValueTransformer *)memberJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingIdentity class]];
}

+ (NSValueTransformer *)preferencesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelMembershipPreferences class]];
}

@end

@implementation AWSChimeSDKMessagingPutMessagingStreamingConfigurationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appInstanceArn" : @"AppInstanceArn",
             @"streamingConfigurations" : @"StreamingConfigurations",
             };
}

+ (NSValueTransformer *)streamingConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingStreamingConfiguration class]];
}

@end

@implementation AWSChimeSDKMessagingPutMessagingStreamingConfigurationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"streamingConfigurations" : @"StreamingConfigurations",
             };
}

+ (NSValueTransformer *)streamingConfigurationsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingStreamingConfiguration class]];
}

@end

@implementation AWSChimeSDKMessagingRedactChannelMessageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"messageId" : @"MessageId",
             @"subChannelId" : @"SubChannelId",
             };
}

@end

@implementation AWSChimeSDKMessagingRedactChannelMessageResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"messageId" : @"MessageId",
             @"subChannelId" : @"SubChannelId",
             };
}

@end

@implementation AWSChimeSDKMessagingSearchChannelsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"chimeBearer" : @"ChimeBearer",
             @"fields" : @"Fields",
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)fieldsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingSearchField class]];
}

@end

@implementation AWSChimeSDKMessagingSearchChannelsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channels" : @"Channels",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)channelsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingChannelSummary class]];
}

@end

@implementation AWSChimeSDKMessagingSearchField

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"operator" : @"Operator",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)keyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"MEMBERS"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingSearchFieldKeyMembers);
        }
        return @(AWSChimeSDKMessagingSearchFieldKeyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingSearchFieldKeyMembers:
                return @"MEMBERS";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)operatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EQUALS"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingSearchFieldOperatorEquals);
        }
        if ([value caseInsensitiveCompare:@"INCLUDES"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingSearchFieldOperatorIncludes);
        }
        return @(AWSChimeSDKMessagingSearchFieldOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingSearchFieldOperatorEquals:
                return @"EQUALS";
            case AWSChimeSDKMessagingSearchFieldOperatorIncludes:
                return @"INCLUDES";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingSendChannelMessageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"clientRequestToken" : @"ClientRequestToken",
             @"content" : @"Content",
             @"contentType" : @"ContentType",
             @"messageAttributes" : @"MessageAttributes",
             @"metadata" : @"Metadata",
             @"persistence" : @"Persistence",
             @"pushNotification" : @"PushNotification",
             @"subChannelId" : @"SubChannelId",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)messageAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSChimeSDKMessagingMessageAttributeValue class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)persistenceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PERSISTENT"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMessagePersistenceTypePersistent);
        }
        if ([value caseInsensitiveCompare:@"NON_PERSISTENT"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMessagePersistenceTypeNonPersistent);
        }
        return @(AWSChimeSDKMessagingChannelMessagePersistenceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelMessagePersistenceTypePersistent:
                return @"PERSISTENT";
            case AWSChimeSDKMessagingChannelMessagePersistenceTypeNonPersistent:
                return @"NON_PERSISTENT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)pushNotificationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingPushNotificationConfiguration class]];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"STANDARD"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMessageTypeStandard);
        }
        if ([value caseInsensitiveCompare:@"CONTROL"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelMessageTypeControl);
        }
        return @(AWSChimeSDKMessagingChannelMessageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelMessageTypeStandard:
                return @"STANDARD";
            case AWSChimeSDKMessagingChannelMessageTypeControl:
                return @"CONTROL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingSendChannelMessageResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"messageId" : @"MessageId",
             @"status" : @"Status",
             @"subChannelId" : @"SubChannelId",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelMessageStatusStructure class]];
}

@end

@implementation AWSChimeSDKMessagingStreamingConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dataType" : @"DataType",
             @"resourceArn" : @"ResourceArn",
             };
}

+ (NSValueTransformer *)dataTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"Channel"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingMessagingDataTypeChannel);
        }
        if ([value caseInsensitiveCompare:@"ChannelMessage"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingMessagingDataTypeChannelMessage);
        }
        return @(AWSChimeSDKMessagingMessagingDataTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingMessagingDataTypeChannel:
                return @"Channel";
            case AWSChimeSDKMessagingMessagingDataTypeChannelMessage:
                return @"ChannelMessage";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingSubChannelSummary

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"membershipCount" : @"MembershipCount",
             @"subChannelId" : @"SubChannelId",
             };
}

@end

@implementation AWSChimeSDKMessagingTag

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

@implementation AWSChimeSDKMessagingTagResourceRequest

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
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingTag class]];
}

@end

@implementation AWSChimeSDKMessagingUntagResourceRequest

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

@implementation AWSChimeSDKMessagingUpdateChannelFlowRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelFlowArn" : @"ChannelFlowArn",
             @"name" : @"Name",
             @"processors" : @"Processors",
             };
}

+ (NSValueTransformer *)processorsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSChimeSDKMessagingProcessor class]];
}

@end

@implementation AWSChimeSDKMessagingUpdateChannelFlowResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelFlowArn" : @"ChannelFlowArn",
             };
}

@end

@implementation AWSChimeSDKMessagingUpdateChannelMessageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"content" : @"Content",
             @"contentType" : @"ContentType",
             @"messageId" : @"MessageId",
             @"metadata" : @"Metadata",
             @"subChannelId" : @"SubChannelId",
             };
}

@end

@implementation AWSChimeSDKMessagingUpdateChannelMessageResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"messageId" : @"MessageId",
             @"status" : @"Status",
             @"subChannelId" : @"SubChannelId",
             };
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSChimeSDKMessagingChannelMessageStatusStructure class]];
}

@end

@implementation AWSChimeSDKMessagingUpdateChannelReadMarkerRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"subChannelId" : @"SubChannelId",
             };
}

@end

@implementation AWSChimeSDKMessagingUpdateChannelReadMarkerResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"subChannelId" : @"SubChannelId",
             };
}

@end

@implementation AWSChimeSDKMessagingUpdateChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             @"chimeBearer" : @"ChimeBearer",
             @"metadata" : @"Metadata",
             @"mode" : @"Mode",
             @"name" : @"Name",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"UNRESTRICTED"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelModeUnrestricted);
        }
        if ([value caseInsensitiveCompare:@"RESTRICTED"] == NSOrderedSame) {
            return @(AWSChimeSDKMessagingChannelModeRestricted);
        }
        return @(AWSChimeSDKMessagingChannelModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSChimeSDKMessagingChannelModeUnrestricted:
                return @"UNRESTRICTED";
            case AWSChimeSDKMessagingChannelModeRestricted:
                return @"RESTRICTED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSChimeSDKMessagingUpdateChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelArn" : @"ChannelArn",
             };
}

@end
