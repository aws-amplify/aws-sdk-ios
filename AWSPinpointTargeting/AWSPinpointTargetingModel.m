//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"clientId" : @"ClientId",
             @"clientSecret" : @"ClientSecret",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSPinpointTargetingADMChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
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

@implementation AWSPinpointTargetingAPNSSandboxChannelRequest

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

@implementation AWSPinpointTargetingActivityResponse

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
        return @(AWSPinpointTargetingChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingApplicationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"arn" : @"Arn",
             @"identifier" : @"Id",
             @"name" : @"Name",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSPinpointTargetingApplicationSettingsResource

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
        return @(AWSPinpointTargetingAttributeTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSPinpointTargetingAttributeTypeInclusive:
                return @"INCLUSIVE";
            case AWSPinpointTargetingAttributeTypeExclusive:
                return @"EXCLUSIVE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingAttributesResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"attributeType" : @"AttributeType",
             @"attributes" : @"Attributes",
             };
}

@end

@implementation AWSPinpointTargetingBaiduChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiKey" : @"ApiKey",
             @"enabled" : @"Enabled",
             @"secretKey" : @"SecretKey",
             };
}

@end

@implementation AWSPinpointTargetingBaiduChannelResponse

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

@implementation AWSPinpointTargetingCampaignEmailMessage

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

@implementation AWSPinpointTargetingCampaignLimits

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"daily" : @"Daily",
             @"maximumDuration" : @"MaximumDuration",
             @"messagesPerSecond" : @"MessagesPerSecond",
             @"total" : @"Total",
             };
}

@end

@implementation AWSPinpointTargetingCampaignResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalTreatments" : @"AdditionalTreatments",
             @"applicationId" : @"ApplicationId",
             @"arn" : @"Arn",
             @"creationDate" : @"CreationDate",
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
             @"schedule" : @"Schedule",
             @"segmentId" : @"SegmentId",
             @"segmentVersion" : @"SegmentVersion",
             @"state" : @"State",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             @"version" : @"Version",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)additionalTreatmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingTreatmentResource class]];
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

@end

@implementation AWSPinpointTargetingCampaignSmsMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"messageType" : @"MessageType",
             @"senderId" : @"SenderId",
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
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSPinpointTargetingCampaignsResponse

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

@implementation AWSPinpointTargetingCreateAppRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSPinpointTargetingCreateCampaignRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignResponse" : @"CampaignResponse",
             };
}

+ (NSValueTransformer *)campaignResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignResponse class]];
}

@end

@implementation AWSPinpointTargetingCreateExportJobRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importJobResponse" : @"ImportJobResponse",
             };
}

+ (NSValueTransformer *)importJobResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingImportJobResponse class]];
}

@end

@implementation AWSPinpointTargetingCreateSegmentRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"segmentResponse" : @"SegmentResponse",
             };
}

+ (NSValueTransformer *)segmentResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSegmentResponse class]];
}

@end

@implementation AWSPinpointTargetingDefaultMessage

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"substitutions" : @"Substitutions",
             };
}

@end

@implementation AWSPinpointTargetingDefaultPushNotificationMessage

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

@implementation AWSPinpointTargetingDeleteAdmChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteAdmChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteApnsChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteApnsSandboxChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteApnsVoipChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteAppResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteBaiduChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteCampaignResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteEmailChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailChannelResponse" : @"EmailChannelResponse",
             };
}

+ (NSValueTransformer *)emailChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEmailChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointId" : @"EndpointId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteEndpointResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteEventStreamResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteGcmChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"GCMChannelResponse" : @"GCMChannelResponse",
             };
}

+ (NSValueTransformer *)GCMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingGCMChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteSegmentRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteSegmentResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteSmsChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SMSChannelResponse" : @"SMSChannelResponse",
             };
}

+ (NSValueTransformer *)SMSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSMSChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDeleteUserEndpointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteUserEndpointsResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingDeleteVoiceChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceChannelResponse" : @"VoiceChannelResponse",
             };
}

+ (NSValueTransformer *)voiceChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingVoiceChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingDirectMessageConfiguration

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

@implementation AWSPinpointTargetingEndpointBatchItem

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
        return @(AWSPinpointTargetingChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"statusCode" : @"StatusCode",
             };
}

@end

@implementation AWSPinpointTargetingEndpointLocation

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
        return @(AWSPinpointTargetingChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
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
        return @(AWSPinpointTargetingChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"userAttributes" : @"UserAttributes",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSPinpointTargetingEndpointsResponse

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

@implementation AWSPinpointTargetingEventDimensions

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

@implementation AWSPinpointTargetingEventItemResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"statusCode" : @"StatusCode",
             };
}

@end

