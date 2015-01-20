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

#import <XCTest/XCTest.h>
#import "DynamoDB.h"
#import "AWSTestUtility.h"

NSString *const AWSDynamoDBObjectMapperTestTable = @"DynamoDBOMTest";

static NSString *tableName = nil;
static NSString *tableName2 = nil;
static NSString *tableNameKeyOnly = nil;

@interface TestObject : AWSDynamoDBModel <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *hashKey;
@property (nonatomic, strong) NSString *rangeKey;
@property (nonatomic, strong) NSString *stringAttribute;
@property (nonatomic, strong) NSNumber *numberAttribute;

@end

@implementation TestObject

+ (NSString *)dynamoDBTableName {
    return tableName;
}

+ (NSString *)hashKeyAttribute {
    return @"hashKey";
}

+ (NSString *)rangeKeyAttribute {
    return @"rangeKey";
}

@end

@interface TestObjectFull : TestObject <AWSDynamoDBModeling>

@property (nonatomic, strong) NSArray *stringSetAttribute;
@property (nonatomic, strong) NSArray *numberSetAttribute;

@end

@implementation TestObjectFull

@end

@interface TestObjectKeyOnly : AWSDynamoDBModel <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *hashKey;
@property (nonatomic, strong) NSString *rangeKey;

@end

@implementation TestObjectKeyOnly

+ (NSString *)dynamoDBTableName {
    return tableNameKeyOnly;
}

+ (NSString *)hashKeyAttribute {
    return @"hashKey";
}

+ (NSString *)rangeKeyAttribute {
    return @"rangeKey";
}

@end

@interface TestObject2 : AWSDynamoDBModel <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *UserId;
@property (nonatomic, strong) NSString *GameTitle;
@property (nonatomic, strong) NSNumber *TopScore;
@property (nonatomic, strong) NSNumber *Wins;
@property (nonatomic, strong) NSNumber *Losses;

@end

@implementation TestObject2

+ (NSString *)dynamoDBTableName {
    return tableName2;
}

+ (NSString *)hashKeyAttribute {
    return @"UserId";
}

+ (NSString *)rangeKeyAttribute {
    return @"GameTitle";
}

@end

@interface TestObjectGameTitleAndTopScore : TestObject2 <AWSDynamoDBModeling>

@end

@implementation TestObjectGameTitleAndTopScore

+ (NSString *)dynamoDBTableName {
    return tableName2;
}

+ (NSString *)hashKeyAttribute {
    return @"GameTitle";
}

+ (NSString *)rangeKeyAttribute {
    return @"TopScore";
}

@end

@interface TestObjectUserIdAndWins : TestObject2 <AWSDynamoDBModeling>

@end

@implementation TestObjectUserIdAndWins

+ (NSString *)dynamoDBTableName {
    return tableName2;
}

+ (NSString *)hashKeyAttribute {
    return @"UserId";
}

+ (NSString *)rangeKeyAttribute {
    return @"Wins";
}

@end

@interface TestObjectFail : AWSDynamoDBModel <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *hashKey;
@property (nonatomic, strong) NSString *rangeKey;
@property (nonatomic, strong) NSString *stringAttribute;
@property (nonatomic, strong) NSNumber *numberAttribute;

@end

@implementation TestObjectFail

+ (NSString *)dynamoDBTableName {
    return @"random-table-that-does-not-exist-anvaiurghakerjnv";
}

+ (NSString *)hashKeyAttribute {
    return @"hashKey";
}

+ (NSString *)rangeKeyAttribute {
    return @"rangeKey";
}
@end

@interface AWSDynamoDBObjectMapperTests : XCTestCase

@end

@implementation AWSDynamoDBObjectMapperTests



+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];

    NSTimeInterval timeIntervalSinceReferenceDate = [NSDate timeIntervalSinceReferenceDate];
    tableName = [NSString stringWithFormat:@"%@-%f", AWSDynamoDBObjectMapperTestTable, timeIntervalSinceReferenceDate];
    tableName2 = [NSString stringWithFormat:@"%@-index-%f", AWSDynamoDBObjectMapperTestTable, [NSDate timeIntervalSinceReferenceDate]];
    tableNameKeyOnly = [NSString stringWithFormat:@"%@-keyonly-%f", AWSDynamoDBObjectMapperTestTable, timeIntervalSinceReferenceDate];
    
    [self createTable:tableName];
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

