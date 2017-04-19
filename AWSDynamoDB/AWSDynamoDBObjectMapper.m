//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSDynamoDBObjectMapper.h"
#import "AWSDynamoDB.h"
#import "AWSBolts.h"
#import "AWSCocoaLumberjack.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSCategory.h"

static NSString *const AWSInfoDynamoDBObjectMapper = @"DynamoDBObjectMapper";

static const NSString *AWSDynamoDBObjectMapperHashKeyAttributePlaceHolder = @":awsddbomhashvalueplaceholder";
NSString *const AWSDynamoDBObjectMapperUserAgent = @"mapper";

@interface NSString (AWSDynamoDBObjectMapperSaveBehavior)

- (AWSDynamoDBObjectMapperSaveBehavior)aws_saveBehaviorValue;

@end

@implementation NSString (AWSDynamoDBObjectMapperSaveBehavior)

- (AWSDynamoDBObjectMapperSaveBehavior)aws_saveBehaviorValue {
    if ([self isEqualToString:@"Update"]) {
        return AWSDynamoDBObjectMapperSaveBehaviorUpdate;
    }
    if ([self isEqualToString:@"UpdateSkipNullAttributes"]) {
        return AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes;
    }
    if ([self isEqualToString:@"AppendSet"]) {
        return AWSDynamoDBObjectMapperSaveBehaviorAppendSet;
    }
    if ([self isEqualToString:@"Clobber"]) {
        return AWSDynamoDBObjectMapperSaveBehaviorClobber;
    }

    // The default value.
    return AWSDynamoDBObjectMapperSaveBehaviorUpdate;
}

@end

@interface NSObject (AWSDynamoDBObjectMapper)

- (NSString *)aws_hashKeyAttributeForClass:(Class)class;

- (NSString *)aws_rangeKeyAttributeForClass:(Class)class;

@end

@implementation NSObject (AWSDynamoDBObjectMapper)

- (NSString *)aws_hashKeyAttributeForClass:(Class)class {
    NSString *hashKeyAttribute = nil;

    NSDictionary *JSONKeyPathsByPropertyKey = nil;
    if ([class respondsToSelector:@selector(JSONKeyPathsByPropertyKey)]) {
        JSONKeyPathsByPropertyKey = [class performSelector:@selector(JSONKeyPathsByPropertyKey)];
    }

    if ([class respondsToSelector:@selector(hashKeyAttribute)]) {
        hashKeyAttribute = [class performSelector:@selector(hashKeyAttribute)];
        if ([JSONKeyPathsByPropertyKey objectForKey:hashKeyAttribute]) {
            hashKeyAttribute = [JSONKeyPathsByPropertyKey objectForKey:hashKeyAttribute];
        }
    }

    return hashKeyAttribute;
}

- (NSString *)aws_rangeKeyAttributeForClass:(Class)class {
    NSString *rangeKeyAttribute = nil;

    NSDictionary *JSONKeyPathsByPropertyKey = nil;
    if ([class respondsToSelector:@selector(JSONKeyPathsByPropertyKey)]) {
        JSONKeyPathsByPropertyKey = [class performSelector:@selector(JSONKeyPathsByPropertyKey)];
    }

    if ([class respondsToSelector:@selector(rangeKeyAttribute)]) {
        rangeKeyAttribute = [class performSelector:@selector(rangeKeyAttribute)];
        if ([JSONKeyPathsByPropertyKey objectForKey:rangeKeyAttribute]) {
            rangeKeyAttribute = [JSONKeyPathsByPropertyKey objectForKey:rangeKeyAttribute];
        }
    }

    return rangeKeyAttribute;
}

@end

@interface AWSDynamoDBObjectModel ()

- (NSDictionary *)itemForPutItemInput;
- (NSDictionary *)itemForUpdateItemInput:(AWSDynamoDBObjectMapperSaveBehavior)behavior;
- (NSDictionary *)key;

@end

@interface AWSDynamoDBPaginatedOutput()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong, nullable) NSDictionary<NSString *, AWSDynamoDBAttributeValue *> *lastEvaluatedKey;

