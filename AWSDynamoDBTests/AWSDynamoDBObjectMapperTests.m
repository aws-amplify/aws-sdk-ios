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

#import <XCTest/XCTest.h>
#import "AWSDynamoDB.h"
#import "AWSTestUtility.h"
#import "AWSDynamoDBTestUtility.h"

NSString *const AWSDynamoDBObjectMapperTestTable = @"DynamoDBOMTest";

static NSString *tableName = nil;
static NSString *tableName2 = nil;
static NSString *tableNameKeyOnly = nil;

@interface TestObjectV2 : AWSDynamoDBObjectModel <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *hashKey;
@property (nonatomic, strong) NSString *rangeKey;
@property (nonatomic, strong) NSString *stringAttribute;
@property (nonatomic, strong) NSNumber *numberAttribute;
@property (nonatomic, strong) NSData *binaryAttribute;

@property (nonatomic, strong) NSSet *stringSetAttribute; //StringSet, NSArray -> NSSet
@property (nonatomic, strong) NSSet *numberSetAttribute; //NumberSet, NSArray -> NSSet
@property (nonatomic, strong) NSSet *binarySetAttribute; //BinarySet, NSArray -> NSSet

//V2 support new data types
@property (nonatomic, assign) NSNumber *bool2Element; //will aslo treat it as bool if init with @YES or @NO
@property (nonatomic, strong) NSArray *listElement; // list
@property (nonatomic, strong) NSDictionary *mapElement; // map

@end

@implementation TestObjectV2

+ (NSString *)dynamoDBTableName {
    return tableName;
}

+ (NSString *)hashKeyAttribute {
    return @"hashKey";
}

+ (NSString *)rangeKeyAttribute {
    return @"rangeKey";
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"hashKey" : @"hashKey1",
             @"rangeKey" : @"rangeKey1",
             @"stringAttribute" : @"stringAttribute1",
             @"numberAttribute" : @"numberAttribute1",
             @"binaryAttribute" : @"binaryAttribute1",
             @"stringSetAttribute" : @"stringSetAttribute1",
             @"numberSetAttribute" : @"numberSetAttribute1",
             @"binarySetAttribute" : @"binarySetAttribute1",
             @"bool2Element" : @"bool2Element1",
             @"listElement" : @"listElement1",
             @"mapElement" : @"mapElement1",
             };
}

@end

@interface TestObjectV2Small : AWSDynamoDBObjectModel <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *hashKey;
@property (nonatomic, strong) NSString *rangeKey;
@property (nonatomic, strong) NSString *stringAttribute;
@property (nonatomic, strong) NSNumber *numberAttribute;

@property (nonatomic, strong) NSSet *stringSetAttribute; //StringSet, NSArray -> NSSet
@property (nonatomic, strong) NSSet *binarySetAttribute; //BinarySet, NSArray -> NSSet

//V2 support new data types
@property (nonatomic, strong) NSDictionary *mapElement; // map

@end

@implementation TestObjectV2Small

+ (NSString *)dynamoDBTableName {
    return tableName;
}

+ (NSString *)hashKeyAttribute {
    return @"hashKey";
}

+ (NSString *)rangeKeyAttribute {
    return @"rangeKey";
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"hashKey" : @"hashKey1",
             @"rangeKey" : @"rangeKey1",
             @"stringAttribute" : @"stringAttribute1",
             @"numberAttribute" : @"numberAttribute1",
             @"stringSetAttribute" : @"stringSetAttribute1",
             @"binarySetAttribute" : @"binarySetAttribute1",
             @"mapElement" : @"mapElement1",
             };
}

@end


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@interface TestObject : AWSDynamoDBObjectModel <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *hashKey;
@property (nonatomic, strong) NSString *rangeKey;
@property (nonatomic, strong) NSString *stringAttribute;
@property (nonatomic, strong) NSNumber *numberAttribute;

//properties that should be ignored by ignoreAttributes
@property (nonatomic, strong) NSString *customStringOne;
@property (nonatomic, strong) NSString *customStringTwo;

@end

#pragma clang diagnostic pop

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

+ (NSArray *)ignoreAttributes {
    return @[@"customStringOne",@"customStringTwo"];
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"hashKey" : @"hashKey1",
             @"rangeKey" : @"rangeKey1",
             };
}

@end

@interface TestObjectFull : TestObject <AWSDynamoDBModeling>

@property (nonatomic, strong) NSSet *stringSetAttribute;
@property (nonatomic, strong) NSSet *numberSetAttribute;

@end

@implementation TestObjectFull

@end

@interface TestObjectKeyOnly : AWSDynamoDBObjectModel <AWSDynamoDBModeling>

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"hashKey" : @"hashKey1",
             @"rangeKey" : @"rangeKey1",
             };
}

@end

@interface TestObject2 : AWSDynamoDBObjectModel <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *UserId;
@property (nonatomic, strong) NSString *GameTitle;
@property (nonatomic, strong) NSNumber *TopScore;
@property (nonatomic, strong) NSNumber *Wins;
@property (nonatomic, strong) NSNumber *Losses;

@property (nonatomic, assign) BOOL purchased;

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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@interface TestObjectFail : AWSDynamoDBObjectModel <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *hashKey;
@property (nonatomic, strong) NSString *rangeKey;
@property (nonatomic, strong) NSString *stringAttribute;
@property (nonatomic, strong) NSNumber *numberAttribute;

@end

#pragma clang diagnostic pop

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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"hashKey" : @"hashKey1",
             @"rangeKey" : @"rangeKey1",
             };
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

    [AWSDynamoDBTestUtility createTable:tableName];
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

    [AWSDynamoDBTestUtility deleteTable:tableName];
}

#pragma mark - Utilities

- (void)createQueryAndScanTestingTable:(AWSDynamoDBObjectMapper*)dynamoDBObjectMapper {

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
    provisionedThroughput.readCapacityUnits = @50;
    provisionedThroughput.writeCapacityUnits = @50;


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
    [[[[dynamoDB createTable:createTableInput] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error to create table: %@",task.error);
        }
        return [AWSDynamoDBTestUtility waitForTableToBeActive:tableName2];
    }] continueWithBlock:^id(AWSTask *task) {
        return nil;
    }] waitUntilFinished];

    //Add Entries
    [[[[AWSTask taskWithResult:nil] continueWithBlock:^id(AWSTask *task) {
        NSMutableArray *tasks = [NSMutableArray new];
        NSArray *gameTitleArray = @[@"Galaxy Invaders",@"Meteor Blasters", @"Starship X", @"Alien Adventure",@"Attack Ships"];
        for (int32_t i = 0; i < 50; i++) {
            for (int32_t j = 0; j < 2; j++) {
                TestObject2 *to2 = [TestObject2 new];
                to2.UserId = [NSString stringWithFormat:@"%d",i];
                if (i == 21 && j == 0) {
                    to2.GameTitle = @"Meteor Blasters";
                    to2.TopScore = @5000;
                    to2.Wins = @150;
                    to2.Losses = @45;

                    to2.purchased = YES;
                } else {
                    to2.GameTitle = j==0?gameTitleArray[arc4random_uniform((u_int32_t)gameTitleArray.count)]:@"Destiny";
                    to2.TopScore = [NSNumber numberWithInt:arc4random_uniform(3000)];
                    to2.Wins = [NSNumber numberWithInteger:arc4random_uniform(100)+20];
                    to2.Losses = [NSNumber numberWithInteger:arc4random_uniform(100)+20];
                }
                [tasks addObject:[dynamoDBObjectMapper save:to2]];
            }
        }

        return [AWSTask taskForCompletionOfAllTasks:tasks];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: %@",task.error);
        }
        return nil;
    }] waitUntilFinished];

}