+ (void)tearDown {
    [super tearDown];

    [self deleteTable:tableName];
}

#pragma mark - Utilities

+ (BFTask *)waitForTableToBeActive:(NSString *)tableName {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    BFTask *task = [BFTask taskWithResult:nil];
    for(int32_t i = 0; i < 16; i++) {
        task = [task continueWithSuccessBlock:^id(BFTask *task) {
            if (task.result) {
                AWSDynamoDBDescribeTableOutput *describeTableOutput = task.result;
                AWSDynamoDBTableStatus tableStatus = describeTableOutput.table.tableStatus;
                if (tableStatus == AWSDynamoDBTableStatusActive) {
                    return task;
                }
            }

            sleep(15);

            AWSDynamoDBDescribeTableInput *describeTableInput = [AWSDynamoDBDescribeTableInput new];
            describeTableInput.tableName = tableName;
            return [dynamoDB describeTable:describeTableInput];
        }];
    }

    return task;
}

+ (BFTask *)waitForTableToBeDeleted:(NSString *)tableName {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    BFTask *task = [BFTask taskWithResult:nil];
    for(int32_t i = 0; i < 16; i ++) {
        task = [task continueWithSuccessBlock:^id(BFTask *task) {
            sleep(15);

            AWSDynamoDBDescribeTableInput *describeTableInput = [AWSDynamoDBDescribeTableInput new];
            describeTableInput.tableName = tableName;
            return [dynamoDB describeTable:describeTableInput];
        }];
    }

    return task;
}

+ (BOOL)createTable:(NSString *)tableName {
    __block BOOL succeeded = NO;
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSDynamoDBDescribeTableInput *describeTableInput = [AWSDynamoDBDescribeTableInput new];
    describeTableInput.tableName = tableName;

    [[[[[dynamoDB describeTable:describeTableInput
         ] continueWithBlock:^id(BFTask *task) {
        if ([task.error.domain isEqualToString:AWSDynamoDBErrorDomain]
            && task.error.code == AWSDynamoDBErrorResourceNotFound) {
            AWSDynamoDBAttributeDefinition *hashKeyAttributeDefinition = [AWSDynamoDBAttributeDefinition new];
            hashKeyAttributeDefinition.attributeName = @"hashKey";
            hashKeyAttributeDefinition.attributeType = AWSDynamoDBScalarAttributeTypeS;

            AWSDynamoDBKeySchemaElement *hashKeySchemaElement = [AWSDynamoDBKeySchemaElement new];
            hashKeySchemaElement.attributeName = @"hashKey";
            hashKeySchemaElement.keyType = AWSDynamoDBKeyTypeHash;

            AWSDynamoDBAttributeDefinition *rangeKeyAttributeDefinition = [AWSDynamoDBAttributeDefinition new];
            rangeKeyAttributeDefinition.attributeName = @"rangeKey";
            rangeKeyAttributeDefinition.attributeType = AWSDynamoDBScalarAttributeTypeS;

            AWSDynamoDBKeySchemaElement *rangeKeySchemaElement = [AWSDynamoDBKeySchemaElement new];
            rangeKeySchemaElement.attributeName = @"rangeKey";
            rangeKeySchemaElement.keyType = AWSDynamoDBKeyTypeRange;

            AWSDynamoDBProvisionedThroughput *provisionedThroughput = [AWSDynamoDBProvisionedThroughput new];
            provisionedThroughput.readCapacityUnits = @5;
            provisionedThroughput.writeCapacityUnits = @5;

            AWSDynamoDBCreateTableInput *createTableInput = [AWSDynamoDBCreateTableInput new];
            createTableInput.tableName = tableName;
            createTableInput.attributeDefinitions = @[hashKeyAttributeDefinition, rangeKeyAttributeDefinition];
            createTableInput.keySchema = @[hashKeySchemaElement, rangeKeySchemaElement];
            createTableInput.provisionedThroughput = provisionedThroughput;

            return [dynamoDB createTable:createTableInput];
        }

        return nil;
    }] continueWithSuccessBlock:^id(BFTask *task) {
        return [self waitForTableToBeActive:tableName];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            succeeded = NO;
        } else {
            succeeded = YES;
        }

        return nil;
    }] waitUntilFinished];

    return succeeded;
}

