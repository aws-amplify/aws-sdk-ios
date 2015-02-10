/*
 * Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
     *  Unknown SaveBehavior.
     */
    AWSDynamoDBObjectMapperSaveBehaviorUnknown,

    /**
     * `AWSDynamoDBObjectMapperSaveBehaviorUpdate` will not affect unmodeled
     * attributes on a save operation and a nil value for the modeled attribute
     * will remove it from that item in DynamoDB.
     * By default, the mapper uses `AWSDynamoDBObjectMapperSaveBehaviorUpdate`.
     */
    AWSDynamoDBObjectMapperSaveBehaviorUpdate,

    /**
     * `AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes` is similar
     * to `AWSDynamoDBObjectMapperSaveBehaviorUpdate`, except that it
     * ignores any null value attribute(s) and will NOT remove them from
     * that item in DynamoDB. It also guarantees to send only one single
     * updateItem request, no matter the object is key-only or not.
     */
    AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes,

    /**
     * `AWSDynamoDBObjectMapperSaveBehaviorAppendSet` treats scalar attributes
     * (String, Number, Binary) the same as
     * `AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes` does.
     * However, for set attributes, it will append to the existing attribute
     * value, instead of overriding it. Caller needs to make sure that the
     * modeled attribute type matches the existing set type, otherwise it would
     * result in a service exception.
     */
    AWSDynamoDBObjectMapperSaveBehaviorAppendSet,

    /**
     * `AWSDynamoDBObjectMapperSaveBehaviorClobber` will clear and replace all
     * attributes, included unmodeled ones, (delete and recreate) on save.
     * Versioned field constraints will also be disregarded.
     */
    AWSDynamoDBObjectMapperSaveBehaviorClobber
};

@class BFTask;
@class AWSServiceConfiguration;
@class AWSDynamoDB;
@class AWSDynamoDBObjectMapperConfiguration;
@class AWSDynamoDBQueryExpression;
@class AWSDynamoDBScanExpression;

/**
 *  A DynamoDB Modeling protocol. All objects mapped to an Amazon DynamoDB table row need to conform to this protocol.
 */
@protocol AWSDynamoDBModeling <NSObject>

@required

/**
 *  Returns the Amazon DynamoDB table name.
 *
 *  @return A table name.
 */
+ (NSString *)dynamoDBTableName;

/**
 *  Returns the hash key attribute name.
 *
 *  @return A hash key attribute name.
 */
+ (NSString *)hashKeyAttribute;

@optional

/**
 *  Returns the range key attribute name.
 *
 *  @return A range key attribute name.
 */
+ (NSString *)rangeKeyAttribute;

/**
 *  Returns the name of the attribute used for veresion control.
 *
 *  @return A version attribute name.
 */
+ (NSString *)versionAttribute;

/**
 *  Returns an array of `NSString`s for the names of attributes that need to be ignored.
 *
 *  @return An array of attribute names.
 */
+ (NSArray *)ignoreAttributes;

@end

__attribute__ ((deprecated("Use 'AWSDynamoDBObjectModel' instead.")))
/**
 *  @warning This class has been deprecated. Use `AWSDynamoDBObjectModel` instead.
 */
@interface AWSDynamoDBModel : MTLModel <MTLJSONSerializing>

@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/**
 *  A base class for all objects mapped to an Amazon DynamoDB table row. They need to inherit from this class.
 */
@interface AWSDynamoDBObjectModel : AWSDynamoDBModel <MTLJSONSerializing>

@end

#pragma clang diagnostic pop

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/**
 *  Object mapper for domain-object interaction with DynamoDB.
 */
@interface AWSDynamoDBObjectMapper : AWSService

/**
 *  The service configuration used to instantiate this service client.
 *
 *  @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSDynamoDBObjectMapperConfiguration *configuration;

/**
 *  Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.
 *
 *  @return The default service client.
 */
+ (instancetype)defaultDynamoDBObjectMapper;

/**
 *  Instantiates the service client with the given service configuration.
 *
 *  @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 *
 *  @warning Unlike the singleton method, you are responsible for maintaining a strong reference to this object. If the service client is released before completing a service request, the request may fail with unspecified errors.
 *
 *  @param configuration The service configuration object.
 *  @param objectMapperConfiguration The DynamoDB Object Mapper configuration object.
 *
 *  @return An instance of the service client.
 */
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

#pragma clang diagnostic pop

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
