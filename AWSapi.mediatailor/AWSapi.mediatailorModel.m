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

#import "AWSapi.mediatailorModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSapi.mediatailorErrorDomain = @"com.amazonaws.AWSapi.mediatailorErrorDomain";

@implementation AWSapi.mediatailorAvailSuppression

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mode" : @"Mode",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSapi.mediatailorModeOff);
        }
        if ([value caseInsensitiveCompare:@"BEHIND_LIVE_EDGE"] == NSOrderedSame) {
            return @(AWSapi.mediatailorModeBehindLiveEdge);
        }
        return @(AWSapi.mediatailorModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.mediatailorModeOff:
                return @"OFF";
            case AWSapi.mediatailorModeBehindLiveEdge:
                return @"BEHIND_LIVE_EDGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.mediatailorCdnConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adSegmentUrlPrefix" : @"AdSegmentUrlPrefix",
             @"contentSegmentUrlPrefix" : @"ContentSegmentUrlPrefix",
             };
}

@end

@implementation AWSapi.mediatailorDashConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestEndpointPrefix" : @"ManifestEndpointPrefix",
             @"mpdLocation" : @"MpdLocation",
             @"originManifestType" : @"OriginManifestType",
             };
}

+ (NSValueTransformer *)originManifestTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_PERIOD"] == NSOrderedSame) {
            return @(AWSapi.mediatailorOriginManifestTypeSinglePeriod);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PERIOD"] == NSOrderedSame) {
            return @(AWSapi.mediatailorOriginManifestTypeMultiPeriod);
        }
        return @(AWSapi.mediatailorOriginManifestTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.mediatailorOriginManifestTypeSinglePeriod:
                return @"SINGLE_PERIOD";
            case AWSapi.mediatailorOriginManifestTypeMultiPeriod:
                return @"MULTI_PERIOD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.mediatailorDashConfigurationForPut

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mpdLocation" : @"MpdLocation",
             @"originManifestType" : @"OriginManifestType",
             };
}

+ (NSValueTransformer *)originManifestTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_PERIOD"] == NSOrderedSame) {
            return @(AWSapi.mediatailorOriginManifestTypeSinglePeriod);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PERIOD"] == NSOrderedSame) {
            return @(AWSapi.mediatailorOriginManifestTypeMultiPeriod);
        }
        return @(AWSapi.mediatailorOriginManifestTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.mediatailorOriginManifestTypeSinglePeriod:
                return @"SINGLE_PERIOD";
            case AWSapi.mediatailorOriginManifestTypeMultiPeriod:
                return @"MULTI_PERIOD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.mediatailorDeletePlaybackConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSapi.mediatailorDeletePlaybackConfigurationResponse

@end

@implementation AWSapi.mediatailorEmpty

@end

@implementation AWSapi.mediatailorGetPlaybackConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSapi.mediatailorGetPlaybackConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adDecisionServerUrl" : @"AdDecisionServerUrl",
             @"availSuppression" : @"AvailSuppression",
             @"cdnConfiguration" : @"CdnConfiguration",
             @"dashConfiguration" : @"DashConfiguration",
             @"hlsConfiguration" : @"HlsConfiguration",
             @"livePreRollConfiguration" : @"LivePreRollConfiguration",
             @"name" : @"Name",
             @"personalizationThresholdSeconds" : @"PersonalizationThresholdSeconds",
             @"playbackConfigurationArn" : @"PlaybackConfigurationArn",
             @"playbackEndpointPrefix" : @"PlaybackEndpointPrefix",
             @"sessionInitializationEndpointPrefix" : @"SessionInitializationEndpointPrefix",
             @"slateAdUrl" : @"SlateAdUrl",
             @"tags" : @"Tags",
             @"transcodeProfileName" : @"TranscodeProfileName",
             @"videoContentSourceUrl" : @"VideoContentSourceUrl",
             };
}

+ (NSValueTransformer *)availSuppressionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorAvailSuppression class]];
}

+ (NSValueTransformer *)cdnConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorCdnConfiguration class]];
}

+ (NSValueTransformer *)dashConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorDashConfiguration class]];
}

+ (NSValueTransformer *)hlsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorHlsConfiguration class]];
}

+ (NSValueTransformer *)livePreRollConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorLivePreRollConfiguration class]];
}

@end

@implementation AWSapi.mediatailorHlsConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestEndpointPrefix" : @"ManifestEndpointPrefix",
             };
}

@end