@implementation AWSPinpointTargetingEventStream

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
        if ([value caseInsensitiveCompare:@"INITIALIZING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"PROCESSING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusProcessing);
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
            case AWSPinpointTargetingJobStatusInitializing:
                return @"INITIALIZING";
            case AWSPinpointTargetingJobStatusProcessing:
                return @"PROCESSING";
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"apiKey" : @"ApiKey",
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSPinpointTargetingGCMChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"latitude" : @"Latitude",
             @"longitude" : @"Longitude",
             };
}

@end

@implementation AWSPinpointTargetingGPSPointDimension

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetAdmChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetApnsChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetApnsSandboxChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetApnsVoipChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetApnsVoipSandboxChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetAppResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationResponse" : @"ApplicationResponse",
             };
}

+ (NSValueTransformer *)applicationResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingApplicationResponse class]];
}

@end

@implementation AWSPinpointTargetingGetApplicationSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetApplicationSettingsResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetAppsResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetBaiduChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"activitiesResponse" : @"ActivitiesResponse",
             };
}

+ (NSValueTransformer *)activitiesResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingActivitiesResponse class]];
}

@end

@implementation AWSPinpointTargetingGetCampaignRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             };
}

@end

@implementation AWSPinpointTargetingGetCampaignResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"campaignId" : @"CampaignId",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingGetCampaignVersionResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetCampaignsResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetChannelsResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetEmailChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailChannelResponse" : @"EmailChannelResponse",
             };
}

+ (NSValueTransformer *)emailChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEmailChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingGetEndpointRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"endpointId" : @"EndpointId",
             };
}

@end

@implementation AWSPinpointTargetingGetEndpointResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetEventStreamResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSPinpointTargetingGetExportJobResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetExportJobsResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetGcmChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"jobId" : @"JobId",
             };
}

@end

@implementation AWSPinpointTargetingGetImportJobResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetImportJobsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"importJobsResponse" : @"ImportJobsResponse",
             };
}

+ (NSValueTransformer *)importJobsResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingImportJobsResponse class]];
}

@end

@implementation AWSPinpointTargetingGetSegmentExportJobsRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             };
}

@end

@implementation AWSPinpointTargetingGetSegmentResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"segmentId" : @"SegmentId",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingGetSegmentVersionResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"pageSize" : @"PageSize",
             @"token" : @"Token",
             };
}

@end

@implementation AWSPinpointTargetingGetSegmentsResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetSmsChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SMSChannelResponse" : @"SMSChannelResponse",
             };
}

+ (NSValueTransformer *)SMSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSMSChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingGetUserEndpointsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"userId" : @"UserId",
             };
}

@end

@implementation AWSPinpointTargetingGetUserEndpointsResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             };
}

@end

@implementation AWSPinpointTargetingGetVoiceChannelResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceChannelResponse" : @"VoiceChannelResponse",
             };
}

+ (NSValueTransformer *)voiceChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingVoiceChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingImportJobRequest

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
        if ([value caseInsensitiveCompare:@"INITIALIZING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusInitializing);
        }
        if ([value caseInsensitiveCompare:@"PROCESSING"] == NSOrderedSame) {
            return @(AWSPinpointTargetingJobStatusProcessing);
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
            case AWSPinpointTargetingJobStatusInitializing:
                return @"INITIALIZING";
            case AWSPinpointTargetingJobStatusProcessing:
                return @"PROCESSING";
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

@implementation AWSPinpointTargetingItemResponse

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

@implementation AWSPinpointTargetingListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSPinpointTargetingListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tagsModel" : @"TagsModel",
             };
}

+ (NSValueTransformer *)tagsModelJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingTagsModel class]];
}

@end

@implementation AWSPinpointTargetingMessage

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"message" : @"Message",
             @"requestID" : @"RequestID",
             };
}

@end

@implementation AWSPinpointTargetingMessageConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"ADMMessage" : @"ADMMessage",
             @"APNSMessage" : @"APNSMessage",
             @"baiduMessage" : @"BaiduMessage",
             @"defaultMessage" : @"DefaultMessage",
             @"emailMessage" : @"EmailMessage",
             @"GCMMessage" : @"GCMMessage",
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

+ (NSValueTransformer *)defaultMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessage class]];
}

+ (NSValueTransformer *)emailMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignEmailMessage class]];
}

+ (NSValueTransformer *)GCMMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessage class]];
}

+ (NSValueTransformer *)SMSMessageJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingCampaignSmsMessage class]];
}

@end

@implementation AWSPinpointTargetingMessageRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"addresses" : @"Addresses",
             @"context" : @"Context",
             @"endpoints" : @"Endpoints",
             @"messageConfiguration" : @"MessageConfiguration",
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

@end

@implementation AWSPinpointTargetingMessageResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"comparisonOperator" : @"ComparisonOperator",
             @"value" : @"Value",
             };
}

@end

@implementation AWSPinpointTargetingNumberValidateRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"isoCountryCode" : @"IsoCountryCode",
             @"phoneNumber" : @"PhoneNumber",
             };
}

@end

@implementation AWSPinpointTargetingNumberValidateResponse

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