@property (nonatomic, weak) AWSDynamoDBObjectMapper *dynamoDBObjectMapper;
@property (nonatomic, assign) Class resultClass;
@property (nonatomic, strong) AWSDynamoDBScanInput *scanInput;
@property (nonatomic, strong) AWSDynamoDBQueryInput *queryInput;

@end

@interface AWSDynamoDB()

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration;

@end

@interface AWSDynamoDBAttributeValue (AWSDynamoDBObjectMapper)

- (void)aws_setAttributeValue:(id)attributeValue;
- (id)aws_getAttributeValue;

@end

@implementation AWSDynamoDBAttributeValue (AWSDynamoDBObjectMapper)

- (void)aws_setAttributeValue:(id)attributeValue {
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
            [listItemAttributeValue aws_setAttributeValue:listItem];
            [list addObject:listItemAttributeValue];
        }
        self.L = list;
    } else if ([attributeValue isKindOfClass:[NSDictionary class]] && [(NSDictionary *)attributeValue count] > 0) {
        NSMutableDictionary *map = [NSMutableDictionary dictionaryWithCapacity:[(NSDictionary *)attributeValue count]];
        for (NSString *mapItemKey in attributeValue) {
            id mapItemValue = attributeValue[mapItemKey];
            AWSDynamoDBAttributeValue *mapItemAttributeValue = [AWSDynamoDBAttributeValue new];
            [mapItemAttributeValue aws_setAttributeValue:mapItemValue];
            [map setObject:mapItemAttributeValue forKey:mapItemKey];
        }
        self.M = map;
    }
}

- (id)aws_getAttributeValue {
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
            [list addObject: [listItemAttributeValue aws_getAttributeValue]];
        }
        return list;

    } else if (self.M) {
        NSMutableDictionary *map = [NSMutableDictionary dictionaryWithCapacity:self.M.count];
        for (NSString *entryAttributeKey in self.M) {
            id entryAttributeValue = self.M[entryAttributeKey];
            [map setObject:[entryAttributeValue aws_getAttributeValue]
                    forKey:entryAttributeKey];
        }
        return map;
    }

    return nil;
}

@end

@interface AWSDynamoDBObjectMapper()

@property (nonatomic, strong) AWSDynamoDB *dynamoDB;
@property (nonatomic, strong) AWSDynamoDBObjectMapperConfiguration *objectMapperConfiguration;

- (AWSTask<AWSDynamoDBPaginatedOutput *> *)query:(Class)resultClass
                                      queryInput:(AWSDynamoDBQueryInput *)queryInput;
- (AWSTask<AWSDynamoDBPaginatedOutput *> *)scan:(Class)resultClass
                                      scanInput:(AWSDynamoDBScanInput *)scanInput;

@end

@implementation AWSDynamoDBObjectMapper

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultDynamoDBObjectMapper {
    static AWSDynamoDBObjectMapper *_dynamoDBObjectMapper  = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoDynamoDBObjectMapper];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }

        _dynamoDBObjectMapper = [[AWSDynamoDBObjectMapper alloc] initWithConfiguration:serviceConfiguration
                                                             objectMapperConfiguration:[AWSDynamoDBObjectMapperConfiguration new]];
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
    AWSDynamoDBObjectMapper *objectMapper = [[AWSDynamoDBObjectMapper alloc] initWithConfiguration:configuration
                                                                         objectMapperConfiguration:objectMapperConfiguration];
    [_serviceClients setObject:objectMapper
                        forKey:key];
}