#pragma mark - Tests
- (void)testAllV2 {
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];

    NSData *binaryElement = [@"testData" dataUsingEncoding:NSUTF8StringEncoding];
    NSSet *stringSet = [NSSet setWithObjects:@"stringSet1",@"stringSet2",@"stringSet3",nil];
    NSSet *numberSet = [NSSet setWithObjects:@1,@2,@3, nil];
    NSSet *binarySet = [NSSet setWithObjects:[@"testDataSet1" dataUsingEncoding:NSUTF8StringEncoding],[@"testDataSet2" dataUsingEncoding:NSUTF8StringEncoding],[@"testDataSet3" dataUsingEncoding:NSUTF8StringEncoding], nil];
    NSNumber *bool2Element = @NO;

    NSDictionary *testMap = @{@"testStrKey":@"testStrValue",@"testBoolKey":@NO,@"testListKey":@[@"newlistOfList",@99]};
    NSArray *listElement = @[@"StringInList",
                             @34,
                             binaryElement,
                             stringSet,
                             numberSet,
                             binarySet,
                             @YES,
                             @[@"stringInListOfList",@56,testMap],
                             testMap];
    NSDictionary *mapElement = @{@"mapStringKey":@"mapStringValue",
                                 @"mapNumberKey":@99,
                                 @"mapBinaryKey":binaryElement,
                                 @"mapStringSetKey":stringSet,
                                 @"mapNumberSetKey":numberSet,
                                 @"mapBinarySetKey":binarySet,
                                 @"mapBoolKey":@YES,
                                 @"mapListKey":listElement,
                                 @"mapMapKey":@{@"str":@"strValue",@"num":@5,@"lst":listElement},
                                 };

    NSArray *updatedListElement = @[@"updatedValue",@888,@NO,@[@"newlistOfList",@99]];
    NSDictionary *updatedMapElement = @{@"mapStringKey":@"updatedValue",
                                        @"mapNumberKey":@123456,
                                        @"mapBoolKey":@NO,
                                        @"mapListKey":listElement,
                                        @"ihave.dot":@"standardValue",
                                        };

    NSMutableArray *tasks = [NSMutableArray new];

    for (int32_t j = 0; j < 5; j++) {
        for (int32_t i = 0; i < 20; i++) {
            TestObjectV2 *testObject = [TestObjectV2 new];
            testObject.hashKey = [NSString stringWithFormat:@"hash-key-%02d", j];
            testObject.rangeKey = [NSString stringWithFormat:@"range-%02d", i];
            testObject.stringAttribute = [NSString stringWithFormat:@"string-attr-%02d", i];
            testObject.numberAttribute = @(i);
            testObject.binaryAttribute = binaryElement;
            testObject.stringSetAttribute = stringSet;
            testObject.numberSetAttribute = numberSet;
            testObject.binarySetAttribute = binarySet;
            testObject.bool2Element = bool2Element;
            testObject.listElement = listElement;
            testObject.mapElement = mapElement;

            [tasks addObject:[dynamoDBObjectMapper save:testObject]];
        }
    }

    [[[[[[[[[[[AWSTask taskForCompletionOfAllTasks:tasks] continueWithSuccessBlock:^id(AWSTask *task) {
        return [dynamoDBObjectMapper load:[TestObjectV2 class] hashKey:@"hash-key-01" rangeKey:@"range-05"];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertEqual([task.result class], [TestObjectV2 class]);
        TestObjectV2 *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, @"hash-key-01");
        XCTAssertEqualObjects(testObject.rangeKey, @"range-05");
        XCTAssertEqualObjects(testObject.stringAttribute, @"string-attr-05");
        XCTAssertEqualObjects(testObject.numberAttribute, @5);
        XCTAssertEqualObjects(testObject.binaryAttribute,[@"testData" dataUsingEncoding:NSUTF8StringEncoding]);
        XCTAssertEqualObjects(testObject.stringSetAttribute,stringSet);
        XCTAssertEqualObjects(testObject.numberSetAttribute, numberSet);
        XCTAssertEqualObjects(testObject.binarySetAttribute, binarySet);
        XCTAssertEqual(testObject.bool2Element, bool2Element);
        XCTAssertEqualObjects(testObject.listElement, listElement);
        XCTAssertEqualObjects(testObject.mapElement, mapElement);

        AWSDynamoDBScanExpression *expression = [AWSDynamoDBScanExpression new];
        return [dynamoDBObjectMapper scan:[TestObjectV2 class]
                               expression:expression];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        NSMutableArray *tasks = [NSMutableArray new];
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
        for (TestObjectV2 *testObject in paginatedOutput.items) {
            TestObjectV2 *updatedTestObject = [TestObjectV2 new];
            updatedTestObject.hashKey = testObject.hashKey;
            updatedTestObject.rangeKey = testObject.rangeKey;
            updatedTestObject.numberAttribute = @([testObject.numberAttribute doubleValue] + 1000);
            updatedTestObject.stringAttribute = nil; //For UPDATE behavior, a null value for the modeled attribute will remove it from that item in DynamoDB.

            updatedTestObject.bool2Element = nil; // even without this statement, bool2Element is still nil. will be removed from table.
            updatedTestObject.listElement = updatedListElement;
            updatedTestObject.mapElement = updatedMapElement;


            [tasks addObject:[dynamoDBObjectMapper save:updatedTestObject]];
        }

        return [AWSTask taskForCompletionOfAllTasks:tasks];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        AWSDynamoDBQueryExpression *queryExpression = [AWSDynamoDBQueryExpression new];
        queryExpression.keyConditionExpression = @"hashKey1 = :hashKey";
        queryExpression.expressionAttributeValues = @{@":hashKey" : @"hash-key-02"};
        return [dynamoDBObjectMapper query:[TestObjectV2 class]
                                expression:queryExpression];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;

        NSMutableArray *tasks = [NSMutableArray new];
        for (TestObjectV2 *testObject in paginatedOutput.items) {
            XCTAssertTrue([testObject.numberAttribute doubleValue] >= 1000);
            XCTAssertNil(testObject.stringAttribute); //item should be removed for UPDATE behavior.

            XCTAssertEqualObjects(testObject.bool2Element, nil);
            XCTAssertEqualObjects(testObject.listElement, updatedListElement);
            XCTAssertEqualObjects(testObject.mapElement, updatedMapElement);

            [tasks addObject:[dynamoDBObjectMapper remove:testObject]];
        }

        return [AWSTask taskForCompletionOfAllTasks:tasks];
    }] continueWithSuccessBlock:^id(AWSTask *task) {

        AWSDynamoDBScanExpression *expression = [AWSDynamoDBScanExpression new];
        expression.projectionExpression = @"mapElement1.#nameplaceholder";
        expression.expressionAttributeNames = @{@"#nameplaceholder":@"ihave.dot"};
        return [dynamoDBObjectMapper scan:[TestObjectV2 class]
                               expression:expression];

    }] continueWithSuccessBlock:^id(AWSTask *task) {

        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
        TestObjectV2 *fistObject = paginatedOutput.items[0];
        XCTAssertEqualObjects(@"standardValue", fistObject.mapElement[@"ihave.dot"]);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        AWSDynamoDBQueryExpression *queryExpression = [AWSDynamoDBQueryExpression new];
        queryExpression.hashKeyValues = @"hash-key-02";
#pragma clang diagnostic pop

        return [dynamoDBObjectMapper query:[TestObjectV2 class]
                                expression:queryExpression];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
        XCTAssertEqual([paginatedOutput.items count], 0);

        return nil;
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return nil;
    }] waitUntilFinished];

}

- (void)testLoadNonExistingItem {
    AWSDynamoDBObjectMapper *objectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    [[[objectMapper load:[TestObjectV2 class]
                 hashKey:@"some random value that does not exist"
                rangeKey:@"some random value that does not exist"] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        XCTAssertNil(task.error);
        XCTAssertNil(task.result);

        return nil;
    }] waitUntilFinished];
}

-(void)testIgnoredAttributes {

    for (int i=1;i<=4;i++) {

        //Save using default behavior
        AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
        updateMapperConfig.saveBehavior = i; // i is from 1 to 4 which represent 4 different save behaviors
        [AWSDynamoDBObjectMapper registerDynamoDBObjectMapperWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                     objectMapperConfiguration:updateMapperConfig
                                                                        forKey:@"testIgnoredAttributes"];
        AWSDynamoDBObjectMapper *updateMapper = [AWSDynamoDBObjectMapper DynamoDBObjectMapperForKey:@"testIgnoredAttributes"];

        NSString *hashKeyValue = [NSString stringWithFormat:@"ignoretest-hash-%s",__FUNCTION__];
        NSString *rangeKeyValue = [NSString stringWithFormat:@"ignoretest-range-%s-%d",__FUNCTION__,i];
        NSString *stringAttributeValue = @"stringValue";
        NSNumber *numberAttributeValue = @1;

        TestObject *mapperObject= [TestObject new];
        mapperObject.hashKey = hashKeyValue;
        mapperObject.rangeKey = rangeKeyValue;
        mapperObject.stringAttribute = stringAttributeValue;
        mapperObject.numberAttribute = numberAttributeValue;
        //set properties that should be ignored by all method
        mapperObject.customStringOne = @"shouldNotAppeared1";
        mapperObject.customStringTwo = @"shouldNotAppeared2";


        [[[[updateMapper save:mapperObject] continueWithBlock:^id(AWSTask *task) {
            if (task.error) {
                XCTFail(@"Error: [%@]", task.error);
            }

            return [updateMapper load:[TestObject class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
        }] continueWithBlock:^id(AWSTask *task) {

            if (task.error) {
                XCTFail(@"Error: [%@]", task.error);
            }

            XCTAssertEqual([task.result class], [TestObject class]);
            TestObject *testObject = task.result;
            XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
            XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
            XCTAssertEqualObjects(testObject.stringAttribute, stringAttributeValue);
            XCTAssertEqualObjects(testObject.numberAttribute, numberAttributeValue);
            XCTAssertNil(testObject.customStringOne);
            XCTAssertNil(testObject.customStringTwo);

            return nil;
        }] waitUntilFinished ];

    }


}
- (void)testBooleanNSNumber {
    NSArray *boolNumberArray = @[@YES,@NO,[NSNumber numberWithBool:YES],[NSNumber numberWithBool:NO]];
    NSArray *nonBoolNumberArray = @[@10,
                                    @400.45,
                                    [NSNumber numberWithChar:'a'],
                                    [NSNumber numberWithDouble:2.0],
                                    [NSNumber numberWithFloat:3.5],
                                    [NSNumber numberWithFloat:4.5],
                                    [NSNumber numberWithInt:5],
                                    [NSNumber numberWithInteger:6],
                                    [NSNumber numberWithLong:888],
                                    [NSNumber numberWithLongLong:1234567],
                                    [NSNumber numberWithShort:345],
                                    [NSNumber numberWithUnsignedChar:'d'],
                                    [NSNumber numberWithUnsignedInt:45],
                                    [NSNumber numberWithUnsignedInteger:10],
                                    [NSNumber numberWithUnsignedLong:20],
                                    [NSNumber numberWithUnsignedLongLong:30],
                                    [NSNumber numberWithUnsignedShort:40],
                                    ];
    Class boolClass = [[NSNumber numberWithBool:YES] class];

    for (id myNum in boolNumberArray) {
        XCTAssertTrue([myNum isKindOfClass:boolClass],@"%@ should be a boolClass.",myNum);
    }
    for (id myNum  in nonBoolNumberArray) {
        XCTAssertFalse([myNum isKindOfClass:boolClass],@"%@ should not be a boolClass.",myNum);
    }

}

- (void)testUpdatedIndexQueryAndScan {
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    //Create a table with both local and global secondary indexes
    [self createQueryAndScanTestingTable:dynamoDBObjectMapper];

    //Query using gsi index table
    //What is the top score ever recorded for the game Meteor Blasters?
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    AWSDynamoDBQueryExpression *queryExpression = [AWSDynamoDBQueryExpression new];
    queryExpression.hashKeyAttribute = @"GameTitle";
    queryExpression.hashKeyValues = @"Meteor Blasters";
    queryExpression.scanIndexForward = @NO; //sort descending
    queryExpression.indexName = @"GameTitleIndex"; //using indexTable for query
    queryExpression.rangeKeyConditionExpression = @"TopScore BETWEEN :range1 AND :range2";
    queryExpression.expressionAttributeValues = @{
                                                  @":range1" : @4000,
                                                  @":range2" : @5000
                                                  };
#pragma clang diagnostic pop

    [[[dynamoDBObjectMapper query:[TestObject2 class] expression:queryExpression] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: %@",task.error);
            return nil;
        }
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;

        //should only contains one object with topscore between
        //first object should be the highest score between 4000 to 5000;
        XCTAssertEqual(1, [paginatedOutput.items count]);

        //first object should be the highest score
        TestObject2 *firstObj = [paginatedOutput.items firstObject];
        XCTAssertEqualObjects(firstObj.TopScore, @5000, @"expected higested TopScore doesn't match");
        XCTAssertEqualObjects(firstObj.UserId, @"21", @"expected userId doesn't match");
        XCTAssertEqualObjects(firstObj.Wins, @150, @"expected Wins doesn't match");
        XCTAssertEqualObjects(firstObj.Losses, @45, @"expected Wins doesn't match");

        XCTAssertEqual(firstObj.purchased,YES, @"expected purchased doesn't match");

        return nil;
    }] waitUntilFinished];

    //Query using lsi index table
    //The game  won most for a specified user?
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    AWSDynamoDBQueryExpression *lsiQueryExpression = [AWSDynamoDBQueryExpression new];
    lsiQueryExpression.hashKeyValues = @"21";
    lsiQueryExpression.scanIndexForward = @NO;
    lsiQueryExpression.indexName = @"WinsLocalIndex";
    lsiQueryExpression.rangeKeyConditionExpression = @"Wins >= :wins";
    lsiQueryExpression.expressionAttributeValues = @{@":wins" : @120};
#pragma clang diagnostic pop

    [[[dynamoDBObjectMapper query:[TestObject2 class] expression:lsiQueryExpression] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: %@",task.error);
            return nil;
        }
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;

        //should only contains one object >= 5000
        //first object should be the highest score between 4000 to 5000;
        XCTAssertEqual(1, [paginatedOutput.items count]);

        //first object should be the highest score
        TestObject2 *firstObj = [paginatedOutput.items firstObject];
        XCTAssertEqualObjects(firstObj.TopScore, @5000, @"expected higested TopScore doesn't match");
        XCTAssertEqualObjects(firstObj.UserId, @"21", @"expected userId doesn't match");
        XCTAssertEqualObjects(firstObj.Wins, @150, @"expected Wins doesn't match");
        XCTAssertEqualObjects(firstObj.Losses, @45, @"expected Wins doesn't match");

        XCTAssertEqual(firstObj.purchased,YES, @"expected purchased doesn't match");

        return nil;
    }] waitUntilFinished ];

    //Scan using gsi index table
    AWSDynamoDBScanExpression *gsiScanExpression = [AWSDynamoDBScanExpression new];
    gsiScanExpression.indexName = @"GameTitleIndex"; //using indexTable for scan
    gsiScanExpression.filterExpression = @"GameTitle = :gameTitle AND Wins <= :wins";
    gsiScanExpression.expressionAttributeValues = @{@":gameTitle" : @"Attack Ships",
                                                    @":wins" : @150};

    [[[dynamoDBObjectMapper scan:[TestObject2 class] expression:gsiScanExpression] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: %@",task.error);
            return nil;
        }

        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;

        NSArray *items = paginatedOutput.items;
        XCTAssertTrue([items count] > 0);

        for (TestObject2 *item in items) {
            XCTAssertEqualObjects(@"Attack Ships",item.GameTitle);
            return nil;
        }

        return nil;


    }] waitUntilFinished];

    //Scan using lsi index table
    AWSDynamoDBScanExpression *lsiScanExpression = [AWSDynamoDBScanExpression new];
    lsiScanExpression.indexName = @"WinsLocalIndex";
    lsiScanExpression.filterExpression = @"GameTitle = :gameTitle";
    lsiScanExpression.expressionAttributeValues = @{@":gameTitle" : @"Attack Ships"};

    [[[dynamoDBObjectMapper scan:[TestObject2 class] expression:lsiScanExpression] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: %@",task.error);
            return nil;
        }
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;

        NSArray *items = paginatedOutput.items;
        XCTAssertTrue([items count] > 0);

        for (TestObject2 *item in items) {
            XCTAssertEqualObjects(@"Attack Ships",item.GameTitle);
            return nil;
        }

        return nil;

    }] waitUntilFinished ];


    if (true) {
        //Using keyConditionsExpression
        //Query using gsi index table
        //What is the top score ever recorded for the game Meteor Blasters?
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        AWSDynamoDBQueryExpression *queryExpression = [AWSDynamoDBQueryExpression new];
        queryExpression.hashKeyValues = @"Meteor Blasters";
        queryExpression.scanIndexForward = @NO; //sort descending
        queryExpression.indexName = @"GameTitleIndex"; //using indexTable for query

        //new rangeKeyConditionsExpression
        queryExpression.rangeKeyConditionExpression = @"TopScore BETWEEN :rangeval1 AND :rangeval2";
        queryExpression.expressionAttributeValues = @{@":rangeval1":@4000,
                                                      @":rangeval2":@5000};

        queryExpression.hashKeyAttribute = @"GameTitle";
#pragma clang diagnostic pop

        [[[dynamoDBObjectMapper query:[TestObject2 class] expression:queryExpression] continueWithBlock:^id(AWSTask *task) {
            if (task.error) {
                XCTFail(@"Error: %@",task.error);
                return nil;
            }
            XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
            AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;

            //should only contains one object with topscore between
            //first object should be the highest score between 4000 to 5000;
            XCTAssertEqual(1, [paginatedOutput.items count]);

            //first object should be the highest score
            TestObject2 *firstObj = [paginatedOutput.items firstObject];
            XCTAssertEqualObjects(firstObj.TopScore, @5000, @"expected higested TopScore doesn't match");
            XCTAssertEqualObjects(firstObj.UserId, @"21", @"expected userId doesn't match");
            XCTAssertEqualObjects(firstObj.Wins, @150, @"expected Wins doesn't match");
            XCTAssertEqualObjects(firstObj.Losses, @45, @"expected Wins doesn't match");

            XCTAssertEqual(firstObj.purchased,YES, @"expected purchased doesn't match");

            return nil;
        }] waitUntilFinished];

        //Query using lsi index table
        //The game  won most for a specified user?
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        AWSDynamoDBQueryExpression *lsiQueryExpression = [AWSDynamoDBQueryExpression new];
        lsiQueryExpression.hashKeyValues = @"21";
        lsiQueryExpression.scanIndexForward = @NO;
        lsiQueryExpression.indexName = @"WinsLocalIndex";

        //new rangeKeyCondtionsExpression
        lsiQueryExpression.rangeKeyConditionExpression = @"Wins > :rangeval";
        lsiQueryExpression.expressionAttributeValues = @{@":rangeval":@120};
#pragma clang diagnostic pop

        [[[dynamoDBObjectMapper query:[TestObject2 class] expression:lsiQueryExpression] continueWithBlock:^id(AWSTask *task) {
            if (task.error) {
                XCTFail(@"Error: %@",task.error);
                return nil;
            }
            XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
            AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;

            //should only contains one object >= 5000
            //first object should be the highest score between 4000 to 5000;
            XCTAssertEqual(1, [paginatedOutput.items count]);

            //first object should be the highest score
            TestObject2 *firstObj = [paginatedOutput.items firstObject];
            XCTAssertEqualObjects(firstObj.TopScore, @5000, @"expected higested TopScore doesn't match");
            XCTAssertEqualObjects(firstObj.UserId, @"21", @"expected userId doesn't match");
            XCTAssertEqualObjects(firstObj.Wins, @150, @"expected Wins doesn't match");
            XCTAssertEqualObjects(firstObj.Losses, @45, @"expected Wins doesn't match");

            XCTAssertEqual(firstObj.purchased,YES, @"expected purchased doesn't match");

            return nil;
        }] waitUntilFinished ];

        //Scan using gsi index table
        AWSDynamoDBScanExpression *gsiScanExpression = [AWSDynamoDBScanExpression new];
        gsiScanExpression.indexName = @"GameTitleIndex"; //using indexTable for scan

        //new filterExpression
        gsiScanExpression.filterExpression = @"GameTitle = :rangeval";
        gsiScanExpression.expressionAttributeValues = @{@":rangeval":@"Attack Ships"};

        gsiScanExpression.projectionExpression = @"GameTitle, TopScore, UserId, Wins, purchased";

        [[[dynamoDBObjectMapper scan:[TestObject2 class] expression:gsiScanExpression] continueWithBlock:^id(AWSTask *task) {
            if (task.error) {
                XCTFail(@"Error: %@",task.error);
                return nil;
            }

            XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
            AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;

            NSArray *items = paginatedOutput.items;
            XCTAssertTrue([items count] > 0);

            for (TestObject2 *item in items) {
                //projectionExpression doesn't allow losses;
                XCTAssertNil(item.Losses);
                XCTAssertEqualObjects(@"Attack Ships",item.GameTitle);
                return nil;
            }

            return nil;


        }] waitUntilFinished];

        //Scan using lsi index table
        AWSDynamoDBScanExpression *lsiScanExpression = [AWSDynamoDBScanExpression new];
        lsiScanExpression.indexName = @"WinsLocalIndex";

        //new filterExpression
        lsiScanExpression.filterExpression = @"GameTitle = :rangeval";
        lsiScanExpression.expressionAttributeValues = @{@":rangeval":@"Attack Ships"};

        [[[dynamoDBObjectMapper scan:[TestObject2 class] expression:lsiScanExpression] continueWithBlock:^id(AWSTask *task) {
            if (task.error) {
                XCTFail(@"Error: %@",task.error);
                return nil;
            }
            XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
            AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;

            NSArray *items = paginatedOutput.items;
            XCTAssertTrue([items count] > 0);

            for (TestObject2 *item in items) {
                XCTAssertEqualObjects(@"Attack Ships",item.GameTitle);
                return nil;
            }

            return nil;

        }] waitUntilFinished ];
    }

    //Delete Table
    [AWSDynamoDBTestUtility deleteTable:tableName2];
}

