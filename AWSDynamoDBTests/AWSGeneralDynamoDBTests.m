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

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AWSTestUtility.h"
#import "AWSDynamoDB.h"

@interface AWSGeneralDynamoDBTests : XCTestCase

@end

@implementation AWSGeneralDynamoDBTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructors {
    NSString *key = @"testDynamoDBConstructors";
    XCTAssertNotNil([AWSDynamoDB defaultDynamoDB]);
    XCTAssertEqual([[AWSDynamoDB defaultDynamoDB] class], [AWSDynamoDB class]);
    XCTAssertNil([AWSDynamoDB DynamoDBForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSDynamoDB DynamoDBForKey:key]);
    XCTAssertEqual([[AWSDynamoDB DynamoDBForKey:key] class], [AWSDynamoDB class]);
    XCTAssertEqual([AWSDynamoDB DynamoDBForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSDynamoDB removeDynamoDBForKey:key];
    XCTAssertNil([AWSDynamoDB DynamoDBForKey:key]);

}

- (void)testBatchGetItem {
    NSString *key = @"testBatchGetItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    [[[[AWSDynamoDB DynamoDBForKey:key] batchGetItem:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testBatchWriteItem {
    NSString *key = @"testBatchWriteItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    [[[[AWSDynamoDB DynamoDBForKey:key] batchWriteItem:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testCreateTable {
    NSString *key = @"testCreateTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    [[[[AWSDynamoDB DynamoDBForKey:key] createTable:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDeleteItem {
    NSString *key = @"testDeleteItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    [[[[AWSDynamoDB DynamoDBForKey:key] deleteItem:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDeleteTable {
    NSString *key = @"testDeleteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    [[[[AWSDynamoDB DynamoDBForKey:key] deleteTable:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDescribeTable {
    NSString *key = @"testDescribeTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    [[[[AWSDynamoDB DynamoDBForKey:key] describeTable:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testGetItem {
    NSString *key = @"testGetItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    [[[[AWSDynamoDB DynamoDBForKey:key] getItem:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testListTables {
    NSString *key = @"testListTables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    [[[[AWSDynamoDB DynamoDBForKey:key] listTables:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testPutItem {
    NSString *key = @"testPutItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    [[[[AWSDynamoDB DynamoDBForKey:key] putItem:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testQuery {
    NSString *key = @"testQuery";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    [[[[AWSDynamoDB DynamoDBForKey:key] query:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testScan {
    NSString *key = @"testScan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    [[[[AWSDynamoDB DynamoDBForKey:key] scan:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testUpdateItem {
    NSString *key = @"testUpdateItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    [[[[AWSDynamoDB DynamoDBForKey:key] updateItem:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testUpdateTable {
    NSString *key = @"testUpdateTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    [[[[AWSDynamoDB DynamoDBForKey:key] updateTable:nil] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertNil(task.exception);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    [AWSDynamoDB removeDynamoDBForKey:key];
}

@end