+ (instancetype)DynamoDBObjectMapperForKey:(NSString *)key {
    @synchronized(self) {
        AWSDynamoDBObjectMapper *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoDynamoDBObjectMapper
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            AWSDynamoDBObjectMapperConfiguration *objectMapperConfiguration = [AWSDynamoDBObjectMapperConfiguration new];
            NSString *saveBahaviorString = [serviceInfo.infoDictionary objectForKey:@"SaveBehavior"];
            NSNumber *consistentRead = [serviceInfo.infoDictionary objectForKey:@"ConsistentRead"];
            if (saveBahaviorString) {
                objectMapperConfiguration.saveBehavior = [saveBahaviorString aws_saveBehaviorValue];
            }
            objectMapperConfiguration.consistentRead = consistentRead;

            [AWSDynamoDBObjectMapper registerDynamoDBObjectMapperWithConfiguration:serviceConfiguration
                                                         objectMapperConfiguration:objectMapperConfiguration
                                                                            forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
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
        AWSServiceConfiguration *_configuration = [configuration copy];
        [_configuration addUserAgentProductToken:AWSDynamoDBObjectMapperUserAgent];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _dynamoDB = [[AWSDynamoDB alloc] initWithConfiguration:_configuration];
#pragma clang diagnostic pop
        _objectMapperConfiguration = [objectMapperConfiguration copy];
    }

    return self;
}

- (AWSTask *)save:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model {
    return [self save:model
        configuration:self.objectMapperConfiguration];
}

- (void)save:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model
completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler {
    [self save:model configuration:self.objectMapperConfiguration completionHandler:completionHandler];
}

- (AWSTask *)save:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model
    configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration {
    switch (configuration.saveBehavior) {
        case AWSDynamoDBObjectMapperSaveBehaviorClobber: {

            AWSDynamoDBPutItemInput *putItemInput = [AWSDynamoDBPutItemInput new];
            putItemInput.tableName = [[model class] performSelector:@selector(dynamoDBTableName)];
            putItemInput.item = [model itemForPutItemInput];

            return [self.dynamoDB putItem:putItemInput];
            break;
        }
        case AWSDynamoDBObjectMapperSaveBehaviorAppendSet:
        case AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes:
        case AWSDynamoDBObjectMapperSaveBehaviorUpdate: {

            AWSDynamoDBUpdateItemInput *updateItemInput = [AWSDynamoDBUpdateItemInput new];
            updateItemInput.tableName = [[model class] performSelector:@selector(dynamoDBTableName)];
            updateItemInput.attributeUpdates = [model itemForUpdateItemInput:configuration.saveBehavior];
            updateItemInput.key = [model key];

            return [self.dynamoDB updateItem:updateItemInput];
            break;
        }

        case AWSDynamoDBObjectMapperSaveBehaviorUnknown:
        default:
            break;
    }
    return nil;
}

- (void)save:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model
configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration
completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler {
    [[self save:model
  configuration:configuration] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }
        return nil;
    }];
}

- (AWSTask *)remove:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model {
    return [self remove:model
          configuration:self.objectMapperConfiguration];
}

- (void)remove:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model
completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler {
    [self remove:model configuration:self.objectMapperConfiguration completionHandler:completionHandler];
}

- (AWSTask *)remove:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model
      configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration {
    AWSDynamoDBDeleteItemInput *deleteItemInput = [AWSDynamoDBDeleteItemInput new];
    deleteItemInput.tableName = [[model class] performSelector:@selector(dynamoDBTableName)];
    deleteItemInput.key = [model key];

    return [self.dynamoDB deleteItem:deleteItemInput];
}

- (void)remove:(AWSDynamoDBObjectModel<AWSDynamoDBModeling> *)model
 configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration
completionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler {
    [[self remove:model
    configuration:configuration] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }
        return nil;
    }];
}

- (AWSTask *)load:(Class)resultClass
          hashKey:(id)hashKey
         rangeKey:(id)rangeKey {
    return [self load:resultClass
              hashKey:hashKey
             rangeKey:rangeKey
        configuration:self.objectMapperConfiguration];
}

- (void)load:(Class)resultClass
     hashKey:(id)hashKey
    rangeKey:(nullable id)rangeKey
completionHandler:(void (^ _Nullable)(AWSDynamoDBObjectModel<AWSDynamoDBModeling> * _Nullable response, NSError * _Nullable error))completionHandler {
    [self load:resultClass
       hashKey:hashKey
      rangeKey:rangeKey
 configuration:self.objectMapperConfiguration
completionHandler:completionHandler];
}

