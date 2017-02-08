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

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "AWSTestUtility.h"
#import "AWSDynamoDBService.h"

static id mockNetworking = nil;

@interface AWSGeneralDynamoDBTests : XCTestCase

@end

@implementation AWSGeneralDynamoDBTests

- (void)setUp {
    [super setUp];
    [AWSTestUtility setupFakeCognitoCredentialsProvider];

    mockNetworking = OCMClassMock([AWSNetworking class]);
    AWSTask *errorTask = [AWSTask taskWithError:[NSError errorWithDomain:@"OCMockExpectedNetworkingError" code:8848 userInfo:nil]];
    OCMStub([mockNetworking sendRequest:[OCMArg isKindOfClass:[AWSNetworkingRequest class]]]).andReturn(errorTask);
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
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] batchGetItem:[AWSDynamoDBBatchGetItemInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testBatchGetItemCompletionHandler {
    NSString *key = @"testBatchGetItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] batchGetItem:[AWSDynamoDBBatchGetItemInput new] completionHandler:^(AWSDynamoDBBatchGetItemOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testBatchWriteItem {
    NSString *key = @"testBatchWriteItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] batchWriteItem:[AWSDynamoDBBatchWriteItemInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testBatchWriteItemCompletionHandler {
    NSString *key = @"testBatchWriteItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] batchWriteItem:[AWSDynamoDBBatchWriteItemInput new] completionHandler:^(AWSDynamoDBBatchWriteItemOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testCreateTable {
    NSString *key = @"testCreateTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] createTable:[AWSDynamoDBCreateTableInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testCreateTableCompletionHandler {
    NSString *key = @"testCreateTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] createTable:[AWSDynamoDBCreateTableInput new] completionHandler:^(AWSDynamoDBCreateTableOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDeleteItem {
    NSString *key = @"testDeleteItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] deleteItem:[AWSDynamoDBDeleteItemInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDeleteItemCompletionHandler {
    NSString *key = @"testDeleteItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] deleteItem:[AWSDynamoDBDeleteItemInput new] completionHandler:^(AWSDynamoDBDeleteItemOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDeleteTable {
    NSString *key = @"testDeleteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] deleteTable:[AWSDynamoDBDeleteTableInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDeleteTableCompletionHandler {
    NSString *key = @"testDeleteTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] deleteTable:[AWSDynamoDBDeleteTableInput new] completionHandler:^(AWSDynamoDBDeleteTableOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDescribeLimits {
    NSString *key = @"testDescribeLimits";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] describeLimits:[AWSDynamoDBDescribeLimitsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDescribeLimitsCompletionHandler {
    NSString *key = @"testDescribeLimits";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] describeLimits:[AWSDynamoDBDescribeLimitsInput new] completionHandler:^(AWSDynamoDBDescribeLimitsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDescribeTable {
    NSString *key = @"testDescribeTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] describeTable:[AWSDynamoDBDescribeTableInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDescribeTableCompletionHandler {
    NSString *key = @"testDescribeTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] describeTable:[AWSDynamoDBDescribeTableInput new] completionHandler:^(AWSDynamoDBDescribeTableOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testGetItem {
    NSString *key = @"testGetItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] getItem:[AWSDynamoDBGetItemInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testGetItemCompletionHandler {
    NSString *key = @"testGetItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] getItem:[AWSDynamoDBGetItemInput new] completionHandler:^(AWSDynamoDBGetItemOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testListTables {
    NSString *key = @"testListTables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] listTables:[AWSDynamoDBListTablesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testListTablesCompletionHandler {
    NSString *key = @"testListTables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] listTables:[AWSDynamoDBListTablesInput new] completionHandler:^(AWSDynamoDBListTablesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testPutItem {
    NSString *key = @"testPutItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] putItem:[AWSDynamoDBPutItemInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testPutItemCompletionHandler {
    NSString *key = @"testPutItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] putItem:[AWSDynamoDBPutItemInput new] completionHandler:^(AWSDynamoDBPutItemOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testQuery {
    NSString *key = @"testQuery";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] query:[AWSDynamoDBQueryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testQueryCompletionHandler {
    NSString *key = @"testQuery";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] query:[AWSDynamoDBQueryInput new] completionHandler:^(AWSDynamoDBQueryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testScan {
    NSString *key = @"testScan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] scan:[AWSDynamoDBScanInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testScanCompletionHandler {
    NSString *key = @"testScan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] scan:[AWSDynamoDBScanInput new] completionHandler:^(AWSDynamoDBScanOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testUpdateItem {
    NSString *key = @"testUpdateItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] updateItem:[AWSDynamoDBUpdateItemInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testUpdateItemCompletionHandler {
    NSString *key = @"testUpdateItem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] updateItem:[AWSDynamoDBUpdateItemInput new] completionHandler:^(AWSDynamoDBUpdateItemOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testUpdateTable {
    NSString *key = @"testUpdateTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] updateTable:[AWSDynamoDBUpdateTableInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testUpdateTableCompletionHandler {
    NSString *key = @"testUpdateTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] updateTable:[AWSDynamoDBUpdateTableInput new] completionHandler:^(AWSDynamoDBUpdateTableOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

@end
