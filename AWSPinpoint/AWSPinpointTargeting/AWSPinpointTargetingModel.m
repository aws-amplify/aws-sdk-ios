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

#import "AWSPinpointTargetingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSPinpointTargetingErrorDomain = @"com.amazonaws.AWSPinpointTargetingErrorDomain";

@implementation AWSPinpointTargetingADMChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"clientSecret" : @"ClientSecret",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSPinpointTargetingADMChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingADMMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"body" : @"Body",
             @"consolidationKey" : @"ConsolidationKey",
             @"data" : @"Data",
             @"expiresAfter" : @"ExpiresAfter",
             @"iconReference" : @"IconReference",
             @"imageIconUrl" : @"ImageIconUrl",
             @"imageUrl" : @"ImageUrl",
             @"MD5" : @"MD5",
             @"rawContent" : @"RawContent",
             @"silentPush" : @"SilentPush",
             @"smallImageIconUrl" : @"SmallImageIconUrl",
             @"sound" : @"Sound",
             @"substitutions" : @"Substitutions",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionUrl);
        }
        return @(AWSPinpointTargetingActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointTargetingActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointTargetingActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingAPNSChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleId" : @"BundleId",
             @"certificate" : @"Certificate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"privateKey" : @"PrivateKey",
             @"teamId" : @"TeamId",
             @"tokenKey" : @"TokenKey",
             @"tokenKeyId" : @"TokenKeyId",
             };
}

@end

@implementation AWSPinpointTargetingAPNSChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"hasTokenKey" : @"HasTokenKey",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingAPNSMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSPushType" : @"APNSPushType",
             @"action" : @"Action",
             @"badge" : @"Badge",
             @"body" : @"Body",
             @"category" : @"Category",
             @"collapseId" : @"CollapseId",
             @"data" : @"Data",
             @"mediaUrl" : @"MediaUrl",
             @"preferredAuthenticationMethod" : @"PreferredAuthenticationMethod",
             @"priority" : @"Priority",
             @"rawContent" : @"RawContent",
             @"silentPush" : @"SilentPush",
             @"sound" : @"Sound",
             @"substitutions" : @"Substitutions",
             @"threadId" : @"ThreadId",
             @"timeToLive" : @"TimeToLive",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionUrl);
        }
        return @(AWSPinpointTargetingActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointTargetingActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointTargetingActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingAPNSPushNotificationTemplate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"body" : @"Body",
             @"mediaUrl" : @"MediaUrl",
             @"rawContent" : @"RawContent",
             @"sound" : @"Sound",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionUrl);
        }
        return @(AWSPinpointTargetingActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointTargetingActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointTargetingActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingAPNSSandboxChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleId" : @"BundleId",
             @"certificate" : @"Certificate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"privateKey" : @"PrivateKey",
             @"teamId" : @"TeamId",
             @"tokenKey" : @"TokenKey",
             @"tokenKeyId" : @"TokenKeyId",
             };
}

@end

@implementation AWSPinpointTargetingAPNSSandboxChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"hasTokenKey" : @"HasTokenKey",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingAPNSVoipChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleId" : @"BundleId",
             @"certificate" : @"Certificate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"privateKey" : @"PrivateKey",
             @"teamId" : @"TeamId",
             @"tokenKey" : @"TokenKey",
             @"tokenKeyId" : @"TokenKeyId",
             };
}

@end

@implementation AWSPinpointTargetingAPNSVoipChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"hasTokenKey" : @"HasTokenKey",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingAPNSVoipSandboxChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bundleId" : @"BundleId",
             @"certificate" : @"Certificate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"privateKey" : @"PrivateKey",
             @"teamId" : @"TeamId",
             @"tokenKey" : @"TokenKey",
             @"tokenKeyId" : @"TokenKeyId",
             };
}

@end

@implementation AWSPinpointTargetingAPNSVoipSandboxChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"defaultAuthenticationMethod" : @"DefaultAuthenticationMethod",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"hasTokenKey" : @"HasTokenKey",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingActivitiesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingActivityResponse class]];
}

@end

@implementation AWSPinpointTargetingActivity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"CUSTOM" : @"CUSTOM",
             @"conditionalSplit" : @"ConditionalSplit",
             @"contactCenter" : @"ContactCenter",
             @"detail" : @"Description",
             @"EMAIL" : @"EMAIL",
             @"holdout" : @"Holdout",
             @"multiCondition" : @"MultiCondition",
             @"PUSH" : @"PUSH",
             @"randomSplit" : @"RandomSplit",
             @"SMS" : @"SMS",
             @"wait" : @"Wait",
             };
}

+ (NSValueTransformer *)CUSTOMJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCustomMessageActivity class]];
}

+ (NSValueTransformer *)conditionalSplitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingConditionalSplitActivity class]];
}

+ (NSValueTransformer *)contactCenterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingContactCenterActivity class]];
}

+ (NSValueTransformer *)EMAILJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEmailMessageActivity class]];
}

+ (NSValueTransformer *)holdoutJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingHoldoutActivity class]];
}

+ (NSValueTransformer *)multiConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMultiConditionalSplitActivity class]];
}

+ (NSValueTransformer *)PUSHJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingPushMessageActivity class]];
}

+ (NSValueTransformer *)randomSplitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingRandomSplitActivity class]];
}

+ (NSValueTransformer *)SMSJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSMSMessageActivity class]];
}

+ (NSValueTransformer *)waitJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWaitActivity class]];
}

@end

@implementation AWSPinpointTargetingActivityResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"end" : @"End",
             @"identifier" : @"Id",
             @"result" : @"Result",
             @"scheduledStart" : @"ScheduledStart",
             @"start" : @"Start",
             @"state" : @"State",
             @"successfulEndpointCount" : @"SuccessfulEndpointCount",
             @"timezonesCompletedCount" : @"TimezonesCompletedCount",
             @"timezonesTotalCount" : @"TimezonesTotalCount",
             @"totalEndpointCount" : @"TotalEndpointCount",
             @"treatmentId" : @"TreatmentId",
             };
}

@end

@implementation AWSPinpointTargetingAddressConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bodyOverride" : @"BodyOverride",
             @"channelType" : @"ChannelType",
             @"context" : @"Context",
             @"rawContent" : @"RawContent",
             @"substitutions" : @"Substitutions",
             @"titleOverride" : @"TitleOverride",
             };
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUSH"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypePush);
        }
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeGcm);
        }
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApns);
        }
        if ([value caseInsensitiveCompare:@"APNS_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsSandbox);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsVoip);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsVoipSandbox);
        }
        if ([value caseInsensitiveCompare:@"ADM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeAdm);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"BAIDU"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeBaidu);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"IN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeInApp);
        }
        return @(AWSPinpointTargetingChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingChannelTypePush:
                return @"PUSH";
            case AWSPinpointTargetingChannelTypeGcm:
                return @"GCM";
            case AWSPinpointTargetingChannelTypeApns:
                return @"APNS";
            case AWSPinpointTargetingChannelTypeApnsSandbox:
                return @"APNS_SANDBOX";
            case AWSPinpointTargetingChannelTypeApnsVoip:
                return @"APNS_VOIP";
            case AWSPinpointTargetingChannelTypeApnsVoipSandbox:
                return @"APNS_VOIP_SANDBOX";
            case AWSPinpointTargetingChannelTypeAdm:
                return @"ADM";
            case AWSPinpointTargetingChannelTypeSms:
                return @"SMS";
            case AWSPinpointTargetingChannelTypeVoice:
                return @"VOICE";
            case AWSPinpointTargetingChannelTypeEmail:
                return @"EMAIL";
            case AWSPinpointTargetingChannelTypeBaidu:
                return @"BAIDU";
            case AWSPinpointTargetingChannelTypeCustom:
                return @"CUSTOM";
            case AWSPinpointTargetingChannelTypeInApp:
                return @"IN_APP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingAndroidPushNotificationTemplate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"body" : @"Body",
             @"imageIconUrl" : @"ImageIconUrl",
             @"imageUrl" : @"ImageUrl",
             @"rawContent" : @"RawContent",
             @"smallImageIconUrl" : @"SmallImageIconUrl",
             @"sound" : @"Sound",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionUrl);
        }
        return @(AWSPinpointTargetingActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointTargetingActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointTargetingActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingApplicationDateRangeKpiResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endTime" : @"EndTime",
             @"kpiName" : @"KpiName",
             @"kpiResult" : @"KpiResult",
             @"nextToken" : @"NextToken",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)kpiResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingBaseKpiResult class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPinpointTargetingApplicationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationDate" : @"CreationDate",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSPinpointTargetingApplicationSettingsResource

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignHook" : @"CampaignHook",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"limits" : @"Limits",
             @"quietTime" : @"QuietTime",
             };
}

+ (NSValueTransformer *)campaignHookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignHook class]];
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignLimits class]];
}

+ (NSValueTransformer *)quietTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingQuietTime class]];
}

@end

@implementation AWSPinpointTargetingApplicationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingApplicationResponse class]];
}

@end

@implementation AWSPinpointTargetingAttributeDimension

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributeType" : @"AttributeType",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)attributeTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUSIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAttributeTypeInclusive);
        }
        if ([value caseInsensitiveCompare:@"EXCLUSIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAttributeTypeExclusive);
        }
        if ([value caseInsensitiveCompare:@"CONTAINS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAttributeTypeContains);
        }
        if ([value caseInsensitiveCompare:@"BEFORE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAttributeTypeBefore);
        }
        if ([value caseInsensitiveCompare:@"AFTER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAttributeTypeAfter);
        }
        if ([value caseInsensitiveCompare:@"ON"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAttributeTypeOn);
        }
        if ([value caseInsensitiveCompare:@"BETWEEN"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAttributeTypeBetween);
        }
        return @(AWSPinpointTargetingAttributeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingAttributeTypeInclusive:
                return @"INCLUSIVE";
            case AWSPinpointTargetingAttributeTypeExclusive:
                return @"EXCLUSIVE";
            case AWSPinpointTargetingAttributeTypeContains:
                return @"CONTAINS";
            case AWSPinpointTargetingAttributeTypeBefore:
                return @"BEFORE";
            case AWSPinpointTargetingAttributeTypeAfter:
                return @"AFTER";
            case AWSPinpointTargetingAttributeTypeOn:
                return @"ON";
            case AWSPinpointTargetingAttributeTypeBetween:
                return @"BETWEEN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingAttributesResource

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"attributeType" : @"AttributeType",
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSPinpointTargetingBaiduChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiKey" : @"ApiKey",
             @"enabled" : @"Enabled",
             @"secretKey" : @"SecretKey",
             };
}

@end

@implementation AWSPinpointTargetingBaiduChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"credential" : @"Credential",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingBaiduMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"body" : @"Body",
             @"data" : @"Data",
             @"iconReference" : @"IconReference",
             @"imageIconUrl" : @"ImageIconUrl",
             @"imageUrl" : @"ImageUrl",
             @"rawContent" : @"RawContent",
             @"silentPush" : @"SilentPush",
             @"smallImageIconUrl" : @"SmallImageIconUrl",
             @"sound" : @"Sound",
             @"substitutions" : @"Substitutions",
             @"timeToLive" : @"TimeToLive",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionUrl);
        }
        return @(AWSPinpointTargetingActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointTargetingActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointTargetingActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingBaseKpiResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"rows" : @"Rows",
             };
}

+ (NSValueTransformer *)rowsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingResultRow class]];
}

@end

@implementation AWSPinpointTargetingCampaignCustomMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             };
}

@end

@implementation AWSPinpointTargetingCampaignDateRangeKpiResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"endTime" : @"EndTime",
             @"kpiName" : @"KpiName",
             @"kpiResult" : @"KpiResult",
             @"nextToken" : @"NextToken",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)kpiResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingBaseKpiResult class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPinpointTargetingCampaignEmailMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"fromAddress" : @"FromAddress",
             @"htmlBody" : @"HtmlBody",
             @"title" : @"Title",
             };
}

@end

@implementation AWSPinpointTargetingCampaignEventFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"filterType" : @"FilterType",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEventDimensions class]];
}

+ (NSValueTransformer *)filterTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFilterTypeSystem);
        }
        if ([value caseInsensitiveCompare:@"ENDPOINT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFilterTypeEndpoint);
        }
        return @(AWSPinpointTargetingFilterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingFilterTypeSystem:
                return @"SYSTEM";
            case AWSPinpointTargetingFilterTypeEndpoint:
                return @"ENDPOINT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingCampaignHook

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"lambdaFunctionName" : @"LambdaFunctionName",
             @"mode" : @"Mode",
             @"webUrl" : @"WebUrl",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DELIVERY"] == NSOrderedSame) {
            return @(AWSPinpointTargetingModeDelivery);
        }
        if ([value caseInsensitiveCompare:@"FILTER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingModeFilter);
        }
        return @(AWSPinpointTargetingModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingModeDelivery:
                return @"DELIVERY";
            case AWSPinpointTargetingModeFilter:
                return @"FILTER";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingCampaignInAppMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"content" : @"Content",
             @"customConfig" : @"CustomConfig",
             @"layout" : @"Layout",
             };
}

+ (NSValueTransformer *)contentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingInAppMessageContent class]];
}

+ (NSValueTransformer *)layoutJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BOTTOM_BANNER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutBottomBanner);
        }
        if ([value caseInsensitiveCompare:@"TOP_BANNER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutTopBanner);
        }
        if ([value caseInsensitiveCompare:@"OVERLAYS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutOverlays);
        }
        if ([value caseInsensitiveCompare:@"MOBILE_FEED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutMobileFeed);
        }
        if ([value caseInsensitiveCompare:@"MIDDLE_BANNER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutMiddleBanner);
        }
        if ([value caseInsensitiveCompare:@"CAROUSEL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutCarousel);
        }
        return @(AWSPinpointTargetingLayoutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingLayoutBottomBanner:
                return @"BOTTOM_BANNER";
            case AWSPinpointTargetingLayoutTopBanner:
                return @"TOP_BANNER";
            case AWSPinpointTargetingLayoutOverlays:
                return @"OVERLAYS";
            case AWSPinpointTargetingLayoutMobileFeed:
                return @"MOBILE_FEED";
            case AWSPinpointTargetingLayoutMiddleBanner:
                return @"MIDDLE_BANNER";
            case AWSPinpointTargetingLayoutCarousel:
                return @"CAROUSEL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingCampaignLimits

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"daily" : @"Daily",
             @"maximumDuration" : @"MaximumDuration",
             @"messagesPerSecond" : @"MessagesPerSecond",
             @"session" : @"Session",
             @"total" : @"Total",
             };
}

@end

@implementation AWSPinpointTargetingCampaignResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalTreatments" : @"AdditionalTreatments",
             @"applicationId" : @"ApplicationId",
             @"arn" : @"Arn",
             @"creationDate" : @"CreationDate",
             @"customDeliveryConfiguration" : @"CustomDeliveryConfiguration",
             @"defaultState" : @"DefaultState",
             @"detail" : @"Description",
             @"holdoutPercent" : @"HoldoutPercent",
             @"hook" : @"Hook",
             @"identifier" : @"Id",
             @"isPaused" : @"IsPaused",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"limits" : @"Limits",
             @"messageConfiguration" : @"MessageConfiguration",
             @"name" : @"Name",
             @"priority" : @"Priority",
             @"schedule" : @"Schedule",
             @"segmentId" : @"SegmentId",
             @"segmentVersion" : @"SegmentVersion",
             @"state" : @"State",
             @"templateConfiguration" : @"TemplateConfiguration",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             @"version" : @"Version",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)additionalTreatmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingTreatmentResource class]];
}

+ (NSValueTransformer *)customDeliveryConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCustomDeliveryConfiguration class]];
}

+ (NSValueTransformer *)defaultStateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignState class]];
}

+ (NSValueTransformer *)hookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignHook class]];
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignLimits class]];
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSchedule class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignState class]];
}

+ (NSValueTransformer *)templateConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTemplateConfiguration class]];
}

@end

@implementation AWSPinpointTargetingCampaignSmsMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"entityId" : @"EntityId",
             @"messageType" : @"MessageType",
             @"originationNumber" : @"OriginationNumber",
             @"senderId" : @"SenderId",
             @"templateId" : @"TemplateId",
             };
}