- (AWSTask *)load:(Class)resultClass
          hashKey:(id)hashKey
         rangeKey:(id)rangeKey
    configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration {
    AWSDynamoDBGetItemInput *getItemInput = [AWSDynamoDBGetItemInput new];
    getItemInput.tableName = [resultClass performSelector:@selector(dynamoDBTableName)];

    NSMutableDictionary *key = [NSMutableDictionary new];

    NSString *hashKeyAttribute = [self aws_hashKeyAttributeForClass:resultClass];
    AWSDynamoDBAttributeValue *hashAttributeValue = [AWSDynamoDBAttributeValue new];
    [hashAttributeValue aws_setAttributeValue:hashKey];
    [key setObject:hashAttributeValue
            forKey:hashKeyAttribute];

    NSString *rangeKeyAttribute = [self aws_rangeKeyAttributeForClass:resultClass];
    if (rangeKeyAttribute) {
        AWSDynamoDBAttributeValue *rangeKeyAttributeValue = [AWSDynamoDBAttributeValue new];
        [rangeKeyAttributeValue aws_setAttributeValue:rangeKey];
        [key setObject:rangeKeyAttributeValue
                forKey:rangeKeyAttribute];
    }
    getItemInput.key = key;

    return [[self.dynamoDB getItem:getItemInput] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSDynamoDBGetItemOutput *getItemOutput = task.result;

        NSError *error = nil;
        NSDictionary *itemsDictionary = [self removeAttributes:getItemOutput.item];

        id responseObject = nil;
        if ([itemsDictionary count] > 0) {
            responseObject = [AWSMTLJSONAdapter modelOfClass:resultClass
                                          fromJSONDictionary:itemsDictionary
                                                       error:&error];
            if (error) {
                return [AWSTask taskWithError:error];
            }
        }
        return responseObject;
    }];
}

- (void)load:(Class)resultClass
     hashKey:(id)hashKey
    rangeKey:(nullable id)rangeKey
configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration
completionHandler:(void (^ _Nullable)(AWSDynamoDBObjectModel<AWSDynamoDBModeling> * _Nullable response, NSError * _Nullable error))completionHandler {
    [[self load:resultClass
        hashKey:hashKey
       rangeKey:rangeKey
  configuration:configuration] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        id response = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(response, error);
        }
        return nil;
    }];
}

- (AWSTask<AWSDynamoDBPaginatedOutput *> *)query:(Class)resultClass
                                      expression:(AWSDynamoDBQueryExpression *)expression {
    return [self query:resultClass
            expression:expression
         configuration:self.objectMapperConfiguration];
}

- (void)query:(Class)resultClass
   expression:(AWSDynamoDBQueryExpression *)expression
completionHandler:(void (^ _Nullable)(AWSDynamoDBPaginatedOutput * _Nullable response, NSError * _Nullable error))completionHandler {
    [self query:resultClass
     expression:expression
  configuration:self.objectMapperConfiguration
completionHandler:completionHandler];
}

