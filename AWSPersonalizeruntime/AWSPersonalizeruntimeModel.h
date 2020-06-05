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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSPersonalizeruntimeErrorDomain;

typedef NS_ENUM(NSInteger, AWSPersonalizeruntimeErrorType) {
    AWSPersonalizeruntimeErrorUnknown,
    AWSPersonalizeruntimeErrorInvalidInput,
    AWSPersonalizeruntimeErrorResourceNotFound,
};

@class AWSPersonalizeruntimeGetPersonalizedRankingRequest;
@class AWSPersonalizeruntimeGetPersonalizedRankingResponse;
@class AWSPersonalizeruntimeGetRecommendationsRequest;
@class AWSPersonalizeruntimeGetRecommendationsResponse;
@class AWSPersonalizeruntimePredictedItem;

/**
 
 */
@interface AWSPersonalizeruntimeGetPersonalizedRankingRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the campaign to use for generating the personalized ranking.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignArn;

/**
 <p>The contextual metadata to use when getting recommendations. Contextual metadata includes any interaction information that might be relevant when getting a user's recommendations, such as the user's current location or device type.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable context;

/**
 <p>A list of items (itemId's) to rank. If an item was not included in the training dataset, the item is appended to the end of the reranked list. The maximum is 500.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable inputList;

/**
 <p>The user for which you want the campaign to provide a personalized ranking.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSPersonalizeruntimeGetPersonalizedRankingResponse : AWSModel


/**
 <p>A list of items in order of most likely interest to the user. The maximum is 500.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeruntimePredictedItem *> * _Nullable personalizedRanking;

@end

/**
 
 */
@interface AWSPersonalizeruntimeGetRecommendationsRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the campaign to use for getting recommendations.</p>
 */
@property (nonatomic, strong) NSString * _Nullable campaignArn;

/**
 <p>The contextual metadata to use when getting recommendations. Contextual metadata includes any interaction information that might be relevant when getting a user's recommendations, such as the user's current location or device type.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable context;

/**
 <p>The ARN of the filter to apply to the returned recommendations. For more information, see Using Filters with Amazon Personalize.</p>
 */
@property (nonatomic, strong) NSString * _Nullable filterArn;

/**
 <p>The item ID to provide recommendations for.</p><p>Required for <code>RELATED_ITEMS</code> recipe type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable itemId;

/**
 <p>The number of results to return. The default is 25. The maximum is 500.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable numResults;

/**
 <p>The user ID to provide recommendations for.</p><p>Required for <code>USER_PERSONALIZATION</code> recipe type.</p>
 */
@property (nonatomic, strong) NSString * _Nullable userId;

@end

/**
 
 */
@interface AWSPersonalizeruntimeGetRecommendationsResponse : AWSModel


/**
 <p>A list of recommendations sorted in ascending order by prediction score. There can be a maximum of 500 items in the list.</p>
 */
@property (nonatomic, strong) NSArray<AWSPersonalizeruntimePredictedItem *> * _Nullable itemList;

@end

/**
 <p>An object that identifies an item.</p><p>The and APIs return a list of <code>PredictedItem</code>s.</p>
 */
@interface AWSPersonalizeruntimePredictedItem : AWSModel


/**
 <p>The recommended item ID.</p>
 */
@property (nonatomic, strong) NSString * _Nullable itemId;

/**
 <p>A numeric representation of the model's certainty that the item will be the next user selection. For more information on scoring logic, see <a>how-scores-work</a>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable score;

@end

NS_ASSUME_NONNULL_END