+ (BOOL)deleteTable:(NSString *)tableName {
    __block BOOL succeeded = NO;
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSDynamoDBDeleteTableInput *deleteTableInput = [AWSDynamoDBDeleteTableInput new];
    deleteTableInput.tableName = tableName;

    [[[[dynamoDB deleteTable:deleteTableInput
        ] continueWithSuccessBlock:^id(BFTask *task) {
        return [self waitForTableToBeDeleted:tableName];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error
            && (![task.error.domain isEqualToString:AWSDynamoDBErrorDomain]
                || task.error.code != AWSDynamoDBErrorResourceNotFound)) {
                succeeded = NO;
            } else {
                succeeded = YES;
            }

        return nil;
    }] waitUntilFinished];

    return succeeded;
}

#pragma mark - Tests

- (void)testIndexQuery {
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    //Create a table with both local and global secondary indexes
    
    //Add hashKey
    AWSDynamoDBAttributeDefinition *hashKeyAttributeDefinition = [AWSDynamoDBAttributeDefinition new];
    hashKeyAttributeDefinition.attributeName = @"UserId";
    hashKeyAttributeDefinition.attributeType = AWSDynamoDBScalarAttributeTypeS;
    
    AWSDynamoDBKeySchemaElement *hashKeySchemaElement = [AWSDynamoDBKeySchemaElement new];
    hashKeySchemaElement.attributeName = @"UserId";
    hashKeySchemaElement.keyType = AWSDynamoDBKeyTypeHash;
    
    //Add RangeKey
    AWSDynamoDBAttributeDefinition *rangeKeyAttributeDefinition = [AWSDynamoDBAttributeDefinition new];
    rangeKeyAttributeDefinition.attributeName = @"GameTitle";
    rangeKeyAttributeDefinition.attributeType = AWSDynamoDBScalarAttributeTypeS;
    
    AWSDynamoDBKeySchemaElement *rangeKeySchemaElement = [AWSDynamoDBKeySchemaElement new];
    rangeKeySchemaElement.attributeName = @"GameTitle";
    rangeKeySchemaElement.keyType = AWSDynamoDBKeyTypeRange;
    
    //Add non-key attributes
    AWSDynamoDBAttributeDefinition *topScoreAttrDef = [AWSDynamoDBAttributeDefinition new];
    topScoreAttrDef.attributeName = @"TopScore";
    topScoreAttrDef.attributeType = AWSDynamoDBScalarAttributeTypeN;
    
    AWSDynamoDBAttributeDefinition *winsAttrDef = [AWSDynamoDBAttributeDefinition new];
    winsAttrDef.attributeName = @"Wins";
    winsAttrDef.attributeType = AWSDynamoDBScalarAttributeTypeN;
    
    AWSDynamoDBProvisionedThroughput *provisionedThroughput = [AWSDynamoDBProvisionedThroughput new];
    provisionedThroughput.readCapacityUnits = @5;
    provisionedThroughput.writeCapacityUnits = @5;
    
    
    //Create Global Secondary Index
    AWSDynamoDBGlobalSecondaryIndex *gsi = [AWSDynamoDBGlobalSecondaryIndex new];
    
    AWSDynamoDBKeySchemaElement *gsiHashKeySchema = [AWSDynamoDBKeySchemaElement new];
    gsiHashKeySchema.attributeName = @"GameTitle";
    gsiHashKeySchema.keyType = AWSDynamoDBKeyTypeHash;
    
    AWSDynamoDBKeySchemaElement *gsiRangeKeySchema = [AWSDynamoDBKeySchemaElement new];
    gsiRangeKeySchema.attributeName = @"TopScore";
    gsiRangeKeySchema.keyType = AWSDynamoDBKeyTypeRange;
    
    AWSDynamoDBProjection *gsiProjection = [AWSDynamoDBProjection new];
    gsiProjection.projectionType = AWSDynamoDBProjectionTypeAll;
    
    gsi.keySchema = @[gsiHashKeySchema,gsiRangeKeySchema];
    gsi.indexName = @"GameTitleIndex";
    gsi.projection = gsiProjection;
    gsi.provisionedThroughput = provisionedThroughput;
    
    //Create Local Secondary Index
    AWSDynamoDBLocalSecondaryIndex *lsi = [AWSDynamoDBLocalSecondaryIndex new];
    
    AWSDynamoDBKeySchemaElement *lsiRangeKeySchema = [AWSDynamoDBKeySchemaElement new];
    lsiRangeKeySchema.attributeName = @"Wins";
    lsiRangeKeySchema.keyType = AWSDynamoDBKeyTypeRange;
    
    AWSDynamoDBProjection *lsiProjection = [AWSDynamoDBProjection new];
    lsiProjection.projectionType = AWSDynamoDBProjectionTypeAll;
    
    lsi.keySchema = @[hashKeySchemaElement,lsiRangeKeySchema];
    lsi.indexName = @"WinsLocalIndex";
    lsi.projection = lsiProjection;
    
    
    //Create Table Input
    AWSDynamoDBCreateTableInput *createTableInput = [AWSDynamoDBCreateTableInput new];
    createTableInput.tableName = tableName2;
    createTableInput.attributeDefinitions = @[hashKeyAttributeDefinition,
                                              rangeKeyAttributeDefinition,
                                              topScoreAttrDef,
                                              winsAttrDef,
                                              ];
    createTableInput.keySchema = @[hashKeySchemaElement, rangeKeySchemaElement];
    createTableInput.provisionedThroughput = provisionedThroughput;
    createTableInput.globalSecondaryIndexes = @[gsi];
    createTableInput.localSecondaryIndexes = @[lsi];
    
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];
    [[[[dynamoDB createTable:createTableInput] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error to create table: %@",task.error);
        }
        return [AWSDynamoDBObjectMapperTests waitForTableToBeActive:tableName2];
    }] continueWithBlock:^id(BFTask *task) {
        return nil;
    }] waitUntilFinished];
    
    //Add Entries
    [[[[BFTask taskWithResult:nil] continueWithBlock:^id(BFTask *task) {
        NSMutableArray *tasks = [NSMutableArray new];
        NSArray *gameTitleArray = @[@"Galaxy Invaders",@"Meteor Blasters", @"Starship X", @"Alien Adventure",@"Attack Ships"];
        for (int32_t i = 0; i < 50; i++) {
            for (int32_t j = 0 ; j < 2; j++) {
                TestObject2 *to2 = [TestObject2 new];
                to2.UserId = [NSString stringWithFormat:@"%d",i];
                if (i == 21 && j == 0) {
                    to2.GameTitle = @"Meteor Blasters";
                    to2.TopScore = @5000;
                    to2.Wins = @150;
                    to2.Losses = @45;
                } else {
                    to2.GameTitle = j==0?gameTitleArray[arc4random_uniform((u_int32_t)gameTitleArray.count)]:@"Destiny";
                    to2.TopScore = [NSNumber numberWithInt:arc4random_uniform(3000)];
                    to2.Wins = [NSNumber numberWithInteger:arc4random_uniform(100)];
                    to2.Losses = [NSNumber numberWithInteger:arc4random_uniform(100)];
                }
                [tasks addObject:[dynamoDBObjectMapper save:to2]];
            }
        }
        
        return [BFTask taskForCompletionOfAllTasks:tasks];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: %@",task.error);
        }
        return nil;
    }] waitUntilFinished];
    
    //Query using gsi index table
    //What is the top score ever recorded for the game Meteor Blasters?
    AWSDynamoDBQueryExpression *queryExpression = [AWSDynamoDBQueryExpression new];
    queryExpression.hashKeyValues = @"Meteor Blasters";
    queryExpression.scanIndexForward = @NO; //sort descending
    queryExpression.indexName = @"GameTitleIndex"; //using indexTable for query
    [[[dynamoDBObjectMapper query:[TestObjectGameTitleAndTopScore class] expression:queryExpression] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: %@",task.error);
        }
         XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
        
        //first object should be the highest score
        TestObjectGameTitleAndTopScore *firstObj = [paginatedOutput.items firstObject];
        XCTAssertEqualObjects(firstObj.TopScore, @5000, @"expected higested TopScore doesn't match");
        XCTAssertEqualObjects(firstObj.UserId, @"21", @"expected userId doesn't match");
        XCTAssertEqualObjects(firstObj.Wins, @150, @"expected Wins doesn't match");
        XCTAssertEqualObjects(firstObj.Losses, @45, @"expected Wins doesn't match");
        
        return nil;
    }] waitUntilFinished];
    
    //Query using lsi index table
    //The game  won most for a specified user?
    AWSDynamoDBQueryExpression *lsiQueryExpression = [AWSDynamoDBQueryExpression new];
    lsiQueryExpression.hashKeyValues = @"21";
    lsiQueryExpression.scanIndexForward = @NO;
    lsiQueryExpression.indexName = @"WinsLocalIndex";
    [[[dynamoDBObjectMapper query:[TestObjectUserIdAndWins class] expression:lsiQueryExpression] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: %@",task.error);
        }
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
        
        //first object should be the highest score
        TestObjectUserIdAndWins *firstObj = [paginatedOutput.items firstObject];
        XCTAssertEqualObjects(firstObj.TopScore, @5000, @"expected higested TopScore doesn't match");
        XCTAssertEqualObjects(firstObj.UserId, @"21", @"expected userId doesn't match");
        XCTAssertEqualObjects(firstObj.Wins, @150, @"expected Wins doesn't match");
        XCTAssertEqualObjects(firstObj.Losses, @45, @"expected Wins doesn't match");
        
        
        return nil;
    }] waitUntilFinished ];
    
    //Delete Table
    [AWSDynamoDBObjectMapperTests deleteTable:tableName2];
    
}