- (AWSTask<AWSDynamoDBPaginatedOutput *> *)query:(Class)resultClass
                                      expression:(AWSDynamoDBQueryExpression *)expression
                                   configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration {
    AWSDynamoDBQueryInput *queryInput = [AWSDynamoDBQueryInput new];
    queryInput.tableName = [resultClass performSelector:@selector(dynamoDBTableName)];
    queryInput.consistentRead = configuration.consistentRead;
    queryInput.limit = expression.limit;
    queryInput.scanIndexForward = expression.scanIndexForward;
    queryInput.exclusiveStartKey = expression.exclusiveStartKey;
    queryInput.indexName = expression.indexName;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    // Special handling for deprecated properties
    if (expression.hashKeyValues) {
        NSString *hashKeyAttribute = expression.hashKeyAttribute;
        if (hashKeyAttribute == nil) {
            //if it is nil, use table's hashKeyAttribute
            hashKeyAttribute = [self aws_hashKeyAttributeForClass:resultClass];
        }

        AWSDynamoDBAttributeValue *hashAttributeValue = [AWSDynamoDBAttributeValue new];
        [hashAttributeValue aws_setAttributeValue:expression.hashKeyValues];

        //Use keyConditionExpression for query.
        NSString *hashConditionExpressionString = [NSString stringWithFormat:@"%@ = %@", hashKeyAttribute, AWSDynamoDBObjectMapperHashKeyAttributePlaceHolder];
        queryInput.keyConditionExpression = hashConditionExpressionString;
        queryInput.expressionAttributeValues = @{AWSDynamoDBObjectMapperHashKeyAttributePlaceHolder:hashAttributeValue};

        if (expression.rangeKeyConditionExpression) {
            NSString *rangeConditionExpressionString = [NSString stringWithFormat:@" AND %@", expression.rangeKeyConditionExpression];
            queryInput.keyConditionExpression = [queryInput.keyConditionExpression stringByAppendingString:rangeConditionExpressionString];
        }
    } else {
#pragma clang diagnostic pop
        queryInput.keyConditionExpression = expression.keyConditionExpression;
    }

    //process expressionAttirubteValues
    // {@":hashval":@"somevalue"} -> @{":hashval":@{"S","somevalue"}};
    if (expression.expressionAttributeValues) {
        NSMutableDictionary *mutableDic = [expression.expressionAttributeValues mutableCopy];
        for (NSString *key in [mutableDic allKeys]) {
            AWSDynamoDBAttributeValue *attributeValue = [AWSDynamoDBAttributeValue new];
            [attributeValue aws_setAttributeValue:mutableDic[key]];

            [mutableDic setObject:attributeValue forKey:key];
        }
        [mutableDic addEntriesFromDictionary:queryInput.expressionAttributeValues];
        queryInput.expressionAttributeValues = mutableDic;
    }

    //assign other properties
    queryInput.expressionAttributeNames = expression.expressionAttributeNames;
    queryInput.filterExpression = expression.filterExpression;
    queryInput.projectionExpression = expression.projectionExpression;

    return [self query:resultClass
            queryInput:queryInput];
}

// Internal class
- (AWSTask<AWSDynamoDBPaginatedOutput *> *)query:(Class)resultClass
                                      queryInput:(AWSDynamoDBQueryInput *)queryInput {
    return [[self.dynamoDB query:queryInput] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSDynamoDBQueryOutput *queryOutput = task.result;

        NSMutableArray *items = [NSMutableArray new];
        NSError *error = nil;
        for (id item in queryOutput.items) {

            NSDictionary *itemsDictionary = [self removeAttributes:item];

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
        paginatedOutput.dynamoDBObjectMapper = self;
        paginatedOutput.resultClass = resultClass;
        paginatedOutput.queryInput = queryInput;

        return paginatedOutput;
    }];
}

- (void)query:(Class)resultClass
   expression:(AWSDynamoDBQueryExpression *)expression
configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration
completionHandler:(void (^ _Nullable)(AWSDynamoDBPaginatedOutput * _Nullable response, NSError * _Nullable error))completionHandler {
    [[self query:resultClass
      expression:expression
   configuration:configuration] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBPaginatedOutput *> * _Nonnull task) {
        AWSDynamoDBPaginatedOutput *response = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(response, error);
        }
        return nil;
    }];
}

- (AWSTask<AWSDynamoDBPaginatedOutput *> *)scan:(Class)resultClass
                                     expression:(AWSDynamoDBScanExpression *)expression {
    return [self scan:resultClass
           expression:expression
        configuration:self.objectMapperConfiguration];
}

- (void)scan:(Class)resultClass
  expression:(AWSDynamoDBScanExpression *)expression
completionHandler:(void (^ _Nullable)(AWSDynamoDBPaginatedOutput * _Nullable response, NSError * _Nullable error))completionHandler {
    [self scan:resultClass
    expression:expression
 configuration:self.objectMapperConfiguration
completionHandler:completionHandler];
}

