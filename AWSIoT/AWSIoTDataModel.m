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

#import "AWSIoTDataModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSIoTDataErrorDomain = @"com.amazonaws.AWSIoTDataErrorDomain";

@implementation AWSIoTDataDeleteThingShadowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDataDeleteThingShadowResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"payload",
             };
}

@end

@implementation AWSIoTDataGetThingShadowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDataGetThingShadowResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"payload",
             };
}

@end

@implementation AWSIoTDataPublishRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"payload",
             @"qos" : @"qos",
             @"topic" : @"topic",
             };
}

@end

@implementation AWSIoTDataUpdateThingShadowRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"payload",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDataUpdateThingShadowResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"payload",
             };
}

@end