- (void)testSaveBehaviorUpdate {
    //Update
    AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    updateMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorUpdate; //which is the default value
    AWSDynamoDBObjectMapper *updateMapper = [[AWSDynamoDBObjectMapper alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                                         objectMapperConfiguration:updateMapperConfig];
    
    NSString *hashKeyValue = [NSString stringWithFormat:@"hash-%s",__FUNCTION__];
    NSString *rangeKeyValue = [NSString stringWithFormat:@"range-%s",__FUNCTION__];
    NSString *stringAttributeValue = @"stringValue";
    NSNumber *numberAttributeValue = @1;
    NSArray *stringSet = @[@"set1",@"set2",@"set3"];
    NSArray *numberSet = @[@1,@2,@3];
    
    TestObjectFull *tobj = [TestObjectFull new];
    tobj.hashKey = hashKeyValue;
    tobj.rangeKey = rangeKeyValue;
    tobj.stringAttribute = stringAttributeValue;
    tobj.numberAttribute = numberAttributeValue;
    tobj.stringSetAttribute = stringSet;
    tobj.numberSetAttribute = numberSet;
    
    [[[[updateMapper save:tobj] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        XCTAssertEqual([task.result class], [TestObjectFull class]);
        TestObjectFull *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringAttribute, stringAttributeValue);
        XCTAssertEqualObjects(testObject.numberAttribute, numberAttributeValue);
        XCTAssertEqualObjects(testObject.stringSetAttribute, stringSet);
        XCTAssertEqualObjects([NSSet setWithArray:testObject.numberSetAttribute],[NSSet setWithArray:numberSet]);

        return nil;
    }] waitUntilFinished ];
    
    
    //change some value to it and make sure it can be updated
    tobj.stringAttribute = nil;
    tobj.numberAttribute = nil;
    tobj.stringSetAttribute = nil;
    tobj.numberSetAttribute = @[@4,@5,@6];
    
    [[[[updateMapper save:tobj] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        XCTAssertEqual([task.result class], [TestObjectFull class]);
        TestObjectFull *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringAttribute, nil);
        XCTAssertEqualObjects(testObject.numberAttribute, nil);
        XCTAssertEqualObjects(testObject.stringSetAttribute, nil);
        XCTAssertEqualObjects([NSSet setWithArray:testObject.numberSetAttribute],[NSSet setWithArray:(@[@4,@5,@6])]);
        return nil;
    }] waitUntilFinished ];
    
}

