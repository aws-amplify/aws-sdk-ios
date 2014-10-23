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

#import "AWSDynamoDBObjectMapper.h"
#import "AWSDynamoDB.h"
#import "Bolts.h"

@interface AWSDynamoDBAttributeValue (AWSDynamoDBObjectMapper)

- (void)aws_setAttributeValue:(id)attributeValue;
- (id)aws_getAttributeValue;

@end

@implementation AWSDynamoDBAttributeValue (AWSDynamoDBObjectMapper)

- (void)aws_setAttributeValue:(id)attributeValue {
    if ([attributeValue isKindOfClass:[NSString class]]) {
        self.S = attributeValue;
    } else if ([attributeValue isKindOfClass:[NSNumber class]]) {
        self.N = [attributeValue stringValue];
    } else if ([attributeValue isKindOfClass:[NSData class]]) {
        self.B = attributeValue;
    } else if ([attributeValue isKindOfClass:[NSArray class]]
               && [(NSArray *)attributeValue count] > 0) {
        id firstObject = [attributeValue firstObject];
        if ([firstObject isKindOfClass:[NSString class]]) {
            self.SS = attributeValue;
        } else if ([firstObject isKindOfClass:[NSNumber class]]) {
            NSMutableArray *NS = [NSMutableArray new];
            [attributeValue enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [NS addObject:[obj stringValue]];
            }];
            self.NS = NS;
        } else if ([firstObject isKindOfClass:[NSData class]]) {
            self.BS = attributeValue;
        }
    }
}

- (id)aws_getAttributeValue {
    if (self.S) {
        return self.S;
    } else if (self.N) {
        NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        return [numberFormatter numberFromString:self.N];
    } else if (self.B) {
        return self.B;
    } else if (self.SS) {
        return self.SS;
    } else if (self.NS) {
        NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;

        NSMutableArray *mutableArray = [NSMutableArray new];

        [self.NS enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [mutableArray addObject:[numberFormatter numberFromString:obj]];
        }];

        return mutableArray;
    } else if (self.BS) {
        return self.BS;
    }

    return nil;
}

@end

@interface AWSDynamoDBObjectMapper()

@property (nonatomic, strong) AWSDynamoDB *dynamoDB;
@property (nonatomic, strong) AWSDynamoDBObjectMapperConfiguration *configuration;

@end

@implementation AWSDynamoDBObjectMapper

+ (instancetype)defaultDynamoDBObjectMapper {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }
    
    static AWSDynamoDBObjectMapper *_dynamoDBObjectMapper  = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dynamoDBObjectMapper = [[AWSDynamoDBObjectMapper alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                             objectMapperConfiguration:[AWSDynamoDBObjectMapperConfiguration new]];
    });
    
    return _dynamoDBObjectMapper;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
            objectMapperConfiguration:(AWSDynamoDBObjectMapperConfiguration *)objectMapperConfiguration {
    if (self = [super init]) {
        _dynamoDB = [[AWSDynamoDB alloc] initWithConfiguration:configuration];
        _configuration = [objectMapperConfiguration copy];
    }

    return self;
}

- (BFTask *)save:(AWSDynamoDBModel *)model {
    return [self save:model
        configuration:self.configuration];
}

