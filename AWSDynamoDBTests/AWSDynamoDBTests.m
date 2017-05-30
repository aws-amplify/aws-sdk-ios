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

NSString *const AWSDynamoDBTestTable1 = @"AWSSDKForiOSv2Test1";
NSString *const AWSDynamoDBTestTable2 = @"AWSSDKForiOSv2Test2";

@interface AWSDynamoDBTests : XCTestCase

@end

@implementation AWSDynamoDBTests

static NSString *table1Name = nil;
static NSString *table2Name = nil;

#pragma mark - Setups

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];

    NSTimeInterval timeIntervalSinceReferenceDate = [NSDate timeIntervalSinceReferenceDate];
    table1Name = [NSString stringWithFormat:@"%@-%f", AWSDynamoDBTestTable1, timeIntervalSinceReferenceDate];
    table2Name = [NSString stringWithFormat:@"%@-%f", AWSDynamoDBTestTable2, timeIntervalSinceReferenceDate];

    [self createTable:table1Name];
}

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

+ (void)tearDown {
    [super tearDown];

    [self deleteTable:table1Name];
}

#pragma mark - Utilities

+ (AWSTask *)waitForTableToBeActive:(NSString *)tableName {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSTask *task = [AWSTask taskWithResult:nil];
    for(int32_t i = 0; i < 16; i++) {
        task = [task continueWithSuccessBlock:^id(AWSTask *task) {
            if (task.result) {
                AWSDynamoDBDescribeTableOutput *describeTableOutput = task.result;
                AWSDynamoDBTableStatus tableStatus = describeTableOutput.table.tableStatus;
                if (tableStatus == AWSDynamoDBTableStatusActive) {
                    return task;
                }
            }

            sleep(5);

            AWSDynamoDBDescribeTableInput *describeTableInput = [AWSDynamoDBDescribeTableInput new];
            describeTableInput.tableName = tableName;
            return [dynamoDB describeTable:describeTableInput];
        }];
    }

    return task;
}

+ (AWSTask *)waitForTableToBeDeleted:(NSString *)tableName {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSTask *task = [AWSTask taskWithResult:nil];
    for(int32_t i = 0; i < 16; i ++) {
        task = [task continueWithSuccessBlock:^id(AWSTask *task) {
            sleep(5);

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
         ] continueWithBlock:^id(AWSTask *task) {
        if ([task.error.domain isEqualToString:AWSDynamoDBErrorDomain]
            && task.error.code == AWSDynamoDBErrorResourceNotFound) {
            AWSDynamoDBAttributeDefinition *attributeDefinition = [AWSDynamoDBAttributeDefinition new];
            attributeDefinition.attributeName = @"hashKey";
            attributeDefinition.attributeType = AWSDynamoDBScalarAttributeTypeS;

            AWSDynamoDBKeySchemaElement *keySchemaElement = [AWSDynamoDBKeySchemaElement new];
            keySchemaElement.attributeName = @"hashKey";
            keySchemaElement.keyType = AWSDynamoDBKeyTypeHash;

            AWSDynamoDBProvisionedThroughput *provisionedThroughput = [AWSDynamoDBProvisionedThroughput new];
            provisionedThroughput.readCapacityUnits = @1;
            provisionedThroughput.writeCapacityUnits = @1;

            AWSDynamoDBCreateTableInput *createTableInput = [AWSDynamoDBCreateTableInput new];
            createTableInput.tableName = tableName;
            createTableInput.attributeDefinitions = @[attributeDefinition];
            createTableInput.keySchema = @[keySchemaElement];
            createTableInput.provisionedThroughput = provisionedThroughput;

            return [dynamoDB createTable:createTableInput];
        }

        return nil;
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        return [self waitForTableToBeActive:tableName];
    }] continueWithBlock:^id(AWSTask *task) {
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
        ] continueWithSuccessBlock:^id(AWSTask *task) {
        return [self waitForTableToBeDeleted:tableName];
    }] continueWithBlock:^id(AWSTask *task) {
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

- (void)testClockSkewDynamoDB {
    [AWSTestUtility setupSwizzling];

    XCTAssertFalse([NSDate aws_getRuntimeClockSkew], @"current RunTimeClockSkew is not zero!");
    [AWSTestUtility setMockDate:[NSDate dateWithTimeIntervalSince1970:3600]];

    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];
    XCTAssertNotNil(dynamoDB);

    AWSDynamoDBListTablesInput *listTablesInput = [AWSDynamoDBListTablesInput new];

    [[[dynamoDB listTables:listTablesInput
       ] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"The request failed. error: [%@]", task.error);
        } else {
            AWSDynamoDBListTablesOutput *listTableOutput = task.result;
            XCTAssertNotNil(listTableOutput, @"AWSDynamoDBListTablesOutput should not be nil");
        }

        return nil;
    }] waitUntilFinished];

    [AWSTestUtility revertSwizzling];
}

