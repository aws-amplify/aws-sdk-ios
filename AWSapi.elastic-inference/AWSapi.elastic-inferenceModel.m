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

#import "AWSapi.elastic-inferenceModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSapi.elastic-inferenceErrorDomain = @"com.amazonaws.AWSapi.elastic-inferenceErrorDomain";

@implementation AWSapi.elastic-inferenceAcceleratorType

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceleratorTypeName" : @"acceleratorTypeName",
             @"memoryInfo" : @"memoryInfo",
             @"throughputInfo" : @"throughputInfo",
             };
}

+ (NSValueTransformer *)memoryInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.elastic-inferenceMemoryInfo class]];
}

+ (NSValueTransformer *)throughputInfoJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.elastic-inferenceKeyValuePair class]];
}

@end

@implementation AWSapi.elastic-inferenceAcceleratorTypeOffering

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceleratorType" : @"acceleratorType",
             @"location" : @"location",
             @"locationType" : @"locationType",
             };
}

+ (NSValueTransformer *)locationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"region"] == NSOrderedSame) {
            return @(AWSapi.elastic-inferenceLocationTypeRegion);
        }
        if ([value caseInsensitiveCompare:@"availability-zone"] == NSOrderedSame) {
            return @(AWSapi.elastic-inferenceLocationTypeAvailabilityZone);
        }
        if ([value caseInsensitiveCompare:@"availability-zone-id"] == NSOrderedSame) {
            return @(AWSapi.elastic-inferenceLocationTypeAvailabilityZoneId);
        }
        return @(AWSapi.elastic-inferenceLocationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.elastic-inferenceLocationTypeRegion:
                return @"region";
            case AWSapi.elastic-inferenceLocationTypeAvailabilityZone:
                return @"availability-zone";
            case AWSapi.elastic-inferenceLocationTypeAvailabilityZoneId:
                return @"availability-zone-id";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.elastic-inferenceDescribeAcceleratorOfferingsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceleratorTypes" : @"acceleratorTypes",
             @"locationType" : @"locationType",
             };
}

+ (NSValueTransformer *)locationTypeJSONTransformer {
    return [AWSMTLValueTransformer reversibleTransformerWithForwardBlock:^NSNumber *(NSString *value) {
        if ([value caseInsensitiveCompare:@"region"] == NSOrderedSame) {
            return @(AWSapi.elastic-inferenceLocationTypeRegion);
        }
        if ([value caseInsensitiveCompare:@"availability-zone"] == NSOrderedSame) {
            return @(AWSapi.elastic-inferenceLocationTypeAvailabilityZone);
        }
        if ([value caseInsensitiveCompare:@"availability-zone-id"] == NSOrderedSame) {
            return @(AWSapi.elastic-inferenceLocationTypeAvailabilityZoneId);
        }
        return @(AWSapi.elastic-inferenceLocationTypeUnknown);
    } reverseBlock:^NSString *(NSNumber *value) {
        switch ([value integerValue]) {
            case AWSapi.elastic-inferenceLocationTypeRegion:
                return @"region";
            case AWSapi.elastic-inferenceLocationTypeAvailabilityZone:
                return @"availability-zone";
            case AWSapi.elastic-inferenceLocationTypeAvailabilityZoneId:
                return @"availability-zone-id";
            default:
                return nil;
        }
    }];
}

@end

@implementation AWSapi.elastic-inferenceDescribeAcceleratorOfferingsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceleratorTypeOfferings" : @"acceleratorTypeOfferings",
             };
}

+ (NSValueTransformer *)acceleratorTypeOfferingsJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.elastic-inferenceAcceleratorTypeOffering class]];
}

@end

@implementation AWSapi.elastic-inferenceDescribeAcceleratorTypesRequest

@end

@implementation AWSapi.elastic-inferenceDescribeAcceleratorTypesResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceleratorTypes" : @"acceleratorTypes",
             };
}

+ (NSValueTransformer *)acceleratorTypesJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.elastic-inferenceAcceleratorType class]];
}

@end

@implementation AWSapi.elastic-inferenceDescribeAcceleratorsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceleratorIds" : @"acceleratorIds",
             @"filters" : @"filters",
             @"maxResults" : @"maxResults",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)filtersJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.elastic-inferenceFilter class]];
}

@end

@implementation AWSapi.elastic-inferenceDescribeAcceleratorsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceleratorSet" : @"acceleratorSet",
             @"nextToken" : @"nextToken",
             };
}

+ (NSValueTransformer *)acceleratorSetJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSapi.elastic-inferenceElasticInferenceAccelerator class]];
}

@end

@implementation AWSapi.elastic-inferenceElasticInferenceAccelerator

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"acceleratorHealth" : @"acceleratorHealth",
             @"acceleratorId" : @"acceleratorId",
             @"acceleratorType" : @"acceleratorType",
             @"attachedResource" : @"attachedResource",
             @"availabilityZone" : @"availabilityZone",
             };
}

+ (NSValueTransformer *)acceleratorHealthJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[AWSapi.elastic-inferenceElasticInferenceAcceleratorHealth class]];
}

@end

@implementation AWSapi.elastic-inferenceElasticInferenceAcceleratorHealth

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"status" : @"status",
             };
}

@end

@implementation AWSapi.elastic-inferenceFilter

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"name" : @"name",
             @"values" : @"values",
             };
}

@end

@implementation AWSapi.elastic-inferenceKeyValuePair

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"key" : @"key",
             @"value" : @"value",
             };
}

@end

@implementation AWSapi.elastic-inferenceListTagsForResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             };
}

@end

@implementation AWSapi.elastic-inferenceListTagsForResourceResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"tags" : @"tags",
             };
}

@end

@implementation AWSapi.elastic-inferenceMemoryInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"sizeInMiB" : @"sizeInMiB",
             };
}

@end

@implementation AWSapi.elastic-inferenceTagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tags" : @"tags",
             };
}

@end

@implementation AWSapi.elastic-inferenceTagResourceResult

@end

@implementation AWSapi.elastic-inferenceUntagResourceRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"resourceArn" : @"resourceArn",
             @"tagKeys" : @"tagKeys",
             };
}

@end

@implementation AWSapi.elastic-inferenceUntagResourceResult

@end