- (void)testSaveBehaviorUpdateSkipNullAttribute {
    //Update
    AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    updateMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes; // Update_Skip_Null_Attributes
    AWSDynamoDBObjectMapper *updateMapper = [[AWSDynamoDBObjectMapper alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                                         objectMapperConfiguration:updateMapperConfig];
    
    NSString *hashKeyValue = [NSString stringWithFormat:@"hash-%s",__FUNCTION__];
    NSString *rangeKeyValue = [NSString stringWithFormat:@"range-%s",__FUNCTION__];
    NSString *stringAttributeValue = @"stringValue";
    NSNumber *numberAttributeValue = @1;
    NSArray *stringSet = @[@"set1",@"set2",@"set3"];
    NSArray *numberSet = @[@1,@2,@3];
    
    TestObjectFull *tobj = [TestObjectFull new];
    tobj.hashKey = hashKeyValue;
    tobj.rangeKey = rangeKeyValue;
    tobj.stringAttribute = stringAttributeValue;
    tobj.numberAttribute = numberAttributeValue;
    tobj.stringSetAttribute = stringSet;
    tobj.numberSetAttribute = numberSet;
    
    [[[[updateMapper save:tobj] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        XCTAssertEqual([task.result class], [TestObjectFull class]);
        TestObjectFull *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringAttribute, stringAttributeValue);
        XCTAssertEqualObjects(testObject.numberAttribute, numberAttributeValue);
        XCTAssertEqualObjects(testObject.stringSetAttribute, stringSet);
        XCTAssertEqualObjects([NSSet setWithArray:testObject.numberSetAttribute],[NSSet setWithArray:numberSet]);
        
        return nil;
    }] waitUntilFinished ];
    
    
    //change some value to nil and make sure it won't be updated.
    tobj.stringAttribute = nil;
    tobj.numberAttribute = nil;
    tobj.stringSetAttribute = nil;
    tobj.numberSetAttribute = @[@4,@5,@6];
    
    [[[[updateMapper save:tobj] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        XCTAssertEqual([task.result class], [TestObjectFull class]);
        TestObjectFull *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringAttribute, stringAttributeValue);
        XCTAssertEqualObjects(testObject.numberAttribute, numberAttributeValue);
        XCTAssertEqualObjects(testObject.stringSetAttribute, stringSet);
        XCTAssertEqualObjects([NSSet setWithArray:testObject.numberSetAttribute],[NSSet setWithArray:(@[@4,@5,@6])]);
        return nil;
    }] waitUntilFinished ];
    
}

