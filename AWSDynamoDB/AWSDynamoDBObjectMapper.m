/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSDynamoDBObjectMapper.h"
#import "AWSDynamoDB.h"
#import "AWSBolts.h"
#import "AWSLogging.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSCategory.h"

typedef NS_ENUM(NSInteger, AWSDynamoDBObjectMapperVersion) {
    AWSDynamoDBObjectMapperVersionUnknown,
    AWSDynamoDBObjectMapperVersion1,
    AWSDynamoDBObjectMapperVersion2,
};

@interface AWSDynamoDBModel ()

- (NSDictionary *)itemForPutItemInputWithVersion:(AWSDynamoDBObjectMapperVersion) mapperVersion;

- (NSDictionary *)itemForUpdateItemInput:(AWSDynamoDBObjectMapperSaveBehavior) behavior mapperVersion:(AWSDynamoDBObjectMapperVersion)mapperVersion;

- (NSDictionary *)key;

@end

@interface AWSDynamoDBAttributeValue (AWSDynamoDBObjectMapper)

- (void)aws_setAttributeValue:(id)attributeValue
                mapperVersion:(AWSDynamoDBObjectMapperVersion)mapperVersion;
- (id)aws_getAttributeValueWithVersion:(AWSDynamoDBObjectMapperVersion)mapperVersion;

@end

@implementation AWSDynamoDBAttributeValue (AWSDynamoDBObjectMapper)

- (void)aws_setAttributeValue:(id)attributeValue
                mapperVersion:(AWSDynamoDBObjectMapperVersion)mapperVersion {
    if (mapperVersion == AWSDynamoDBObjectMapperVersion2) {
        //doesn't support NULL type yet.
        //must be ahead of [attributeValue isKindOfClass:[NSNumber class]]
        if ([attributeValue isKindOfClass:[[NSNumber numberWithBool:YES] class]]) {
            self.BOOLEAN = attributeValue;
        } else if ([attributeValue isKindOfClass:[NSString class]]) {
            self.S = attributeValue;
        } else if ([attributeValue isKindOfClass:[NSNumber class]]) {
            self.N = [attributeValue stringValue];
        } else if ([attributeValue isKindOfClass:[NSData class]]) {
            self.B = attributeValue;
        } else if ([attributeValue isKindOfClass:[NSSet class]] && [(NSSet *)attributeValue count] > 0) {
            id anyObject = [attributeValue anyObject];
            if ([anyObject isKindOfClass:[NSString class]]) {
                self.SS = [attributeValue allObjects];
            } else if ([anyObject isKindOfClass:[NSNumber class]]) {
                NSMutableArray *NS = [NSMutableArray new];
                [attributeValue enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    [NS addObject:[obj stringValue]];
                }];
                self.NS = NS;
            } else if ([anyObject isKindOfClass:[NSData class]]) {
                self.BS = [attributeValue allObjects];
            }
        } else if ([attributeValue isKindOfClass:[NSArray class]] && [(NSArray *)attributeValue count] > 0) {
            NSMutableArray *list = [NSMutableArray arrayWithCapacity:[(NSArray *)attributeValue count]];
            for (id listItem in attributeValue) {
                AWSDynamoDBAttributeValue *listItemAttributeValue = [AWSDynamoDBAttributeValue new];
                [listItemAttributeValue aws_setAttributeValue:listItem mapperVersion:AWSDynamoDBObjectMapperVersion2];
                [list addObject:listItemAttributeValue];
            }
            self.L = list;
        } else if ([attributeValue isKindOfClass:[NSDictionary class]] && [(NSDictionary *)attributeValue count] > 0) {
            NSMutableDictionary *map = [NSMutableDictionary dictionaryWithCapacity:[(NSDictionary *)attributeValue count]];
            for (NSString *mapItemKey in attributeValue) {
                id mapItemValue = attributeValue[mapItemKey];
                AWSDynamoDBAttributeValue *mapItemAttributeValue = [AWSDynamoDBAttributeValue new];
                [mapItemAttributeValue aws_setAttributeValue:mapItemValue mapperVersion:AWSDynamoDBObjectMapperVersion2];
                [map setObject:mapItemAttributeValue forKey:mapItemKey];
            }
            self.M = map;
        }
    } else if (mapperVersion == AWSDynamoDBObjectMapperVersion1) {
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
    } else {
        AWSLogError(@"Fatal error. Invalid AWSDynamoDBObjectMapperVersion.");
    }
}