+ (NSValueTransformer *)messageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRANSACTIONAL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingMessageTypeTransactional);
        }
        if ([value caseInsensitiveCompare:@"PROMOTIONAL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingMessageTypePromotional);
        }
        return @(AWSPinpointTargetingMessageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingMessageTypeTransactional:
                return @"TRANSACTIONAL";
            case AWSPinpointTargetingMessageTypePromotional:
                return @"PROMOTIONAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingCampaignState

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignStatus" : @"CampaignStatus",
             };
}

+ (NSValueTransformer *)campaignStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SCHEDULED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingCampaignStatusScheduled);
        }
        if ([value caseInsensitiveCompare:@"EXECUTING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingCampaignStatusExecuting);
        }
        if ([value caseInsensitiveCompare:@"PENDING_NEXT_RUN"] == NSOrderedSame) {
            return @(AWSPinpointTargetingCampaignStatusPendingNextRun);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingCampaignStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingCampaignStatusPaused);
        }
        if ([value caseInsensitiveCompare:@"DELETED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingCampaignStatusDeleted);
        }
        if ([value caseInsensitiveCompare:@"INVALID"] == NSOrderedSame) {
            return @(AWSPinpointTargetingCampaignStatusInvalid);
        }
        return @(AWSPinpointTargetingCampaignStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingCampaignStatusScheduled:
                return @"SCHEDULED";
            case AWSPinpointTargetingCampaignStatusExecuting:
                return @"EXECUTING";
            case AWSPinpointTargetingCampaignStatusPendingNextRun:
                return @"PENDING_NEXT_RUN";
            case AWSPinpointTargetingCampaignStatusCompleted:
                return @"COMPLETED";
            case AWSPinpointTargetingCampaignStatusPaused:
                return @"PAUSED";
            case AWSPinpointTargetingCampaignStatusDeleted:
                return @"DELETED";
            case AWSPinpointTargetingCampaignStatusInvalid:
                return @"INVALID";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingCampaignsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingCampaignResponse class]];
}

@end

@implementation AWSPinpointTargetingChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingChannelsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channels" : @"Channels",
             };
}

+ (NSValueTransformer *)channelsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingChannelResponse class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointTargetingCondition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"conditions" : @"Conditions",
             @"operator" : @"Operator",
             };
}

+ (NSValueTransformer *)conditionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingSimpleCondition class]];
}

+ (NSValueTransformer *)operatorJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingOperatorAll);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSPinpointTargetingOperatorAny);
        }
        return @(AWSPinpointTargetingOperatorUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingOperatorAll:
                return @"ALL";
            case AWSPinpointTargetingOperatorAny:
                return @"ANY";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingConditionalSplitActivity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"condition" : @"Condition",
             @"evaluationWaitTime" : @"EvaluationWaitTime",
             @"falseActivity" : @"FalseActivity",
             @"trueActivity" : @"TrueActivity",
             };
}

+ (NSValueTransformer *)conditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCondition class]];
}

+ (NSValueTransformer *)evaluationWaitTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWaitTime class]];
}

@end

@implementation AWSPinpointTargetingContactCenterActivity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextActivity" : @"NextActivity",
             };
}

@end

@implementation AWSPinpointTargetingCreateAppRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createApplicationRequest" : @"CreateApplicationRequest",
             };
}

+ (NSValueTransformer *)createApplicationRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCreateApplicationRequest class]];
}

@end

@implementation AWSPinpointTargetingCreateAppResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationResponse" : @"ApplicationResponse",
             };
}

+ (NSValueTransformer *)applicationResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingApplicationResponse class]];
}

@end

@implementation AWSPinpointTargetingCreateApplicationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSPinpointTargetingCreateCampaignRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"writeCampaignRequest" : @"WriteCampaignRequest",
             };
}

+ (NSValueTransformer *)writeCampaignRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWriteCampaignRequest class]];
}

@end

@implementation AWSPinpointTargetingCreateCampaignResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignResponse class]];
}

@end

@implementation AWSPinpointTargetingCreateEmailTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailTemplateRequest" : @"EmailTemplateRequest",
             @"templateName" : @"TemplateName",
             };
}

+ (NSValueTransformer *)emailTemplateRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEmailTemplateRequest class]];
}

@end

@implementation AWSPinpointTargetingCreateEmailTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTemplateMessageBody" : @"CreateTemplateMessageBody",
             };
}

+ (NSValueTransformer *)createTemplateMessageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCreateTemplateMessageBody class]];
}

@end

@implementation AWSPinpointTargetingCreateExportJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"exportJobRequest" : @"ExportJobRequest",
             };
}

+ (NSValueTransformer *)exportJobRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingExportJobRequest class]];
}

@end

@implementation AWSPinpointTargetingCreateExportJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportJobResponse" : @"ExportJobResponse",
             };
}

+ (NSValueTransformer *)exportJobResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingExportJobResponse class]];
}

@end

@implementation AWSPinpointTargetingCreateImportJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"importJobRequest" : @"ImportJobRequest",
             };
}

+ (NSValueTransformer *)importJobRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingImportJobRequest class]];
}

@end

@implementation AWSPinpointTargetingCreateImportJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importJobResponse" : @"ImportJobResponse",
             };
}

+ (NSValueTransformer *)importJobResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingImportJobResponse class]];
}

@end

@implementation AWSPinpointTargetingCreateInAppTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inAppTemplateRequest" : @"InAppTemplateRequest",
             @"templateName" : @"TemplateName",
             };
}

+ (NSValueTransformer *)inAppTemplateRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingInAppTemplateRequest class]];
}

@end

@implementation AWSPinpointTargetingCreateInAppTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateCreateMessageBody" : @"TemplateCreateMessageBody",
             };
}

+ (NSValueTransformer *)templateCreateMessageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTemplateCreateMessageBody class]];
}

@end

@implementation AWSPinpointTargetingCreateJourneyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"writeJourneyRequest" : @"WriteJourneyRequest",
             };
}

+ (NSValueTransformer *)writeJourneyRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWriteJourneyRequest class]];
}

@end

@implementation AWSPinpointTargetingCreateJourneyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"journeyResponse" : @"JourneyResponse",
             };
}

+ (NSValueTransformer *)journeyResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyResponse class]];
}

@end

@implementation AWSPinpointTargetingCreatePushTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pushNotificationTemplateRequest" : @"PushNotificationTemplateRequest",
             @"templateName" : @"TemplateName",
             };
}

+ (NSValueTransformer *)pushNotificationTemplateRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingPushNotificationTemplateRequest class]];
}

@end

@implementation AWSPinpointTargetingCreatePushTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTemplateMessageBody" : @"CreateTemplateMessageBody",
             };
}

+ (NSValueTransformer *)createTemplateMessageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCreateTemplateMessageBody class]];
}

@end

@implementation AWSPinpointTargetingCreateRecommenderConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"recommendationProviderIdType" : @"RecommendationProviderIdType",
             @"recommendationProviderRoleArn" : @"RecommendationProviderRoleArn",
             @"recommendationProviderUri" : @"RecommendationProviderUri",
             @"recommendationTransformerUri" : @"RecommendationTransformerUri",
             @"recommendationsDisplayName" : @"RecommendationsDisplayName",
             @"recommendationsPerMessage" : @"RecommendationsPerMessage",
             };
}

@end

@implementation AWSPinpointTargetingCreateRecommenderConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createRecommenderConfiguration" : @"CreateRecommenderConfiguration",
             };
}

+ (NSValueTransformer *)createRecommenderConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCreateRecommenderConfiguration class]];
}

@end

@implementation AWSPinpointTargetingCreateRecommenderConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recommenderConfigurationResponse" : @"RecommenderConfigurationResponse",
             };
}

+ (NSValueTransformer *)recommenderConfigurationResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingRecommenderConfigurationResponse class]];
}

@end

@implementation AWSPinpointTargetingCreateSegmentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"writeSegmentRequest" : @"WriteSegmentRequest",
             };
}

+ (NSValueTransformer *)writeSegmentRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWriteSegmentRequest class]];
}

@end

@implementation AWSPinpointTargetingCreateSegmentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentResponse class]];
}

@end

@implementation AWSPinpointTargetingCreateSmsTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SMSTemplateRequest" : @"SMSTemplateRequest",
             @"templateName" : @"TemplateName",
             };
}

+ (NSValueTransformer *)SMSTemplateRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSMSTemplateRequest class]];
}

@end

@implementation AWSPinpointTargetingCreateSmsTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTemplateMessageBody" : @"CreateTemplateMessageBody",
             };
}

+ (NSValueTransformer *)createTemplateMessageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCreateTemplateMessageBody class]];
}

@end

@implementation AWSPinpointTargetingCreateTemplateMessageBody

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"message" : @"Message",
             @"requestID" : @"RequestID",
             };
}

@end

@implementation AWSPinpointTargetingCreateVoiceTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             @"voiceTemplateRequest" : @"VoiceTemplateRequest",
             };
}

+ (NSValueTransformer *)voiceTemplateRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingVoiceTemplateRequest class]];
}

@end

@implementation AWSPinpointTargetingCreateVoiceTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createTemplateMessageBody" : @"CreateTemplateMessageBody",
             };
}

+ (NSValueTransformer *)createTemplateMessageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCreateTemplateMessageBody class]];
}

@end

@implementation AWSPinpointTargetingCustomDeliveryConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryUri" : @"DeliveryUri",
             @"endpointTypes" : @"EndpointTypes",
             };
}

@end

@implementation AWSPinpointTargetingCustomMessageActivity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryUri" : @"DeliveryUri",
             @"endpointTypes" : @"EndpointTypes",
             @"messageConfig" : @"MessageConfig",
             @"nextActivity" : @"NextActivity",
             @"templateName" : @"TemplateName",
             @"templateVersion" : @"TemplateVersion",
             };
}

+ (NSValueTransformer *)messageConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyCustomMessage class]];
}

@end

@implementation AWSPinpointTargetingDefaultButtonConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backgroundColor" : @"BackgroundColor",
             @"borderRadius" : @"BorderRadius",
             @"buttonAction" : @"ButtonAction",
             @"link" : @"Link",
             @"text" : @"Text",
             @"textColor" : @"TextColor",
             };
}

+ (NSValueTransformer *)buttonActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LINK"] == NSOrderedSame) {
            return @(AWSPinpointTargetingButtonActionLink);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointTargetingButtonActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"CLOSE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingButtonActionClose);
        }
        return @(AWSPinpointTargetingButtonActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingButtonActionLink:
                return @"LINK";
            case AWSPinpointTargetingButtonActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointTargetingButtonActionClose:
                return @"CLOSE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingDefaultMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"substitutions" : @"Substitutions",
             };
}

@end

@implementation AWSPinpointTargetingDefaultPushNotificationMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"body" : @"Body",
             @"data" : @"Data",
             @"silentPush" : @"SilentPush",
             @"substitutions" : @"Substitutions",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionUrl);
        }
        return @(AWSPinpointTargetingActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointTargetingActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointTargetingActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingDefaultPushNotificationTemplate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"body" : @"Body",
             @"sound" : @"Sound",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionUrl);
        }
        return @(AWSPinpointTargetingActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointTargetingActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointTargetingActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingDeleteAdmChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteAdmChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADMChannelResponse" : @"ADMChannelResponse",
             };
}

+ (NSValueTransformer *)ADMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingADMChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteApnsChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteApnsChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSChannelResponse" : @"APNSChannelResponse",
             };
}

+ (NSValueTransformer *)APNSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteApnsSandboxChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteApnsSandboxChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSSandboxChannelResponse" : @"APNSSandboxChannelResponse",
             };
}

+ (NSValueTransformer *)APNSSandboxChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSSandboxChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteApnsVoipChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteApnsVoipChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipChannelResponse" : @"APNSVoipChannelResponse",
             };
}

+ (NSValueTransformer *)APNSVoipChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSVoipChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipSandboxChannelResponse" : @"APNSVoipSandboxChannelResponse",
             };
}

+ (NSValueTransformer *)APNSVoipSandboxChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSVoipSandboxChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteAppRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteAppResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationResponse" : @"ApplicationResponse",
             };
}

+ (NSValueTransformer *)applicationResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingApplicationResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteBaiduChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteBaiduChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baiduChannelResponse" : @"BaiduChannelResponse",
             };
}

+ (NSValueTransformer *)baiduChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingBaiduChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteCampaignRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteCampaignResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteEmailChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteEmailChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailChannelResponse" : @"EmailChannelResponse",
             };
}

+ (NSValueTransformer *)emailChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEmailChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteEmailTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingDeleteEmailTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingDeleteEndpointRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointId" : @"EndpointId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointResponse" : @"EndpointResponse",
             };
}

+ (NSValueTransformer *)endpointResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteEventStreamRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteEventStreamResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventStream" : @"EventStream",
             };
}

+ (NSValueTransformer *)eventStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEventStream class]];
}

@end

@implementation AWSPinpointTargetingDeleteGcmChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteGcmChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"GCMChannelResponse" : @"GCMChannelResponse",
             };
}

+ (NSValueTransformer *)GCMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingGCMChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteInAppTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingDeleteInAppTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingDeleteJourneyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"journeyId" : @"JourneyId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteJourneyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"journeyResponse" : @"JourneyResponse",
             };
}

+ (NSValueTransformer *)journeyResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyResponse class]];
}

@end

@implementation AWSPinpointTargetingDeletePushTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingDeletePushTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingDeleteRecommenderConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recommenderId" : @"RecommenderId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteRecommenderConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recommenderConfigurationResponse" : @"RecommenderConfigurationResponse",
             };
}

+ (NSValueTransformer *)recommenderConfigurationResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingRecommenderConfigurationResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteSegmentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteSegmentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteSmsChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteSmsChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SMSChannelResponse" : @"SMSChannelResponse",
             };
}

+ (NSValueTransformer *)SMSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSMSChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteSmsTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingDeleteSmsTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingDeleteUserEndpointsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteUserEndpointsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointsResponse" : @"EndpointsResponse",
             };
}

+ (NSValueTransformer *)endpointsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointsResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteVoiceChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteVoiceChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceChannelResponse" : @"VoiceChannelResponse",
             };
}

+ (NSValueTransformer *)voiceChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingVoiceChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteVoiceTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingDeleteVoiceTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingDirectMessageConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADMMessage" : @"ADMMessage",
             @"APNSMessage" : @"APNSMessage",
             @"baiduMessage" : @"BaiduMessage",
             @"defaultMessage" : @"DefaultMessage",
             @"defaultPushNotificationMessage" : @"DefaultPushNotificationMessage",
             @"emailMessage" : @"EmailMessage",
             @"GCMMessage" : @"GCMMessage",
             @"SMSMessage" : @"SMSMessage",
             @"voiceMessage" : @"VoiceMessage",
             };
}

+ (NSValueTransformer *)ADMMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingADMMessage class]];
}

+ (NSValueTransformer *)APNSMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSMessage class]];
}

+ (NSValueTransformer *)baiduMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingBaiduMessage class]];
}

+ (NSValueTransformer *)defaultMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingDefaultMessage class]];
}

+ (NSValueTransformer *)defaultPushNotificationMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingDefaultPushNotificationMessage class]];
}

+ (NSValueTransformer *)emailMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEmailMessage class]];
}

+ (NSValueTransformer *)GCMMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingGCMMessage class]];
}

+ (NSValueTransformer *)SMSMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSMSMessage class]];
}

+ (NSValueTransformer *)voiceMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingVoiceMessage class]];
}

@end

@implementation AWSPinpointTargetingEmailChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"configurationSet" : @"ConfigurationSet",
             @"enabled" : @"Enabled",
             @"fromAddress" : @"FromAddress",
             @"identity" : @"Identity",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSPinpointTargetingEmailChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"configurationSet" : @"ConfigurationSet",
             @"creationDate" : @"CreationDate",
             @"enabled" : @"Enabled",
             @"fromAddress" : @"FromAddress",
             @"hasCredential" : @"HasCredential",
             @"identifier" : @"Id",
             @"identity" : @"Identity",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"messagesPerSecond" : @"MessagesPerSecond",
             @"platform" : @"Platform",
             @"roleArn" : @"RoleArn",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingEmailMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"feedbackForwardingAddress" : @"FeedbackForwardingAddress",
             @"fromAddress" : @"FromAddress",
             @"rawEmail" : @"RawEmail",
             @"replyToAddresses" : @"ReplyToAddresses",
             @"simpleEmail" : @"SimpleEmail",
             @"substitutions" : @"Substitutions",
             };
}

