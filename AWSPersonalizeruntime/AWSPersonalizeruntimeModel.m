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

#import "AWSPersonalizeruntimeModel.h"
#import <AWSCore/AWSCategory.h>

NSString *const AWSPersonalizeruntimeErrorDomain = @"com.amazonaws.AWSPersonalizeruntimeErrorDomain";

@implementation AWSPersonalizeruntimeGetPersonalizedRankingRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignArn" : @"campaignArn",
             @"context" : @"context",
             @"inputList" : @"inputList",
             @"userId" : @"userId",
             };
}

@end

@implementation AWSPersonalizeruntimeGetPersonalizedRankingResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"personalizedRanking" : @"personalizedRanking",
             };
}

+ (NSValueTransformer *)personalizedRankingJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeruntimePredictedItem class]];
}

@end

@implementation AWSPersonalizeruntimeGetRecommendationsRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"campaignArn" : @"campaignArn",
             @"context" : @"context",
             @"filterArn" : @"filterArn",
             @"itemId" : @"itemId",
             @"numResults" : @"numResults",
             @"userId" : @"userId",
             };
}

@end

@implementation AWSPersonalizeruntimeGetRecommendationsResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"itemList" : @"itemList",
             };
}

+ (NSValueTransformer *)itemListJSONTransformer {
    return [NSValueTransformer awsmtl_JSONArrayTransformerWithModelClass:[AWSPersonalizeruntimePredictedItem class]];
}

@end

@implementation AWSPersonalizeruntimePredictedItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
             @"itemId" : @"itemId",
             @"score" : @"score",
             };
}

@end