- (void)testDescribeTable {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSDynamoDBDescribeTableInput *describeTableInput = [AWSDynamoDBDescribeTableInput new];
    describeTableInput.tableName = table1Name;

    [[[dynamoDB describeTable:describeTableInput
       ] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"The request failed. error: [%@]", task.error);
        } else {
            AWSDynamoDBDescribeTableOutput *describeTableOutput = task.result;
            AWSDynamoDBTableStatus tableStatus = describeTableOutput.table.tableStatus;
            XCTAssertEqual(tableStatus, AWSDynamoDBTableStatusActive);
        }

        return nil;
    }] waitUntilFinished];
}

/* Testing a cancelation of a quick request is not reliable.
- (void)testCancelDescribeTable {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSDynamoDBDescribeTableInput *describeTableInput = [AWSDynamoDBDescribeTableInput new];
    describeTableInput.tableName = table1Name;

    AWSTask *task = [[dynamoDB describeTable:describeTableInput] continueWithBlock:^id(AWSTask *task) {
        if (!([task.error.domain isEqualToString:NSURLErrorDomain]
              && task.error.code == NSURLErrorCancelled)) {
            XCTFail(@"Failed to cancel a request. task: [%@]", task);
        }

        return nil;
    }];

    [describeTableInput cancel];

    [task waitUntilFinished];
}
*/

- (void)testListTables {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSDynamoDBListTablesInput *listTablesInput = [AWSDynamoDBListTablesInput new];

    [[[dynamoDB listTables:listTablesInput
       ] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"The request failed. error: [%@]", task.error);
        } else {
            AWSDynamoDBListTablesOutput *listTableOutput = task.result;
            NSArray *tableNames = listTableOutput.tableNames;
            XCTAssertTrue([tableNames containsObject:table1Name]);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testPutItem {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSDynamoDBPutItemInput *putItemInput = [AWSDynamoDBPutItemInput new];
    putItemInput.tableName = table1Name;
    AWSDynamoDBAttributeValue *hashValue = [AWSDynamoDBAttributeValue new];
    hashValue.S = @"testPutItem";
    AWSDynamoDBAttributeValue *stringValue = [AWSDynamoDBAttributeValue new];
    stringValue.S = @"stringValue";
    AWSDynamoDBAttributeValue *stringSetValue = [AWSDynamoDBAttributeValue new];
    stringSetValue.SS = @[@"string1",@"string2",@"string3"];

    AWSDynamoDBAttributeValue *numberValue = [AWSDynamoDBAttributeValue new];
    numberValue.N = @"12345";

    AWSDynamoDBAttributeValue *numberSetValue = [AWSDynamoDBAttributeValue new];
    numberSetValue.NS = @[@"1",@"2",@"3",@"4",@"5"];

    AWSDynamoDBAttributeValue *binaryValue = [AWSDynamoDBAttributeValue new];
    binaryValue.B = [@"base64string" dataUsingEncoding:NSUTF8StringEncoding];

    AWSDynamoDBAttributeValue *binarySetValue = [AWSDynamoDBAttributeValue new];
    binarySetValue.BS = @[
                          [@"Base64!@#$% 1" dataUsingEncoding:NSUTF8StringEncoding],
                          [@"base64string" dataUsingEncoding:NSUTF8StringEncoding],
                          [@"Base64!@#$% 3" dataUsingEncoding:NSUTF8StringEncoding]
                          ];

    putItemInput.item = @{
                          @"hashKey" : hashValue,
                          @"stringKey" : stringValue,
                          @"stringSetKey" : stringSetValue,
                          @"numberKey" : numberValue,
                          @"numberSetKey" : numberSetValue,
                          @"binaryKey" : binaryValue,
                          @"binarySetKey" : binarySetValue,
                          };

    putItemInput.returnValues = AWSDynamoDBReturnValueAllOld;

    [[[dynamoDB putItem:putItemInput] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"The request failed. error: [%@]", task.error);
        } else {
            AWSDynamoDBPutItemOutput *putItemOutput = task.result;
            AWSDDLogDebug(@"Result of putItemOutput is:%@",[putItemOutput description]);
            //XCTAssertNotNil(putItemOutput, @"putItemOutput should NOT be nil!");
        }

        return nil;
    }] waitUntilFinished];
}

