/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>

#import "AWSService.h"
#import "AWSModel.h"

/**
 *  Enumeration of behaviors for the save operation.
 */
typedef NS_ENUM(NSInteger, AWSDynamoDBObjectMapperSaveBehavior) {
    /**
     *  Unknown SaveBehavior option.
     */
    AWSDynamoDBObjectMapperSaveBehaviorUnknown,
    /**
     *  <p>AWSDynamoDBObjectMapperSaveBehaviorUpdate will not affect unmodeled attributes on a save operation and a nil value for the modeled attribute will remove it from that item in DynamoDB.<p>Because of the limitation of updateItem request, the implementation of AWSDynamoDBObjectMapperSaveBehaviorUpdate will send a putItem request when a key-only object is being saved, and it will send another updateItem request if the given key(s) already exists in the table.<p>By default, the mapper uses AWSDynamoDBObjectMapperSaveBehaviorUpdate.
     */
    AWSDynamoDBObjectMapperSaveBehaviorUpdate,
};

@class BFTask;
@class AWSServiceConfiguration;
@class AWSDynamoDB;
@class AWSDynamoDBObjectMapperConfiguration;
@class AWSDynamoDBQueryExpression;
@class AWSDynamoDBScanExpression;

@protocol AWSDynamoDBModeling <NSObject>

@required
+ (NSString *)dynamoDBTableName;
+ (NSString *)hashKeyAttribute;

@optional
+ (NSString *)rangeKeyAttribute;
+ (NSString *)versionAttribute;
+ (NSArray *)ignoreAttributes;

@end

@interface AWSDynamoDBModel : AWSModel

- (instancetype)initWithItem:(NSDictionary *)item;

- (NSDictionary *)itemForPutItemInput;

- (NSDictionary *)itemForUpdateItemInput;

- (NSDictionary *)key;

@end

/**
 *  Object mapper for domain-object interaction with DynamoDB.
 */
@interface AWSDynamoDBObjectMapper : AWSService

@property (nonatomic, strong, readonly) AWSDynamoDBObjectMapperConfiguration *configuration;

+ (instancetype)defaultDynamoDBObjectMapper;

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
            objectMapperConfiguration:(AWSDynamoDBObjectMapperConfiguration *)objectMapperConfiguration;

/**
 *  Saves the object given into DynamoDB, using the default configuration.
 *
 *  @param model A model to save.
 *
 *  @return BFTask.
 */
- (BFTask *)save:(AWSDynamoDBModel *)model;

/**
 *  Saves the object given into DynamoDB, using the specified configuration.
 *
 *  @param model         A model to save.
 *  @param configuration A configuration.
 *
 *  @return BFTask.
 */
- (BFTask *)save:(AWSDynamoDBModel *)model
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

/**
 *  Deletes the given object from its DynamoDB table using the default configuration.
 *
 *  @param model A model to delete.
 *
 *  @return BFTask.
 */
- (BFTask *)remove:(AWSDynamoDBModel *)model;

/**
 *  Deletes the given object from its DynamoDB table using the specified configuration.
 *
 *  @param model         A model to delete.
 *  @param configuration A configuration.
 *
 *  @return BFTask.
 */
- (BFTask *)remove:(AWSDynamoDBModel *)model
     configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

/**
 *  Loads an object with a hash and range key, using the default configuration.
 *
 *  @param resultClass The class of the result object.
 *  @param hashKey     A hash key value.
 *  @param rangeKey    A range key value.
 *
 *  @return BFTask.
 */
- (BFTask *)load:(Class)resultClass
         hashKey:(id)hashKey
        rangeKey:(id)rangeKey;

/**
 *  Returns an object with the given hash key, or null if no such object exists.
 *
 *  @param resultClass   The class of the result object.
 *  @param hashKey       A hash key value.
 *  @param rangeKey      A range key value.
 *  @param configuration A configuration.
 *
 *  @return BFTask.
 */
- (BFTask *)load:(Class)resultClass
         hashKey:(id)hashKey
        rangeKey:(id)rangeKey
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