+ (NSValueTransformer *)rawEmailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingRawEmail class]];
}

+ (NSValueTransformer *)simpleEmailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSimpleEmail class]];
}

@end

@implementation AWSPinpointTargetingEmailMessageActivity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageConfig" : @"MessageConfig",
             @"nextActivity" : @"NextActivity",
             @"templateName" : @"TemplateName",
             @"templateVersion" : @"TemplateVersion",
             };
}

+ (NSValueTransformer *)messageConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyEmailMessage class]];
}

@end

@implementation AWSPinpointTargetingEmailTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defaultSubstitutions" : @"DefaultSubstitutions",
             @"htmlPart" : @"HtmlPart",
             @"recommenderId" : @"RecommenderId",
             @"subject" : @"Subject",
             @"templateDescription" : @"TemplateDescription",
             @"textPart" : @"TextPart",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSPinpointTargetingEmailTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationDate" : @"CreationDate",
             @"defaultSubstitutions" : @"DefaultSubstitutions",
             @"htmlPart" : @"HtmlPart",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"recommenderId" : @"RecommenderId",
             @"subject" : @"Subject",
             @"templateDescription" : @"TemplateDescription",
             @"templateName" : @"TemplateName",
             @"templateType" : @"TemplateType",
             @"textPart" : @"TextPart",
             @"version" : @"Version",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)templateTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"PUSH"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypePush);
        }
        if ([value caseInsensitiveCompare:@"INAPP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeInapp);
        }
        return @(AWSPinpointTargetingTemplateTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingTemplateTypeEmail:
                return @"EMAIL";
            case AWSPinpointTargetingTemplateTypeSms:
                return @"SMS";
            case AWSPinpointTargetingTemplateTypeVoice:
                return @"VOICE";
            case AWSPinpointTargetingTemplateTypePush:
                return @"PUSH";
            case AWSPinpointTargetingTemplateTypeInapp:
                return @"INAPP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingEndpointBatchItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"attributes" : @"Attributes",
             @"channelType" : @"ChannelType",
             @"demographic" : @"Demographic",
             @"effectiveDate" : @"EffectiveDate",
             @"endpointStatus" : @"EndpointStatus",
             @"identifier" : @"Id",
             @"location" : @"Location",
             @"metrics" : @"Metrics",
             @"optOut" : @"OptOut",
             @"requestId" : @"RequestId",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUSH"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypePush);
        }
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeGcm);
        }
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApns);
        }
        if ([value caseInsensitiveCompare:@"APNS_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsSandbox);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsVoip);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsVoipSandbox);
        }
        if ([value caseInsensitiveCompare:@"ADM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeAdm);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"BAIDU"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeBaidu);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"IN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeInApp);
        }
        return @(AWSPinpointTargetingChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingChannelTypePush:
                return @"PUSH";
            case AWSPinpointTargetingChannelTypeGcm:
                return @"GCM";
            case AWSPinpointTargetingChannelTypeApns:
                return @"APNS";
            case AWSPinpointTargetingChannelTypeApnsSandbox:
                return @"APNS_SANDBOX";
            case AWSPinpointTargetingChannelTypeApnsVoip:
                return @"APNS_VOIP";
            case AWSPinpointTargetingChannelTypeApnsVoipSandbox:
                return @"APNS_VOIP_SANDBOX";
            case AWSPinpointTargetingChannelTypeAdm:
                return @"ADM";
            case AWSPinpointTargetingChannelTypeSms:
                return @"SMS";
            case AWSPinpointTargetingChannelTypeVoice:
                return @"VOICE";
            case AWSPinpointTargetingChannelTypeEmail:
                return @"EMAIL";
            case AWSPinpointTargetingChannelTypeBaidu:
                return @"BAIDU";
            case AWSPinpointTargetingChannelTypeCustom:
                return @"CUSTOM";
            case AWSPinpointTargetingChannelTypeInApp:
                return @"IN_APP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)demographicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointDemographic class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointLocation class]];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointUser class]];
}

@end

@implementation AWSPinpointTargetingEndpointBatchRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingEndpointBatchItem class]];
}

@end

@implementation AWSPinpointTargetingEndpointDemographic

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appVersion" : @"AppVersion",
             @"locale" : @"Locale",
             @"make" : @"Make",
             @"model" : @"Model",
             @"modelVersion" : @"ModelVersion",
             @"platform" : @"Platform",
             @"platformVersion" : @"PlatformVersion",
             @"timezone" : @"Timezone",
             };
}

@end

@implementation AWSPinpointTargetingEndpointItemResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"statusCode" : @"StatusCode",
             };
}

@end

@implementation AWSPinpointTargetingEndpointLocation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"city" : @"City",
             @"country" : @"Country",
             @"latitude" : @"Latitude",
             @"longitude" : @"Longitude",
             @"postalCode" : @"PostalCode",
             @"region" : @"Region",
             };
}

@end

@implementation AWSPinpointTargetingEndpointMessageResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"deliveryStatus" : @"DeliveryStatus",
             @"messageId" : @"MessageId",
             @"statusCode" : @"StatusCode",
             @"statusMessage" : @"StatusMessage",
             @"updatedToken" : @"UpdatedToken",
             };
}

+ (NSValueTransformer *)deliveryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDeliveryStatusSuccessful);
        }
        if ([value caseInsensitiveCompare:@"THROTTLED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDeliveryStatusThrottled);
        }
        if ([value caseInsensitiveCompare:@"TEMPORARY_FAILURE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDeliveryStatusTemporaryFailure);
        }
        if ([value caseInsensitiveCompare:@"PERMANENT_FAILURE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDeliveryStatusPermanentFailure);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN_FAILURE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDeliveryStatusUnknownFailure);
        }
        if ([value caseInsensitiveCompare:@"OPT_OUT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDeliveryStatusOptOut);
        }
        if ([value caseInsensitiveCompare:@"DUPLICATE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDeliveryStatusDuplicate);
        }
        return @(AWSPinpointTargetingDeliveryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingDeliveryStatusSuccessful:
                return @"SUCCESSFUL";
            case AWSPinpointTargetingDeliveryStatusThrottled:
                return @"THROTTLED";
            case AWSPinpointTargetingDeliveryStatusTemporaryFailure:
                return @"TEMPORARY_FAILURE";
            case AWSPinpointTargetingDeliveryStatusPermanentFailure:
                return @"PERMANENT_FAILURE";
            case AWSPinpointTargetingDeliveryStatusUnknownFailure:
                return @"UNKNOWN_FAILURE";
            case AWSPinpointTargetingDeliveryStatusOptOut:
                return @"OPT_OUT";
            case AWSPinpointTargetingDeliveryStatusDuplicate:
                return @"DUPLICATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingEndpointRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"attributes" : @"Attributes",
             @"channelType" : @"ChannelType",
             @"demographic" : @"Demographic",
             @"effectiveDate" : @"EffectiveDate",
             @"endpointStatus" : @"EndpointStatus",
             @"location" : @"Location",
             @"metrics" : @"Metrics",
             @"optOut" : @"OptOut",
             @"requestId" : @"RequestId",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUSH"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypePush);
        }
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeGcm);
        }
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApns);
        }
        if ([value caseInsensitiveCompare:@"APNS_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsSandbox);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsVoip);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsVoipSandbox);
        }
        if ([value caseInsensitiveCompare:@"ADM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeAdm);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"BAIDU"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeBaidu);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"IN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeInApp);
        }
        return @(AWSPinpointTargetingChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingChannelTypePush:
                return @"PUSH";
            case AWSPinpointTargetingChannelTypeGcm:
                return @"GCM";
            case AWSPinpointTargetingChannelTypeApns:
                return @"APNS";
            case AWSPinpointTargetingChannelTypeApnsSandbox:
                return @"APNS_SANDBOX";
            case AWSPinpointTargetingChannelTypeApnsVoip:
                return @"APNS_VOIP";
            case AWSPinpointTargetingChannelTypeApnsVoipSandbox:
                return @"APNS_VOIP_SANDBOX";
            case AWSPinpointTargetingChannelTypeAdm:
                return @"ADM";
            case AWSPinpointTargetingChannelTypeSms:
                return @"SMS";
            case AWSPinpointTargetingChannelTypeVoice:
                return @"VOICE";
            case AWSPinpointTargetingChannelTypeEmail:
                return @"EMAIL";
            case AWSPinpointTargetingChannelTypeBaidu:
                return @"BAIDU";
            case AWSPinpointTargetingChannelTypeCustom:
                return @"CUSTOM";
            case AWSPinpointTargetingChannelTypeInApp:
                return @"IN_APP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)demographicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointDemographic class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointLocation class]];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointUser class]];
}

@end

@implementation AWSPinpointTargetingEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"applicationId" : @"ApplicationId",
             @"attributes" : @"Attributes",
             @"channelType" : @"ChannelType",
             @"cohortId" : @"CohortId",
             @"creationDate" : @"CreationDate",
             @"demographic" : @"Demographic",
             @"effectiveDate" : @"EffectiveDate",
             @"endpointStatus" : @"EndpointStatus",
             @"identifier" : @"Id",
             @"location" : @"Location",
             @"metrics" : @"Metrics",
             @"optOut" : @"OptOut",
             @"requestId" : @"RequestId",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUSH"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypePush);
        }
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeGcm);
        }
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApns);
        }
        if ([value caseInsensitiveCompare:@"APNS_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsSandbox);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsVoip);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsVoipSandbox);
        }
        if ([value caseInsensitiveCompare:@"ADM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeAdm);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"BAIDU"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeBaidu);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"IN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeInApp);
        }
        return @(AWSPinpointTargetingChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingChannelTypePush:
                return @"PUSH";
            case AWSPinpointTargetingChannelTypeGcm:
                return @"GCM";
            case AWSPinpointTargetingChannelTypeApns:
                return @"APNS";
            case AWSPinpointTargetingChannelTypeApnsSandbox:
                return @"APNS_SANDBOX";
            case AWSPinpointTargetingChannelTypeApnsVoip:
                return @"APNS_VOIP";
            case AWSPinpointTargetingChannelTypeApnsVoipSandbox:
                return @"APNS_VOIP_SANDBOX";
            case AWSPinpointTargetingChannelTypeAdm:
                return @"ADM";
            case AWSPinpointTargetingChannelTypeSms:
                return @"SMS";
            case AWSPinpointTargetingChannelTypeVoice:
                return @"VOICE";
            case AWSPinpointTargetingChannelTypeEmail:
                return @"EMAIL";
            case AWSPinpointTargetingChannelTypeBaidu:
                return @"BAIDU";
            case AWSPinpointTargetingChannelTypeCustom:
                return @"CUSTOM";
            case AWSPinpointTargetingChannelTypeInApp:
                return @"IN_APP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)demographicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointDemographic class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointLocation class]];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointUser class]];
}

@end

@implementation AWSPinpointTargetingEndpointSendConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"bodyOverride" : @"BodyOverride",
             @"context" : @"Context",
             @"rawContent" : @"RawContent",
             @"substitutions" : @"Substitutions",
             @"titleOverride" : @"TitleOverride",
             };
}

@end

@implementation AWSPinpointTargetingEndpointUser

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userAttributes" : @"UserAttributes",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSPinpointTargetingEndpointsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingEndpointResponse class]];
}

@end

@implementation AWSPinpointTargetingEvent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appPackageName" : @"AppPackageName",
             @"appTitle" : @"AppTitle",
             @"appVersionCode" : @"AppVersionCode",
             @"attributes" : @"Attributes",
             @"clientSdkVersion" : @"ClientSdkVersion",
             @"eventType" : @"EventType",
             @"metrics" : @"Metrics",
             @"sdkName" : @"SdkName",
             @"session" : @"Session",
             @"timestamp" : @"Timestamp",
             };
}

+ (NSValueTransformer *)sessionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSession class]];
}

@end

@implementation AWSPinpointTargetingEventCondition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"messageActivity" : @"MessageActivity",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEventDimensions class]];
}

@end

@implementation AWSPinpointTargetingEventDimensions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"eventType" : @"EventType",
             @"metrics" : @"Metrics",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingAttributeDimension class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)eventTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSetDimension class]];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingMetricDimension class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointTargetingEventFilter

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"filterType" : @"FilterType",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEventDimensions class]];
}

+ (NSValueTransformer *)filterTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SYSTEM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFilterTypeSystem);
        }
        if ([value caseInsensitiveCompare:@"ENDPOINT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFilterTypeEndpoint);
        }
        return @(AWSPinpointTargetingFilterTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingFilterTypeSystem:
                return @"SYSTEM";
            case AWSPinpointTargetingFilterTypeEndpoint:
                return @"ENDPOINT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingEventItemResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"statusCode" : @"StatusCode",
             };
}

@end

@implementation AWSPinpointTargetingEventStartCondition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventFilter" : @"EventFilter",
             @"segmentId" : @"SegmentId",
             };
}

+ (NSValueTransformer *)eventFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEventFilter class]];
}

@end

@implementation AWSPinpointTargetingEventStream

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"destinationStreamArn" : @"DestinationStreamArn",
             @"externalId" : @"ExternalId",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"lastUpdatedBy" : @"LastUpdatedBy",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSPinpointTargetingEventsBatch

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpoint" : @"Endpoint",
             @"events" : @"Events",
             };
}

+ (NSValueTransformer *)endpointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingPublicEndpoint class]];
}

+ (NSValueTransformer *)eventsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingEvent class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointTargetingEventsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"batchItem" : @"BatchItem",
             };
}

+ (NSValueTransformer *)batchItemJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingEventsBatch class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointTargetingEventsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"results" : @"Results",
             };
}

+ (NSValueTransformer *)resultsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingItemResponse class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointTargetingExportJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             @"s3UrlPrefix" : @"S3UrlPrefix",
             @"segmentId" : @"SegmentId",
             @"segmentVersion" : @"SegmentVersion",
             };
}

@end

@implementation AWSPinpointTargetingExportJobResource

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"roleArn" : @"RoleArn",
             @"s3UrlPrefix" : @"S3UrlPrefix",
             @"segmentId" : @"SegmentId",
             @"segmentVersion" : @"SegmentVersion",
             };
}

@end

@implementation AWSPinpointTargetingExportJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"completedPieces" : @"CompletedPieces",
             @"completionDate" : @"CompletionDate",
             @"creationDate" : @"CreationDate",
             @"definition" : @"Definition",
             @"failedPieces" : @"FailedPieces",
             @"failures" : @"Failures",
             @"identifier" : @"Id",
             @"jobStatus" : @"JobStatus",
             @"totalFailures" : @"TotalFailures",
             @"totalPieces" : @"TotalPieces",
             @"totalProcessed" : @"TotalProcessed",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)definitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingExportJobResource class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"PREPARING_FOR_INITIALIZATION"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusPreparingForInitialization);
        }
        if ([value caseInsensitiveCompare:@"INITIALIZING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"PROCESSING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusProcessing);
        }
        if ([value caseInsensitiveCompare:@"PENDING_JOB"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusPendingJob);
        }
        if ([value caseInsensitiveCompare:@"COMPLETING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusCompleting);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusFailing);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusFailed);
        }
        return @(AWSPinpointTargetingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingJobStatusCreated:
                return @"CREATED";
            case AWSPinpointTargetingJobStatusPreparingForInitialization:
                return @"PREPARING_FOR_INITIALIZATION";
            case AWSPinpointTargetingJobStatusInitializing:
                return @"INITIALIZING";
            case AWSPinpointTargetingJobStatusProcessing:
                return @"PROCESSING";
            case AWSPinpointTargetingJobStatusPendingJob:
                return @"PENDING_JOB";
            case AWSPinpointTargetingJobStatusCompleting:
                return @"COMPLETING";
            case AWSPinpointTargetingJobStatusCompleted:
                return @"COMPLETED";
            case AWSPinpointTargetingJobStatusFailing:
                return @"FAILING";
            case AWSPinpointTargetingJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingExportJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingExportJobResponse class]];
}

@end

@implementation AWSPinpointTargetingGCMChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiKey" : @"ApiKey",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSPinpointTargetingGCMChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"credential" : @"Credential",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingGCMMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"body" : @"Body",
             @"collapseKey" : @"CollapseKey",
             @"data" : @"Data",
             @"iconReference" : @"IconReference",
             @"imageIconUrl" : @"ImageIconUrl",
             @"imageUrl" : @"ImageUrl",
             @"priority" : @"Priority",
             @"rawContent" : @"RawContent",
             @"restrictedPackageName" : @"RestrictedPackageName",
             @"silentPush" : @"SilentPush",
             @"smallImageIconUrl" : @"SmallImageIconUrl",
             @"sound" : @"Sound",
             @"substitutions" : @"Substitutions",
             @"timeToLive" : @"TimeToLive",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionUrl);
        }
        return @(AWSPinpointTargetingActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointTargetingActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointTargetingActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingGPSCoordinates

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latitude" : @"Latitude",
             @"longitude" : @"Longitude",
             };
}

@end

@implementation AWSPinpointTargetingGPSPointDimension

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"coordinates" : @"Coordinates",
             @"rangeInKilometers" : @"RangeInKilometers",
             };
}

+ (NSValueTransformer *)coordinatesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingGPSCoordinates class]];
}

@end

@implementation AWSPinpointTargetingGetAdmChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetAdmChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADMChannelResponse" : @"ADMChannelResponse",
             };
}

+ (NSValueTransformer *)ADMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingADMChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingGetApnsChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetApnsChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSChannelResponse" : @"APNSChannelResponse",
             };
}

+ (NSValueTransformer *)APNSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingGetApnsSandboxChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetApnsSandboxChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSSandboxChannelResponse" : @"APNSSandboxChannelResponse",
             };
}

+ (NSValueTransformer *)APNSSandboxChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSSandboxChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingGetApnsVoipChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetApnsVoipChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipChannelResponse" : @"APNSVoipChannelResponse",
             };
}

+ (NSValueTransformer *)APNSVoipChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSVoipChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingGetApnsVoipSandboxChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetApnsVoipSandboxChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipSandboxChannelResponse" : @"APNSVoipSandboxChannelResponse",
             };
}

+ (NSValueTransformer *)APNSVoipSandboxChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSVoipSandboxChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingGetAppRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetAppResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationResponse" : @"ApplicationResponse",
             };
}

+ (NSValueTransformer *)applicationResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingApplicationResponse class]];
}

@end

@implementation AWSPinpointTargetingGetApplicationDateRangeKpiRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endTime" : @"EndTime",
             @"kpiName" : @"KpiName",
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPinpointTargetingGetApplicationDateRangeKpiResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationDateRangeKpiResponse" : @"ApplicationDateRangeKpiResponse",
             };
}

+ (NSValueTransformer *)applicationDateRangeKpiResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingApplicationDateRangeKpiResponse class]];
}

@end

@implementation AWSPinpointTargetingGetApplicationSettingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetApplicationSettingsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationSettingsResource" : @"ApplicationSettingsResource",
             };
}

+ (NSValueTransformer *)applicationSettingsResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingApplicationSettingsResource class]];
}

@end

@implementation AWSPinpointTargetingGetAppsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetAppsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationsResponse" : @"ApplicationsResponse",
             };
}

+ (NSValueTransformer *)applicationsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingApplicationsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetBaiduChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetBaiduChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baiduChannelResponse" : @"BaiduChannelResponse",
             };
}

+ (NSValueTransformer *)baiduChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingBaiduChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingGetCampaignActivitiesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetCampaignActivitiesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activitiesResponse" : @"ActivitiesResponse",
             };
}

+ (NSValueTransformer *)activitiesResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingActivitiesResponse class]];
}

@end

@implementation AWSPinpointTargetingGetCampaignDateRangeKpiRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"endTime" : @"EndTime",
             @"kpiName" : @"KpiName",
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPinpointTargetingGetCampaignDateRangeKpiResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignDateRangeKpiResponse" : @"CampaignDateRangeKpiResponse",
             };
}

+ (NSValueTransformer *)campaignDateRangeKpiResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignDateRangeKpiResponse class]];
}

@end

@implementation AWSPinpointTargetingGetCampaignRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             };
}

@end

@implementation AWSPinpointTargetingGetCampaignResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignResponse class]];
}

@end

@implementation AWSPinpointTargetingGetCampaignVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingGetCampaignVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignResponse class]];
}

@end

@implementation AWSPinpointTargetingGetCampaignVersionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetCampaignVersionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignsResponse" : @"CampaignsResponse",
             };
}

+ (NSValueTransformer *)campaignsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetCampaignsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetCampaignsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignsResponse" : @"CampaignsResponse",
             };
}

+ (NSValueTransformer *)campaignsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetChannelsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetChannelsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelsResponse" : @"ChannelsResponse",
             };
}

+ (NSValueTransformer *)channelsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingChannelsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetEmailChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetEmailChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailChannelResponse" : @"EmailChannelResponse",
             };
}

+ (NSValueTransformer *)emailChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEmailChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingGetEmailTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingGetEmailTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailTemplateResponse" : @"EmailTemplateResponse",
             };
}

+ (NSValueTransformer *)emailTemplateResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEmailTemplateResponse class]];
}

@end

@implementation AWSPinpointTargetingGetEndpointRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointId" : @"EndpointId",
             };
}

@end

@implementation AWSPinpointTargetingGetEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointResponse" : @"EndpointResponse",
             };
}

+ (NSValueTransformer *)endpointResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointResponse class]];
}

@end

@implementation AWSPinpointTargetingGetEventStreamRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetEventStreamResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventStream" : @"EventStream",
             };
}

+ (NSValueTransformer *)eventStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEventStream class]];
}

@end

@implementation AWSPinpointTargetingGetExportJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSPinpointTargetingGetExportJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportJobResponse" : @"ExportJobResponse",
             };
}

+ (NSValueTransformer *)exportJobResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingExportJobResponse class]];
}

@end

@implementation AWSPinpointTargetingGetExportJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetExportJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportJobsResponse" : @"ExportJobsResponse",
             };
}

+ (NSValueTransformer *)exportJobsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingExportJobsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetGcmChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetGcmChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"GCMChannelResponse" : @"GCMChannelResponse",
             };
}

+ (NSValueTransformer *)GCMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingGCMChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingGetImportJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSPinpointTargetingGetImportJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importJobResponse" : @"ImportJobResponse",
             };
}

+ (NSValueTransformer *)importJobResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingImportJobResponse class]];
}

@end

@implementation AWSPinpointTargetingGetImportJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetImportJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importJobsResponse" : @"ImportJobsResponse",
             };
}

+ (NSValueTransformer *)importJobsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingImportJobsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetInAppMessagesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointId" : @"EndpointId",
             };
}

@end

@implementation AWSPinpointTargetingGetInAppMessagesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inAppMessagesResponse" : @"InAppMessagesResponse",
             };
}

+ (NSValueTransformer *)inAppMessagesResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingInAppMessagesResponse class]];
}

@end

@implementation AWSPinpointTargetingGetInAppTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingGetInAppTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inAppTemplateResponse" : @"InAppTemplateResponse",
             };
}

+ (NSValueTransformer *)inAppTemplateResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingInAppTemplateResponse class]];
}

@end

@implementation AWSPinpointTargetingGetJourneyDateRangeKpiRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endTime" : @"EndTime",
             @"journeyId" : @"JourneyId",
             @"kpiName" : @"KpiName",
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPinpointTargetingGetJourneyDateRangeKpiResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"journeyDateRangeKpiResponse" : @"JourneyDateRangeKpiResponse",
             };
}

+ (NSValueTransformer *)journeyDateRangeKpiResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyDateRangeKpiResponse class]];
}

@end

@implementation AWSPinpointTargetingGetJourneyExecutionActivityMetricsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"journeyActivityId" : @"JourneyActivityId",
             @"journeyId" : @"JourneyId",
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSPinpointTargetingGetJourneyExecutionActivityMetricsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"journeyExecutionActivityMetricsResponse" : @"JourneyExecutionActivityMetricsResponse",
             };
}

+ (NSValueTransformer *)journeyExecutionActivityMetricsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyExecutionActivityMetricsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetJourneyExecutionMetricsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"journeyId" : @"JourneyId",
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             };
}

@end

@implementation AWSPinpointTargetingGetJourneyExecutionMetricsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"journeyExecutionMetricsResponse" : @"JourneyExecutionMetricsResponse",
             };
}

+ (NSValueTransformer *)journeyExecutionMetricsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyExecutionMetricsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetJourneyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"journeyId" : @"JourneyId",
             };
}

@end

@implementation AWSPinpointTargetingGetJourneyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"journeyResponse" : @"JourneyResponse",
             };
}

+ (NSValueTransformer *)journeyResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyResponse class]];
}

@end

@implementation AWSPinpointTargetingGetPushTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingGetPushTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pushNotificationTemplateResponse" : @"PushNotificationTemplateResponse",
             };
}

+ (NSValueTransformer *)pushNotificationTemplateResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingPushNotificationTemplateResponse class]];
}

@end

@implementation AWSPinpointTargetingGetRecommenderConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recommenderId" : @"RecommenderId",
             };
}

@end

@implementation AWSPinpointTargetingGetRecommenderConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recommenderConfigurationResponse" : @"RecommenderConfigurationResponse",
             };
}

+ (NSValueTransformer *)recommenderConfigurationResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingRecommenderConfigurationResponse class]];
}

@end

@implementation AWSPinpointTargetingGetRecommenderConfigurationsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetRecommenderConfigurationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"listRecommenderConfigurationsResponse" : @"ListRecommenderConfigurationsResponse",
             };
}

+ (NSValueTransformer *)listRecommenderConfigurationsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingListRecommenderConfigurationsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetSegmentExportJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"segmentId" : @"SegmentId",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetSegmentExportJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"exportJobsResponse" : @"ExportJobsResponse",
             };
}

+ (NSValueTransformer *)exportJobsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingExportJobsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetSegmentImportJobsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"segmentId" : @"SegmentId",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetSegmentImportJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importJobsResponse" : @"ImportJobsResponse",
             };
}

+ (NSValueTransformer *)importJobsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingImportJobsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetSegmentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             };
}

@end

@implementation AWSPinpointTargetingGetSegmentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentResponse class]];
}

@end

@implementation AWSPinpointTargetingGetSegmentVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingGetSegmentVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentResponse class]];
}

@end

@implementation AWSPinpointTargetingGetSegmentVersionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"segmentId" : @"SegmentId",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetSegmentVersionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentsResponse" : @"SegmentsResponse",
             };
}

+ (NSValueTransformer *)segmentsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetSegmentsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetSegmentsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentsResponse" : @"SegmentsResponse",
             };
}

+ (NSValueTransformer *)segmentsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetSmsChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetSmsChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SMSChannelResponse" : @"SMSChannelResponse",
             };
}

+ (NSValueTransformer *)SMSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSMSChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingGetSmsTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingGetSmsTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SMSTemplateResponse" : @"SMSTemplateResponse",
             };
}

+ (NSValueTransformer *)SMSTemplateResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSMSTemplateResponse class]];
}

@end

@implementation AWSPinpointTargetingGetUserEndpointsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSPinpointTargetingGetUserEndpointsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointsResponse" : @"EndpointsResponse",
             };
}

+ (NSValueTransformer *)endpointsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetVoiceChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetVoiceChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceChannelResponse" : @"VoiceChannelResponse",
             };
}

+ (NSValueTransformer *)voiceChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingVoiceChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingGetVoiceTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingGetVoiceTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceTemplateResponse" : @"VoiceTemplateResponse",
             };
}

+ (NSValueTransformer *)voiceTemplateResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingVoiceTemplateResponse class]];
}

@end

@implementation AWSPinpointTargetingHoldoutActivity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextActivity" : @"NextActivity",
             @"percentage" : @"Percentage",
             };
}

@end

@implementation AWSPinpointTargetingImportJobRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defineSegment" : @"DefineSegment",
             @"externalId" : @"ExternalId",
             @"format" : @"Format",
             @"registerEndpoints" : @"RegisterEndpoints",
             @"roleArn" : @"RoleArn",
             @"s3Url" : @"S3Url",
             @"segmentId" : @"SegmentId",
             @"segmentName" : @"SegmentName",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFormatJson);
        }
        return @(AWSPinpointTargetingFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingFormatCsv:
                return @"CSV";
            case AWSPinpointTargetingFormatJson:
                return @"JSON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingImportJobResource

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"defineSegment" : @"DefineSegment",
             @"externalId" : @"ExternalId",
             @"format" : @"Format",
             @"registerEndpoints" : @"RegisterEndpoints",
             @"roleArn" : @"RoleArn",
             @"s3Url" : @"S3Url",
             @"segmentId" : @"SegmentId",
             @"segmentName" : @"SegmentName",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFormatJson);
        }
        return @(AWSPinpointTargetingFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingFormatCsv:
                return @"CSV";
            case AWSPinpointTargetingFormatJson:
                return @"JSON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingImportJobResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"completedPieces" : @"CompletedPieces",
             @"completionDate" : @"CompletionDate",
             @"creationDate" : @"CreationDate",
             @"definition" : @"Definition",
             @"failedPieces" : @"FailedPieces",
             @"failures" : @"Failures",
             @"identifier" : @"Id",
             @"jobStatus" : @"JobStatus",
             @"totalFailures" : @"TotalFailures",
             @"totalPieces" : @"TotalPieces",
             @"totalProcessed" : @"TotalProcessed",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)definitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingImportJobResource class]];
}

+ (NSValueTransformer *)jobStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CREATED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusCreated);
        }
        if ([value caseInsensitiveCompare:@"PREPARING_FOR_INITIALIZATION"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusPreparingForInitialization);
        }
        if ([value caseInsensitiveCompare:@"INITIALIZING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"PROCESSING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusProcessing);
        }
        if ([value caseInsensitiveCompare:@"PENDING_JOB"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusPendingJob);
        }
        if ([value caseInsensitiveCompare:@"COMPLETING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusCompleting);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusCompleted);
        }
        if ([value caseInsensitiveCompare:@"FAILING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusFailing);
        }
        if ([value caseInsensitiveCompare:@"FAILED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusFailed);
        }
        return @(AWSPinpointTargetingJobStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingJobStatusCreated:
                return @"CREATED";
            case AWSPinpointTargetingJobStatusPreparingForInitialization:
                return @"PREPARING_FOR_INITIALIZATION";
            case AWSPinpointTargetingJobStatusInitializing:
                return @"INITIALIZING";
            case AWSPinpointTargetingJobStatusProcessing:
                return @"PROCESSING";
            case AWSPinpointTargetingJobStatusPendingJob:
                return @"PENDING_JOB";
            case AWSPinpointTargetingJobStatusCompleting:
                return @"COMPLETING";
            case AWSPinpointTargetingJobStatusCompleted:
                return @"COMPLETED";
            case AWSPinpointTargetingJobStatusFailing:
                return @"FAILING";
            case AWSPinpointTargetingJobStatusFailed:
                return @"FAILED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingImportJobsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingImportJobResponse class]];
}

@end

@implementation AWSPinpointTargetingInAppCampaignSchedule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endDate" : @"EndDate",
             @"eventFilter" : @"EventFilter",
             @"quietTime" : @"QuietTime",
             };
}

+ (NSValueTransformer *)eventFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignEventFilter class]];
}

+ (NSValueTransformer *)quietTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingQuietTime class]];
}

@end

@implementation AWSPinpointTargetingInAppMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"customConfig" : @"CustomConfig",
             @"layout" : @"Layout",
             };
}

+ (NSValueTransformer *)contentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingInAppMessageContent class]];
}