- (void) testGetItem {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    NSString *myKey = @"testPutItem";


    AWSDynamoDBPutItemInput *putItemInput = [AWSDynamoDBPutItemInput new];
    putItemInput.tableName = table1Name;

    AWSDynamoDBAttributeValue *hashValue = [AWSDynamoDBAttributeValue new];
    hashValue.S = myKey;
    AWSDynamoDBAttributeValue *stringValue = [AWSDynamoDBAttributeValue new];
    stringValue.S = @"stringValue";
    AWSDynamoDBAttributeValue *stringSetValue = [AWSDynamoDBAttributeValue new];
    stringSetValue.SS = @[@"string1",@"string2",@"string3"];

    AWSDynamoDBAttributeValue *numberValue = [AWSDynamoDBAttributeValue new];
    numberValue.N = @"12345";

    AWSDynamoDBAttributeValue *numberSetValue = [AWSDynamoDBAttributeValue new];
    numberSetValue.NS = @[@"1",@"2",@"3",@"4",@"5"];

    AWSDynamoDBAttributeValue *binaryValue = [AWSDynamoDBAttributeValue new];
    binaryValue.B = [@"base64string" dataUsingEncoding:NSUTF8StringEncoding];

    AWSDynamoDBAttributeValue *binarySetValue = [AWSDynamoDBAttributeValue new];
    binarySetValue.BS = @[
                          [@"Base64!@#$% 1" dataUsingEncoding:NSUTF8StringEncoding],
                          [@"base64string" dataUsingEncoding:NSUTF8StringEncoding],
                          [@"Base64!@#$% 3" dataUsingEncoding:NSUTF8StringEncoding]
                          ];

    AWSDynamoDBAttributeValue *nilValue = [AWSDynamoDBAttributeValue new];
    nilValue.NIL = @YES;

    AWSDynamoDBAttributeValue *boolValue = [AWSDynamoDBAttributeValue new];
    boolValue.BOOLEAN = @YES;

    AWSDynamoDBAttributeValue *arrayValue = [AWSDynamoDBAttributeValue new];
    AWSDynamoDBAttributeValue *arrayValueElement1 = [AWSDynamoDBAttributeValue new];
    arrayValueElement1.S = @"arrayValueElement1";
    AWSDynamoDBAttributeValue *arrayValueElement2 = [AWSDynamoDBAttributeValue new];
    arrayValueElement2.S = @"arrayValueElement2";
    arrayValue.L = @[arrayValueElement1, arrayValueElement2];

    AWSDynamoDBAttributeValue *dictionaryValue = [AWSDynamoDBAttributeValue new];
    AWSDynamoDBAttributeValue *dictionaryValueElement1 = [AWSDynamoDBAttributeValue new];
    dictionaryValueElement1.S = @"dictionaryValueElement1";
    AWSDynamoDBAttributeValue *dictionaryValueElement2 = [AWSDynamoDBAttributeValue new];
    dictionaryValueElement2.S = @"dictionaryValueElement2";
    dictionaryValue.M  = @{@"dictionaryValueElement1" : dictionaryValueElement1,
                           @"dictionaryValueElement2" : dictionaryValueElement2};

    putItemInput.item = @{
                          @"hashKey" : hashValue,
                          @"stringKey" : stringValue,
                          @"stringSetKey" : stringSetValue,
                          @"numberKey" : numberValue,
                          @"numberSetKey" : numberSetValue,
                          @"binaryKey" : binaryValue,
                          @"binarySetKey" : binarySetValue,
                          @"nilValue" : nilValue,
                          @"boolValue" : boolValue,
                          @"arrayValue" : arrayValue,
                          @"dictionaryValue" : dictionaryValue
                          };

    putItemInput.returnValues = AWSDynamoDBReturnValueAllOld;

    [[[[dynamoDB putItem:putItemInput] continueWithSuccessBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"The request failed. error: [%@]", task.error);
        }

        AWSDynamoDBGetItemInput *getItemInput = [AWSDynamoDBGetItemInput new];
        getItemInput.tableName = table1Name;

        AWSDynamoDBAttributeValue *hashValue = [AWSDynamoDBAttributeValue new];
        hashValue.S = myKey;

        getItemInput.key = @{@"hashKey": hashValue};

        return [dynamoDB getItem:getItemInput];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"The request failed. error: [%@]", task.error);
        } else {
            AWSDynamoDBGetItemOutput *getItemOutput = task.result;
            NSDictionary *items = getItemOutput.item;
            XCTAssertEqualObjects(hashValue, [items objectForKey:@"hashKey"]);
            XCTAssertEqualObjects(stringValue,[items objectForKey:@"stringKey"]);
            XCTAssertEqualObjects(stringSetValue,[items objectForKey:@"stringSetKey"]);
            XCTAssertEqualObjects(numberValue,[items objectForKey:@"numberKey"]);
            AWSDynamoDBAttributeValue *responseNumberSetValue = [items objectForKey:@"numberSetKey"];
            XCTAssertEqualObjects([NSSet setWithArray:numberSetValue.NS],[NSSet setWithArray:responseNumberSetValue.NS]);
            XCTAssertEqualObjects(binaryValue,[items objectForKey:@"binaryKey"]);
            AWSDynamoDBAttributeValue *responseBinarySetValue = [items objectForKey:@"binarySetKey"];
            XCTAssertEqualObjects([NSSet setWithArray:binarySetValue.BS],[NSSet setWithArray:responseBinarySetValue.BS]);
            XCTAssertEqualObjects(nilValue, [items objectForKey:@"nilValue"]);
            XCTAssertEqualObjects(boolValue, [items objectForKey:@"boolValue"]);

            XCTAssertEqualObjects(arrayValue, [items objectForKey:@"arrayValue"]);
            NSArray *arrayResponse = ((AWSDynamoDBAttributeValue *)[items objectForKey:@"arrayValue"]).L;
            XCTAssertTrue([arrayResponse count] == 2);
            XCTAssertEqualObjects(arrayValueElement1, arrayResponse[0]);
            XCTAssertEqualObjects(arrayValueElement2, arrayResponse[1]);

            XCTAssertEqualObjects(dictionaryValue, [items objectForKey:@"dictionaryValue"]);
            NSDictionary *dictionaryResponse = ((AWSDynamoDBAttributeValue *)[items objectForKey:@"dictionaryValue"]).M;
            XCTAssertTrue([dictionaryResponse count] == 2);
            XCTAssertEqualObjects(dictionaryValueElement1, dictionaryResponse[@"dictionaryValueElement1"]);
            XCTAssertEqualObjects(dictionaryValueElement2, dictionaryResponse[@"dictionaryValueElement2"]);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testDeleteItem {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSDynamoDBDeleteItemInput *deleteItemInput = [AWSDynamoDBDeleteItemInput new];
    deleteItemInput.tableName = table1Name;

    NSString *myKey = @"testGetItem";
    AWSDynamoDBAttributeValue *hashValue = [AWSDynamoDBAttributeValue new];
    hashValue.S = myKey;

    deleteItemInput.key = @{@"hashKey": hashValue};
    deleteItemInput.returnConsumedCapacity = AWSDynamoDBReturnConsumedCapacityTotal;
    deleteItemInput.returnItemCollectionMetrics = AWSDynamoDBReturnItemCollectionMetricsSize;

    [[[dynamoDB deleteItem:deleteItemInput
       ] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"The request failed. error: [%@]", task.error);
        } else {
            AWSDynamoDBDeleteItemOutput *deleteItemOutput = task.result;
            XCTAssertNotNil(deleteItemOutput.consumedCapacity, @"deleteItemOutput.consumedCapacity should not be NIL!");
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testQuery {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    NSString *myKey = @"testPutItemForQuery";
    NSString *myValue = @"otherValue";

    AWSDynamoDBPutItemInput *putItemInput = [AWSDynamoDBPutItemInput new];
    putItemInput.tableName = table1Name;
    AWSDynamoDBAttributeValue *hashValue = [AWSDynamoDBAttributeValue new];
    hashValue.S = myKey;
    AWSDynamoDBAttributeValue *otherValue = [AWSDynamoDBAttributeValue new];
    otherValue.S = myValue;
    putItemInput.item = @{
                          @"hashKey" : hashValue,
                          @"otherKey" : otherValue
                          };

    [[[[dynamoDB putItem:putItemInput
        ] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPutItemOutput class]], @"The response object is not a class of [%@]", NSStringFromClass([AWSDynamoDBPutItemOutput class]));

        AWSDynamoDBCondition *conditon = [AWSDynamoDBCondition new];
        conditon.attributeValueList = @[hashValue];
        conditon.comparisonOperator = AWSDynamoDBComparisonOperatorEQ;

        AWSDynamoDBQueryInput *queryInput = [AWSDynamoDBQueryInput new];
        queryInput.tableName = table1Name;
        queryInput.consistentRead = @YES;
        queryInput.keyConditions = @{@"hashKey": conditon};

        return [dynamoDB query:queryInput];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBQueryOutput class]], @"The response object is not a class of [%@]", NSStringFromClass([AWSDynamoDBQueryOutput class]));

        AWSDynamoDBQueryOutput *queryOutput = task.result;
        XCTAssertEqualObjects(queryOutput.count, @1, @"number of result from query is not equal to One");

        NSDictionary *itemDictionary = [queryOutput.items firstObject];

        XCTAssert([[itemDictionary objectForKey:@"hashKey"] isKindOfClass:[AWSDynamoDBAttributeValue class]], @"The response object is not a class of [%@]", NSStringFromClass([AWSDynamoDBAttributeValue class]));
        AWSDynamoDBAttributeValue *resultAttributeValueHashKey = [itemDictionary objectForKey:@"hashKey"];
        XCTAssertEqualObjects(resultAttributeValueHashKey, hashValue);

        XCTAssert([[itemDictionary objectForKey:@"otherKey"] isKindOfClass:[AWSDynamoDBAttributeValue class]], @"The response object is not a class of [%@]", NSStringFromClass([AWSDynamoDBAttributeValue class]));
        AWSDynamoDBAttributeValue *resultAttributeValueOtherKey = [itemDictionary objectForKey:@"otherKey"];
        XCTAssertEqualObjects(resultAttributeValueOtherKey, otherValue);

        return nil;
    }] waitUntilFinished];
}