- (void)testSaveBehaviorAppendSet {
    //Update
    AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    updateMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorAppendSet; // Append_Set
    AWSDynamoDBObjectMapper *updateMapper = [[AWSDynamoDBObjectMapper alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                                         objectMapperConfiguration:updateMapperConfig];
    
    NSString *hashKeyValue = [NSString stringWithFormat:@"hash-%s",__FUNCTION__];
    NSString *rangeKeyValue = [NSString stringWithFormat:@"range-%s",__FUNCTION__];
    NSString *stringAttributeValue = @"stringValue";
    NSNumber *numberAttributeValue = @1;
    NSArray *stringSet = @[@"set1",@"set2",@"set3"];
    NSArray *numberSet = @[@1,@2,@3];
    
    TestObjectFull *tobj = [TestObjectFull new];
    tobj.hashKey = hashKeyValue;
    tobj.rangeKey = rangeKeyValue;
    tobj.stringAttribute = stringAttributeValue;
    tobj.numberAttribute = numberAttributeValue;
    tobj.stringSetAttribute = stringSet;
    tobj.numberSetAttribute = numberSet;
    
    [[[[updateMapper save:tobj] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        XCTAssertEqual([task.result class], [TestObjectFull class]);
        TestObjectFull *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringAttribute, stringAttributeValue);
        XCTAssertEqualObjects(testObject.numberAttribute, numberAttributeValue);
        XCTAssertEqualObjects(testObject.stringSetAttribute, stringSet);
        XCTAssertEqualObjects([NSSet setWithArray:testObject.numberSetAttribute],[NSSet setWithArray:numberSet]);
        
        return nil;
    }] waitUntilFinished ];
    
    
    //change some stringSet and numberSEt and make sure it has been appended

    tobj.stringSetAttribute = @[@"set4",@"set5",@"set6"];
    tobj.numberSetAttribute = @[@4,@5,@6];
    
    [[[[updateMapper save:tobj] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        XCTAssertEqual([task.result class], [TestObjectFull class]);
        TestObjectFull *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringAttribute, stringAttributeValue);
        XCTAssertEqualObjects(testObject.numberAttribute, numberAttributeValue);
        XCTAssertEqualObjects([NSSet setWithArray:testObject.stringSetAttribute],[NSSet setWithArray:(@[@"set1",@"set2",@"set3",@"set4",@"set5",@"set6"])]);
        XCTAssertEqualObjects([NSSet setWithArray:testObject.numberSetAttribute],[NSSet setWithArray:(@[@1,@2,@3,@4,@5,@6])]);
        return nil;
    }] waitUntilFinished ];
    
}