+ (NSValueTransformer *)layoutJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BOTTOM_BANNER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutBottomBanner);
        }
        if ([value caseInsensitiveCompare:@"TOP_BANNER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutTopBanner);
        }
        if ([value caseInsensitiveCompare:@"OVERLAYS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutOverlays);
        }
        if ([value caseInsensitiveCompare:@"MOBILE_FEED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutMobileFeed);
        }
        if ([value caseInsensitiveCompare:@"MIDDLE_BANNER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutMiddleBanner);
        }
        if ([value caseInsensitiveCompare:@"CAROUSEL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutCarousel);
        }
        return @(AWSPinpointTargetingLayoutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingLayoutBottomBanner:
                return @"BOTTOM_BANNER";
            case AWSPinpointTargetingLayoutTopBanner:
                return @"TOP_BANNER";
            case AWSPinpointTargetingLayoutOverlays:
                return @"OVERLAYS";
            case AWSPinpointTargetingLayoutMobileFeed:
                return @"MOBILE_FEED";
            case AWSPinpointTargetingLayoutMiddleBanner:
                return @"MIDDLE_BANNER";
            case AWSPinpointTargetingLayoutCarousel:
                return @"CAROUSEL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingInAppMessageBodyConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alignment" : @"Alignment",
             @"body" : @"Body",
             @"textColor" : @"TextColor",
             };
}

+ (NSValueTransformer *)alignmentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LEFT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAlignmentLeft);
        }
        if ([value caseInsensitiveCompare:@"CENTER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAlignmentCenter);
        }
        if ([value caseInsensitiveCompare:@"RIGHT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAlignmentRight);
        }
        return @(AWSPinpointTargetingAlignmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingAlignmentLeft:
                return @"LEFT";
            case AWSPinpointTargetingAlignmentCenter:
                return @"CENTER";
            case AWSPinpointTargetingAlignmentRight:
                return @"RIGHT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingInAppMessageButton

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"android" : @"Android",
             @"defaultConfig" : @"DefaultConfig",
             @"IOS" : @"IOS",
             @"web" : @"Web",
             };
}

+ (NSValueTransformer *)androidJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingOverrideButtonConfiguration class]];
}

+ (NSValueTransformer *)defaultConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingDefaultButtonConfiguration class]];
}

+ (NSValueTransformer *)IOSJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingOverrideButtonConfiguration class]];
}

+ (NSValueTransformer *)webJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingOverrideButtonConfiguration class]];
}

@end

@implementation AWSPinpointTargetingInAppMessageCampaign

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignId" : @"CampaignId",
             @"dailyCap" : @"DailyCap",
             @"inAppMessage" : @"InAppMessage",
             @"priority" : @"Priority",
             @"schedule" : @"Schedule",
             @"sessionCap" : @"SessionCap",
             @"totalCap" : @"TotalCap",
             @"treatmentId" : @"TreatmentId",
             };
}

+ (NSValueTransformer *)inAppMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingInAppMessage class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingInAppCampaignSchedule class]];
}

@end

@implementation AWSPinpointTargetingInAppMessageContent

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"backgroundColor" : @"BackgroundColor",
             @"bodyConfig" : @"BodyConfig",
             @"headerConfig" : @"HeaderConfig",
             @"imageUrl" : @"ImageUrl",
             @"primaryBtn" : @"PrimaryBtn",
             @"secondaryBtn" : @"SecondaryBtn",
             };
}

+ (NSValueTransformer *)bodyConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingInAppMessageBodyConfig class]];
}

+ (NSValueTransformer *)headerConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingInAppMessageHeaderConfig class]];
}

+ (NSValueTransformer *)primaryBtnJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingInAppMessageButton class]];
}

+ (NSValueTransformer *)secondaryBtnJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingInAppMessageButton class]];
}

@end

@implementation AWSPinpointTargetingInAppMessageHeaderConfig

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"alignment" : @"Alignment",
             @"header" : @"Header",
             @"textColor" : @"TextColor",
             };
}

+ (NSValueTransformer *)alignmentJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LEFT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAlignmentLeft);
        }
        if ([value caseInsensitiveCompare:@"CENTER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAlignmentCenter);
        }
        if ([value caseInsensitiveCompare:@"RIGHT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingAlignmentRight);
        }
        return @(AWSPinpointTargetingAlignmentUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingAlignmentLeft:
                return @"LEFT";
            case AWSPinpointTargetingAlignmentCenter:
                return @"CENTER";
            case AWSPinpointTargetingAlignmentRight:
                return @"RIGHT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingInAppMessagesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"inAppMessageCampaigns" : @"InAppMessageCampaigns",
             };
}

+ (NSValueTransformer *)inAppMessageCampaignsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingInAppMessageCampaign class]];
}

@end

@implementation AWSPinpointTargetingInAppTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"content" : @"Content",
             @"customConfig" : @"CustomConfig",
             @"layout" : @"Layout",
             @"templateDescription" : @"TemplateDescription",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)contentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingInAppMessageContent class]];
}

+ (NSValueTransformer *)layoutJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BOTTOM_BANNER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutBottomBanner);
        }
        if ([value caseInsensitiveCompare:@"TOP_BANNER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutTopBanner);
        }
        if ([value caseInsensitiveCompare:@"OVERLAYS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutOverlays);
        }
        if ([value caseInsensitiveCompare:@"MOBILE_FEED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutMobileFeed);
        }
        if ([value caseInsensitiveCompare:@"MIDDLE_BANNER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutMiddleBanner);
        }
        if ([value caseInsensitiveCompare:@"CAROUSEL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutCarousel);
        }
        return @(AWSPinpointTargetingLayoutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingLayoutBottomBanner:
                return @"BOTTOM_BANNER";
            case AWSPinpointTargetingLayoutTopBanner:
                return @"TOP_BANNER";
            case AWSPinpointTargetingLayoutOverlays:
                return @"OVERLAYS";
            case AWSPinpointTargetingLayoutMobileFeed:
                return @"MOBILE_FEED";
            case AWSPinpointTargetingLayoutMiddleBanner:
                return @"MIDDLE_BANNER";
            case AWSPinpointTargetingLayoutCarousel:
                return @"CAROUSEL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingInAppTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"content" : @"Content",
             @"creationDate" : @"CreationDate",
             @"customConfig" : @"CustomConfig",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"layout" : @"Layout",
             @"templateDescription" : @"TemplateDescription",
             @"templateName" : @"TemplateName",
             @"templateType" : @"TemplateType",
             @"version" : @"Version",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)contentJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingInAppMessageContent class]];
}

+ (NSValueTransformer *)layoutJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"BOTTOM_BANNER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutBottomBanner);
        }
        if ([value caseInsensitiveCompare:@"TOP_BANNER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutTopBanner);
        }
        if ([value caseInsensitiveCompare:@"OVERLAYS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutOverlays);
        }
        if ([value caseInsensitiveCompare:@"MOBILE_FEED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutMobileFeed);
        }
        if ([value caseInsensitiveCompare:@"MIDDLE_BANNER"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutMiddleBanner);
        }
        if ([value caseInsensitiveCompare:@"CAROUSEL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingLayoutCarousel);
        }
        return @(AWSPinpointTargetingLayoutUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingLayoutBottomBanner:
                return @"BOTTOM_BANNER";
            case AWSPinpointTargetingLayoutTopBanner:
                return @"TOP_BANNER";
            case AWSPinpointTargetingLayoutOverlays:
                return @"OVERLAYS";
            case AWSPinpointTargetingLayoutMobileFeed:
                return @"MOBILE_FEED";
            case AWSPinpointTargetingLayoutMiddleBanner:
                return @"MIDDLE_BANNER";
            case AWSPinpointTargetingLayoutCarousel:
                return @"CAROUSEL";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)templateTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"PUSH"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypePush);
        }
        if ([value caseInsensitiveCompare:@"INAPP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeInapp);
        }
        return @(AWSPinpointTargetingTemplateTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingTemplateTypeEmail:
                return @"EMAIL";
            case AWSPinpointTargetingTemplateTypeSms:
                return @"SMS";
            case AWSPinpointTargetingTemplateTypeVoice:
                return @"VOICE";
            case AWSPinpointTargetingTemplateTypePush:
                return @"PUSH";
            case AWSPinpointTargetingTemplateTypeInapp:
                return @"INAPP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingItemResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endpointItemResponse" : @"EndpointItemResponse",
             @"eventsItemResponse" : @"EventsItemResponse",
             };
}

+ (NSValueTransformer *)endpointItemResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointItemResponse class]];
}

+ (NSValueTransformer *)eventsItemResponseJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingEventItemResponse class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointTargetingJourneyCustomMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             };
}

@end

@implementation AWSPinpointTargetingJourneyDateRangeKpiResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endTime" : @"EndTime",
             @"journeyId" : @"JourneyId",
             @"kpiName" : @"KpiName",
             @"kpiResult" : @"KpiResult",
             @"nextToken" : @"NextToken",
             @"startTime" : @"StartTime",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)kpiResultJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingBaseKpiResult class]];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPinpointTargetingJourneyEmailMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"fromAddress" : @"FromAddress",
             };
}

@end

@implementation AWSPinpointTargetingJourneyExecutionActivityMetricsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activityType" : @"ActivityType",
             @"applicationId" : @"ApplicationId",
             @"journeyActivityId" : @"JourneyActivityId",
             @"journeyId" : @"JourneyId",
             @"lastEvaluatedTime" : @"LastEvaluatedTime",
             @"metrics" : @"Metrics",
             };
}

@end

@implementation AWSPinpointTargetingJourneyExecutionMetricsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"journeyId" : @"JourneyId",
             @"lastEvaluatedTime" : @"LastEvaluatedTime",
             @"metrics" : @"Metrics",
             };
}

@end

@implementation AWSPinpointTargetingJourneyLimits

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dailyCap" : @"DailyCap",
             @"endpointReentryCap" : @"EndpointReentryCap",
             @"endpointReentryInterval" : @"EndpointReentryInterval",
             @"messagesPerSecond" : @"MessagesPerSecond",
             };
}

@end

@implementation AWSPinpointTargetingJourneyPushMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"timeToLive" : @"TimeToLive",
             };
}

@end

@implementation AWSPinpointTargetingJourneyChannelSettings

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"connectCampaignArn" : @"ConnectCampaignArn",
             @"connectCampaignExecutionRoleArn" : @"ConnectCampaignExecutionRoleArn",
             };
}

@end

@implementation AWSPinpointTargetingJourneyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activities" : @"Activities",
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"identifier" : @"Id",
             @"journeyChannelSettings" : @"JourneyChannelSettings",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"limits" : @"Limits",
             @"localTime" : @"LocalTime",
             @"name" : @"Name",
             @"quietTime" : @"QuietTime",
             @"refreshFrequency" : @"RefreshFrequency",
             @"refreshOnSegmentUpdate" : @"RefreshOnSegmentUpdate",
             @"schedule" : @"Schedule",
             @"startActivity" : @"StartActivity",
             @"startCondition" : @"StartCondition",
             @"state" : @"State",
             @"waitForQuietTime" : @"WaitForQuietTime",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)activitiesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingActivity class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)journeyChannelSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyChannelSettings class]];
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyLimits class]];
}

+ (NSValueTransformer *)quietTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingQuietTime class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneySchedule class]];
}

+ (NSValueTransformer *)startConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingStartCondition class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateDraft);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateActive);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"CLOSED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateClosed);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStatePaused);
        }
        return @(AWSPinpointTargetingStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingStateDraft:
                return @"DRAFT";
            case AWSPinpointTargetingStateActive:
                return @"ACTIVE";
            case AWSPinpointTargetingStateCompleted:
                return @"COMPLETED";
            case AWSPinpointTargetingStateCancelled:
                return @"CANCELLED";
            case AWSPinpointTargetingStateClosed:
                return @"CLOSED";
            case AWSPinpointTargetingStatePaused:
                return @"PAUSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingJourneySMSMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"entityId" : @"EntityId",
             @"messageType" : @"MessageType",
             @"originationNumber" : @"OriginationNumber",
             @"senderId" : @"SenderId",
             @"templateId" : @"TemplateId",
             };
}

+ (NSValueTransformer *)messageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRANSACTIONAL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingMessageTypeTransactional);
        }
        if ([value caseInsensitiveCompare:@"PROMOTIONAL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingMessageTypePromotional);
        }
        return @(AWSPinpointTargetingMessageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingMessageTypeTransactional:
                return @"TRANSACTIONAL";
            case AWSPinpointTargetingMessageTypePromotional:
                return @"PROMOTIONAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingJourneySchedule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"startTime" : @"StartTime",
             @"timezone" : @"Timezone",
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *number) {
        return [NSDate dateWithTimeIntervalSince1970:[number doubleValue]];
    } reverseBlock:^id(NSDate *date) {
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

@end

@implementation AWSPinpointTargetingJourneyStateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"state" : @"State",
             };
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateDraft);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateActive);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"CLOSED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateClosed);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStatePaused);
        }
        return @(AWSPinpointTargetingStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingStateDraft:
                return @"DRAFT";
            case AWSPinpointTargetingStateActive:
                return @"ACTIVE";
            case AWSPinpointTargetingStateCompleted:
                return @"COMPLETED";
            case AWSPinpointTargetingStateCancelled:
                return @"CANCELLED";
            case AWSPinpointTargetingStateClosed:
                return @"CLOSED";
            case AWSPinpointTargetingStatePaused:
                return @"PAUSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingJourneysResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingJourneyResponse class]];
}

@end

@implementation AWSPinpointTargetingListJourneysRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingListJourneysResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"journeysResponse" : @"JourneysResponse",
             };
}

+ (NSValueTransformer *)journeysResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneysResponse class]];
}

@end

@implementation AWSPinpointTargetingListRecommenderConfigurationsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingRecommenderConfigurationResponse class]];
}

@end

@implementation AWSPinpointTargetingListTagsForResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSPinpointTargetingListTagsForResourceResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagsModel" : @"TagsModel",
             };
}

+ (NSValueTransformer *)tagsModelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTagsModel class]];
}

@end

@implementation AWSPinpointTargetingListTemplateVersionsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             @"templateName" : @"TemplateName",
             @"templateType" : @"TemplateType",
             };
}

@end

@implementation AWSPinpointTargetingListTemplateVersionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateVersionsResponse" : @"TemplateVersionsResponse",
             };
}

+ (NSValueTransformer *)templateVersionsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTemplateVersionsResponse class]];
}

@end

@implementation AWSPinpointTargetingListTemplatesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"NextToken",
             @"pageSize" : @"PageSize",
             @"prefix" : @"Prefix",
             @"templateType" : @"TemplateType",
             };
}

@end

@implementation AWSPinpointTargetingListTemplatesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templatesResponse" : @"TemplatesResponse",
             };
}

+ (NSValueTransformer *)templatesResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTemplatesResponse class]];
}

@end

@implementation AWSPinpointTargetingMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"action" : @"Action",
             @"body" : @"Body",
             @"imageIconUrl" : @"ImageIconUrl",
             @"imageSmallIconUrl" : @"ImageSmallIconUrl",
             @"imageUrl" : @"ImageUrl",
             @"jsonBody" : @"JsonBody",
             @"mediaUrl" : @"MediaUrl",
             @"rawContent" : @"RawContent",
             @"silentPush" : @"SilentPush",
             @"timeToLive" : @"TimeToLive",
             @"title" : @"Title",
             @"url" : @"Url",
             };
}

+ (NSValueTransformer *)actionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OPEN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionOpenApp);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"URL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingActionUrl);
        }
        return @(AWSPinpointTargetingActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingActionOpenApp:
                return @"OPEN_APP";
            case AWSPinpointTargetingActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointTargetingActionUrl:
                return @"URL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingMessageBody

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"requestID" : @"RequestID",
             };
}

@end

@implementation AWSPinpointTargetingMessageConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADMMessage" : @"ADMMessage",
             @"APNSMessage" : @"APNSMessage",
             @"baiduMessage" : @"BaiduMessage",
             @"customMessage" : @"CustomMessage",
             @"defaultMessage" : @"DefaultMessage",
             @"emailMessage" : @"EmailMessage",
             @"GCMMessage" : @"GCMMessage",
             @"inAppMessage" : @"InAppMessage",
             @"SMSMessage" : @"SMSMessage",
             };
}

+ (NSValueTransformer *)ADMMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessage class]];
}

+ (NSValueTransformer *)APNSMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessage class]];
}

+ (NSValueTransformer *)baiduMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessage class]];
}

+ (NSValueTransformer *)customMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignCustomMessage class]];
}

+ (NSValueTransformer *)defaultMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessage class]];
}

+ (NSValueTransformer *)emailMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignEmailMessage class]];
}

+ (NSValueTransformer *)GCMMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessage class]];
}

+ (NSValueTransformer *)inAppMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignInAppMessage class]];
}

+ (NSValueTransformer *)SMSMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignSmsMessage class]];
}

@end

@implementation AWSPinpointTargetingMessageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addresses" : @"Addresses",
             @"context" : @"Context",
             @"endpoints" : @"Endpoints",
             @"messageConfiguration" : @"MessageConfiguration",
             @"templateConfiguration" : @"TemplateConfiguration",
             @"traceId" : @"TraceId",
             };
}