- (id)aws_getAttributeValueWithVersion:(AWSDynamoDBObjectMapperVersion) mapperVersion {
    if (mapperVersion == AWSDynamoDBObjectMapperVersion2) {
        //Does not support self.NIL yet.
        if (self.BOOLEAN) {
            return self.BOOLEAN;
        } else if (self.S) {
            return self.S;
        } else if (self.N) {
            return [NSNumber aws_numberFromString:self.N];
        } else if (self.B) {
            return self.B;
        } else if (self.SS) {
            return [NSSet setWithArray:self.SS];
        } else if (self.NS) {
            NSMutableSet *mutableSet = [NSMutableSet new];
            [self.NS enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [mutableSet addObject:[NSNumber aws_numberFromString:obj]];
            }];

            return mutableSet;
        } else if (self.BS) {
            return [NSSet setWithArray:self.BS];
        } else if (self.L) {
            NSMutableArray *list = [NSMutableArray arrayWithCapacity:self.L.count];
            for (id listItemAttributeValue in self.L) {
                [list addObject: [listItemAttributeValue aws_getAttributeValueWithVersion:AWSDynamoDBObjectMapperVersion2]];
            }
            return list;

        } else if (self.M) {
            NSMutableDictionary *map = [NSMutableDictionary dictionaryWithCapacity:self.M.count];
            for (NSString *entryAttributeKey in self.M) {
                id entryAttributeValue = self.M[entryAttributeKey];
                [map setObject:[entryAttributeValue aws_getAttributeValueWithVersion:AWSDynamoDBObjectMapperVersion2] forKey:entryAttributeKey];
            }
            return map;
        }

    } else if (mapperVersion == AWSDynamoDBObjectMapperVersion1) {

        if (self.S) {
            return self.S;
        } else if (self.N) {
            return [NSNumber aws_numberFromString:self.N];
        } else if (self.B) {
            return self.B;
        } else if (self.SS) {
            return self.SS;
        } else if (self.NS) {
            NSMutableArray *mutableArray = [NSMutableArray new];
            [self.NS enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [mutableArray addObject:[NSNumber aws_numberFromString:obj]];
            }];

            return mutableArray;
        } else if (self.BS) {
            return self.BS;
        }

    } else {
        AWSLogError(@"Fatal error. Invalid AWSDynamoDBObjectMapperVersion.");
    }

    return nil;
}

@end

@interface AWSDynamoDBObjectMapper()

@property (nonatomic, strong) AWSDynamoDB *dynamoDB;
@property (nonatomic, strong) AWSDynamoDBObjectMapperConfiguration *configuration;

@end

@implementation AWSDynamoDBObjectMapper

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultDynamoDBObjectMapper {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSDynamoDBObjectMapper *_dynamoDBObjectMapper  = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _dynamoDBObjectMapper = [[AWSDynamoDBObjectMapper alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                             objectMapperConfiguration:[AWSDynamoDBObjectMapperConfiguration new]];
#pragma clang diagnostic pop
    });

    return _dynamoDBObjectMapper;
}

