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

#import "AZModel.h"

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
    /**
     *  AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNilAttributes is similar to AWSDynamoDBObjectMapperSaveBehaviorUpdate, except that it ignores any nil value attribute(s) and will NOT remove them from that item in DynamoDB. It also guarantees to send only one single updateItem request, no matter the object is key-only or not.
     */
    AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNilAttributes,
    /**
     *  AWSDynamoDBObjectMapperSaveBehaviorClobber will clear and replace all attributes, included unmodeled ones, (delete and recreate) on save. Versioned field constraints will also be disregarded.
     */
    AWSDynamoDBObjectMapperSaveBehaviorClobber,
    /**
     *  AWSDynamoDBObjectMapperSaveBehaviorAppendSet treats scalar attributes (String, Number, Binary) the same as AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNilAttributes does. However, for set attributes, it will append to the existing attribute value, instead of overriding it. Caller needs to make sure that the modeled attribute type matches the existing set type, otherwise it would result in a service exception.
     */
    AWSDynamoDBObjectMapperSaveBehaviorAppendSet,
};

@class BFTask;
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

@interface AWSDynamoDBModel : AZModel

- (instancetype)initWithItem:(NSDictionary *)item;

- (NSDictionary *)itemForPutItemInput;

- (NSDictionary *)itemForUpdateItemInput;

- (NSDictionary *)key;

@end

@interface AWSDynamoDBObjectMapper : NSObject

@property (nonatomic, strong, readonly) AWSDynamoDB *dynamoDB;
@property (nonatomic, strong, readonly) AWSDynamoDBObjectMapperConfiguration *configuration;
// PaginationLoadingStrategy: LAZY_LOADING, ITERATION_ONLY, EAGER_LOADING
// TableNameOverride: putting prefixes, use different table name

+ (instancetype)defaultDynamoDBObjectMapper;

- (instancetype)initWithDynamoDB:(AWSDynamoDB *)dynamoDB
                   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

- (BFTask *)save:(AWSDynamoDBModel *)model;

- (BFTask *)save:(AWSDynamoDBModel *)model
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

- (BFTask *)remove:(AWSDynamoDBModel *)model;

- (BFTask *)remove:(AWSDynamoDBModel *)model
     configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

- (BFTask *)load:(Class)resultClass
         hashKey:(id)hashKey
        rangeKey:(id)rangeKey;

- (BFTask *)load:(Class)resultClass
         hashKey:(id)hashKey
        rangeKey:(id)rangeKey
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

- (BFTask *)query:(Class)resultClass
       expression:(AWSDynamoDBQueryExpression *)expression;

- (BFTask *)query:(Class)resultClass
       expression:(AWSDynamoDBQueryExpression *)expression
    configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

- (BFTask *)scan:(Class)resultClass
      expression:(AWSDynamoDBScanExpression *)expression;

- (BFTask *)scan:(Class)resultClass
      expression:(AWSDynamoDBScanExpression *)expression
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration;

@end

@interface AWSDynamoDBObjectMapperConfiguration : NSObject <NSCopying>

@property (nonatomic, assign) AWSDynamoDBObjectMapperSaveBehavior saveBehavior;
@property (nonatomic, strong) NSNumber *consistentRead;

@end

@interface AWSDynamoDBQueryExpression : NSObject

@property (nonatomic, strong) NSNumber *scanIndexForward;
@property (nonatomic, strong) id hashKeyValues;
@property (nonatomic, strong) NSDictionary *rangeKeyConditions;
@property (nonatomic, strong) NSDictionary *exclusiveStartKey;
@property (nonatomic, strong) NSNumber *limit;
@property (nonatomic, strong) NSString *indexName;

@end

@interface AWSDynamoDBScanExpression : NSObject

@property (nonatomic, strong) NSDictionary *scanFilter;
@property (nonatomic, strong) NSDictionary *exclusiveStartKey;
@property (nonatomic, strong) NSNumber *limit;

@end

@interface AWSDynamoDBPaginatedOutput : NSObject

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSDictionary *lastEvaluatedKey;

@end
