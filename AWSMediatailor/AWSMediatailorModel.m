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

#import "AWSMediatailorModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSMediatailorErrorDomain = @"com.amazonaws.AWSMediatailorErrorDomain";

@implementation AWSMediatailorAvailSuppression

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mode" : @"Mode",
             @"value" : @"Value",
             };
}

+ (NSValueTransformer *)modeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"OFF"] == NSOrderedSame) {
            return @(AWSMediatailorModeOff);
        }
        if ([value caseInsensitiveCompare:@"BEHIND_LIVE_EDGE"] == NSOrderedSame) {
            return @(AWSMediatailorModeBehindLiveEdge);
        }
        return @(AWSMediatailorModeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediatailorModeOff:
                return @"OFF";
            case AWSMediatailorModeBehindLiveEdge:
                return @"BEHIND_LIVE_EDGE";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediatailorBumper

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"endUrl" : @"EndUrl",
             @"startUrl" : @"StartUrl",
             };
}

@end

@implementation AWSMediatailorCdnConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adSegmentUrlPrefix" : @"AdSegmentUrlPrefix",
             @"contentSegmentUrlPrefix" : @"ContentSegmentUrlPrefix",
             };
}

@end

@implementation AWSMediatailorDashConfiguration

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
            return @(AWSMediatailorOriginManifestTypeSinglePeriod);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PERIOD"] == NSOrderedSame) {
            return @(AWSMediatailorOriginManifestTypeMultiPeriod);
        }
        return @(AWSMediatailorOriginManifestTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediatailorOriginManifestTypeSinglePeriod:
                return @"SINGLE_PERIOD";
            case AWSMediatailorOriginManifestTypeMultiPeriod:
                return @"MULTI_PERIOD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediatailorDashConfigurationForPut

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"mpdLocation" : @"MpdLocation",
             @"originManifestType" : @"OriginManifestType",
             };
}

+ (NSValueTransformer *)originManifestTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"SINGLE_PERIOD"] == NSOrderedSame) {
            return @(AWSMediatailorOriginManifestTypeSinglePeriod);
        }
        if ([value caseInsensitiveCompare:@"MULTI_PERIOD"] == NSOrderedSame) {
            return @(AWSMediatailorOriginManifestTypeMultiPeriod);
        }
        return @(AWSMediatailorOriginManifestTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSMediatailorOriginManifestTypeSinglePeriod:
                return @"SINGLE_PERIOD";
            case AWSMediatailorOriginManifestTypeMultiPeriod:
                return @"MULTI_PERIOD";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSMediatailorDeletePlaybackConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSMediatailorDeletePlaybackConfigurationResponse

@end

@implementation AWSMediatailorEmpty

@end

@implementation AWSMediatailorGetPlaybackConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"Name",
             };
}

@end

@implementation AWSMediatailorGetPlaybackConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adDecisionServerUrl" : @"AdDecisionServerUrl",
             @"availSuppression" : @"AvailSuppression",
             @"bumper" : @"Bumper",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorAvailSuppression class]];
}

+ (NSValueTransformer *)bumperJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorBumper class]];
}

+ (NSValueTransformer *)cdnConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorCdnConfiguration class]];
}

+ (NSValueTransformer *)dashConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorDashConfiguration class]];
}

+ (NSValueTransformer *)hlsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorHlsConfiguration class]];
}

+ (NSValueTransformer *)livePreRollConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorLivePreRollConfiguration class]];
}

@end

@implementation AWSMediatailorHlsConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"manifestEndpointPrefix" : @"ManifestEndpointPrefix",
             };
}

@end

@implementation AWSMediatailorListPlaybackConfigurationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"maxResults" : @"MaxResults",
             @"nextToken" : @"NextToken",
             };
}

@end

@implementation AWSMediatailorListPlaybackConfigurationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"items" : @"Items",
             @"nextToken" : @"NextToken",
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSMediatailorPlaybackConfiguration class]];
}

@end

@implementation AWSMediatailorListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             };
}

@end

@implementation AWSMediatailorListTagsForResourceResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSMediatailorPlaybackConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adDecisionServerUrl" : @"AdDecisionServerUrl",
             @"availSuppression" : @"AvailSuppression",
             @"bumper" : @"Bumper",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorAvailSuppression class]];
}

+ (NSValueTransformer *)bumperJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorBumper class]];
}

+ (NSValueTransformer *)cdnConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorCdnConfiguration class]];
}

+ (NSValueTransformer *)dashConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorDashConfiguration class]];
}

+ (NSValueTransformer *)hlsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorHlsConfiguration class]];
}

@end

@implementation AWSMediatailorLivePreRollConfiguration

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adDecisionServerUrl" : @"AdDecisionServerUrl",
             @"maxDurationSeconds" : @"MaxDurationSeconds",
             };
}

@end

@implementation AWSMediatailorPutPlaybackConfigurationRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adDecisionServerUrl" : @"AdDecisionServerUrl",
             @"availSuppression" : @"AvailSuppression",
             @"bumper" : @"Bumper",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorAvailSuppression class]];
}

+ (NSValueTransformer *)bumperJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorBumper class]];
}

+ (NSValueTransformer *)cdnConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorCdnConfiguration class]];
}

+ (NSValueTransformer *)dashConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorDashConfigurationForPut class]];
}

+ (NSValueTransformer *)livePreRollConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorLivePreRollConfiguration class]];
}

@end

@implementation AWSMediatailorPutPlaybackConfigurationResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"adDecisionServerUrl" : @"AdDecisionServerUrl",
             @"availSuppression" : @"AvailSuppression",
             @"bumper" : @"Bumper",
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
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorAvailSuppression class]];
}

+ (NSValueTransformer *)bumperJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorBumper class]];
}

+ (NSValueTransformer *)cdnConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorCdnConfiguration class]];
}

+ (NSValueTransformer *)dashConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorDashConfiguration class]];
}

+ (NSValueTransformer *)hlsConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorHlsConfiguration class]];
}

+ (NSValueTransformer *)livePreRollConfigurationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSMediatailorLivePreRollConfiguration class]];
}

@end

@implementation AWSMediatailorTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSMediatailorTagsModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"Tags",
             };
}

@end

@implementation AWSMediatailorUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"ResourceArn",
             @"tagKeys" : @"TagKeys",
             };
}

@end
