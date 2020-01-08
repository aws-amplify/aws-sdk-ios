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

#import "AWSKinesisVideoSignalingModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSKinesisVideoSignalingErrorDomain = @"com.amazonaws.AWSKinesisVideoSignalingErrorDomain";

@implementation AWSKinesisVideoSignalingGetIceServerConfigRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelARN" : @"ChannelARN",
             @"clientId" : @"ClientId",
             @"service" : @"Service",
             @"username" : @"Username",
             };
}

+ (NSValueTransformer *)serviceJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"TURN"] == NSOrderedSame) {
            return @(AWSKinesisVideoSignalingServiceTurn);
        }
        return @(AWSKinesisVideoSignalingServiceUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSKinesisVideoSignalingServiceTurn:
                return @"TURN";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSKinesisVideoSignalingGetIceServerConfigResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"iceServerList" : @"IceServerList",
             };
}

+ (NSValueTransformer *)iceServerListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSKinesisVideoSignalingIceServer class]];
}

@end

@implementation AWSKinesisVideoSignalingIceServer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"password" : @"Password",
             @"ttl" : @"Ttl",
             @"uris" : @"Uris",
             @"username" : @"Username",
             };
}

@end

@implementation AWSKinesisVideoSignalingSendAlexaOfferToMasterRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"channelARN" : @"ChannelARN",
             @"messagePayload" : @"MessagePayload",
             @"senderClientId" : @"SenderClientId",
             };
}

@end

@implementation AWSKinesisVideoSignalingSendAlexaOfferToMasterResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"answer" : @"Answer",
             };
}

@end