+ (void)registerDynamoDBObjectMapperWithConfiguration:(AWSServiceConfiguration *)configuration
                            objectMapperConfiguration:(AWSDynamoDBObjectMapperConfiguration *)objectMapperConfiguration
                                               forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    AWSDynamoDBObjectMapper *objectMapper = [[AWSDynamoDBObjectMapper alloc] initWithConfiguration:configuration
                                                                         objectMapperConfiguration:objectMapperConfiguration];
    [_serviceClients setObject:objectMapper
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)DynamoDBObjectMapperForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeDynamoDBObjectMapperForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultDynamoDBObjectMapper` or `+ DynamoDBObjectMapperForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration
            objectMapperConfiguration:(AWSDynamoDBObjectMapperConfiguration *)objectMapperConfiguration {
    if (self = [super init]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _dynamoDB = [[AWSDynamoDB alloc] initWithConfiguration:configuration];
#pragma clang diagnostic pop
        _configuration = [objectMapperConfiguration copy];
    }

    return self;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

- (AWSTask *)save:(AWSDynamoDBModel *)model {
    return [self save:model
        configuration:self.configuration];
}

- (AWSTask *)save:(AWSDynamoDBModel *)model
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration {
    switch (configuration.saveBehavior) {
        case AWSDynamoDBObjectMapperSaveBehaviorClobber: {

            AWSDynamoDBPutItemInput *putItemInput = [AWSDynamoDBPutItemInput new];
            putItemInput.tableName = [[model class] performSelector:@selector(dynamoDBTableName)];

            if ([model isKindOfClass:[AWSDynamoDBObjectModel class]]) {
                putItemInput.item = [(AWSDynamoDBModel *)model itemForPutItemInputWithVersion:AWSDynamoDBObjectMapperVersion2];
            } else  {
                putItemInput.item = [(AWSDynamoDBModel *)model itemForPutItemInputWithVersion:AWSDynamoDBObjectMapperVersion1];
            }

            return [self.dynamoDB putItem:putItemInput];
            break;
        }
        case AWSDynamoDBObjectMapperSaveBehaviorAppendSet:
        case AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes:
        case AWSDynamoDBObjectMapperSaveBehaviorUpdate: {

            AWSDynamoDBUpdateItemInput *updateItemInput = [AWSDynamoDBUpdateItemInput new];
            updateItemInput.tableName = [[model class] performSelector:@selector(dynamoDBTableName)];

            if ([model isKindOfClass:[AWSDynamoDBObjectModel class]]) {
                updateItemInput.attributeUpdates = [(AWSDynamoDBModel *)model itemForUpdateItemInput:configuration.saveBehavior mapperVersion:AWSDynamoDBObjectMapperVersion2];
                updateItemInput.key = [(AWSDynamoDBModel *)model key];
            } else {
                updateItemInput.attributeUpdates = [(AWSDynamoDBModel *)model itemForUpdateItemInput:configuration.saveBehavior mapperVersion:AWSDynamoDBObjectMapperVersion1];
                updateItemInput.key = [(AWSDynamoDBModel *)model key];
            }

            return [self.dynamoDB updateItem:updateItemInput];
            break;
        }

        case AWSDynamoDBObjectMapperSaveBehaviorUnknown:
        default:
            break;
    }
    return nil;
}

- (AWSTask *)remove:(AWSDynamoDBModel *)model {
    return [self remove:model
          configuration:self.configuration];
}

- (AWSTask *)remove:(AWSDynamoDBModel *)model
     configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration {
    AWSDynamoDBDeleteItemInput *deleteItemInput = [AWSDynamoDBDeleteItemInput new];
    deleteItemInput.tableName = [[model class] performSelector:@selector(dynamoDBTableName)];

    if ([model isKindOfClass:[AWSDynamoDBObjectModel class]]) {
        deleteItemInput.key = [(AWSDynamoDBModel *)model key];
    } else {
        deleteItemInput.key = [(AWSDynamoDBModel *)model key];
    }

    return [self.dynamoDB deleteItem:deleteItemInput];
}

#pragma clang diagnostic pop

- (AWSTask *)load:(Class)resultClass
         hashKey:(id)hashKey
        rangeKey:(id)rangeKey {
    return [self load:resultClass
              hashKey:hashKey
             rangeKey:rangeKey
        configuration:self.configuration];
}

- (AWSTask *)load:(Class)resultClass
         hashKey:(id)hashKey
        rangeKey:(id)rangeKey
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration {
    AWSDynamoDBGetItemInput *getItemInput = [AWSDynamoDBGetItemInput new];
    getItemInput.tableName = [resultClass performSelector:@selector(dynamoDBTableName)];

    NSMutableDictionary *key = [NSMutableDictionary new];
    AWSDynamoDBAttributeValue *hashAttributeValue = [AWSDynamoDBAttributeValue new];
    [hashAttributeValue aws_setAttributeValue:hashKey
                                mapperVersion:AWSDynamoDBObjectMapperVersion2]; //Either version 1 or version 2 should work for Key value.
    [key setObject:hashAttributeValue
            forKey:[resultClass performSelector:@selector(hashKeyAttribute)]];

    if ([resultClass respondsToSelector:@selector(rangeKeyAttribute)]) {
        AWSDynamoDBAttributeValue *rangeKeyAttributeValue = [AWSDynamoDBAttributeValue new];
        [rangeKeyAttributeValue aws_setAttributeValue:rangeKey mapperVersion:AWSDynamoDBObjectMapperVersion2]; //Either version 1 or version 2 should work for Key value.
        [key setObject:rangeKeyAttributeValue
                forKey:[resultClass performSelector:@selector(rangeKeyAttribute)]];
    }
    getItemInput.key = key;

    return [[self.dynamoDB getItem:getItemInput] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSDynamoDBGetItemOutput *getItemOutput = task.result;

        NSError *error = nil;
        NSDictionary *itemsDictionary = nil;
        if ([resultClass isSubclassOfClass:[AWSDynamoDBObjectModel class]]) {
            itemsDictionary = [self removeAttributes:getItemOutput.item mapperVersion:AWSDynamoDBObjectMapperVersion2];
        } else {
            itemsDictionary = [self removeAttributes:getItemOutput.item mapperVersion:AWSDynamoDBObjectMapperVersion1];
        }

        id responseObject = [AWSMTLJSONAdapter modelOfClass:resultClass
                                         fromJSONDictionary:itemsDictionary
                                                      error:&error];
        if (error) {
            return [AWSTask taskWithError:error];
        }
        return responseObject;
    }];
}

