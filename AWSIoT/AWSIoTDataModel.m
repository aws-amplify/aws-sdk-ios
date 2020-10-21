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

#import "AWSIoTDataModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSIoTDataErrorDomain = @"com.amazonaws.AWSIoTDataErrorDomain";

@implementation AWSIoTDataDeleteThingShadowRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"shadowName" : @"shadowName",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDataDeleteThingShadowResponse

+ (BOOL)supportsSecureCoding {
    return NO;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"payload",
             };
}

@end

@implementation AWSIoTDataGetThingShadowRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"shadowName" : @"shadowName",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDataGetThingShadowResponse

+ (BOOL)supportsSecureCoding {
    return NO;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"payload",
             };
}

@end

@implementation AWSIoTDataListNamedShadowsForThingRequest

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"pageSize" : @"pageSize",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDataListNamedShadowsForThingResponse

+ (BOOL)supportsSecureCoding {
    return YES;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"nextToken" : @"nextToken",
             @"results" : @"results",
             @"timestamp" : @"timestamp",
             };
}

@end

@implementation AWSIoTDataPublishRequest

+ (BOOL)supportsSecureCoding {
    return NO;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"payload",
             @"qos" : @"qos",
             @"topic" : @"topic",
             };
}

@end

@implementation AWSIoTDataUpdateThingShadowRequest

+ (BOOL)supportsSecureCoding {
    return NO;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"payload",
             @"shadowName" : @"shadowName",
             @"thingName" : @"thingName",
             };
}

@end

@implementation AWSIoTDataUpdateThingShadowResponse

+ (BOOL)supportsSecureCoding {
    return NO;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"payload" : @"payload",
             };
}

@end