- (BFTask *)save:(AWSDynamoDBModel *)model
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration {
    switch (configuration.saveBehavior) {
        case AWSDynamoDBObjectMapperSaveBehaviorUpdate: {
            AWSDynamoDBPutItemInput *putItemInput = [AWSDynamoDBPutItemInput new];
            putItemInput.tableName = [[model class] performSelector:@selector(dynamoDBTableName)];
            putItemInput.item = [model itemForPutItemInput];

            NSMutableDictionary *expected = [NSMutableDictionary new];
            for (id key in [model dictionaryValue]) {
                if ([key isEqual:[[model class] performSelector:@selector(hashKeyAttribute)]]
                    || ([[model class] respondsToSelector:@selector(rangeKeyAttribute)]
                        && [key isEqual:[[model class] performSelector:@selector(rangeKeyAttribute)]])) {
                    AWSDynamoDBCondition *condition = [AWSDynamoDBCondition new];
                    condition.comparisonOperator = AWSDynamoDBComparisonOperatorNull;

                    expected[key] = condition;
                }
            }
            putItemInput.expected = expected;

            return [[self.dynamoDB putItem:putItemInput] continueWithBlock:^id(BFTask *task) {
                if ([task.error.domain isEqualToString:AWSDynamoDBErrorDomain]
                    && task.error.code == AWSDynamoDBErrorConditionalCheckFailed) {
                    AWSDynamoDBUpdateItemInput *updateItemInput = [AWSDynamoDBUpdateItemInput new];
                    updateItemInput.tableName = [[model class] performSelector:@selector(dynamoDBTableName)];
                    updateItemInput.attributeUpdates = [model itemForUpdateItemInput];
                    updateItemInput.key = [model key];

                    return [self.dynamoDB updateItem:updateItemInput];
                }

                return nil;
            }];
        }
            break;

        case AWSDynamoDBObjectMapperSaveBehaviorUnknown:
        default:
            break;
    }
    return nil;
}

- (BFTask *)remove:(AWSDynamoDBModel *)model {
    return [self remove:model
          configuration:self.configuration];
}

- (BFTask *)remove:(AWSDynamoDBModel *)model
     configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration {
    AWSDynamoDBDeleteItemInput *deleteItemInput = [AWSDynamoDBDeleteItemInput new];
    deleteItemInput.tableName = [[model class] performSelector:@selector(dynamoDBTableName)];
    deleteItemInput.key = [model key];

    return [self.dynamoDB deleteItem:deleteItemInput];
}

- (BFTask *)load:(Class)resultClass
         hashKey:(id)hashKey
        rangeKey:(id)rangeKey {
    return [self load:resultClass
              hashKey:hashKey
             rangeKey:rangeKey
        configuration:self.configuration];
}

- (BFTask *)load:(Class)resultClass
         hashKey:(id)hashKey
        rangeKey:(id)rangeKey
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration {
    AWSDynamoDBGetItemInput *getItemInput = [AWSDynamoDBGetItemInput new];
    getItemInput.tableName = [resultClass performSelector:@selector(dynamoDBTableName)];

    NSMutableDictionary *key = [NSMutableDictionary new];
    AWSDynamoDBAttributeValue *hashAttributeValue = [AWSDynamoDBAttributeValue new];
    [hashAttributeValue aws_setAttributeValue:hashKey];
    [key setObject:hashAttributeValue
            forKey:[resultClass performSelector:@selector(hashKeyAttribute)]];

    if ([resultClass respondsToSelector:@selector(rangeKeyAttribute)]) {
        AWSDynamoDBAttributeValue *rangeKeyAttributeValue = [AWSDynamoDBAttributeValue new];
        [rangeKeyAttributeValue aws_setAttributeValue:rangeKey];
        [key setObject:rangeKeyAttributeValue
                forKey:[resultClass performSelector:@selector(rangeKeyAttribute)]];
    }
    getItemInput.key = key;

    return [[self.dynamoDB getItem:getItemInput] continueWithSuccessBlock:^id(BFTask *task) {
        AWSDynamoDBGetItemOutput *getItemOutput = task.result;

        NSError *error = nil;
        id responseObject = [MTLJSONAdapter modelOfClass:resultClass
                                      fromJSONDictionary:[self removeAttributes:getItemOutput.item]
                                                   error:&error];
        if (error) {
            return [BFTask taskWithError:error];
        }
        return responseObject;
    }];
}

- (BFTask *)query:(Class)resultClass
       expression:(AWSDynamoDBQueryExpression *)expression {
    return [self query:resultClass
            expression:expression
         configuration:self.configuration];
}