- (AWSTask *)query:(Class)resultClass
       expression:(AWSDynamoDBQueryExpression *)expression {
    return [self query:resultClass
            expression:expression
         configuration:self.configuration];
}

- (AWSTask *)query:(Class)resultClass
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
    [hashAttributeValue aws_setAttributeValue:expression.hashKeyValues
                                mapperVersion:AWSDynamoDBObjectMapperVersion2]; //Either version 1 or version 2 should work for Key value.

    AWSDynamoDBCondition *hashCondition = [AWSDynamoDBCondition new];
    hashCondition.attributeValueList = @[hashAttributeValue];
    hashCondition.comparisonOperator = AWSDynamoDBComparisonOperatorEQ;

    NSString *hashKeyAttribute = [resultClass performSelector:@selector(hashKeyAttribute)];
    NSMutableDictionary *keyConditions = [NSMutableDictionary dictionaryWithObject:hashCondition
                                                                            forKey:hashKeyAttribute];
    [keyConditions addEntriesFromDictionary:expression.rangeKeyConditions];
    queryInput.keyConditions = keyConditions;

    return [[self.dynamoDB query:queryInput] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSDynamoDBQueryOutput *queryOutput = task.result;

        NSMutableArray *items = [NSMutableArray new];
        NSError *error = nil;
        for (id item in queryOutput.items) {

            NSDictionary *itemsDictionary = nil;
            if ([resultClass isSubclassOfClass:[AWSDynamoDBObjectModel class]]) {
                itemsDictionary = [self removeAttributes:item mapperVersion:AWSDynamoDBObjectMapperVersion2];
            } else {
                itemsDictionary = [self removeAttributes:item mapperVersion:AWSDynamoDBObjectMapperVersion1];
            }

            id responseObject = [AWSMTLJSONAdapter modelOfClass:resultClass
                                             fromJSONDictionary:itemsDictionary
                                                          error:&error];
            if (error) {
                return [AWSTask taskWithError:error];
            }
            [items addObject:responseObject];
        }

        AWSDynamoDBPaginatedOutput *paginatedOutput = [AWSDynamoDBPaginatedOutput new];
        paginatedOutput.items = items;
        paginatedOutput.lastEvaluatedKey = queryOutput.lastEvaluatedKey;
        return paginatedOutput;
    }];
}

- (AWSTask *)scan:(Class)resultClass
      expression:(AWSDynamoDBScanExpression *)expression {
    return [self scan:resultClass
           expression:expression
        configuration:self.configuration];
}

- (AWSTask *)scan:(Class)resultClass
      expression:(AWSDynamoDBScanExpression *)expression
   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration {
    AWSDynamoDBScanInput *scanInput = [AWSDynamoDBScanInput new];
    scanInput.tableName = [resultClass performSelector:@selector(dynamoDBTableName)];
    scanInput.limit = expression.limit;
    scanInput.exclusiveStartKey = expression.exclusiveStartKey;
    scanInput.scanFilter = expression.scanFilter;

    return [[self.dynamoDB scan:scanInput] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSDynamoDBScanOutput *scanOutput = task.result;

        NSMutableArray *items = [NSMutableArray new];
        NSError *error = nil;
        for (id item in scanOutput.items) {

            NSDictionary *itemsDictionary = nil;
            if ([resultClass isSubclassOfClass:[AWSDynamoDBObjectModel class]]) {
                itemsDictionary = [self removeAttributes:item mapperVersion:AWSDynamoDBObjectMapperVersion2];
            } else {
                itemsDictionary = [self removeAttributes:item mapperVersion:AWSDynamoDBObjectMapperVersion1];
            }

            id responseObject = [AWSMTLJSONAdapter modelOfClass:resultClass
                                          fromJSONDictionary:itemsDictionary
                                                       error:&error];
            if (error) {
                return [AWSTask taskWithError:error];
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

- (NSDictionary *)removeAttributes:(NSDictionary *)item mapperVersion:(AWSDynamoDBObjectMapperVersion)mapperVersion {
    NSMutableDictionary *mutableItem = [NSMutableDictionary new];
    [item enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj respondsToSelector:@selector(aws_getAttributeValueWithVersion:)]) {
            [mutableItem setObject:[obj aws_getAttributeValueWithVersion:mapperVersion]
                            forKey:key];
        }
    }];

    return mutableItem;
}

@end

@implementation AWSDynamoDBObjectModel

@end

@implementation AWSDynamoDBModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return nil;
}