- (void)testIndexQueryAndScan {
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    //Create a table with both local and global secondary indexes
    //Create a table with both local and global secondary indexes
    [self createQueryAndScanTestingTable:dynamoDBObjectMapper];

    //Query using gsi index table
    //What is the top score ever recorded for the game Meteor Blasters?
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    AWSDynamoDBQueryExpression *queryExpression = [AWSDynamoDBQueryExpression new];
    queryExpression.hashKeyValues = @"Meteor Blasters";
    queryExpression.scanIndexForward = @NO; //sort descending
    queryExpression.indexName = @"GameTitleIndex"; //using indexTable for query
    queryExpression.rangeKeyConditionExpression = @"TopScore BETWEEN :range1 AND :range2";
    queryExpression.expressionAttributeValues = @{@":range1" : @4000,
                                                  @":range2" : @5000};
#pragma clang diagnostic pop
    [[[dynamoDBObjectMapper query:[TestObjectGameTitleAndTopScore class] expression:queryExpression] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: %@",task.error);
            return nil;
        }
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;

        //should only contains one object with topscore between
        //first object should be the highest score between 4000 to 5000;
        XCTAssertEqual(1, [paginatedOutput.items count]);

        TestObjectGameTitleAndTopScore *firstObj = [paginatedOutput.items firstObject];
        XCTAssertEqualObjects(firstObj.TopScore, @5000, @"expected higested TopScore doesn't match");
        XCTAssertEqualObjects(firstObj.UserId, @"21", @"expected userId doesn't match");
        XCTAssertEqualObjects(firstObj.Wins, @150, @"expected Wins doesn't match");
        XCTAssertEqualObjects(firstObj.Losses, @45, @"expected Wins doesn't match");

        XCTAssertEqual(firstObj.purchased,YES, @"expected purchased doesn't match");

        return nil;
    }] waitUntilFinished];

    //Query using lsi index table
    //The game  won most for a specified user?
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    AWSDynamoDBQueryExpression *lsiQueryExpression = [AWSDynamoDBQueryExpression new];
    lsiQueryExpression.hashKeyValues = @"21";
    lsiQueryExpression.scanIndexForward = @NO;
    lsiQueryExpression.indexName = @"WinsLocalIndex";
    lsiQueryExpression.rangeKeyConditionExpression = @"Wins >= :wins";
    lsiQueryExpression.expressionAttributeValues = @{@":wins" : @20};