@implementation AWSapi.mediatailorListPlaybackConfigurationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSapi.mediatailorListPlaybackConfigurationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.mediatailorPlaybackConfiguration class]];
}

@end

@implementation AWSapi.mediatailorListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSapi.mediatailorListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSapi.mediatailorPlaybackConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adDecisionServerUrl" : @"AdDecisionServerUrl",
             @"availSuppression" : @"AvailSuppression",
             @"cdnConfiguration" : @"CdnConfiguration",
             @"dashConfiguration" : @"DashConfiguration",
             @"hlsConfiguration" : @"HlsConfiguration",
             @"name" : @"Name",
             @"personalizationThresholdSeconds" : @"PersonalizationThresholdSeconds",
             @"playbackConfigurationArn" : @"PlaybackConfigurationArn",
             @"playbackEndpointPrefix" : @"PlaybackEndpointPrefix",
             @"sessionInitializationEndpointPrefix" : @"SessionInitializationEndpointPrefix",
             @"slateAdUrl" : @"SlateAdUrl",
             @"tags" : @"Tags",
             @"transcodeProfileName" : @"TranscodeProfileName",
             @"videoContentSourceUrl" : @"VideoContentSourceUrl",
             };
}

+ (NSValueTransformer *)availSuppressionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorAvailSuppression class]];
}

+ (NSValueTransformer *)cdnConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorCdnConfiguration class]];
}

+ (NSValueTransformer *)dashConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorDashConfiguration class]];
}

+ (NSValueTransformer *)hlsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorHlsConfiguration class]];
}

@end

@implementation AWSapi.mediatailorLivePreRollConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adDecisionServerUrl" : @"AdDecisionServerUrl",
             @"maxDurationSeconds" : @"MaxDurationSeconds",
             };
}

@end

@implementation AWSapi.mediatailorPutPlaybackConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adDecisionServerUrl" : @"AdDecisionServerUrl",
             @"availSuppression" : @"AvailSuppression",
             @"cdnConfiguration" : @"CdnConfiguration",
             @"dashConfiguration" : @"DashConfiguration",
             @"livePreRollConfiguration" : @"LivePreRollConfiguration",
             @"name" : @"Name",
             @"personalizationThresholdSeconds" : @"PersonalizationThresholdSeconds",
             @"slateAdUrl" : @"SlateAdUrl",
             @"tags" : @"Tags",
             @"transcodeProfileName" : @"TranscodeProfileName",
             @"videoContentSourceUrl" : @"VideoContentSourceUrl",
             };
}

+ (NSValueTransformer *)availSuppressionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorAvailSuppression class]];
}

+ (NSValueTransformer *)cdnConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorCdnConfiguration class]];
}

+ (NSValueTransformer *)dashConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorDashConfigurationForPut class]];
}

+ (NSValueTransformer *)livePreRollConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorLivePreRollConfiguration class]];
}

@end

@implementation AWSapi.mediatailorPutPlaybackConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adDecisionServerUrl" : @"AdDecisionServerUrl",
             @"availSuppression" : @"AvailSuppression",
             @"cdnConfiguration" : @"CdnConfiguration",
             @"dashConfiguration" : @"DashConfiguration",
             @"hlsConfiguration" : @"HlsConfiguration",
             @"livePreRollConfiguration" : @"LivePreRollConfiguration",
             @"name" : @"Name",
             @"personalizationThresholdSeconds" : @"PersonalizationThresholdSeconds",
             @"playbackConfigurationArn" : @"PlaybackConfigurationArn",
             @"playbackEndpointPrefix" : @"PlaybackEndpointPrefix",
             @"sessionInitializationEndpointPrefix" : @"SessionInitializationEndpointPrefix",
             @"slateAdUrl" : @"SlateAdUrl",
             @"tags" : @"Tags",
             @"transcodeProfileName" : @"TranscodeProfileName",
             @"videoContentSourceUrl" : @"VideoContentSourceUrl",
             };
}

+ (NSValueTransformer *)availSuppressionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorAvailSuppression class]];
}

+ (NSValueTransformer *)cdnConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorCdnConfiguration class]];
}

+ (NSValueTransformer *)dashConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorDashConfiguration class]];
}

+ (NSValueTransformer *)hlsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorHlsConfiguration class]];
}

+ (NSValueTransformer *)livePreRollConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.mediatailorLivePreRollConfiguration class]];
}

@end

@implementation AWSapi.mediatailorTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSapi.mediatailorTagsModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSapi.mediatailorUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end