- (void)testScan {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSDynamoDBScanInput *scanInput = [AWSDynamoDBScanInput new];
    scanInput.tableName = table1Name;

    NSString *key = @"testScan";

    //Put item
    AWSDynamoDBPutItemInput *putItemInput = [AWSDynamoDBPutItemInput new];
    putItemInput.tableName = table1Name;
    AWSDynamoDBAttributeValue *hashValue = [AWSDynamoDBAttributeValue new];
    hashValue.S = key;
    AWSDynamoDBAttributeValue *otherValue = [AWSDynamoDBAttributeValue new];
    otherValue.S = @"otherValue";
    putItemInput.item = @{
                          @"hashKey" : hashValue,
                          @"otherKey" : otherValue
                          };

    [[[[dynamoDB putItem:putItemInput
        ] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPutItemOutput class]], @"The response object is not a class of [%@]", NSStringFromClass([AWSDynamoDBPutItemOutput class]));

        return [dynamoDB scan:scanInput];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"Scan operation failed. error: [%@]", task.error);
        } else {
            AWSDynamoDBScanOutput *scanOutput = task.result;


            if ([scanOutput.count intValue] > 0) {
                NSArray *items = scanOutput.items;
                BOOL containsScanKey = NO;
                for(NSDictionary *entry in items){
                    if ([[entry objectForKey:@"hashKey"] isEqual:hashValue]){
                        containsScanKey = YES;
                    }
                }

                XCTAssertTrue(containsScanKey, @"Scan did not contain expected key");

            } else {
                XCTFail(@"Reponse object for scan returned with a count < 1.");
            }
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testUpdateItem {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    NSString *key = @"testUpdateItem";
    AWSDynamoDBAttributeValue *updatedValue = [AWSDynamoDBAttributeValue new];
    updatedValue.S = @"updatedValue";

    //Put item
    AWSDynamoDBPutItemInput *putItemInput = [AWSDynamoDBPutItemInput new];
    putItemInput.tableName = table1Name;
    AWSDynamoDBAttributeValue *hashValue = [AWSDynamoDBAttributeValue new];
    hashValue.S = key;
    AWSDynamoDBAttributeValue *otherValue = [AWSDynamoDBAttributeValue new];
    otherValue.S = @"otherValue";
    putItemInput.item = @{
                          @"hashKey" : hashValue,
                          @"otherKey" : otherValue
                          };

    [[[[dynamoDB putItem:putItemInput
        ] continueWithSuccessBlock:^id(AWSTask *task) {

        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPutItemOutput class]], @"The response object is not a class of [%@]", NSStringFromClass([AWSDynamoDBPutItemOutput class]));

        AWSDynamoDBUpdateItemInput *updateInput = [AWSDynamoDBUpdateItemInput new];
        updateInput.tableName = table1Name;
        updateInput.key = @{@"hashKey": hashValue};

        AWSDynamoDBAttributeValueUpdate *valueUpdate = [AWSDynamoDBAttributeValueUpdate new];
        valueUpdate.value = updatedValue;
        valueUpdate.action = AWSDynamoDBAttributeActionPut;

        updateInput.attributeUpdates = @{@"otherKey": valueUpdate};
        updateInput.returnValues = AWSDynamoDBReturnValueUpdatedNew;

        return [dynamoDB updateItem:updateInput];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"The request failed. error: [%@]", task.error);
        } else {
            AWSDynamoDBUpdateItemOutput *updateItemOutput = task.result;
            AWSDynamoDBAttributeValue *outputAttributeValue  = [updateItemOutput.attributes objectForKey:@"otherKey"];

            XCTAssertEqualObjects(outputAttributeValue, updatedValue);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testUpdateTable {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    if (![[self class] createTable:table2Name]) {
        XCTFail(@"failed to createTable: %@",table2Name);
    }

    NSNumber *newCapacity = @2;
    AWSDynamoDBProvisionedThroughput *provisionedThroughput = [AWSDynamoDBProvisionedThroughput new];
    provisionedThroughput.readCapacityUnits = newCapacity;
    provisionedThroughput.writeCapacityUnits = newCapacity;

    AWSDynamoDBUpdateTableInput *updateTableInput = [AWSDynamoDBUpdateTableInput new];
    updateTableInput.tableName = table2Name;
    updateTableInput.provisionedThroughput = provisionedThroughput;


    [[[[[dynamoDB updateTable:updateTableInput
         ] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        return [[self class] waitForTableToBeActive:table2Name];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        AWSDynamoDBDescribeTableInput *describeTableInput = [AWSDynamoDBDescribeTableInput new];
        describeTableInput.tableName = table2Name;

        return [dynamoDB describeTable:describeTableInput];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"The request failed. error: [%@]", task.error);
        } else {
            AWSDynamoDBDescribeTableOutput *describeTableOutput = task.result;
            AWSDynamoDBTableDescription *tableDescription = describeTableOutput.table;
            XCTAssertEqualObjects(tableDescription.provisionedThroughput.readCapacityUnits, provisionedThroughput.readCapacityUnits);
            XCTAssertEqualObjects(tableDescription.provisionedThroughput.writeCapacityUnits, provisionedThroughput.writeCapacityUnits);
        }
        return nil;
    }] waitUntilFinished];

    XCTAssertTrue([[self class] deleteTable:table2Name], @"Failed to delete table created for testing update table");
}

- (void)testBatchGetItem {
    NSString *key1 = @"putItemForBatch1";
    NSString *key2 = @"putItemForBatch2";
    AWSDynamoDBAttributeValue *attributeValue1 = [AWSDynamoDBAttributeValue new];
    attributeValue1.S = key1;
    AWSDynamoDBAttributeValue *attributeValue2 = [AWSDynamoDBAttributeValue new];
    attributeValue2.S = key2;

    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    //Put item
    AWSDynamoDBPutItemInput *putItemInput = [AWSDynamoDBPutItemInput new];
    putItemInput.tableName = table1Name;
    AWSDynamoDBAttributeValue *hashValue = [AWSDynamoDBAttributeValue new];
    hashValue.S = key1;
    AWSDynamoDBAttributeValue *otherValue = [AWSDynamoDBAttributeValue new];
    otherValue.S = @"otherValue";
    putItemInput.item = @{
                          @"hashKey" : hashValue,
                          @"otherKey" : otherValue
                          };

    [[[[[dynamoDB putItem:putItemInput
         ] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPutItemOutput class]], @"The response object is not a class of [%@]", NSStringFromClass([AWSDynamoDBPutItemOutput class]));

        //Put item
        AWSDynamoDBPutItemInput *putItemInput2 = [AWSDynamoDBPutItemInput new];
        putItemInput2.tableName = table1Name;
        AWSDynamoDBAttributeValue *hashValue2 = [AWSDynamoDBAttributeValue new];
        hashValue2.S = key2;
        AWSDynamoDBAttributeValue *otherValue2 = [AWSDynamoDBAttributeValue new];
        otherValue2.S = @"otherValue";
        putItemInput2.item = @{
                               @"hashKey" : hashValue2,
                               @"otherKey" : otherValue2
                               };
        return [dynamoDB putItem:putItemInput2];
    }] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBPutItemOutput class]], @"The response object is not a class of [%@]", NSStringFromClass([AWSDynamoDBPutItemOutput class]));

        AWSDynamoDBKeysAndAttributes *keysAndAttributes = [AWSDynamoDBKeysAndAttributes new];
        keysAndAttributes.keys = @[@{@"hashKey":attributeValue1},@{@"hashKey":attributeValue2}];
        keysAndAttributes.consistentRead = @YES;

        AWSDynamoDBBatchGetItemInput *batchGetItemInput = [AWSDynamoDBBatchGetItemInput new];
        batchGetItemInput.requestItems = @{table1Name: keysAndAttributes};


        return [dynamoDB batchGetItem:batchGetItemInput];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"The request failed. error: [%@]", task.error);
        } else {
            XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBBatchGetItemOutput class]], @"The response object is not a class of [%@]", NSStringFromClass([AWSDynamoDBBatchGetItemOutput class]));
            AWSDynamoDBBatchGetItemOutput *batchGetItemOutput = task.result;
            NSArray *attributeValueArray = [batchGetItemOutput.responses objectForKey:table1Name];

            BOOL key1Bool = NO;
            BOOL key2Bool = NO;
            for(NSDictionary *currentItem in attributeValueArray) {
                AWSDynamoDBAttributeValue *outputAttributeValue = [currentItem objectForKey:@"hashKey"];
                if ([outputAttributeValue isEqual:attributeValue1]) {
                    key1Bool = YES;
                }
                if ([outputAttributeValue isEqual:attributeValue2]) {
                    key2Bool = YES;
                }
            }

            XCTAssertTrue(key1Bool, @"Key1 was not found");
            XCTAssertTrue(key2Bool, @"Key 2 was not found");
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testBatchWriteItem {
    NSString *key1 = @"putItemForBatchWrite1";
    NSString *key2 = @"putItemForBatchWrite2";
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    //Write Request 1
    AWSDynamoDBAttributeValue *hashValue1 = [AWSDynamoDBAttributeValue new];
    hashValue1.S = key1;
    AWSDynamoDBAttributeValue *otherValue1 = [AWSDynamoDBAttributeValue new];
    otherValue1.S = @"otherValue";

    AWSDynamoDBWriteRequest *writeRequest = [AWSDynamoDBWriteRequest new];
    writeRequest.putRequest = [AWSDynamoDBPutRequest new];
    writeRequest.putRequest.item = @{
                                     @"hashKey" : hashValue1,
                                     @"otherKey" : otherValue1
                                     };

    //Write Request 2
    AWSDynamoDBAttributeValue *hashValue2 = [AWSDynamoDBAttributeValue new];
    hashValue2.S = key2;
    AWSDynamoDBAttributeValue *otherValue2 = [AWSDynamoDBAttributeValue new];
    otherValue2.S = @"otherValue";

    AWSDynamoDBWriteRequest *writeRequest2 = [AWSDynamoDBWriteRequest new];
    writeRequest2.putRequest = [AWSDynamoDBPutRequest new];
    writeRequest2.putRequest.item = @{
                                      @"hashKey" : hashValue2,
                                      @"otherKey" : otherValue2
                                      };

    AWSDynamoDBBatchWriteItemInput *batchWriteItemInput = [AWSDynamoDBBatchWriteItemInput new];
    batchWriteItemInput.requestItems = @{table1Name: @[writeRequest,writeRequest2]};
    batchWriteItemInput.returnConsumedCapacity = AWSDynamoDBReturnConsumedCapacityTotal;

    [[[dynamoDB batchWriteItem:batchWriteItemInput
       ] continueWithBlock:^id(AWSTask *task) {
        if (task.error) {
            XCTFail(@"The request failed. error: [%@]", task.error);
        } else {
            XCTAssertTrue([task.result isKindOfClass:[AWSDynamoDBBatchWriteItemOutput class]], @"The response object is not a class of [%@]", NSStringFromClass([AWSDynamoDBBatchWriteItemOutput class]));
            AWSDynamoDBBatchWriteItemOutput *batchWriteItemOutput = task.result;
            NSArray *consumedCapacity = batchWriteItemOutput.consumedCapacity;
            XCTAssertGreaterThan([consumedCapacity count], (NSUInteger)0);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testCreateAndDeleteTable {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

    AWSDynamoDBAttributeDefinition *attributeDefinition = [AWSDynamoDBAttributeDefinition new];
    attributeDefinition.attributeName = @"hashKey";
    attributeDefinition.attributeType = AWSDynamoDBScalarAttributeTypeS;

    AWSDynamoDBKeySchemaElement *keySchemaElement = [AWSDynamoDBKeySchemaElement new];
    keySchemaElement.attributeName = @"hashKey";
    keySchemaElement.keyType = AWSDynamoDBKeyTypeHash;

    AWSDynamoDBProvisionedThroughput *provisionedThroughput = [AWSDynamoDBProvisionedThroughput new];
    provisionedThroughput.readCapacityUnits = @1;
    provisionedThroughput.writeCapacityUnits = @1;

    AWSDynamoDBCreateTableInput *createTableInput = [AWSDynamoDBCreateTableInput new];
    createTableInput.tableName = table2Name;
    createTableInput.attributeDefinitions = @[attributeDefinition];
    createTableInput.keySchema = @[keySchemaElement];
    createTableInput.provisionedThroughput = provisionedThroughput;


    [[[[[[dynamoDB createTable:createTableInput
          ] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        AWSDynamoDBCreateTableOutput *createTableOutput = task.result;
        AWSDynamoDBTableDescription *tableDescription = createTableOutput.tableDescription;
        XCTAssertEqualObjects(tableDescription.tableName,table2Name);
        return [[self class] waitForTableToBeActive:table2Name];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        AWSDynamoDBDeleteTableInput *deleteTableInput = [AWSDynamoDBDeleteTableInput new];
        deleteTableInput.tableName = table2Name;
        return [dynamoDB deleteTable: deleteTableInput];
    }] continueWithSuccessBlock:^id(AWSTask *task) {
        XCTAssertNil(task.error);
        AWSDynamoDBDeleteTableOutput *deleteTableOutput = task.result;
        AWSDynamoDBTableDescription *tableDescription = deleteTableOutput.tableDescription;
        XCTAssertEqualObjects(tableDescription.tableName, table2Name);
        XCTAssertEqual(tableDescription.tableStatus, AWSDynamoDBTableStatusDeleting);

        return [[self class] waitForTableToBeDeleted:table2Name];
    }] continueWithBlock:^id(AWSTask *task) {
        if (task.error
            && (![task.error.domain isEqualToString:AWSDynamoDBErrorDomain]
                || task.error.code != AWSDynamoDBErrorResourceNotFound)) {
                XCTFail(@"The request failed. error: [%@]", task.error);
            }

        return nil;
    }] waitUntilFinished];
}

/*
 - (void)testThrottling {
 XCTAssertTrue([[self class] createTable:table2Name], @"Failed to create a table.");

 AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];

 NSMutableString *mutableString = [NSMutableString new];
 for(int32_t i = 0; i < 5000; i++) {
 [mutableString appendString:@"0123456789"];
 }

 AWSTask *task = [AWSTask taskWithResult:nil];

 for (int32_t i = 0; i < 200; i++) {
 task = [task continueWithSuccessBlock:^id(AWSTask *task) {
 //Put item
 AWSDynamoDBPutItemInput *putItemInput = [AWSDynamoDBPutItemInput new];
 putItemInput.tableName = table2Name;
 AWSDynamoDBAttributeValue *hashValue = [AWSDynamoDBAttributeValue new];
 hashValue.S = [NSString stringWithFormat:@"testPutItem%d", i];
 AWSDynamoDBAttributeValue *otherValue = [AWSDynamoDBAttributeValue new];
 otherValue.S = [NSString stringWithFormat:@"%@%d", mutableString, i];
 putItemInput.item = @{
 @"hashKey" : hashValue,
 @"otherKey" : otherValue
 };
 return [dynamoDB putItem:putItemInput];
 }];
 }
 
 [[task continueWithBlock:^id(AWSTask *task) {
 if (!task.error
 && !([task.error.domain isEqualToString:AWSDynamoDBErrorDomain]
 || task.error.code == AWSDynamoDBErrorProvisionedThroughputExceeded)) {
 XCTFail(@"Throttling didn't happen. result: [%@] error: [%@]", task.result, task.error);
 }
 
 return nil;
 }] waitUntilFinished];
 
 XCTAssertTrue([[self class] deleteTable:table2Name], @"Failed to delete a table.");
 }
 */

@end
