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

#import <XCTest/XCTest.h>
#import "DynamoDB.h"
#import "AWSTestUtility.h"

NSString *const AWSDynamoDBObjectMapperTestTable = @"DynamoDBOMTest";

static NSString *tableName = nil;

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

@interface AWSDynamoDBObjectMapperTests : XCTestCase

@end

@implementation AWSDynamoDBObjectMapperTests



+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];

    NSTimeInterval timeIntervalSinceReferenceDate = [NSDate timeIntervalSinceReferenceDate];
    tableName = [NSString stringWithFormat:@"%@-%f", AWSDynamoDBObjectMapperTestTable, timeIntervalSinceReferenceDate];

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

- (void)testItemForPutItemInput {
    TestObject *testObject = [TestObject new];
    testObject.hashKey = @"hash-12345";
    testObject.rangeKey = @"range-12345";
    testObject.stringAttribute = @"string-attr-12345";
    testObject.numberAttribute = @12345;

    NSDictionary *item = [testObject itemForPutItemInput];
    XCTAssertEqualObjects(((AWSDynamoDBAttributeValue *)item[@"hashKey"]).S, @"hash-12345");
    XCTAssertEqualObjects(((AWSDynamoDBAttributeValue *)item[@"rangeKey"]).S, @"range-12345");
    XCTAssertEqualObjects(((AWSDynamoDBAttributeValue *)item[@"stringAttribute"]).S, @"string-attr-12345");
    XCTAssertEqualObjects(((AWSDynamoDBAttributeValue *)item[@"numberAttribute"]).N, @"12345");
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
            testObject.numberAttribute = @([testObject.numberAttribute doubleValue] + 1000);
            [tasks addObject:[dynamoDBObjectMapper save:testObject]];
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
        for (id to in paginatedOutput.items) {
            [tasks addObject:[dynamoDBObjectMapper remove:to]];
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
        
        return nil;
    }] waitUntilFinished];
}

@end