- (void)testSaveBehaviorClobber {
    //Update
    AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    updateMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorClobber; //Clobber Type
    AWSDynamoDBObjectMapper *updateMapper = [[AWSDynamoDBObjectMapper alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                                         objectMapperConfiguration:updateMapperConfig];
    
    NSString *hashKeyValue = [NSString stringWithFormat:@"hash-%s",__FUNCTION__];
    NSString *rangeKeyValue = [NSString stringWithFormat:@"range-%s",__FUNCTION__];
    NSString *stringAttributeValue = @"stringValue";
    NSNumber *numberAttributeValue = @1;
    NSArray *stringSet = @[@"set1",@"set2",@"set3"];
    NSArray *numberSet = @[@1,@2,@3];
    
    TestObjectFull *tobj = [TestObjectFull new];
    tobj.hashKey = hashKeyValue;
    tobj.rangeKey = rangeKeyValue;
    tobj.stringAttribute = stringAttributeValue;
    tobj.numberAttribute = numberAttributeValue;
    tobj.stringSetAttribute = stringSet;
    tobj.numberSetAttribute = numberSet;
    
    [[[[updateMapper save:tobj] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        XCTAssertEqual([task.result class], [TestObjectFull class]);
        TestObjectFull *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringAttribute, stringAttributeValue);
        XCTAssertEqualObjects(testObject.numberAttribute, numberAttributeValue);
        XCTAssertEqualObjects(testObject.stringSetAttribute, stringSet);
        XCTAssertEqualObjects([NSSet setWithArray:testObject.numberSetAttribute],[NSSet setWithArray:numberSet]);
        
        return nil;
    }] waitUntilFinished ];
    
    
    //change some value to it and make sure it can be updated
    TestObject *replaceTestObject = [TestObject new];
    replaceTestObject.hashKey = hashKeyValue;
    replaceTestObject.rangeKey = rangeKeyValue;
    replaceTestObject.stringAttribute = @"string3";
    //numberAttributes is modelled and should be replaced to nil
    //numberSet and stringSet is unmodelled and will be replaced to nil as well.
    
    [[[[updateMapper save:replaceTestObject] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        XCTAssertEqual([task.result class], [TestObjectFull class]);
        TestObjectFull *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringAttribute, @"string3");
        XCTAssertEqualObjects(testObject.numberAttribute, nil);
        XCTAssertEqualObjects(testObject.stringSetAttribute, nil);
        XCTAssertEqualObjects(testObject.numberSetAttribute,nil);
        return nil;
    }] waitUntilFinished ];
    
}