@implementation AWSPinpointTargetingPhoneNumberValidateRequest

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
        return @(AWSPinpointTargetingChannelTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
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

@implementation AWSPinpointTargetingPutEventStreamRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"end" : @"End",
             @"start" : @"Start",
             };
}

@end

@implementation AWSPinpointTargetingRawEmail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"data" : @"Data",
             };
}

@end

@implementation AWSPinpointTargetingRecencyDimension

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

@implementation AWSPinpointTargetingRemoveAttributesRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"attributesResource" : @"AttributesResource",
             };
}

+ (NSValueTransformer *)attributesResourceJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingAttributesResource class]];
}

@end

@implementation AWSPinpointTargetingSMSChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             @"senderId" : @"SenderId",
             @"shortCode" : @"ShortCode",
             };
}

@end

@implementation AWSPinpointTargetingSMSChannelResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"body" : @"Body",
             @"keyword" : @"Keyword",
             @"messageType" : @"MessageType",
             @"originationNumber" : @"OriginationNumber",
             @"senderId" : @"SenderId",
             @"substitutions" : @"Substitutions",
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

@implementation AWSPinpointTargetingSchedule

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"recency" : @"Recency",
             };
}

+ (NSValueTransformer *)recencyJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingRecencyDimension class]];
}

@end

@implementation AWSPinpointTargetingSegmentDemographics

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"version" : @"Version",
             };
}

@end

@implementation AWSPinpointTargetingSegmentResponse

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"context" : @"Context",
             @"messageConfiguration" : @"MessageConfiguration",
             @"traceId" : @"TraceId",
             @"users" : @"Users",
             };
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingDirectMessageConfiguration class]];
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"applicationId" : @"ApplicationId",
             @"requestId" : @"RequestId",
             @"result" : @"Result",
             };
}

@end

@implementation AWSPinpointTargetingSendUsersMessagesRequest

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

@implementation AWSPinpointTargetingSimpleEmail

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"charset" : @"Charset",
             @"data" : @"Data",
             };
}

@end

@implementation AWSPinpointTargetingTagResourceRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSPinpointTargetingTreatmentResource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"identifier" : @"Id",
             @"messageConfiguration" : @"MessageConfiguration",
             @"schedule" : @"Schedule",
             @"sizePercent" : @"SizePercent",
             @"state" : @"State",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             };
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

@end

@implementation AWSPinpointTargetingUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end

@implementation AWSPinpointTargetingUpdateAdmChannelRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"blacklist" : @"Blacklist",
             };
}

@end

@implementation AWSPinpointTargetingUpdateBaiduChannelRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"emailChannelResponse" : @"EmailChannelResponse",
             };
}

+ (NSValueTransformer *)emailChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingEmailChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateEndpointRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"GCMChannelResponse" : @"GCMChannelResponse",
             };
}

+ (NSValueTransformer *)GCMChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingGCMChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateSegmentRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"SMSChannelResponse" : @"SMSChannelResponse",
             };
}

+ (NSValueTransformer *)SMSChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSMSChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingUpdateVoiceChannelRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"voiceChannelResponse" : @"VoiceChannelResponse",
             };
}

+ (NSValueTransformer *)voiceChannelResponseJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingVoiceChannelResponse class]];
}

@end

@implementation AWSPinpointTargetingVoiceChannelRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"enabled" : @"Enabled",
             };
}

@end

@implementation AWSPinpointTargetingVoiceChannelResponse

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

@implementation AWSPinpointTargetingWriteApplicationSettingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignHook" : @"CampaignHook",
             @"cloudWatchMetricsEnabled" : @"CloudWatchMetricsEnabled",
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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"additionalTreatments" : @"AdditionalTreatments",
             @"detail" : @"Description",
             @"holdoutPercent" : @"HoldoutPercent",
             @"hook" : @"Hook",
             @"isPaused" : @"IsPaused",
             @"limits" : @"Limits",
             @"messageConfiguration" : @"MessageConfiguration",
             @"name" : @"Name",
             @"schedule" : @"Schedule",
             @"segmentId" : @"SegmentId",
             @"segmentVersion" : @"SegmentVersion",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             @"tags" : @"tags",
             };
}

+ (NSValueTransformer *)additionalTreatmentsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPinpointTargetingWriteTreatmentResource class]];
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

@end

@implementation AWSPinpointTargetingWriteEventStream

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"destinationStreamArn" : @"DestinationStreamArn",
             @"roleArn" : @"RoleArn",
             };
}

@end

@implementation AWSPinpointTargetingWriteSegmentRequest

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"messageConfiguration" : @"MessageConfiguration",
             @"schedule" : @"Schedule",
             @"sizePercent" : @"SizePercent",
             @"treatmentDescription" : @"TreatmentDescription",
             @"treatmentName" : @"TreatmentName",
             };
}

+ (NSValueTransformer *)messageConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingMessageConfiguration class]];
}

+ (NSValueTransformer *)scheduleJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSPinpointTargetingSchedule class]];
}

@end