- (AWSTask<AWSDynamoDBPaginatedOutput *> *)scan:(Class)resultClass
                                     expression:(AWSDynamoDBScanExpression *)expression
                                  configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration {
    AWSDynamoDBScanInput *scanInput = [AWSDynamoDBScanInput new];
    scanInput.tableName = [resultClass performSelector:@selector(dynamoDBTableName)];
    scanInput.limit = expression.limit;
    scanInput.exclusiveStartKey = expression.exclusiveStartKey;
    scanInput.indexName = expression.indexName;

    //process expressionAttirubteValues
    // {@":hashval":@"somevalue"} -> @{":hashval":@{"S","somevalue"}};
    if (expression.expressionAttributeValues) {
        NSMutableDictionary *mutableDic = [expression.expressionAttributeValues mutableCopy];
        for (NSString *key in [mutableDic allKeys]) {
            AWSDynamoDBAttributeValue *attributeValue = [AWSDynamoDBAttributeValue new];
            [attributeValue aws_setAttributeValue:mutableDic[key]];

            [mutableDic setObject:attributeValue forKey:key];
        }
        [mutableDic addEntriesFromDictionary:scanInput.expressionAttributeValues];
        scanInput.expressionAttributeValues = mutableDic;
    }

    //assign other properties
    scanInput.filterExpression = expression.filterExpression;
    scanInput.projectionExpression = expression.projectionExpression;
    scanInput.expressionAttributeNames = expression.expressionAttributeNames;

    return [self scan:resultClass
            scanInput:scanInput];
}

// Internal class
- (AWSTask<AWSDynamoDBPaginatedOutput *> *)scan:(Class)resultClass
                                      scanInput:(AWSDynamoDBScanInput *)scanInput {
    return [[self.dynamoDB scan:scanInput] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSDynamoDBScanOutput *scanOutput = task.result;

        NSMutableArray *items = [NSMutableArray new];
        NSError *error = nil;
        for (id item in scanOutput.items) {

            NSDictionary *itemsDictionary = [self removeAttributes:item];
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
        paginatedOutput.dynamoDBObjectMapper = self;
        paginatedOutput.resultClass = resultClass;
        paginatedOutput.scanInput = scanInput;

        return paginatedOutput;
    }];
}

- (void)scan:(Class)resultClass
  expression:(AWSDynamoDBScanExpression *)expression
configuration:(AWSDynamoDBObjectMapperConfiguration *)configuration
completionHandler:(void (^ _Nullable)(AWSDynamoDBPaginatedOutput * _Nullable response, NSError * _Nullable error))completionHandler {
    [[self scan:resultClass
     expression:expression
  configuration:configuration] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBPaginatedOutput *> * _Nonnull task) {
        AWSDynamoDBPaginatedOutput *response = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(response, error);
        }
        return nil;
    }];
}

#pragma mark - Utility

- (NSDictionary *)removeAttributes:(NSDictionary *)item {
    NSMutableDictionary *mutableItem = [NSMutableDictionary new];
    [item enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj respondsToSelector:@selector(aws_getAttributeValue)]) {
            id value = [obj aws_getAttributeValue];
            if (value) {
                [mutableItem setObject:value
                                forKey:key];
            }
        }
    }];

    return mutableItem;
}

@end

@implementation AWSDynamoDBObjectModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return nil;
}

- (NSDictionary *)removeIgnoredAttributesFromJSONDictionary:(NSDictionary *)JSONDictionary {
    if ([[self class] respondsToSelector:@selector(ignoreAttributes)] == NO) {
        return JSONDictionary;
    }

    NSArray *ignoredAttrArray = [[self class] performSelector:@selector(ignoreAttributes)];
    NSMutableDictionary *resultDictionary = [JSONDictionary mutableCopy];
    [resultDictionary removeObjectsForKeys:ignoredAttrArray];
    return resultDictionary;
}