- (void)testSaveForKeyOnlyItem {
    [AWSDynamoDBObjectMapperTests createTable:tableNameKeyOnly];
    
    
    //Behavior: Update (Default)
    AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    updateMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorUpdate; //which is the default
    AWSDynamoDBObjectMapper *updateMapper = [[AWSDynamoDBObjectMapper alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                                         objectMapperConfiguration:updateMapperConfig];
    
    //save item with Key-Only attributes
    NSString *hashKeyValue = @"testHashKeyValue";
    NSString *rangeKeyValue = @"testRangeKeyValue";
  
    TestObjectKeyOnly *testObject = [TestObjectKeyOnly new];
    testObject.hashKey = hashKeyValue;
    testObject.rangeKey = rangeKeyValue;
    
    [[[[updateMapper save:testObject] continueWithBlock:^id(BFTask *task) {
       
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        return [updateMapper load:[TestObjectKeyOnly class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(BFTask *task) {
        
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        XCTAssertEqual([task.result class], [TestObjectKeyOnly class]);
        TestObjectKeyOnly *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);

        return nil;
    }] waitUntilFinished];
    
    //Behavior: Clobber
    AWSDynamoDBObjectMapperConfiguration *clobberMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    clobberMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorClobber;
    AWSDynamoDBObjectMapper *clobberMapper = [[AWSDynamoDBObjectMapper alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                                         objectMapperConfiguration:clobberMapperConfig];
    rangeKeyValue = @"testRangeKeyValue2";
    TestObjectKeyOnly *testObjectClobber = [TestObjectKeyOnly new];
    testObjectClobber.hashKey = hashKeyValue;
    testObjectClobber.rangeKey = rangeKeyValue;
    
    [[[[clobberMapper save:testObjectClobber] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        return [clobberMapper load:[TestObjectKeyOnly class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }
        
        XCTAssertEqual([task.result class], [TestObjectKeyOnly class]);
        TestObjectKeyOnly *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        
        return nil;
    }]waitUntilFinished];
    
    [AWSDynamoDBObjectMapperTests deleteTable:tableNameKeyOnly];
    
}
- (void)testAll {
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];

    [[[[[[[[[[[BFTask taskWithResult:nil] continueWithBlock:^id(BFTask *task) {
        NSMutableArray *tasks = [NSMutableArray new];

        for (int32_t j = 0; j < 5; j++) {
            for (int32_t i = 0; i < 20; i++) {
                TestObject *testObject = [TestObject new];
                testObject.hashKey = [NSString stringWithFormat:@"hash-key-%02d", j];
                testObject.rangeKey = [NSString stringWithFormat:@"range-%02d", i];
                testObject.stringAttribute = [NSString stringWithFormat:@"string-attr-%02d", i];
                testObject.numberAttribute = @(i);

                [tasks addObject:[dynamoDBObjectMapper save:testObject]];
            }
        }

        return [BFTask taskForCompletionOfAllTasks:tasks];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        return [dynamoDBObjectMapper load:[TestObject class]
                                  hashKey:@"hash-key-01"
                                 rangeKey:@"range-05"];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertEqual([task.result class], [TestObject class]);
        TestObject *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, @"hash-key-01");
        XCTAssertEqualObjects(testObject.rangeKey, @"range-05");
        XCTAssertEqualObjects(testObject.stringAttribute, @"string-attr-05");
        XCTAssertEqualObjects(testObject.numberAttribute, @5);

        AWSDynamoDBScanExpression *expression = [AWSDynamoDBScanExpression new];
        return [dynamoDBObjectMapper scan:[TestObject class]
                               expression:expression];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        NSMutableArray *tasks = [NSMutableArray new];
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
        for (TestObject *testObject in paginatedOutput.items) {
            TestObject *updatedTestObject = [TestObject new];
            updatedTestObject.hashKey = testObject.hashKey;
            updatedTestObject.rangeKey = testObject.rangeKey;
            updatedTestObject.numberAttribute = @([testObject.numberAttribute doubleValue] + 1000);
            updatedTestObject.stringAttribute = nil; //For UPDATE behavior, a null value for the modeled attribute will remove it from that item in DynamoDB.
            [tasks addObject:[dynamoDBObjectMapper save:updatedTestObject]];
        }

        return [BFTask taskForCompletionOfAllTasks:tasks];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        AWSDynamoDBQueryExpression *queryExpression = [AWSDynamoDBQueryExpression new];
        queryExpression.hashKeyValues = @"hash-key-02";
        return [dynamoDBObjectMapper query:[TestObject class]
                                expression:queryExpression];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;

        NSMutableArray *tasks = [NSMutableArray new];
        for (TestObject *testObject in paginatedOutput.items) {
            XCTAssertTrue([testObject.numberAttribute doubleValue] >= 1000);
            XCTAssertNil(testObject.stringAttribute); //item should be removed for UPDATE behavior.
            [tasks addObject:[dynamoDBObjectMapper remove:testObject]];
        }

        return [BFTask taskForCompletionOfAllTasks:tasks];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        AWSDynamoDBQueryExpression *queryExpression = [AWSDynamoDBQueryExpression new];
        queryExpression.hashKeyValues = @"invalid-key";
        return [dynamoDBObjectMapper query:[TestObject class]
                                expression:queryExpression];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
        XCTAssertEqual([paginatedOutput.items count], 0);

        return nil;
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.exception) {
            XCTFail(@"Exception: [%@]", task.exception);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testError {
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];

    TestObjectFail *testObject = [TestObjectFail new];
    testObject.hashKey = @"hash-key";
    testObject.rangeKey = @"range";
    testObject.stringAttribute = @"string-attr";
    testObject.numberAttribute = @(0);
    
    [[[dynamoDBObjectMapper save:testObject] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(task.error.domain, AWSDynamoDBErrorDomain);
        XCTAssertEqual(task.error.code, AWSDynamoDBErrorResourceNotFound);
        if (task.result) {
            XCTFail(@"Expecting an error. Result: [%@]", task.result);
        }
        return nil;
    }] waitUntilFinished];
}

@end