- (BFTask *)query:(Class)resultClass
       expression:(AWSDynamoDBQueryExpression *)expression
    configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration {
    AWSDynamoDBQueryInput *queryInput = [AWSDynamoDBQueryInput new];
    queryInput.tableName = [resultClass performSelector:@selector(dynamoDBTableName)];
    queryInput.consistentRead = configuration.consistentRead;
    queryInput.limit = expression.limit;
    queryInput.scanIndexForward = expression.scanIndexForward;
    queryInput.exclusiveStartKey = expression.exclusiveStartKey;
    queryInput.indexName = expression.indexName;

    AWSDynamoDBAttributeValue *hashAttributeValue = [AWSDynamoDBAttributeValue new];
    [hashAttributeValue aws_setAttributeValue:expression.hashKeyValues];

    AWSDynamoDBCondition *hashCondition = [AWSDynamoDBCondition new];
    hashCondition.attributeValueList = @[hashAttributeValue];
    hashCondition.comparisonOperator = AWSDynamoDBComparisonOperatorEQ;

    NSString *hashKeyAttribute = [resultClass performSelector:@selector(hashKeyAttribute)];
    NSMutableDictionary *keyConditions = [NSMutableDictionary dictionaryWithObject:hashCondition
                                                                            forKey:hashKeyAttribute];
    [keyConditions addEntriesFromDictionary:expression.rangeKeyConditions];
    queryInput.keyConditions = keyConditions;

    return [[self.dynamoDB query:queryInput] continueWithSuccessBlock:^id(BFTask *task) {
        AWSDynamoDBQueryOutput *queryOutput = task.result;

        NSMutableArray *items = [NSMutableArray new];
        NSError *error = nil;
        for (id item in queryOutput.items) {
            id responseObject = [MTLJSONAdapter modelOfClass:resultClass
                                          fromJSONDictionary:[self removeAttributes:item]
                                                       error:&error];
            if (error) {
                return [BFTask taskWithError:error];
            }
            [items addObject:responseObject];
        }

        AWSDynamoDBPaginatedOutput *paginatedOutput = [AWSDynamoDBPaginatedOutput new];
        paginatedOutput.items = items;
        paginatedOutput.lastEvaluatedKey = queryOutput.lastEvaluatedKey;
        return paginatedOutput;
    }];
}

- (BFTask *)scan:(Class)resultClass
      expression:(AWSDynamoDBScanExpression *)expression {
    return [self scan:resultClass
           expression:expression
        configuration:self.configuration];
}

- (BFTask *)scan:(Class)resultClass
      expression:(AWSDynamoDBScanExpression *)expression
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration {
    AWSDynamoDBScanInput *scanInput = [AWSDynamoDBScanInput new];
    scanInput.tableName = [resultClass performSelector:@selector(dynamoDBTableName)];
    scanInput.limit = expression.limit;
    scanInput.exclusiveStartKey = expression.exclusiveStartKey;
    scanInput.scanFilter = expression.scanFilter;

    return [[self.dynamoDB scan:scanInput] continueWithSuccessBlock:^id(BFTask *task) {
        AWSDynamoDBScanOutput *scanOutput = task.result;

        NSMutableArray *items = [NSMutableArray new];
        NSError *error = nil;
        for (id item in scanOutput.items) {
            id responseObject = [MTLJSONAdapter modelOfClass:resultClass
                                          fromJSONDictionary:[self removeAttributes:item]
                                                       error:&error];
            if (error) {
                return [BFTask taskWithError:error];
            }
            [items addObject:responseObject];
        }

        AWSDynamoDBPaginatedOutput *paginatedOutput = [AWSDynamoDBPaginatedOutput new];
        paginatedOutput.items = items;
        paginatedOutput.lastEvaluatedKey = scanOutput.lastEvaluatedKey;
        return paginatedOutput;
    }];
}

#pragma mark - Utility

