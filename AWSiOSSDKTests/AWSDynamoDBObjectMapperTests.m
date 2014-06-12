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

#if AWS_TEST_DYNAMODB_OBJECT_MAPPER

#import <XCTest/XCTest.h>
#import "DynamoDB.h"

NSString *const AWSDynamoDBObjectMapperTestTable = @"matsuday-test-table";

@interface TestObject : AWSDynamoDBModel <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *hashKey;
@property (nonatomic, strong) NSString *rangeKey;
@property (nonatomic, strong) NSString *stringAttribute;
@property (nonatomic, strong) NSNumber *numberAttribute;

@end

@implementation TestObject

+ (NSString *)dynamoDBTableName {
    return AWSDynamoDBObjectMapperTestTable;
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

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

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

    [[[[[[[[[BFTask taskWithResult:nil] continueWithBlock:^id(BFTask *task) {
        NSMutableArray *tasks = [NSMutableArray new];

        for (int32_t i = 0; i < 20; i++) {
            TestObject *testObject = [TestObject new];
            testObject.hashKey = @"hash-key";
            testObject.rangeKey = [NSString stringWithFormat:@"range-%02d", i];
            testObject.stringAttribute = [NSString stringWithFormat:@"string-attr-%02d", i];
            testObject.numberAttribute = @(i);

            [tasks addObject:[dynamoDBObjectMapper save:testObject]];
        }

        return [BFTask taskForCompletionOfAllTasks:tasks];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        return [dynamoDBObjectMapper load:[TestObject class]
                                  hashKey:@"hash-key"
                                 rangeKey:@"range-05"];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        XCTAssertEqual([task.result class], [TestObject class]);
        TestObject *testObject = task.result;
        XCTAssertEqualObjects(testObject.hashKey, @"hash-key");
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
        queryExpression.hashKeyValues = @"hash-key";
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
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        return nil;
    }] waitUntilFinished];
}

@end

#endif