#pragma clang diagnostic pop
    [[[dynamoDBObjectMapper query:[TestObjectUserIdAndWins class] expression:lsiQueryExpression] continueWithBlock:^id(AWSTask *task) {
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

        XCTAssertEqual(firstObj.purchased,YES, @"expected purchased doesn't match");

        return nil;
    }] waitUntilFinished ];

    //Scan using gsi index table
    AWSDynamoDBScanExpression *gsiScanExpression = [AWSDynamoDBScanExpression new];
    gsiScanExpression.indexName = @"GameTitleIndex"; //using indexTable for scan
    gsiScanExpression.filterExpression = @"GameTitle = :gameTitle";
    gsiScanExpression.expressionAttributeValues = @{@":gameTitle" : @"Attack Ships"};

    [[[dynamoDBObjectMapper scan:[TestObjectGameTitleAndTopScore class] expression:gsiScanExpression] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: %@",task.error);
        }

        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;

        NSArray *items = paginatedOutput.items;
        XCTAssertTrue([items count] > 0);

        for (TestObjectGameTitleAndTopScore *item in items) {
            XCTAssertEqualObjects(@"Attack Ships",item.GameTitle);
        }

        return nil;


    }] waitUntilFinished];

    //Scan using lsi index table
    AWSDynamoDBScanExpression *lsiScanExpression = [AWSDynamoDBScanExpression new];
    lsiScanExpression.indexName = @"WinsLocalIndex";
    lsiScanExpression.filterExpression = @"GameTitle = :gameTitle";
    lsiScanExpression.expressionAttributeValues = @{@":gameTitle" : @"Attack Ships"};

    [[[dynamoDBObjectMapper scan:[TestObjectUserIdAndWins class] expression:lsiScanExpression] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: %@",task.error);
        }
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;

        NSArray *items = paginatedOutput.items;
        XCTAssertTrue([items count] > 0);

        for (TestObjectGameTitleAndTopScore *item in items) {
            XCTAssertEqualObjects(@"Attack Ships",item.GameTitle);
        }

        return nil;

    }] waitUntilFinished ];


    //Delete Table
    [AWSDynamoDBTestUtility deleteTable:tableName2];
}