- (NSDictionary *)itemForPutItemInputWithVersion:(AWSDynamoDBObjectMapperVersion) mapperVersion {
    NSMutableDictionary *item = [NSMutableDictionary new];
    NSMutableArray *keyArray = [NSMutableArray arrayWithObject:[[self class] performSelector:@selector(hashKeyAttribute)]];
    if ([self respondsToSelector:@selector(rangeKeyAttribute)]) {
        [keyArray addObject:[[self class] performSelector:@selector(rangeKeyAttribute)]];
    }
    NSDictionary *dictionaryValue = [AWSMTLJSONAdapter JSONDictionaryFromModel:self];

    for (id key in dictionaryValue) {
        if ([keyArray containsObject:key]) {
            // For key attributes
            AWSDynamoDBAttributeValue *keyAttributeValue = [AWSDynamoDBAttributeValue new];
            [keyAttributeValue aws_setAttributeValue:dictionaryValue[key]
                                       mapperVersion:mapperVersion];
            item[key] = keyAttributeValue;
        } else if (dictionaryValue[key]) {
            // For other attributes
            if (dictionaryValue[key] == [NSNull null]) {
                //when doing a putItem, we can safely ignore the null-valvued attributes
            } else {
                AWSDynamoDBAttributeValue *attributeValue = [AWSDynamoDBAttributeValue new];
                [attributeValue aws_setAttributeValue:dictionaryValue[key]
                                        mapperVersion:mapperVersion];
                item[key] = attributeValue;
            }
        }
    }

    return item;
}

- (NSDictionary *)itemForUpdateItemInput:(AWSDynamoDBObjectMapperSaveBehavior) behavior mapperVersion:(AWSDynamoDBObjectMapperVersion)mapperVersion {
    NSMutableDictionary *item = [NSMutableDictionary new];
    NSArray *keyArray = [[self key] allKeys];
    NSDictionary *dictionaryValue = [AWSMTLJSONAdapter JSONDictionaryFromModel:self];

    for (id key in dictionaryValue) {
        if (![keyArray containsObject:key]) {
            // For other attributes

            if (dictionaryValue[key] == [NSNull null]) {
                //If attribute value is null
                if (behavior == AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes || behavior == AWSDynamoDBObjectMapperSaveBehaviorAppendSet) {
                    /*
                     * If UPDATE_SKIP_NULL_ATTRIBUTES or APPEND_SET is
                     * configured, we don't delete null value attributes.
                     */
                } else {
                    /* Delete attributes that are set as null in the object. */
                    AWSDynamoDBAttributeValueUpdate *attributeValueUpdate = [AWSDynamoDBAttributeValueUpdate new];
                    attributeValueUpdate.action = AWSDynamoDBAttributeActionDelete;

                    item[key] = attributeValueUpdate;
                }

            } else {
                //If attribute value is not null
                AWSDynamoDBAttributeValueUpdate *attributeValueUpdate = [AWSDynamoDBAttributeValueUpdate new];
                AWSDynamoDBAttributeValue *attributeValue = [AWSDynamoDBAttributeValue new];
                [attributeValue aws_setAttributeValue:dictionaryValue[key] mapperVersion:mapperVersion];
                attributeValueUpdate.value = attributeValue;
                if (behavior == AWSDynamoDBObjectMapperSaveBehaviorAppendSet &&
                    (attributeValue.BS != nil || attributeValue.NS != nil || attributeValue.SS != nil)) {

                    /* If it's a set attribute and the mapper is configured with APPEND_SET,
                     * we do an "ADD" update instead of the default "PUT".
                     */
                    attributeValueUpdate.action = AWSDynamoDBAttributeActionAdd;
                } else {
                    /* Otherwise, we do the default "PUT" update. */
                    attributeValueUpdate.action = AWSDynamoDBAttributeActionPut;
                }

                item[key] = attributeValueUpdate;
            }
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
    NSDictionary *dictionaryValue = [AWSMTLJSONAdapter JSONDictionaryFromModel:self];

    for (id key in keyArray) {
        // For key attributes
        AWSDynamoDBAttributeValue *keyAttributeValue = [AWSDynamoDBAttributeValue new];
        [keyAttributeValue aws_setAttributeValue:dictionaryValue[key]
                                   mapperVersion:AWSDynamoDBObjectMapperVersion2]; //Either version 1 or version 2 should work for Key value.
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