+ (NSValueTransformer *)addressesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingAddressConfiguration class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)endpointsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingEndpointSendConfiguration class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingDirectMessageConfiguration class]];
}

+ (NSValueTransformer *)templateConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTemplateConfiguration class]];
}

@end

@implementation AWSPinpointTargetingMessageResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointResult" : @"EndpointResult",
             @"requestId" : @"RequestId",
             @"result" : @"Result",
             };
}

+ (NSValueTransformer *)endpointResultJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingEndpointMessageResult class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)resultJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingMessageResult class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointTargetingMessageResult

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"deliveryStatus" : @"DeliveryStatus",
             @"messageId" : @"MessageId",
             @"statusCode" : @"StatusCode",
             @"statusMessage" : @"StatusMessage",
             @"updatedToken" : @"UpdatedToken",
             };
}

+ (NSValueTransformer *)deliveryStatusJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SUCCESSFUL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDeliveryStatusSuccessful);
        }
        if ([value caseInsensitiveCompare:@"THROTTLED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDeliveryStatusThrottled);
        }
        if ([value caseInsensitiveCompare:@"TEMPORARY_FAILURE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDeliveryStatusTemporaryFailure);
        }
        if ([value caseInsensitiveCompare:@"PERMANENT_FAILURE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDeliveryStatusPermanentFailure);
        }
        if ([value caseInsensitiveCompare:@"UNKNOWN_FAILURE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDeliveryStatusUnknownFailure);
        }
        if ([value caseInsensitiveCompare:@"OPT_OUT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDeliveryStatusOptOut);
        }
        if ([value caseInsensitiveCompare:@"DUPLICATE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDeliveryStatusDuplicate);
        }
        return @(AWSPinpointTargetingDeliveryStatusUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingDeliveryStatusSuccessful:
                return @"SUCCESSFUL";
            case AWSPinpointTargetingDeliveryStatusThrottled:
                return @"THROTTLED";
            case AWSPinpointTargetingDeliveryStatusTemporaryFailure:
                return @"TEMPORARY_FAILURE";
            case AWSPinpointTargetingDeliveryStatusPermanentFailure:
                return @"PERMANENT_FAILURE";
            case AWSPinpointTargetingDeliveryStatusUnknownFailure:
                return @"UNKNOWN_FAILURE";
            case AWSPinpointTargetingDeliveryStatusOptOut:
                return @"OPT_OUT";
            case AWSPinpointTargetingDeliveryStatusDuplicate:
                return @"DUPLICATE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingMetricDimension

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparisonOperator" : @"ComparisonOperator",
             @"value" : @"Value",
             };
}

@end

@implementation AWSPinpointTargetingMultiConditionalBranch

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"condition" : @"Condition",
             @"nextActivity" : @"NextActivity",
             };
}

+ (NSValueTransformer *)conditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSimpleCondition class]];
}

@end

@implementation AWSPinpointTargetingMultiConditionalSplitActivity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branches" : @"Branches",
             @"defaultActivity" : @"DefaultActivity",
             @"evaluationWaitTime" : @"EvaluationWaitTime",
             };
}

+ (NSValueTransformer *)branchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingMultiConditionalBranch class]];
}

+ (NSValueTransformer *)evaluationWaitTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWaitTime class]];
}

@end

@implementation AWSPinpointTargetingNumberValidateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isoCountryCode" : @"IsoCountryCode",
             @"phoneNumber" : @"PhoneNumber",
             };
}

@end

@implementation AWSPinpointTargetingNumberValidateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"carrier" : @"Carrier",
             @"city" : @"City",
             @"cleansedPhoneNumberE164" : @"CleansedPhoneNumberE164",
             @"cleansedPhoneNumberNational" : @"CleansedPhoneNumberNational",
             @"country" : @"Country",
             @"countryCodeIso2" : @"CountryCodeIso2",
             @"countryCodeNumeric" : @"CountryCodeNumeric",
             @"county" : @"County",
             @"originalCountryCodeIso2" : @"OriginalCountryCodeIso2",
             @"originalPhoneNumber" : @"OriginalPhoneNumber",
             @"phoneType" : @"PhoneType",
             @"phoneTypeCode" : @"PhoneTypeCode",
             @"timezone" : @"Timezone",
             @"zipCode" : @"ZipCode",
             };
}

@end

@implementation AWSPinpointTargetingOverrideButtonConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"buttonAction" : @"ButtonAction",
             @"link" : @"Link",
             };
}

+ (NSValueTransformer *)buttonActionJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"LINK"] == NSOrderedSame) {
            return @(AWSPinpointTargetingButtonActionLink);
        }
        if ([value caseInsensitiveCompare:@"DEEP_LINK"] == NSOrderedSame) {
            return @(AWSPinpointTargetingButtonActionDeepLink);
        }
        if ([value caseInsensitiveCompare:@"CLOSE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingButtonActionClose);
        }
        return @(AWSPinpointTargetingButtonActionUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingButtonActionLink:
                return @"LINK";
            case AWSPinpointTargetingButtonActionDeepLink:
                return @"DEEP_LINK";
            case AWSPinpointTargetingButtonActionClose:
                return @"CLOSE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingPhoneNumberValidateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numberValidateRequest" : @"NumberValidateRequest",
             };
}

+ (NSValueTransformer *)numberValidateRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingNumberValidateRequest class]];
}

@end

@implementation AWSPinpointTargetingPhoneNumberValidateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"numberValidateResponse" : @"NumberValidateResponse",
             };
}

+ (NSValueTransformer *)numberValidateResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingNumberValidateResponse class]];
}

@end

@implementation AWSPinpointTargetingPublicEndpoint

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"address" : @"Address",
             @"attributes" : @"Attributes",
             @"channelType" : @"ChannelType",
             @"demographic" : @"Demographic",
             @"effectiveDate" : @"EffectiveDate",
             @"endpointStatus" : @"EndpointStatus",
             @"location" : @"Location",
             @"metrics" : @"Metrics",
             @"optOut" : @"OptOut",
             @"requestId" : @"RequestId",
             @"user" : @"User",
             };
}

+ (NSValueTransformer *)channelTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"PUSH"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypePush);
        }
        if ([value caseInsensitiveCompare:@"GCM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeGcm);
        }
        if ([value caseInsensitiveCompare:@"APNS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApns);
        }
        if ([value caseInsensitiveCompare:@"APNS_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsSandbox);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsVoip);
        }
        if ([value caseInsensitiveCompare:@"APNS_VOIP_SANDBOX"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeApnsVoipSandbox);
        }
        if ([value caseInsensitiveCompare:@"ADM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeAdm);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"BAIDU"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeBaidu);
        }
        if ([value caseInsensitiveCompare:@"CUSTOM"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeCustom);
        }
        if ([value caseInsensitiveCompare:@"IN_APP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingChannelTypeInApp);
        }
        return @(AWSPinpointTargetingChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingChannelTypePush:
                return @"PUSH";
            case AWSPinpointTargetingChannelTypeGcm:
                return @"GCM";
            case AWSPinpointTargetingChannelTypeApns:
                return @"APNS";
            case AWSPinpointTargetingChannelTypeApnsSandbox:
                return @"APNS_SANDBOX";
            case AWSPinpointTargetingChannelTypeApnsVoip:
                return @"APNS_VOIP";
            case AWSPinpointTargetingChannelTypeApnsVoipSandbox:
                return @"APNS_VOIP_SANDBOX";
            case AWSPinpointTargetingChannelTypeAdm:
                return @"ADM";
            case AWSPinpointTargetingChannelTypeSms:
                return @"SMS";
            case AWSPinpointTargetingChannelTypeVoice:
                return @"VOICE";
            case AWSPinpointTargetingChannelTypeEmail:
                return @"EMAIL";
            case AWSPinpointTargetingChannelTypeBaidu:
                return @"BAIDU";
            case AWSPinpointTargetingChannelTypeCustom:
                return @"CUSTOM";
            case AWSPinpointTargetingChannelTypeInApp:
                return @"IN_APP";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)demographicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointDemographic class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointLocation class]];
}

+ (NSValueTransformer *)userJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointUser class]];
}

@end

@implementation AWSPinpointTargetingPushMessageActivity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageConfig" : @"MessageConfig",
             @"nextActivity" : @"NextActivity",
             @"templateName" : @"TemplateName",
             @"templateVersion" : @"TemplateVersion",
             };
}

+ (NSValueTransformer *)messageConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyPushMessage class]];
}

@end

@implementation AWSPinpointTargetingPushNotificationTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADM" : @"ADM",
             @"APNS" : @"APNS",
             @"baidu" : @"Baidu",
             @"defaultValue" : @"Default",
             @"defaultSubstitutions" : @"DefaultSubstitutions",
             @"GCM" : @"GCM",
             @"recommenderId" : @"RecommenderId",
             @"templateDescription" : @"TemplateDescription",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)ADMJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAndroidPushNotificationTemplate class]];
}

+ (NSValueTransformer *)APNSJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSPushNotificationTemplate class]];
}

+ (NSValueTransformer *)baiduJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAndroidPushNotificationTemplate class]];
}

+ (NSValueTransformer *)defaultValueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingDefaultPushNotificationTemplate class]];
}

+ (NSValueTransformer *)GCMJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAndroidPushNotificationTemplate class]];
}

@end

@implementation AWSPinpointTargetingPushNotificationTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADM" : @"ADM",
             @"APNS" : @"APNS",
             @"arn" : @"Arn",
             @"baidu" : @"Baidu",
             @"creationDate" : @"CreationDate",
             @"defaultValue" : @"Default",
             @"defaultSubstitutions" : @"DefaultSubstitutions",
             @"GCM" : @"GCM",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"recommenderId" : @"RecommenderId",
             @"templateDescription" : @"TemplateDescription",
             @"templateName" : @"TemplateName",
             @"templateType" : @"TemplateType",
             @"version" : @"Version",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)ADMJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAndroidPushNotificationTemplate class]];
}

+ (NSValueTransformer *)APNSJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSPushNotificationTemplate class]];
}

+ (NSValueTransformer *)baiduJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAndroidPushNotificationTemplate class]];
}

+ (NSValueTransformer *)defaultValueJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingDefaultPushNotificationTemplate class]];
}

+ (NSValueTransformer *)GCMJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAndroidPushNotificationTemplate class]];
}

+ (NSValueTransformer *)templateTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"PUSH"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypePush);
        }
        if ([value caseInsensitiveCompare:@"INAPP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeInapp);
        }
        return @(AWSPinpointTargetingTemplateTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingTemplateTypeEmail:
                return @"EMAIL";
            case AWSPinpointTargetingTemplateTypeSms:
                return @"SMS";
            case AWSPinpointTargetingTemplateTypeVoice:
                return @"VOICE";
            case AWSPinpointTargetingTemplateTypePush:
                return @"PUSH";
            case AWSPinpointTargetingTemplateTypeInapp:
                return @"INAPP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingPutEventStreamRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"writeEventStream" : @"WriteEventStream",
             };
}

+ (NSValueTransformer *)writeEventStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWriteEventStream class]];
}

@end

@implementation AWSPinpointTargetingPutEventStreamResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventStream" : @"EventStream",
             };
}

+ (NSValueTransformer *)eventStreamJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEventStream class]];
}

@end

@implementation AWSPinpointTargetingPutEventsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"eventsRequest" : @"EventsRequest",
             };
}

+ (NSValueTransformer *)eventsRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEventsRequest class]];
}

@end

@implementation AWSPinpointTargetingPutEventsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventsResponse" : @"EventsResponse",
             };
}

+ (NSValueTransformer *)eventsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEventsResponse class]];
}

@end

@implementation AWSPinpointTargetingQuietTime

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"end" : @"End",
             @"start" : @"Start",
             };
}

@end

@implementation AWSPinpointTargetingRandomSplitActivity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"branches" : @"Branches",
             };
}

+ (NSValueTransformer *)branchesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingRandomSplitEntry class]];
}

@end

@implementation AWSPinpointTargetingRandomSplitEntry

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextActivity" : @"NextActivity",
             @"percentage" : @"Percentage",
             };
}

@end

@implementation AWSPinpointTargetingRawEmail

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             };
}

@end

@implementation AWSPinpointTargetingRecencyDimension

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"duration" : @"Duration",
             @"recencyType" : @"RecencyType",
             };
}

+ (NSValueTransformer *)durationJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"HR_24"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDurationHr24);
        }
        if ([value caseInsensitiveCompare:@"DAY_7"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDurationDay7);
        }
        if ([value caseInsensitiveCompare:@"DAY_14"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDurationDay14);
        }
        if ([value caseInsensitiveCompare:@"DAY_30"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDurationDay30);
        }
        return @(AWSPinpointTargetingDurationUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingDurationHr24:
                return @"HR_24";
            case AWSPinpointTargetingDurationDay7:
                return @"DAY_7";
            case AWSPinpointTargetingDurationDay14:
                return @"DAY_14";
            case AWSPinpointTargetingDurationDay30:
                return @"DAY_30";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)recencyTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingRecencyTypeActive);
        }
        if ([value caseInsensitiveCompare:@"INACTIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingRecencyTypeInactive);
        }
        return @(AWSPinpointTargetingRecencyTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingRecencyTypeActive:
                return @"ACTIVE";
            case AWSPinpointTargetingRecencyTypeInactive:
                return @"INACTIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingRecommenderConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"creationDate" : @"CreationDate",
             @"detail" : @"Description",
             @"identifier" : @"Id",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"name" : @"Name",
             @"recommendationProviderIdType" : @"RecommendationProviderIdType",
             @"recommendationProviderRoleArn" : @"RecommendationProviderRoleArn",
             @"recommendationProviderUri" : @"RecommendationProviderUri",
             @"recommendationTransformerUri" : @"RecommendationTransformerUri",
             @"recommendationsDisplayName" : @"RecommendationsDisplayName",
             @"recommendationsPerMessage" : @"RecommendationsPerMessage",
             };
}

@end

@implementation AWSPinpointTargetingRemoveAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"attributeType" : @"AttributeType",
             @"updateAttributesRequest" : @"UpdateAttributesRequest",
             };
}

+ (NSValueTransformer *)updateAttributesRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingUpdateAttributesRequest class]];
}

@end

@implementation AWSPinpointTargetingRemoveAttributesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributesResource" : @"AttributesResource",
             };
}

+ (NSValueTransformer *)attributesResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAttributesResource class]];
}

@end

@implementation AWSPinpointTargetingResultRow

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groupedBys" : @"GroupedBys",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)groupedBysJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingResultRowValue class]];
}

+ (NSValueTransformer *)valuesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingResultRowValue class]];
}

@end

@implementation AWSPinpointTargetingResultRowValue

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"Key",
             @"types" : @"Type",
             @"value" : @"Value",
             };
}

@end

@implementation AWSPinpointTargetingSMSChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"senderId" : @"SenderId",
             @"shortCode" : @"ShortCode",
             };
}

@end

@implementation AWSPinpointTargetingSMSChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"promotionalMessagesPerSecond" : @"PromotionalMessagesPerSecond",
             @"senderId" : @"SenderId",
             @"shortCode" : @"ShortCode",
             @"transactionalMessagesPerSecond" : @"TransactionalMessagesPerSecond",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingSMSMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"entityId" : @"EntityId",
             @"keyword" : @"Keyword",
             @"mediaUrl" : @"MediaUrl",
             @"messageType" : @"MessageType",
             @"originationNumber" : @"OriginationNumber",
             @"senderId" : @"SenderId",
             @"substitutions" : @"Substitutions",
             @"templateId" : @"TemplateId",
             };
}

+ (NSValueTransformer *)messageTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TRANSACTIONAL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingMessageTypeTransactional);
        }
        if ([value caseInsensitiveCompare:@"PROMOTIONAL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingMessageTypePromotional);
        }
        return @(AWSPinpointTargetingMessageTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingMessageTypeTransactional:
                return @"TRANSACTIONAL";
            case AWSPinpointTargetingMessageTypePromotional:
                return @"PROMOTIONAL";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingSMSMessageActivity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageConfig" : @"MessageConfig",
             @"nextActivity" : @"NextActivity",
             @"templateName" : @"TemplateName",
             @"templateVersion" : @"TemplateVersion",
             };
}

+ (NSValueTransformer *)messageConfigJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneySMSMessage class]];
}

@end

@implementation AWSPinpointTargetingSMSTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"defaultSubstitutions" : @"DefaultSubstitutions",
             @"recommenderId" : @"RecommenderId",
             @"templateDescription" : @"TemplateDescription",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSPinpointTargetingSMSTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"body" : @"Body",
             @"creationDate" : @"CreationDate",
             @"defaultSubstitutions" : @"DefaultSubstitutions",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"recommenderId" : @"RecommenderId",
             @"templateDescription" : @"TemplateDescription",
             @"templateName" : @"TemplateName",
             @"templateType" : @"TemplateType",
             @"version" : @"Version",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)templateTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"PUSH"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypePush);
        }
        if ([value caseInsensitiveCompare:@"INAPP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeInapp);
        }
        return @(AWSPinpointTargetingTemplateTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingTemplateTypeEmail:
                return @"EMAIL";
            case AWSPinpointTargetingTemplateTypeSms:
                return @"SMS";
            case AWSPinpointTargetingTemplateTypeVoice:
                return @"VOICE";
            case AWSPinpointTargetingTemplateTypePush:
                return @"PUSH";
            case AWSPinpointTargetingTemplateTypeInapp:
                return @"INAPP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingSchedule

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endTime" : @"EndTime",
             @"eventFilter" : @"EventFilter",
             @"frequency" : @"Frequency",
             @"isLocalTime" : @"IsLocalTime",
             @"quietTime" : @"QuietTime",
             @"startTime" : @"StartTime",
             @"timezone" : @"Timezone",
             };
}

+ (NSValueTransformer *)eventFilterJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignEventFilter class]];
}

+ (NSValueTransformer *)frequencyJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ONCE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFrequencyOnce);
        }
        if ([value caseInsensitiveCompare:@"HOURLY"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFrequencyHourly);
        }
        if ([value caseInsensitiveCompare:@"DAILY"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFrequencyDaily);
        }
        if ([value caseInsensitiveCompare:@"WEEKLY"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFrequencyWeekly);
        }
        if ([value caseInsensitiveCompare:@"MONTHLY"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFrequencyMonthly);
        }
        if ([value caseInsensitiveCompare:@"EVENT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFrequencyEvent);
        }
        if ([value caseInsensitiveCompare:@"IN_APP_EVENT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFrequencyInAppEvent);
        }
        return @(AWSPinpointTargetingFrequencyUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingFrequencyOnce:
                return @"ONCE";
            case AWSPinpointTargetingFrequencyHourly:
                return @"HOURLY";
            case AWSPinpointTargetingFrequencyDaily:
                return @"DAILY";
            case AWSPinpointTargetingFrequencyWeekly:
                return @"WEEKLY";
            case AWSPinpointTargetingFrequencyMonthly:
                return @"MONTHLY";
            case AWSPinpointTargetingFrequencyEvent:
                return @"EVENT";
            case AWSPinpointTargetingFrequencyInAppEvent:
                return @"IN_APP_EVENT";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)quietTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingQuietTime class]];
}

@end

@implementation AWSPinpointTargetingSegmentBehaviors

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recency" : @"Recency",
             };
}

+ (NSValueTransformer *)recencyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingRecencyDimension class]];
}

@end

@implementation AWSPinpointTargetingSegmentCondition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentId" : @"SegmentId",
             };
}

@end

@implementation AWSPinpointTargetingSegmentDemographics

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"appVersion" : @"AppVersion",
             @"channel" : @"Channel",
             @"deviceType" : @"DeviceType",
             @"make" : @"Make",
             @"model" : @"Model",
             @"platform" : @"Platform",
             };
}

+ (NSValueTransformer *)appVersionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSetDimension class]];
}

+ (NSValueTransformer *)channelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSetDimension class]];
}

+ (NSValueTransformer *)deviceTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSetDimension class]];
}

+ (NSValueTransformer *)makeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSetDimension class]];
}

+ (NSValueTransformer *)modelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSetDimension class]];
}

+ (NSValueTransformer *)platformJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSetDimension class]];
}

@end

@implementation AWSPinpointTargetingSegmentDimensions

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"behavior" : @"Behavior",
             @"demographic" : @"Demographic",
             @"location" : @"Location",
             @"metrics" : @"Metrics",
             @"userAttributes" : @"UserAttributes",
             };
}

+ (NSValueTransformer *)attributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingAttributeDimension class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)behaviorJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentBehaviors class]];
}

+ (NSValueTransformer *)demographicJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentDemographics class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentLocation class]];
}

+ (NSValueTransformer *)metricsJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingMetricDimension class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)userAttributesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingAttributeDimension class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointTargetingSegmentGroup

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"sourceSegments" : @"SourceSegments",
             @"sourceType" : @"SourceType",
             @"types" : @"Type",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingSegmentDimensions class]];
}

+ (NSValueTransformer *)sourceSegmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingSegmentReference class]];
}

+ (NSValueTransformer *)sourceTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingSourceTypeAll);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSPinpointTargetingSourceTypeAny);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingSourceTypeNone);
        }
        return @(AWSPinpointTargetingSourceTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingSourceTypeAll:
                return @"ALL";
            case AWSPinpointTargetingSourceTypeAny:
                return @"ANY";
            case AWSPinpointTargetingSourceTypeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

+ (NSValueTransformer *)typesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTypesAll);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTypesAny);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTypesNone);
        }
        return @(AWSPinpointTargetingTypesUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingTypesAll:
                return @"ALL";
            case AWSPinpointTargetingTypesAny:
                return @"ANY";
            case AWSPinpointTargetingTypesNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingSegmentGroupList

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"groups" : @"Groups",
             @"include" : @"Include",
             };
}

+ (NSValueTransformer *)groupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingSegmentGroup class]];
}

+ (NSValueTransformer *)includeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"ALL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingIncludeAll);
        }
        if ([value caseInsensitiveCompare:@"ANY"] == NSOrderedSame) {
            return @(AWSPinpointTargetingIncludeAny);
        }
        if ([value caseInsensitiveCompare:@"NONE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingIncludeNone);
        }
        return @(AWSPinpointTargetingIncludeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingIncludeAll:
                return @"ALL";
            case AWSPinpointTargetingIncludeAny:
                return @"ANY";
            case AWSPinpointTargetingIncludeNone:
                return @"NONE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingSegmentImportResource

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelCounts" : @"ChannelCounts",
             @"externalId" : @"ExternalId",
             @"format" : @"Format",
             @"roleArn" : @"RoleArn",
             @"s3Url" : @"S3Url",
             @"size" : @"Size",
             };
}

+ (NSValueTransformer *)formatJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"CSV"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFormatCsv);
        }
        if ([value caseInsensitiveCompare:@"JSON"] == NSOrderedSame) {
            return @(AWSPinpointTargetingFormatJson);
        }
        return @(AWSPinpointTargetingFormatUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingFormatCsv:
                return @"CSV";
            case AWSPinpointTargetingFormatJson:
                return @"JSON";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingSegmentLocation

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"country" : @"Country",
             @"GPSPoint" : @"GPSPoint",
             };
}

+ (NSValueTransformer *)countryJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSetDimension class]];
}

+ (NSValueTransformer *)GPSPointJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingGPSPointDimension class]];
}

@end

@implementation AWSPinpointTargetingSegmentReference

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingSegmentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"arn" : @"Arn",
             @"creationDate" : @"CreationDate",
             @"dimensions" : @"Dimensions",
             @"identifier" : @"Id",
             @"importDefinition" : @"ImportDefinition",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"name" : @"Name",
             @"segmentGroups" : @"SegmentGroups",
             @"segmentType" : @"SegmentType",
             @"version" : @"Version",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentDimensions class]];
}

+ (NSValueTransformer *)importDefinitionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentImportResource class]];
}

+ (NSValueTransformer *)segmentGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentGroupList class]];
}

+ (NSValueTransformer *)segmentTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DIMENSIONAL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingSegmentTypeDimensional);
        }
        if ([value caseInsensitiveCompare:@"IMPORT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingSegmentTypeImport);
        }
        return @(AWSPinpointTargetingSegmentTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingSegmentTypeDimensional:
                return @"DIMENSIONAL";
            case AWSPinpointTargetingSegmentTypeImport:
                return @"IMPORT";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingSegmentsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingSegmentResponse class]];
}

@end

@implementation AWSPinpointTargetingSendMessagesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"messageRequest" : @"MessageRequest",
             };
}

+ (NSValueTransformer *)messageRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageRequest class]];
}

@end

@implementation AWSPinpointTargetingSendMessagesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageResponse" : @"MessageResponse",
             };
}

+ (NSValueTransformer *)messageResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageResponse class]];
}

@end

@implementation AWSPinpointTargetingSendOTPMessageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"sendOTPMessageRequestParameters" : @"SendOTPMessageRequestParameters",
             };
}

+ (NSValueTransformer *)sendOTPMessageRequestParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSendOTPMessageRequestParameters class]];
}

@end

@implementation AWSPinpointTargetingSendOTPMessageRequestParameters

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"allowedAttempts" : @"AllowedAttempts",
             @"brandName" : @"BrandName",
             @"channel" : @"Channel",
             @"codeLength" : @"CodeLength",
             @"destinationIdentity" : @"DestinationIdentity",
             @"entityId" : @"EntityId",
             @"language" : @"Language",
             @"originationIdentity" : @"OriginationIdentity",
             @"referenceId" : @"ReferenceId",
             @"templateId" : @"TemplateId",
             @"validityPeriod" : @"ValidityPeriod",
             };
}

@end

@implementation AWSPinpointTargetingSendOTPMessageResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageResponse" : @"MessageResponse",
             };
}

+ (NSValueTransformer *)messageResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageResponse class]];
}

@end

@implementation AWSPinpointTargetingSendUsersMessageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"context" : @"Context",
             @"messageConfiguration" : @"MessageConfiguration",
             @"templateConfiguration" : @"TemplateConfiguration",
             @"traceId" : @"TraceId",
             @"users" : @"Users",
             };
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingDirectMessageConfiguration class]];
}

+ (NSValueTransformer *)templateConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTemplateConfiguration class]];
}

+ (NSValueTransformer *)usersJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingEndpointSendConfiguration class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

@end

@implementation AWSPinpointTargetingSendUsersMessageResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"requestId" : @"RequestId",
             @"result" : @"Result",
             };
}

@end

@implementation AWSPinpointTargetingSendUsersMessagesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"sendUsersMessageRequest" : @"SendUsersMessageRequest",
             };
}

+ (NSValueTransformer *)sendUsersMessageRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSendUsersMessageRequest class]];
}

@end

@implementation AWSPinpointTargetingSendUsersMessagesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sendUsersMessageResponse" : @"SendUsersMessageResponse",
             };
}

+ (NSValueTransformer *)sendUsersMessageResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSendUsersMessageResponse class]];
}

@end

@implementation AWSPinpointTargetingSession

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"duration" : @"Duration",
             @"identifier" : @"Id",
             @"startTimestamp" : @"StartTimestamp",
             @"stopTimestamp" : @"StopTimestamp",
             };
}

@end

@implementation AWSPinpointTargetingSetDimension

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensionType" : @"DimensionType",
             @"values" : @"Values",
             };
}

+ (NSValueTransformer *)dimensionTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"INCLUSIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDimensionTypeInclusive);
        }
        if ([value caseInsensitiveCompare:@"EXCLUSIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingDimensionTypeExclusive);
        }
        return @(AWSPinpointTargetingDimensionTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingDimensionTypeInclusive:
                return @"INCLUSIVE";
            case AWSPinpointTargetingDimensionTypeExclusive:
                return @"EXCLUSIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingSimpleCondition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"eventCondition" : @"EventCondition",
             @"segmentCondition" : @"SegmentCondition",
             @"segmentDimensions" : @"SegmentDimensions",
             };
}

+ (NSValueTransformer *)eventConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEventCondition class]];
}

+ (NSValueTransformer *)segmentConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentCondition class]];
}

+ (NSValueTransformer *)segmentDimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentDimensions class]];
}

@end

@implementation AWSPinpointTargetingSimpleEmail

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"htmlPart" : @"HtmlPart",
             @"subject" : @"Subject",
             @"textPart" : @"TextPart",
             };
}

+ (NSValueTransformer *)htmlPartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSimpleEmailPart class]];
}

+ (NSValueTransformer *)subjectJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSimpleEmailPart class]];
}

+ (NSValueTransformer *)textPartJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSimpleEmailPart class]];
}

@end

@implementation AWSPinpointTargetingSimpleEmailPart

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"charset" : @"Charset",
             @"data" : @"Data",
             };
}

@end

@implementation AWSPinpointTargetingStartCondition

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"detail" : @"Description",
             @"eventStartCondition" : @"EventStartCondition",
             @"segmentStartCondition" : @"SegmentStartCondition",
             };
}

+ (NSValueTransformer *)eventStartConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEventStartCondition class]];
}

+ (NSValueTransformer *)segmentStartConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentCondition class]];
}

@end

@implementation AWSPinpointTargetingTagResourceRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagsModel" : @"TagsModel",
             };
}

+ (NSValueTransformer *)tagsModelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTagsModel class]];
}

@end

@implementation AWSPinpointTargetingTagsModel

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSPinpointTargetingTemplate

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingTemplateActiveVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingTemplateConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailTemplate" : @"EmailTemplate",
             @"pushTemplate" : @"PushTemplate",
             @"SMSTemplate" : @"SMSTemplate",
             @"voiceTemplate" : @"VoiceTemplate",
             };
}

+ (NSValueTransformer *)emailTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTemplate class]];
}

+ (NSValueTransformer *)pushTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTemplate class]];
}

+ (NSValueTransformer *)SMSTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTemplate class]];
}

+ (NSValueTransformer *)voiceTemplateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTemplate class]];
}

@end

@implementation AWSPinpointTargetingTemplateCreateMessageBody

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"message" : @"Message",
             @"requestID" : @"RequestID",
             };
}

@end

@implementation AWSPinpointTargetingTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"creationDate" : @"CreationDate",
             @"defaultSubstitutions" : @"DefaultSubstitutions",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"templateDescription" : @"TemplateDescription",
             @"templateName" : @"TemplateName",
             @"templateType" : @"TemplateType",
             @"version" : @"Version",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)templateTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"PUSH"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypePush);
        }
        if ([value caseInsensitiveCompare:@"INAPP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeInapp);
        }
        return @(AWSPinpointTargetingTemplateTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingTemplateTypeEmail:
                return @"EMAIL";
            case AWSPinpointTargetingTemplateTypeSms:
                return @"SMS";
            case AWSPinpointTargetingTemplateTypeVoice:
                return @"VOICE";
            case AWSPinpointTargetingTemplateTypePush:
                return @"PUSH";
            case AWSPinpointTargetingTemplateTypeInapp:
                return @"INAPP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingTemplateVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"creationDate" : @"CreationDate",
             @"defaultSubstitutions" : @"DefaultSubstitutions",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"templateDescription" : @"TemplateDescription",
             @"templateName" : @"TemplateName",
             @"templateType" : @"TemplateType",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingTemplateVersionsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"message" : @"Message",
             @"nextToken" : @"NextToken",
             @"requestID" : @"RequestID",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingTemplateVersionResponse class]];
}

@end

@implementation AWSPinpointTargetingTemplatesResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"item" : @"Item",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingTemplateResponse class]];
}

@end

@implementation AWSPinpointTargetingTreatmentResource

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customDeliveryConfiguration" : @"CustomDeliveryConfiguration",
             @"identifier" : @"Id",
             @"messageConfiguration" : @"MessageConfiguration",
             @"schedule" : @"Schedule",
             @"sizePercent" : @"SizePercent",
             @"state" : @"State",
             @"templateConfiguration" : @"TemplateConfiguration",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             };
}

+ (NSValueTransformer *)customDeliveryConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCustomDeliveryConfiguration class]];
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSchedule class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignState class]];
}

+ (NSValueTransformer *)templateConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTemplateConfiguration class]];
}

@end

@implementation AWSPinpointTargetingUntagResourceRequest

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

@implementation AWSPinpointTargetingUpdateAdmChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADMChannelRequest" : @"ADMChannelRequest",
             @"applicationId" : @"ApplicationId",
             };
}

+ (NSValueTransformer *)ADMChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingADMChannelRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateAdmChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADMChannelResponse" : @"ADMChannelResponse",
             };
}

+ (NSValueTransformer *)ADMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingADMChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateApnsChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSChannelRequest" : @"APNSChannelRequest",
             @"applicationId" : @"ApplicationId",
             };
}

+ (NSValueTransformer *)APNSChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSChannelRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateApnsChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSChannelResponse" : @"APNSChannelResponse",
             };
}