- (void)testSaveBehaviorUpdateV2 {
    //Update
    AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    updateMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorUpdate; //which is the default value
    [AWSDynamoDBObjectMapper registerDynamoDBObjectMapperWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                 objectMapperConfiguration:updateMapperConfig
                                                                    forKey:@"testSaveBehaviorUpdateV2"];
    AWSDynamoDBObjectMapper *updateMapper = [AWSDynamoDBObjectMapper DynamoDBObjectMapperForKey:@"testSaveBehaviorUpdateV2"];

    NSString *hashKeyValue = [NSString stringWithFormat:@"hash-v2-%s",__FUNCTION__];
    NSString *rangeKeyValue = [NSString stringWithFormat:@"range-v2-%s",__FUNCTION__];

    NSData *binaryElement = [@"testData" dataUsingEncoding:NSUTF8StringEncoding];
    NSSet *stringSet = [NSSet setWithObjects:@"stringSet1",@"stringSet2",@"stringSet3",nil];
    NSSet *numberSet = [NSSet setWithObjects:@1,@2,@3, nil];
    NSSet *binarySet = [NSSet setWithObjects:[@"testDataSet1" dataUsingEncoding:NSUTF8StringEncoding],[@"testDataSet2" dataUsingEncoding:NSUTF8StringEncoding],[@"testDataSet3" dataUsingEncoding:NSUTF8StringEncoding], nil];
    NSNumber *bool2Element = @NO;
    NSArray *listElement = @[@"StringInList",@34,binaryElement,stringSet,numberSet,binarySet,@YES,@[@"stringInListOfList",@56]];
    NSDictionary *mapElement = @{@"mapStringKey":@"mapStringValue",
                                 @"mapNumberKey":@99,
                                 @"mapBinaryKey":binaryElement,
                                 @"mapStringSetKey":stringSet,
                                 @"mapNumberSetKey":numberSet,
                                 @"mapBinarySetKey":binarySet,
                                 @"mapBoolKey":@YES,
                                 @"mapListKey":listElement,
                                 @"mapMapKey":@{@"str":@"strValue",@"num":@5,@"lst":listElement}
                                 };

    NSArray *updatedListElement = @[@"updatedValue",@888,@NO,@[@"newlistOfList",@99]];
    NSDictionary *updatedMapElement = @{@"mapStringKey":@"updatedValue",
                                        @"mapNumberKey":@123456,
                                        @"mapBoolKey":@NO,
                                        @"mapListKey":updatedListElement,
                                        };

    TestObjectV2 *objv2 = [TestObjectV2 new];
    objv2.hashKey = hashKeyValue;
    objv2.rangeKey = rangeKeyValue;
    objv2.stringSetAttribute = stringSet;
    objv2.numberSetAttribute = numberSet;
    objv2.binarySetAttribute = binarySet;
    objv2.bool2Element = bool2Element;
    objv2.listElement = listElement;
    objv2.mapElement = mapElement;


    [[[[updateMapper save:objv2] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectV2 class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertEqual([task.result class], [TestObjectV2 class]);
        TestObjectV2 *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringSetAttribute, stringSet);
        XCTAssertEqualObjects(testObject.numberSetAttribute, numberSet);
        XCTAssertEqualObjects(testObject.binarySetAttribute, binarySet);
        XCTAssertEqualObjects(testObject.bool2Element, bool2Element);
        XCTAssertEqualObjects(testObject.listElement, listElement);
        XCTAssertEqualObjects(testObject.mapElement, mapElement);

        return nil;
    }] waitUntilFinished ];


    //change some value to it and make sure it can be updated
    TestObjectV2Small *objv2Small = [TestObjectV2Small new];
    objv2Small.hashKey = hashKeyValue;
    objv2Small.rangeKey = rangeKeyValue;
    objv2Small.stringSetAttribute = nil;
    objv2Small.binarySetAttribute = nil;
    objv2Small.mapElement = updatedMapElement;

    //numberSetAttribute, listElement ,bool2Element are unmodelled and should not be updated.

    [[[[updateMapper save:objv2Small] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectV2 class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertEqual([task.result class], [TestObjectV2 class]);
        TestObjectV2 *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringSetAttribute, nil);
        XCTAssertEqualObjects(testObject.numberSetAttribute, numberSet);
        XCTAssertEqualObjects(testObject.binarySetAttribute, nil);
        XCTAssertEqualObjects(testObject.bool2Element, bool2Element);
        XCTAssertEqualObjects(testObject.listElement, listElement);
        XCTAssertEqualObjects(testObject.mapElement, updatedMapElement);

        return nil;
    }] waitUntilFinished];
}
- (void)testSaveBehaviorUpdate {
    //Update
    AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    updateMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorUpdate; //which is the default value
    [AWSDynamoDBObjectMapper registerDynamoDBObjectMapperWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                 objectMapperConfiguration:updateMapperConfig
                                                                    forKey:@"testSaveBehaviorUpdate"];
    AWSDynamoDBObjectMapper *updateMapper = [AWSDynamoDBObjectMapper DynamoDBObjectMapperForKey:@"testSaveBehaviorUpdate"];

    NSString *hashKeyValue = [NSString stringWithFormat:@"hash-%s",__FUNCTION__];
    NSString *rangeKeyValue = [NSString stringWithFormat:@"range-%s",__FUNCTION__];
    NSString *stringAttributeValue = @"stringValue";
    NSNumber *numberAttributeValue = @1;
    NSSet *stringSet = [NSSet setWithArray:@[@"set1",@"set2",@"set3"]];
    NSSet *numberSet = [NSSet setWithArray:@[@1,@2,@3]];

    TestObjectFull *tobj = [TestObjectFull new];
    tobj.hashKey = hashKeyValue;
    tobj.rangeKey = rangeKeyValue;
    tobj.stringAttribute = stringAttributeValue;
    tobj.numberAttribute = numberAttributeValue;
    tobj.stringSetAttribute = stringSet;
    tobj.numberSetAttribute = numberSet;

    [[[[updateMapper save:tobj] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
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
        XCTAssertEqualObjects(testObject.numberSetAttribute, numberSet);

        return nil;
    }] waitUntilFinished ];


    //change some value to it and make sure nil can be updated.
    TestObject *subsetObj = [TestObject new];
    subsetObj.hashKey  = hashKeyValue;
    subsetObj.rangeKey = rangeKeyValue;
    subsetObj.stringAttribute = nil;
    subsetObj.numberAttribute = nil;
    //subsetObject doesn't have stringSetAttribute and numberSetAttribute, unmodeled attribute should not be updated.

    [[[[updateMapper save:subsetObj] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
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
        XCTAssertEqualObjects(testObject.stringSetAttribute, stringSet);
        XCTAssertEqualObjects(testObject.numberSetAttribute, numberSet);
        return nil;
    }] waitUntilFinished];
}