/**
 *  Queries an Amazon DynamoDB table and returns the matching results as an unmodifiable list of instantiated objects, using the default configuration.
 *
 *  @param resultClass The class of the result object.
 *  @param expression  An expression object.
 *
 *  @return BFTask.
 */
- (BFTask *)query:(Class)resultClass
       expression:(AWSDynamoDBQueryExpression *)expression;

/**
 *  Queries an Amazon DynamoDB table and returns the matching results as an unmodifiable list of instantiated objects.
 *
 *  @param resultClass   The class of the result object.
 *  @param expression    An expression object.
 *  @param configuration A configuration.
 *
 *  @return BFTask.
 */
- (BFTask *)query:(Class)resultClass
       expression:(AWSDynamoDBQueryExpression *)expression
    configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

/**
 *  Scans through an Amazon DynamoDB table and returns the matching results as an AWSDynamoDBPaginatedOutput of instantiated objects, using the default configuration.
 *
 *  @param resultClass The class of the result object.
 *  @param expression  An expression object.
 *
 *  @return BFTask.
 */
- (BFTask *)scan:(Class)resultClass
      expression:(AWSDynamoDBScanExpression *)expression;

/**
 *  Scans through an Amazon DynamoDB table and returns the matching results as an AWSDynamoDBPaginatedOutput of instantiated objects.
 *
 *  @param resultClass   The class of the result object.
 *  @param expression    An expression object.
 *  @param configuration A configuration.
 *
 *  @return BFTask.
 */
- (BFTask *)scan:(Class)resultClass
      expression:(AWSDynamoDBScanExpression *)expression
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

@end

/**
 *  Immutable configuration object for service call behavior. An instance of this configuration is supplied to every DynamoDBMapper at construction. New instances can be given to the mapper object on individual save, load, and remove operations to override the defaults.
 */
@interface AWSDynamoDBObjectMapperConfiguration : NSObject <NSCopying>

/**
 *  The behavior for the save operation.
 */
@property (nonatomic, assign) AWSDynamoDBObjectMapperSaveBehavior saveBehavior;

/**
 *  When set to @YES, AWSDynamoDBObjectMapper uses consistent read to read data from the table. When set to @NO, it uses eventually consistant read.
 */
@property (nonatomic, strong) NSNumber *consistentRead;

@end

/**
 *   A query expression.
 */
@interface AWSDynamoDBQueryExpression : NSObject

/**
 *  When set to @YES, AWSDynamoDBObjectMapper scans the index forward. When set to @NO, it scans the other direction.
 */
@property (nonatomic, strong) NSNumber *scanIndexForward;

/**
 *  The value of the hash key.
 */
@property (nonatomic, strong) id hashKeyValues;

/**
 *  The range key conditions.
 */
@property (nonatomic, strong) NSDictionary *rangeKeyConditions;

/**
 *  The exclusive start key.
 */
@property (nonatomic, strong) NSDictionary *exclusiveStartKey;

/**
 *  The limit.
 */
@property (nonatomic, strong) NSNumber *limit;

/**
 *  The index name.
 */
@property (nonatomic, strong) NSString *indexName;

@end

/**
 *  Options for filtering results from a scan operation. For example, callers can specify filter conditions so that only objects whose attributes match different conditions are returned (see ComparisonOperator for more information on the available comparison types).
 */
@interface AWSDynamoDBScanExpression : NSObject

/**
 *  The scan filter.
 */
@property (nonatomic, strong) NSDictionary *scanFilter;

/**
 *  The exclusive start key.
 */
@property (nonatomic, strong) NSDictionary *exclusiveStartKey;

/**
 *  The limit.
 */
@property (nonatomic, strong) NSNumber *limit;

@end

/**
 *  The paginated output object.
 */
@interface AWSDynamoDBPaginatedOutput : NSObject

/**
 *  The array of items.
 */
@property (nonatomic, strong) NSArray *items;

/**
 *  The last evaluated key.
 */
@property (nonatomic, strong) NSDictionary *lastEvaluatedKey;

@end