+ (NSValueTransformer *)APNSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateApnsSandboxChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSSandboxChannelRequest" : @"APNSSandboxChannelRequest",
             @"applicationId" : @"ApplicationId",
             };
}

+ (NSValueTransformer *)APNSSandboxChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSSandboxChannelRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateApnsSandboxChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSSandboxChannelResponse" : @"APNSSandboxChannelResponse",
             };
}

+ (NSValueTransformer *)APNSSandboxChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSSandboxChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateApnsVoipChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipChannelRequest" : @"APNSVoipChannelRequest",
             @"applicationId" : @"ApplicationId",
             };
}

+ (NSValueTransformer *)APNSVoipChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSVoipChannelRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateApnsVoipChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipChannelResponse" : @"APNSVoipChannelResponse",
             };
}

+ (NSValueTransformer *)APNSVoipChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSVoipChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipSandboxChannelRequest" : @"APNSVoipSandboxChannelRequest",
             @"applicationId" : @"ApplicationId",
             };
}

+ (NSValueTransformer *)APNSVoipSandboxChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSVoipSandboxChannelRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"APNSVoipSandboxChannelResponse" : @"APNSVoipSandboxChannelResponse",
             };
}

+ (NSValueTransformer *)APNSVoipSandboxChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAPNSVoipSandboxChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateApplicationSettingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"writeApplicationSettingsRequest" : @"WriteApplicationSettingsRequest",
             };
}

+ (NSValueTransformer *)writeApplicationSettingsRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWriteApplicationSettingsRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateApplicationSettingsResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationSettingsResource" : @"ApplicationSettingsResource",
             };
}

+ (NSValueTransformer *)applicationSettingsResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingApplicationSettingsResource class]];
}

@end

@implementation AWSPinpointTargetingUpdateAttributesRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blacklist" : @"Blacklist",
             };
}

@end

@implementation AWSPinpointTargetingUpdateBaiduChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"baiduChannelRequest" : @"BaiduChannelRequest",
             };
}

+ (NSValueTransformer *)baiduChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingBaiduChannelRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateBaiduChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"baiduChannelResponse" : @"BaiduChannelResponse",
             };
}

+ (NSValueTransformer *)baiduChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingBaiduChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateCampaignRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"writeCampaignRequest" : @"WriteCampaignRequest",
             };
}

+ (NSValueTransformer *)writeCampaignRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWriteCampaignRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateCampaignResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateEmailChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"emailChannelRequest" : @"EmailChannelRequest",
             };
}

+ (NSValueTransformer *)emailChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEmailChannelRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateEmailChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailChannelResponse" : @"EmailChannelResponse",
             };
}

+ (NSValueTransformer *)emailChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEmailChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateEmailTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createNewVersion" : @"CreateNewVersion",
             @"emailTemplateRequest" : @"EmailTemplateRequest",
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)emailTemplateRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEmailTemplateRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateEmailTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingUpdateEndpointRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointId" : @"EndpointId",
             @"endpointRequest" : @"EndpointRequest",
             };
}

+ (NSValueTransformer *)endpointRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateEndpointResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingUpdateEndpointsBatchRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointBatchRequest" : @"EndpointBatchRequest",
             };
}

+ (NSValueTransformer *)endpointBatchRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEndpointBatchRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateEndpointsBatchResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingUpdateGcmChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"GCMChannelRequest" : @"GCMChannelRequest",
             };
}

+ (NSValueTransformer *)GCMChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingGCMChannelRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateGcmChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"GCMChannelResponse" : @"GCMChannelResponse",
             };
}

+ (NSValueTransformer *)GCMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingGCMChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateInAppTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createNewVersion" : @"CreateNewVersion",
             @"inAppTemplateRequest" : @"InAppTemplateRequest",
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)inAppTemplateRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingInAppTemplateRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateInAppTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingUpdateJourneyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"journeyId" : @"JourneyId",
             @"writeJourneyRequest" : @"WriteJourneyRequest",
             };
}

+ (NSValueTransformer *)writeJourneyRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWriteJourneyRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateJourneyResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"journeyResponse" : @"JourneyResponse",
             };
}

+ (NSValueTransformer *)journeyResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateJourneyStateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"journeyId" : @"JourneyId",
             @"journeyStateRequest" : @"JourneyStateRequest",
             };
}

+ (NSValueTransformer *)journeyStateRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyStateRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateJourneyStateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"journeyResponse" : @"JourneyResponse",
             };
}

+ (NSValueTransformer *)journeyResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdatePushTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createNewVersion" : @"CreateNewVersion",
             @"pushNotificationTemplateRequest" : @"PushNotificationTemplateRequest",
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)pushNotificationTemplateRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingPushNotificationTemplateRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdatePushTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingUpdateRecommenderConfiguration

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributes" : @"Attributes",
             @"detail" : @"Description",
             @"name" : @"Name",
             @"recommendationProviderIdType" : @"RecommendationProviderIdType",
             @"recommendationProviderRoleArn" : @"RecommendationProviderRoleArn",
             @"recommendationProviderUri" : @"RecommendationProviderUri",
             @"recommendationTransformerUri" : @"RecommendationTransformerUri",
             @"recommendationsDisplayName" : @"RecommendationsDisplayName",
             @"recommendationsPerMessage" : @"RecommendationsPerMessage",
             };
}

@end

@implementation AWSPinpointTargetingUpdateRecommenderConfigurationRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recommenderId" : @"RecommenderId",
             @"updateRecommenderConfiguration" : @"UpdateRecommenderConfiguration",
             };
}

+ (NSValueTransformer *)updateRecommenderConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingUpdateRecommenderConfiguration class]];
}

@end

@implementation AWSPinpointTargetingUpdateRecommenderConfigurationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recommenderConfigurationResponse" : @"RecommenderConfigurationResponse",
             };
}

+ (NSValueTransformer *)recommenderConfigurationResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingRecommenderConfigurationResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateSegmentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             @"writeSegmentRequest" : @"WriteSegmentRequest",
             };
}

+ (NSValueTransformer *)writeSegmentRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWriteSegmentRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateSegmentResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateSmsChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"SMSChannelRequest" : @"SMSChannelRequest",
             };
}

+ (NSValueTransformer *)SMSChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSMSChannelRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateSmsChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SMSChannelResponse" : @"SMSChannelResponse",
             };
}

+ (NSValueTransformer *)SMSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSMSChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateSmsTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createNewVersion" : @"CreateNewVersion",
             @"SMSTemplateRequest" : @"SMSTemplateRequest",
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             };
}

+ (NSValueTransformer *)SMSTemplateRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSMSTemplateRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateSmsTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingUpdateTemplateActiveVersionRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"templateActiveVersionRequest" : @"TemplateActiveVersionRequest",
             @"templateName" : @"TemplateName",
             @"templateType" : @"TemplateType",
             };
}

+ (NSValueTransformer *)templateActiveVersionRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTemplateActiveVersionRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateTemplateActiveVersionResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingUpdateVoiceChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"voiceChannelRequest" : @"VoiceChannelRequest",
             };
}

+ (NSValueTransformer *)voiceChannelRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingVoiceChannelRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateVoiceChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceChannelResponse" : @"VoiceChannelResponse",
             };
}

+ (NSValueTransformer *)voiceChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingVoiceChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateVoiceTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"createNewVersion" : @"CreateNewVersion",
             @"templateName" : @"TemplateName",
             @"version" : @"Version",
             @"voiceTemplateRequest" : @"VoiceTemplateRequest",
             };
}

+ (NSValueTransformer *)voiceTemplateRequestJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingVoiceTemplateRequest class]];
}

@end

@implementation AWSPinpointTargetingUpdateVoiceTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageBody" : @"MessageBody",
             };
}

+ (NSValueTransformer *)messageBodyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageBody class]];
}

@end

@implementation AWSPinpointTargetingVerificationResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"valid" : @"Valid",
             };
}

@end

@implementation AWSPinpointTargetingVerifyOTPMessageRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"verifyOTPMessageRequestParameters" : @"VerifyOTPMessageRequestParameters",
             };
}

+ (NSValueTransformer *)verifyOTPMessageRequestParametersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingVerifyOTPMessageRequestParameters class]];
}

@end

@implementation AWSPinpointTargetingVerifyOTPMessageRequestParameters

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationIdentity" : @"DestinationIdentity",
             @"otp" : @"Otp",
             @"referenceId" : @"ReferenceId",
             };
}

@end

@implementation AWSPinpointTargetingVerifyOTPMessageResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"verificationResponse" : @"VerificationResponse",
             };
}

+ (NSValueTransformer *)verificationResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingVerificationResponse class]];
}

@end

@implementation AWSPinpointTargetingVoiceChannelRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSPinpointTargetingVoiceChannelResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"creationDate" : @"CreationDate",
             @"enabled" : @"Enabled",
             @"hasCredential" : @"HasCredential",
             @"identifier" : @"Id",
             @"isArchived" : @"IsArchived",
             @"lastModifiedBy" : @"LastModifiedBy",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"platform" : @"Platform",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingVoiceMessage

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"languageCode" : @"LanguageCode",
             @"originationNumber" : @"OriginationNumber",
             @"substitutions" : @"Substitutions",
             @"voiceId" : @"VoiceId",
             };
}

@end

@implementation AWSPinpointTargetingVoiceTemplateRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"defaultSubstitutions" : @"DefaultSubstitutions",
             @"languageCode" : @"LanguageCode",
             @"templateDescription" : @"TemplateDescription",
             @"voiceId" : @"VoiceId",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSPinpointTargetingVoiceTemplateResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"body" : @"Body",
             @"creationDate" : @"CreationDate",
             @"defaultSubstitutions" : @"DefaultSubstitutions",
             @"languageCode" : @"LanguageCode",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"templateDescription" : @"TemplateDescription",
             @"templateName" : @"TemplateName",
             @"templateType" : @"TemplateType",
             @"version" : @"Version",
             @"voiceId" : @"VoiceId",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)templateTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"EMAIL"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeEmail);
        }
        if ([value caseInsensitiveCompare:@"SMS"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeSms);
        }
        if ([value caseInsensitiveCompare:@"VOICE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeVoice);
        }
        if ([value caseInsensitiveCompare:@"PUSH"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypePush);
        }
        if ([value caseInsensitiveCompare:@"INAPP"] == NSOrderedSame) {
            return @(AWSPinpointTargetingTemplateTypeInapp);
        }
        return @(AWSPinpointTargetingTemplateTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingTemplateTypeEmail:
                return @"EMAIL";
            case AWSPinpointTargetingTemplateTypeSms:
                return @"SMS";
            case AWSPinpointTargetingTemplateTypeVoice:
                return @"VOICE";
            case AWSPinpointTargetingTemplateTypePush:
                return @"PUSH";
            case AWSPinpointTargetingTemplateTypeInapp:
                return @"INAPP";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingWaitActivity

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextActivity" : @"NextActivity",
             @"waitTime" : @"WaitTime",
             };
}

+ (NSValueTransformer *)waitTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingWaitTime class]];
}

@end

@implementation AWSPinpointTargetingWaitTime

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"waitFor" : @"WaitFor",
             @"waitUntil" : @"WaitUntil",
             };
}

@end

@implementation AWSPinpointTargetingWriteApplicationSettingsRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignHook" : @"CampaignHook",
             @"cloudWatchMetricsEnabled" : @"CloudWatchMetricsEnabled",
             @"eventTaggingEnabled" : @"EventTaggingEnabled",
             @"limits" : @"Limits",
             @"quietTime" : @"QuietTime",
             };
}

+ (NSValueTransformer *)campaignHookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignHook class]];
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignLimits class]];
}

+ (NSValueTransformer *)quietTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingQuietTime class]];
}

@end

@implementation AWSPinpointTargetingWriteCampaignRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalTreatments" : @"AdditionalTreatments",
             @"customDeliveryConfiguration" : @"CustomDeliveryConfiguration",
             @"detail" : @"Description",
             @"holdoutPercent" : @"HoldoutPercent",
             @"hook" : @"Hook",
             @"isPaused" : @"IsPaused",
             @"limits" : @"Limits",
             @"messageConfiguration" : @"MessageConfiguration",
             @"name" : @"Name",
             @"priority" : @"Priority",
             @"schedule" : @"Schedule",
             @"segmentId" : @"SegmentId",
             @"segmentVersion" : @"SegmentVersion",
             @"templateConfiguration" : @"TemplateConfiguration",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)additionalTreatmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingWriteTreatmentResource class]];
}

+ (NSValueTransformer *)customDeliveryConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCustomDeliveryConfiguration class]];
}

+ (NSValueTransformer *)hookJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignHook class]];
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignLimits class]];
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSchedule class]];
}

+ (NSValueTransformer *)templateConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTemplateConfiguration class]];
}

@end

@implementation AWSPinpointTargetingWriteEventStream

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationStreamArn" : @"DestinationStreamArn",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSPinpointTargetingWriteJourneyRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activities" : @"Activities",
             @"creationDate" : @"CreationDate",
             @"journeyChannelSettings" : @"JourneyChannelSettings",
             @"lastModifiedDate" : @"LastModifiedDate",
             @"limits" : @"Limits",
             @"localTime" : @"LocalTime",
             @"name" : @"Name",
             @"quietTime" : @"QuietTime",
             @"refreshFrequency" : @"RefreshFrequency",
             @"refreshOnSegmentUpdate" : @"RefreshOnSegmentUpdate",
             @"schedule" : @"Schedule",
             @"startActivity" : @"StartActivity",
             @"startCondition" : @"StartCondition",
             @"state" : @"State",
             @"waitForQuietTime" : @"WaitForQuietTime",
             };
}

+ (NSValueTransformer *)activitiesJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^id(id JSONDictionary) {
        return [AWSModelUtility mapMTLDictionaryFromJSONDictionary:JSONDictionary withModelClass:[AWSPinpointTargetingActivity class]];
    } reverseBlock:^id(id mapMTLDictionary) {
        return [AWSModelUtility JSONDictionaryFromMapMTLDictionary:mapMTLDictionary];
    }];
}

+ (NSValueTransformer *)journeyChannelSettingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyChannelSettings class]];
}

+ (NSValueTransformer *)limitsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneyLimits class]];
}

+ (NSValueTransformer *)quietTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingQuietTime class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingJourneySchedule class]];
}

+ (NSValueTransformer *)startConditionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingStartCondition class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"DRAFT"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateDraft);
        }
        if ([value caseInsensitiveCompare:@"ACTIVE"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateActive);
        }
        if ([value caseInsensitiveCompare:@"COMPLETED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateCompleted);
        }
        if ([value caseInsensitiveCompare:@"CANCELLED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateCancelled);
        }
        if ([value caseInsensitiveCompare:@"CLOSED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStateClosed);
        }
        if ([value caseInsensitiveCompare:@"PAUSED"] == NSOrderedSame) {
            return @(AWSPinpointTargetingStatePaused);
        }
        return @(AWSPinpointTargetingStateUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingStateDraft:
                return @"DRAFT";
            case AWSPinpointTargetingStateActive:
                return @"ACTIVE";
            case AWSPinpointTargetingStateCompleted:
                return @"COMPLETED";
            case AWSPinpointTargetingStateCancelled:
                return @"CANCELLED";
            case AWSPinpointTargetingStateClosed:
                return @"CLOSED";
            case AWSPinpointTargetingStatePaused:
                return @"PAUSED";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingWriteSegmentRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"dimensions" : @"Dimensions",
             @"name" : @"Name",
             @"segmentGroups" : @"SegmentGroups",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)dimensionsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentDimensions class]];
}

+ (NSValueTransformer *)segmentGroupsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentGroupList class]];
}

@end

@implementation AWSPinpointTargetingWriteTreatmentResource

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"customDeliveryConfiguration" : @"CustomDeliveryConfiguration",
             @"messageConfiguration" : @"MessageConfiguration",
             @"schedule" : @"Schedule",
             @"sizePercent" : @"SizePercent",
             @"templateConfiguration" : @"TemplateConfiguration",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             };
}

+ (NSValueTransformer *)customDeliveryConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCustomDeliveryConfiguration class]];
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSchedule class]];
}

+ (NSValueTransformer *)templateConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTemplateConfiguration class]];
}

@end