- (void)testSaveBehaviorUpdateSkipNullAttributeV2 {
    //Update
    AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    updateMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes;
    [AWSDynamoDBObjectMapper registerDynamoDBObjectMapperWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                 objectMapperConfiguration:updateMapperConfig
                                                                    forKey:@"testSaveBehaviorUpdateSkipNullAttributeV2"];
    AWSDynamoDBObjectMapper *updateMapper = [AWSDynamoDBObjectMapper DynamoDBObjectMapperForKey:@"testSaveBehaviorUpdateSkipNullAttributeV2"];

    NSString *hashKeyValue = [NSString stringWithFormat:@"hash-v2-%s",__FUNCTION__];
    NSString *rangeKeyValue = [NSString stringWithFormat:@"range-v2-%s",__FUNCTION__];

    NSData *binaryElement = [@"testData" dataUsingEncoding:NSUTF8StringEncoding];
    NSSet *stringSet = [NSSet setWithObjects:@"stringSet1",@"stringSet2",@"stringSet3",nil];
    NSSet *numberSet = [NSSet setWithObjects:@1,@2,@3, nil];
    NSSet *binarySet = [NSSet setWithObjects:[@"testDataSet1" dataUsingEncoding:NSUTF8StringEncoding],[@"testDataSet2" dataUsingEncoding:NSUTF8StringEncoding],[@"testDataSet3" dataUsingEncoding:NSUTF8StringEncoding], nil];
    NSNumber *bool2Element = @NO;
    NSArray *listElement = @[@"StringInList",@34,binaryElement,stringSet,numberSet,binarySet,@YES,@[@"stringInListOfList",@56]];
    NSDictionary *mapElement = @{@"mapStringKey":@"mapStringValue",
                                 @"mapNumberKey":@99,
                                 @"mapBinaryKey":binaryElement,
                                 @"mapStringSetKey":stringSet,
                                 @"mapNumberSetKey":numberSet,
                                 @"mapBinarySetKey":binarySet,
                                 @"mapBoolKey":@YES,
                                 @"mapListKey":listElement,
                                 @"mapMapKey":@{@"str":@"strValue",@"num":@5,@"lst":listElement}
                                 };

    TestObjectV2 *objv2 = [TestObjectV2 new];
    objv2.hashKey = hashKeyValue;
    objv2.rangeKey = rangeKeyValue;
    objv2.stringSetAttribute = stringSet;
    objv2.numberSetAttribute = numberSet;
    objv2.binarySetAttribute = binarySet;
    objv2.bool2Element = bool2Element;
    objv2.listElement = listElement;
    objv2.mapElement = mapElement;


    [[[[updateMapper save:objv2] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectV2 class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertEqual([task.result class], [TestObjectV2 class]);
        TestObjectV2 *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringSetAttribute, stringSet);
        XCTAssertEqualObjects(testObject.numberSetAttribute, numberSet);
        XCTAssertEqualObjects(testObject.binarySetAttribute, binarySet);
        XCTAssertEqualObjects(testObject.bool2Element, bool2Element);
        XCTAssertEqualObjects(testObject.listElement, listElement);
        XCTAssertEqualObjects(testObject.mapElement, mapElement);

        return nil;
    }] waitUntilFinished ];


    //change some value to it and make sure it won't be updated
    objv2.stringSetAttribute = nil;
    objv2.numberSetAttribute = nil;
    objv2.binarySetAttribute = nil;
    objv2.bool2Element = nil;
    objv2.listElement = nil;
    objv2.mapElement = nil;

    [[[[updateMapper save:objv2] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectV2 class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertEqual([task.result class], [TestObjectV2 class]);
        TestObjectV2 *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringSetAttribute, stringSet);
        XCTAssertEqualObjects(testObject.numberSetAttribute, numberSet);
        XCTAssertEqualObjects(testObject.binarySetAttribute, binarySet);
        XCTAssertEqualObjects(testObject.bool2Element, bool2Element);
        XCTAssertEqualObjects(testObject.listElement, listElement);
        XCTAssertEqualObjects(testObject.mapElement, mapElement);

        return nil;
    }] waitUntilFinished ];

}
- (void)testSaveBehaviorUpdateSkipNullAttribute {
    //Update
    AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    updateMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorUpdateSkipNullAttributes; // Update_Skip_Null_Attributes
    [AWSDynamoDBObjectMapper registerDynamoDBObjectMapperWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                 objectMapperConfiguration:updateMapperConfig
                                                                    forKey:@"testSaveBehaviorUpdateSkipNullAttribute"];
    AWSDynamoDBObjectMapper *updateMapper = [AWSDynamoDBObjectMapper DynamoDBObjectMapperForKey:@"testSaveBehaviorUpdateSkipNullAttribute"];

    NSString *hashKeyValue = [NSString stringWithFormat:@"hash-%s",__FUNCTION__];
    NSString *rangeKeyValue = [NSString stringWithFormat:@"range-%s",__FUNCTION__];
    NSString *stringAttributeValue = @"stringValue";
    NSNumber *numberAttributeValue = @1;
    NSSet *stringSet = [NSSet setWithArray:@[@"set1",@"set2",@"set3"]];
    NSSet *numberSet = [NSSet setWithArray:@[@1,@2,@3]];

    TestObjectFull *tobj = [TestObjectFull new];
    tobj.hashKey = hashKeyValue;
    tobj.rangeKey = rangeKeyValue;
    tobj.stringAttribute = stringAttributeValue;
    tobj.numberAttribute = numberAttributeValue;
    tobj.stringSetAttribute = stringSet;
    tobj.numberSetAttribute = numberSet;

    [[[[updateMapper save:tobj] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
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
        XCTAssertEqualObjects(testObject.numberSetAttribute, numberSet);

        return nil;
    }] waitUntilFinished ];


    //change some value to nil and make sure it won't be updated.
    tobj.stringAttribute = nil;
    tobj.numberAttribute = nil;
    tobj.stringSetAttribute = nil;
    tobj.numberSetAttribute = [NSSet setWithArray:@[@4,@5,@6]];

    [[[[updateMapper save:tobj] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
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
        XCTAssertEqualObjects(testObject.numberSetAttribute, [NSSet setWithArray:(@[@4,@5,@6])]);
        return nil;
    }] waitUntilFinished ];

}