- (NSDictionary *)itemForPutItemInput {
    NSMutableDictionary *item = [NSMutableDictionary new];
    NSMutableArray *keyArray = [NSMutableArray new];

    NSString *hashKeyAttribute = [self aws_hashKeyAttributeForClass:[self class]];
    [keyArray addObject:hashKeyAttribute];

    NSString *rangeKeyAttribute = [self aws_rangeKeyAttributeForClass:[self class]];
    if (rangeKeyAttribute) {
        [keyArray addObject:rangeKeyAttribute];
    }

    NSDictionary *dictionaryValue = [AWSMTLJSONAdapter JSONDictionaryFromModel:self];
    dictionaryValue = [self removeIgnoredAttributesFromJSONDictionary:dictionaryValue];

    for (id key in dictionaryValue) {
        if ([keyArray containsObject:key]) {
            // For key attributes
            AWSDynamoDBAttributeValue *keyAttributeValue = [AWSDynamoDBAttributeValue new];
            [keyAttributeValue aws_setAttributeValue:dictionaryValue[key]];
            item[key] = keyAttributeValue;
        } else if (dictionaryValue[key]) {
            // For other attributes
            if (dictionaryValue[key] == [NSNull null]) {
                //when doing a putItem, we can safely ignore the null-valvued attributes
            } else {
                AWSDynamoDBAttributeValue *attributeValue = [AWSDynamoDBAttributeValue new];
                [attributeValue aws_setAttributeValue:dictionaryValue[key]];
                item[key] = attributeValue;
            }
        }
    }

    return item;
}

- (NSDictionary *)itemForUpdateItemInput:(AWSDynamoDBObjectMapperSaveBehavior)behavior {
    // TODO: update this method to use UpdateExpression instead of AWSDynamoDBAttributeValueUpdate.
    NSMutableDictionary *item = [NSMutableDictionary new];
    NSArray *keyArray = [[self key] allKeys];
    NSDictionary *dictionaryValue = [AWSMTLJSONAdapter JSONDictionaryFromModel:self];
    dictionaryValue = [self removeIgnoredAttributesFromJSONDictionary:dictionaryValue];

    for (id key in dictionaryValue) {
        if (![keyArray containsObject:key]) {
            // For other attributes

            if (dictionaryValue[key] == [NSNull null]) {
                //If attribute value is null
                if (behavior == AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes
                    || behavior == AWSDynamoDBObjectMapperSaveBehaviorAppendSet) {
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
                [attributeValue aws_setAttributeValue:dictionaryValue[key]];
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
    NSMutableArray *keyArray = [NSMutableArray new];

    NSString *hashKeyAttribute = [self aws_hashKeyAttributeForClass:[self class]];
    [keyArray addObject:hashKeyAttribute];

    NSString *rangeKeyAttribute = [self aws_rangeKeyAttributeForClass:[self class]];
    if (rangeKeyAttribute) {
        [keyArray addObject:rangeKeyAttribute];
    }

    NSDictionary *dictionaryValue = [AWSMTLJSONAdapter JSONDictionaryFromModel:self];
    
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

- (AWSTask *)loadNextPage {
    if (self.lastEvaluatedKey) {
        return [self loadPage];
    }
    
    return [AWSTask taskWithResult:nil];
}

- (void)loadNextPageWithCompletionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler {
    [[self loadNextPage] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }
        return nil;
    }];
}

- (AWSTask *)reload {
    self.lastEvaluatedKey = nil;
    return [self loadPage];
}

- (void)reloadWithCompletionHandler:(void (^ _Nullable)(NSError * _Nullable error))completionHandler {
    [[self reload] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }
        return nil;
    }];
}

// Internal method
- (AWSTask *)loadPage {
    if (self.queryInput) {
        self.queryInput.exclusiveStartKey = self.lastEvaluatedKey;
        return [[self.dynamoDBObjectMapper query:self.resultClass
                                      queryInput:self.queryInput] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSDynamoDBPaginatedOutput *> * _Nonnull task) {
            AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
            self.lastEvaluatedKey = paginatedOutput.lastEvaluatedKey;
            self.items = paginatedOutput.items;

            return nil;
        }];
    }
    if (self.scanInput) {
        self.scanInput.exclusiveStartKey = self.lastEvaluatedKey;
        return [[self.dynamoDBObjectMapper scan:self.resultClass
                                      scanInput:self.scanInput] continueWithSuccessBlock:^id _Nullable(AWSTask<AWSDynamoDBPaginatedOutput *> * _Nonnull task) {
            AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
            self.lastEvaluatedKey = paginatedOutput.lastEvaluatedKey;
            self.items = paginatedOutput.items;

            return nil;
        }];
    }

    return [AWSTask taskWithResult:nil];
}

@end