- (NSDictionary *)removeAttributes:(NSDictionary *)item {
    NSMutableDictionary *mutableItem = [NSMutableDictionary new];
    [item enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj respondsToSelector:@selector(aws_getAttributeValue)]) {
            [mutableItem setObject:[obj aws_getAttributeValue]
                            forKey:key];
        }
    }];

    return mutableItem;
}

@end

@implementation AWSDynamoDBModel

- (instancetype)initWithItem:(NSDictionary *)item {
    if (self = [super init]) {

    }

    return self;
}

- (NSDictionary *)itemForPutItemInput {
    NSMutableDictionary *item = [NSMutableDictionary new];
    NSMutableArray *keyArray = [NSMutableArray arrayWithObject:[[self class] performSelector:@selector(hashKeyAttribute)]];
    if ([self respondsToSelector:@selector(rangeKeyAttribute)]) {
        [keyArray addObject:[[self class] performSelector:@selector(rangeKeyAttribute)]];
    }
    NSDictionary *dictionaryValue = [MTLJSONAdapter JSONDictionaryFromModel:self];

    for (id key in dictionaryValue) {
        if ([keyArray containsObject:key]) {
            // For key attributes
            AWSDynamoDBAttributeValue *keyAttributeValue = [AWSDynamoDBAttributeValue new];
            [keyAttributeValue aws_setAttributeValue:dictionaryValue[key]];
            item[key] = keyAttributeValue;
        } else if (dictionaryValue[key]) {
            // For other attributes
            AWSDynamoDBAttributeValue *attributeValue = [AWSDynamoDBAttributeValue new];
            [attributeValue aws_setAttributeValue:dictionaryValue[key]];
            item[key] = attributeValue;
        }
    }

    return item;
}

- (NSDictionary *)itemForUpdateItemInput {
    NSMutableDictionary *item = [NSMutableDictionary new];
    NSArray *keyArray = [[self key] allKeys];
    NSDictionary *dictionaryValue = [MTLJSONAdapter JSONDictionaryFromModel:self];

    for (id key in dictionaryValue) {
        if (![keyArray containsObject:key]) {
            // For other attributes
            AWSDynamoDBAttributeValueUpdate *attributeValueUpdate = [AWSDynamoDBAttributeValueUpdate new];
            AWSDynamoDBAttributeValue *attributeValue = [AWSDynamoDBAttributeValue new];
            [attributeValue aws_setAttributeValue:dictionaryValue[key]];
            attributeValueUpdate.value = attributeValue;
            attributeValueUpdate.action = AWSDynamoDBAttributeActionPut;

            item[key] = attributeValueUpdate;
        }
    }

    return item;
}

- (NSDictionary *)key {
    NSMutableDictionary *keyDictionary = [NSMutableDictionary new];
    NSMutableArray *keyArray = [NSMutableArray arrayWithObject:[[self class] performSelector:@selector(hashKeyAttribute)]];
    if ([[self class] respondsToSelector:@selector(rangeKeyAttribute)]) {
        [keyArray addObject:[[self class] performSelector:@selector(rangeKeyAttribute)]];
    }
    NSDictionary *dictionaryValue = [MTLJSONAdapter JSONDictionaryFromModel:self];

    for (id key in keyArray) {
        // For key attributes
        AWSDynamoDBAttributeValue *keyAttributeValue = [AWSDynamoDBAttributeValue new];
        [keyAttributeValue aws_setAttributeValue:dictionaryValue[key]];
        keyDictionary[key] = keyAttributeValue;
    }

    return keyDictionary;
}

@end

@implementation AWSDynamoDBObjectMapperConfiguration

- (instancetype)init {
    if (self = [super init]) {
        _saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorUpdate;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    AWSDynamoDBObjectMapperConfiguration *configuration = [[[self class] allocWithZone:zone] init];
    configuration.saveBehavior = self.saveBehavior;
    configuration.consistentRead = [self.consistentRead copy];

    return configuration;
}

@end

@implementation AWSDynamoDBQueryExpression

@end

@implementation AWSDynamoDBScanExpression

@end

@implementation AWSDynamoDBPaginatedOutput

@end