- (void)testSaveBehaviorAppendSetV2 {
    //Update
    AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    updateMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorAppendSet;
    [AWSDynamoDBObjectMapper registerDynamoDBObjectMapperWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                 objectMapperConfiguration:updateMapperConfig
                                                                    forKey:@"testSaveBehaviorAppendSetV2"];
    AWSDynamoDBObjectMapper *updateMapper = [AWSDynamoDBObjectMapper DynamoDBObjectMapperForKey:@"testSaveBehaviorAppendSetV2"];

    NSString *hashKeyValue = [NSString stringWithFormat:@"hash-v2-%s",__FUNCTION__];
    NSString *rangeKeyValue = [NSString stringWithFormat:@"range-v2-%s",__FUNCTION__];

    NSData *binaryElement = [@"testData" dataUsingEncoding:NSUTF8StringEncoding];
    NSSet *stringSet = [NSSet setWithObjects:@"stringSet1",@"stringSet2",@"stringSet3",nil];
    NSSet *numberSet = [NSSet setWithObjects:@1,@2,@3, nil];
    NSSet *binarySet = [NSSet setWithObjects:[@"testDataSet1" dataUsingEncoding:NSUTF8StringEncoding],[@"testDataSet2" dataUsingEncoding:NSUTF8StringEncoding],[@"testDataSet3" dataUsingEncoding:NSUTF8StringEncoding], nil];
    NSNumber *bool2Element = @NO;
    NSArray *listElement = @[@"StringInList",@34,binaryElement,stringSet,numberSet,binarySet,@YES,@[@"stringInListOfList",@56]];
    NSDictionary *mapElement = @{@"mapStringKey":@"mapStringValue",
                                 @"mapNumberKey":@99,
                                 @"mapBinaryKey":binaryElement,
                                 @"mapStringSetKey":stringSet,
                                 @"mapNumberSetKey":numberSet,
                                 @"mapBinarySetKey":binarySet,
                                 @"mapBoolKey":@YES,
                                 @"mapListKey":listElement,
                                 @"mapMapKey":@{@"str":@"strValue",@"num":@5,@"lst":listElement}
                                 };


    TestObjectV2 *objv2 = [TestObjectV2 new];
    objv2.hashKey = hashKeyValue;
    objv2.rangeKey = rangeKeyValue;
    objv2.stringSetAttribute = stringSet;
    objv2.numberSetAttribute = numberSet;
    objv2.binarySetAttribute = binarySet;
    objv2.bool2Element = bool2Element;
    objv2.listElement = listElement;
    objv2.mapElement = mapElement;


    [[[[updateMapper save:objv2] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectV2 class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertEqual([task.result class], [TestObjectV2 class]);
        TestObjectV2 *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringSetAttribute, stringSet);
        XCTAssertEqualObjects(testObject.numberSetAttribute, numberSet);
        XCTAssertEqualObjects(testObject.binarySetAttribute, binarySet);
        XCTAssertEqualObjects(testObject.bool2Element, bool2Element);
        XCTAssertEqualObjects(testObject.listElement, listElement);
        XCTAssertEqualObjects(testObject.mapElement, mapElement);

        return nil;
    }] waitUntilFinished ];


    //change some stringSet and numberSEt and make sure it has been appended

    TestObjectV2 *newObjv2 = [TestObjectV2 new];
    newObjv2.hashKey = hashKeyValue;
    newObjv2.rangeKey = rangeKeyValue;
    newObjv2.stringSetAttribute = [NSSet setWithObjects:@"stringSet4",@"stringSet5",@"stringSet6",nil];
    newObjv2.numberSetAttribute = [NSSet setWithObjects:@4,@5,@6, nil];


    [[[[updateMapper save:newObjv2] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectV2 class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertEqual([task.result class], [TestObjectV2 class]);
        TestObjectV2 *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);

        XCTAssertEqualObjects(testObject.stringSetAttribute, ([NSSet setWithObjects:@"stringSet1",@"stringSet2",@"stringSet3",@"stringSet4",@"stringSet5",@"stringSet6",nil]));
        XCTAssertEqualObjects(testObject.numberSetAttribute, ([NSSet setWithObjects:@1,@2,@3,@4,@5,@6, nil]));
        XCTAssertEqualObjects(testObject.binarySetAttribute, binarySet);
        XCTAssertEqualObjects(testObject.bool2Element, bool2Element);
        XCTAssertEqualObjects(testObject.listElement, listElement);
        XCTAssertEqualObjects(testObject.mapElement, mapElement);

        return nil;
    }] waitUntilFinished ];
}

- (void)testSaveBehaviorAppendSet {
    //Update
    AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    updateMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorAppendSet; // Append_Set
    [AWSDynamoDBObjectMapper registerDynamoDBObjectMapperWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                 objectMapperConfiguration:updateMapperConfig
                                                                    forKey:@"testSaveBehaviorAppendSet"];
    AWSDynamoDBObjectMapper *updateMapper = [AWSDynamoDBObjectMapper DynamoDBObjectMapperForKey:@"testSaveBehaviorAppendSet"];

    NSString *hashKeyValue = [NSString stringWithFormat:@"hash-%s",__FUNCTION__];
    NSString *rangeKeyValue = [NSString stringWithFormat:@"range-%s",__FUNCTION__];
    NSString *stringAttributeValue = @"stringValue";
    NSNumber *numberAttributeValue = @1;
    NSSet *stringSet = [NSSet setWithArray:@[@"set1",@"set2",@"set3"]];
    NSSet *numberSet = [NSSet setWithArray:@[@1,@2,@3]];

    TestObjectFull *tobj = [TestObjectFull new];
    tobj.hashKey = hashKeyValue;
    tobj.rangeKey = rangeKeyValue;
    tobj.stringAttribute = stringAttributeValue;
    tobj.numberAttribute = numberAttributeValue;
    tobj.stringSetAttribute = stringSet;
    tobj.numberSetAttribute = numberSet;

    [[[[updateMapper save:tobj] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
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
        XCTAssertEqualObjects(testObject.numberSetAttribute, numberSet);

        return nil;
    }] waitUntilFinished ];


    //change some stringSet and numberSEt and make sure it has been appended

    tobj.stringSetAttribute = [NSSet setWithArray:@[@"set4",@"set5",@"set6"]];
    tobj.numberSetAttribute = [NSSet setWithArray:@[@4,@5,@6]];

    [[[[updateMapper save:tobj] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
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
        XCTAssertEqualObjects(testObject.stringSetAttribute, [NSSet setWithArray:(@[@"set1",@"set2",@"set3",@"set4",@"set5",@"set6"])]);
        XCTAssertEqualObjects(testObject.numberSetAttribute, [NSSet setWithArray:(@[@1,@2,@3,@4,@5,@6])]);
        return nil;
    }] waitUntilFinished ];

}

- (void)testSaveBehaviorClobberV2 {
    //Update
    AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    updateMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorClobber;
    [AWSDynamoDBObjectMapper registerDynamoDBObjectMapperWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                 objectMapperConfiguration:updateMapperConfig
                                                                    forKey:@"testSaveBehaviorClobberV2"];
    AWSDynamoDBObjectMapper *updateMapper = [AWSDynamoDBObjectMapper DynamoDBObjectMapperForKey:@"testSaveBehaviorClobberV2"];

    NSString *hashKeyValue = [NSString stringWithFormat:@"hash-v2-%s",__FUNCTION__];
    NSString *rangeKeyValue = [NSString stringWithFormat:@"range-v2-%s",__FUNCTION__];

    NSData *binaryElement = [@"testData" dataUsingEncoding:NSUTF8StringEncoding];
    NSSet *stringSet = [NSSet setWithObjects:@"stringSet1",@"stringSet2",@"stringSet3",nil];
    NSSet *numberSet = [NSSet setWithObjects:@1,@2,@3, nil];
    NSSet *binarySet = [NSSet setWithObjects:[@"testDataSet1" dataUsingEncoding:NSUTF8StringEncoding],[@"testDataSet2" dataUsingEncoding:NSUTF8StringEncoding],[@"testDataSet3" dataUsingEncoding:NSUTF8StringEncoding], nil];
    NSNumber *bool2Element = @NO;
    NSArray *listElement = @[@"StringInList",@34,binaryElement,stringSet,numberSet,binarySet,@YES,@[@"stringInListOfList",@56]];
    NSDictionary *mapElement = @{@"mapStringKey":@"mapStringValue",
                                 @"mapNumberKey":@99,
                                 @"mapBinaryKey":binaryElement,
                                 @"mapStringSetKey":stringSet,
                                 @"mapNumberSetKey":numberSet,
                                 @"mapBinarySetKey":binarySet,
                                 @"mapBoolKey":@YES,
                                 @"mapListKey":listElement,
                                 @"mapMapKey":@{@"str":@"strValue",@"num":@5,@"lst":listElement}
                                 };

    NSArray *updatedListElement = @[@"updatedValue",@888,@NO,@[@"newlistOfList",@99]];
    NSDictionary *updatedMapElement = @{@"mapStringKey":@"updatedValue",
                                        @"mapNumberKey":@123456,
                                        @"mapBoolKey":@NO,
                                        @"mapListKey":listElement,
                                        };

    TestObjectV2 *objv2 = [TestObjectV2 new];
    objv2.hashKey = hashKeyValue;
    objv2.rangeKey = rangeKeyValue;
    objv2.stringSetAttribute = stringSet;
    objv2.numberSetAttribute = numberSet;
    objv2.binarySetAttribute = binarySet;
    objv2.bool2Element = bool2Element;
    objv2.listElement = listElement;
    objv2.mapElement = mapElement;


    [[[[updateMapper save:objv2] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectV2 class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertEqual([task.result class], [TestObjectV2 class]);
        TestObjectV2 *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringSetAttribute, stringSet);
        XCTAssertEqualObjects(testObject.numberSetAttribute, numberSet);
        XCTAssertEqualObjects(testObject.binarySetAttribute, binarySet);
        XCTAssertEqualObjects(testObject.bool2Element, bool2Element);
        XCTAssertEqualObjects(testObject.listElement, listElement);
        XCTAssertEqualObjects(testObject.mapElement, mapElement);

        return nil;
    }] waitUntilFinished ];


    //change some value to it and make sure it can be updated
    TestObjectV2 *newObjv2 = [TestObjectV2 new];

    newObjv2.hashKey = hashKeyValue;
    newObjv2.rangeKey = rangeKeyValue;

    //objv2.stringSetAttribute = nil; //stringSetAttribute should be nil.
    newObjv2.numberSetAttribute = nil;
    newObjv2.binarySetAttribute = nil;
    newObjv2.bool2Element = @YES;
    newObjv2.listElement = updatedListElement;
    newObjv2.mapElement = updatedMapElement;

    [[[[updateMapper save:newObjv2] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectV2 class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertEqual([task.result class], [TestObjectV2 class]);
        TestObjectV2 *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);
        XCTAssertEqualObjects(testObject.stringSetAttribute, nil);
        XCTAssertEqualObjects(testObject.numberSetAttribute, nil);
        XCTAssertEqualObjects(testObject.binarySetAttribute, nil);

        XCTAssertEqualObjects(testObject.bool2Element, @YES);
        XCTAssertEqualObjects(testObject.listElement, updatedListElement);
        XCTAssertEqualObjects(testObject.mapElement, updatedMapElement);

        return nil;
    }] waitUntilFinished ];


}
- (void)testSaveBehaviorClobber {
    //Update
    AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    updateMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorClobber; //Clobber Type
    [AWSDynamoDBObjectMapper registerDynamoDBObjectMapperWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                 objectMapperConfiguration:updateMapperConfig
                                                                    forKey:@"testSaveBehaviorClobber"];
    AWSDynamoDBObjectMapper *updateMapper = [AWSDynamoDBObjectMapper DynamoDBObjectMapperForKey:@"testSaveBehaviorClobber"];

    NSString *hashKeyValue = [NSString stringWithFormat:@"hash-%s",__FUNCTION__];
    NSString *rangeKeyValue = [NSString stringWithFormat:@"range-%s",__FUNCTION__];
    NSString *stringAttributeValue = @"stringValue";
    NSNumber *numberAttributeValue = @1;
    NSSet *stringSet = [NSSet setWithArray:@[@"set1",@"set2",@"set3"]];
    NSSet *numberSet = [NSSet setWithArray:@[@1,@2,@3]];

    TestObjectFull *tobj = [TestObjectFull new];
    tobj.hashKey = hashKeyValue;
    tobj.rangeKey = rangeKeyValue;
    tobj.stringAttribute = stringAttributeValue;
    tobj.numberAttribute = numberAttributeValue;
    tobj.stringSetAttribute = stringSet;
    tobj.numberSetAttribute = numberSet;

    [[[[updateMapper save:tobj] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
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
        XCTAssertEqualObjects(testObject.numberSetAttribute, numberSet);

        return nil;
    }] waitUntilFinished ];


    //change some value to it and make sure it can be updated
    TestObject *replaceTestObject = [TestObject new];
    replaceTestObject.hashKey = hashKeyValue;
    replaceTestObject.rangeKey = rangeKeyValue;
    replaceTestObject.stringAttribute = @"string3";
    //numberAttributes is modelled and should be replaced to nil
    //numberSet and stringSet is unmodelled and will be replaced to nil as well.

    [[[[updateMapper save:replaceTestObject] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectFull class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
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
    [AWSDynamoDBTestUtility createTable:tableNameKeyOnly];

    //Behavior: Update (Default)
    AWSDynamoDBObjectMapperConfiguration *updateMapperConfig = [AWSDynamoDBObjectMapperConfiguration new];
    updateMapperConfig.saveBehavior = AWSDynamoDBObjectMapperSaveBehaviorUpdate; //which is the default
    [AWSDynamoDBObjectMapper registerDynamoDBObjectMapperWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                 objectMapperConfiguration:updateMapperConfig
                                                                    forKey:@"testSaveForKeyOnlyItem_updateMapper"];
    AWSDynamoDBObjectMapper *updateMapper = [AWSDynamoDBObjectMapper DynamoDBObjectMapperForKey:@"testSaveForKeyOnlyItem_updateMapper"];

    //save item with Key-Only attributes
    NSString *hashKeyValue = @"testHashKeyValue";
    NSString *rangeKeyValue = @"testRangeKeyValue";

    TestObjectKeyOnly *testObject = [TestObjectKeyOnly new];
    testObject.hashKey = hashKeyValue;
    testObject.rangeKey = rangeKeyValue;

    [[[[updateMapper save:testObject] continueWithBlock:^id(AWSTask *task) {

        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [updateMapper load:[TestObjectKeyOnly class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {

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
    [AWSDynamoDBObjectMapper registerDynamoDBObjectMapperWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration
                                                 objectMapperConfiguration:updateMapperConfig
                                                                    forKey:@"testSaveForKeyOnlyItem_clobberMapper"];
    AWSDynamoDBObjectMapper *clobberMapper = [AWSDynamoDBObjectMapper DynamoDBObjectMapperForKey:@"testSaveForKeyOnlyItem_clobberMapper"];

    rangeKeyValue = @"testRangeKeyValue2";
    TestObjectKeyOnly *testObjectClobber = [TestObjectKeyOnly new];
    testObjectClobber.hashKey = hashKeyValue;
    testObjectClobber.rangeKey = rangeKeyValue;

    [[[[clobberMapper save:testObjectClobber] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return [clobberMapper load:[TestObjectKeyOnly class] hashKey:hashKeyValue rangeKey:rangeKeyValue];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        XCTAssertEqual([task.result class], [TestObjectKeyOnly class]);
        TestObjectKeyOnly *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, hashKeyValue);
        XCTAssertEqualObjects(testObject.rangeKey, rangeKeyValue);

        return nil;
    }]waitUntilFinished];

    [AWSDynamoDBTestUtility deleteTable:tableNameKeyOnly];
}

- (void)testAll {
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];

    [[[[[[[[[[[AWSTask taskWithResult:nil] continueWithBlock:^id(AWSTask *task) {
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

        return [AWSTask taskForCompletionOfAllTasks:tasks];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        return [dynamoDBObjectMapper load:[TestObject class]
                                  hashKey:@"hash-key-01"
                                 rangeKey:@"range-05"];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertEqual([task.result class], [TestObject class]);
        TestObject *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, @"hash-key-01");
        XCTAssertEqualObjects(testObject.rangeKey, @"range-05");
        XCTAssertEqualObjects(testObject.stringAttribute, @"string-attr-05");
        XCTAssertEqualObjects(testObject.numberAttribute, @5);

        AWSDynamoDBScanExpression *expression = [AWSDynamoDBScanExpression new];
        return [dynamoDBObjectMapper scan:[TestObject class]
                               expression:expression];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
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

        return [AWSTask taskForCompletionOfAllTasks:tasks];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        AWSDynamoDBQueryExpression *queryExpression = [AWSDynamoDBQueryExpression new];
        queryExpression.hashKeyValues = @"hash-key-02";
#pragma clang diagnostic pop
        return [dynamoDBObjectMapper query:[TestObject class]
                                expression:queryExpression];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;

        NSMutableArray *tasks = [NSMutableArray new];
        for (TestObject *testObject in paginatedOutput.items) {
            XCTAssertTrue([testObject.numberAttribute doubleValue] >= 1000);
            XCTAssertNil(testObject.stringAttribute); //item should be removed for UPDATE behavior.
            [tasks addObject:[dynamoDBObjectMapper remove:testObject]];
        }

        return [AWSTask taskForCompletionOfAllTasks:tasks];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        AWSDynamoDBQueryExpression *queryExpression = [AWSDynamoDBQueryExpression new];
        queryExpression.hashKeyValues = @"invalid-key";
#pragma clang diagnostic pop
        return [dynamoDBObjectMapper query:[TestObject class]
                                expression:queryExpression];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPaginatedOutput class]]);
        AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
        XCTAssertEqual([paginatedOutput.items count], 0);
        
        return nil;
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
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
    
    [[[dynamoDBObjectMapper save:testObject] continueWithBlock:^id(AWSTask *task) {
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
