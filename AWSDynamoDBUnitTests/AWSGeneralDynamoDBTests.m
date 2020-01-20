//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

- (void)testCreateBackup {
    NSString *key = @"testCreateBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] createBackup:[AWSDynamoDBCreateBackupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testCreateBackupCompletionHandler {
    NSString *key = @"testCreateBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] createBackup:[AWSDynamoDBCreateBackupInput new] completionHandler:^(AWSDynamoDBCreateBackupOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testCreateGlobalTable {
    NSString *key = @"testCreateGlobalTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] createGlobalTable:[AWSDynamoDBCreateGlobalTableInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testCreateGlobalTableCompletionHandler {
    NSString *key = @"testCreateGlobalTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] createGlobalTable:[AWSDynamoDBCreateGlobalTableInput new] completionHandler:^(AWSDynamoDBCreateGlobalTableOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDeleteBackup {
    NSString *key = @"testDeleteBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] deleteBackup:[AWSDynamoDBDeleteBackupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDeleteBackupCompletionHandler {
    NSString *key = @"testDeleteBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] deleteBackup:[AWSDynamoDBDeleteBackupInput new] completionHandler:^(AWSDynamoDBDeleteBackupOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeBackup {
    NSString *key = @"testDescribeBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] describeBackup:[AWSDynamoDBDescribeBackupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDescribeBackupCompletionHandler {
    NSString *key = @"testDescribeBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] describeBackup:[AWSDynamoDBDescribeBackupInput new] completionHandler:^(AWSDynamoDBDescribeBackupOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeContinuousBackups {
    NSString *key = @"testDescribeContinuousBackups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] describeContinuousBackups:[AWSDynamoDBDescribeContinuousBackupsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDescribeContinuousBackupsCompletionHandler {
    NSString *key = @"testDescribeContinuousBackups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] describeContinuousBackups:[AWSDynamoDBDescribeContinuousBackupsInput new] completionHandler:^(AWSDynamoDBDescribeContinuousBackupsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeContributorInsights {
    NSString *key = @"testDescribeContributorInsights";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] describeContributorInsights:[AWSDynamoDBDescribeContributorInsightsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDescribeContributorInsightsCompletionHandler {
    NSString *key = @"testDescribeContributorInsights";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] describeContributorInsights:[AWSDynamoDBDescribeContributorInsightsInput new] completionHandler:^(AWSDynamoDBDescribeContributorInsightsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeEndpoints {
    NSString *key = @"testDescribeEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] describeEndpoints:[AWSDynamoDBDescribeEndpointsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDescribeEndpointsCompletionHandler {
    NSString *key = @"testDescribeEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] describeEndpoints:[AWSDynamoDBDescribeEndpointsRequest new] completionHandler:^(AWSDynamoDBDescribeEndpointsResponse* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeGlobalTable {
    NSString *key = @"testDescribeGlobalTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] describeGlobalTable:[AWSDynamoDBDescribeGlobalTableInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDescribeGlobalTableCompletionHandler {
    NSString *key = @"testDescribeGlobalTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] describeGlobalTable:[AWSDynamoDBDescribeGlobalTableInput new] completionHandler:^(AWSDynamoDBDescribeGlobalTableOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeGlobalTableSettings {
    NSString *key = @"testDescribeGlobalTableSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] describeGlobalTableSettings:[AWSDynamoDBDescribeGlobalTableSettingsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDescribeGlobalTableSettingsCompletionHandler {
    NSString *key = @"testDescribeGlobalTableSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] describeGlobalTableSettings:[AWSDynamoDBDescribeGlobalTableSettingsInput new] completionHandler:^(AWSDynamoDBDescribeGlobalTableSettingsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeTableReplicaAutoScaling {
    NSString *key = @"testDescribeTableReplicaAutoScaling";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] describeTableReplicaAutoScaling:[AWSDynamoDBDescribeTableReplicaAutoScalingInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDescribeTableReplicaAutoScalingCompletionHandler {
    NSString *key = @"testDescribeTableReplicaAutoScaling";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] describeTableReplicaAutoScaling:[AWSDynamoDBDescribeTableReplicaAutoScalingInput new] completionHandler:^(AWSDynamoDBDescribeTableReplicaAutoScalingOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeTimeToLive {
    NSString *key = @"testDescribeTimeToLive";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] describeTimeToLive:[AWSDynamoDBDescribeTimeToLiveInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testDescribeTimeToLiveCompletionHandler {
    NSString *key = @"testDescribeTimeToLive";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] describeTimeToLive:[AWSDynamoDBDescribeTimeToLiveInput new] completionHandler:^(AWSDynamoDBDescribeTimeToLiveOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testListBackups {
    NSString *key = @"testListBackups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] listBackups:[AWSDynamoDBListBackupsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testListBackupsCompletionHandler {
    NSString *key = @"testListBackups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] listBackups:[AWSDynamoDBListBackupsInput new] completionHandler:^(AWSDynamoDBListBackupsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testListContributorInsights {
    NSString *key = @"testListContributorInsights";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] listContributorInsights:[AWSDynamoDBListContributorInsightsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testListContributorInsightsCompletionHandler {
    NSString *key = @"testListContributorInsights";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] listContributorInsights:[AWSDynamoDBListContributorInsightsInput new] completionHandler:^(AWSDynamoDBListContributorInsightsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testListGlobalTables {
    NSString *key = @"testListGlobalTables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] listGlobalTables:[AWSDynamoDBListGlobalTablesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testListGlobalTablesCompletionHandler {
    NSString *key = @"testListGlobalTables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] listGlobalTables:[AWSDynamoDBListGlobalTablesInput new] completionHandler:^(AWSDynamoDBListGlobalTablesOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testListTagsOfResource {
    NSString *key = @"testListTagsOfResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] listTagsOfResource:[AWSDynamoDBListTagsOfResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testListTagsOfResourceCompletionHandler {
    NSString *key = @"testListTagsOfResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] listTagsOfResource:[AWSDynamoDBListTagsOfResourceInput new] completionHandler:^(AWSDynamoDBListTagsOfResourceOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testRestoreTableFromBackup {
    NSString *key = @"testRestoreTableFromBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] restoreTableFromBackup:[AWSDynamoDBRestoreTableFromBackupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testRestoreTableFromBackupCompletionHandler {
    NSString *key = @"testRestoreTableFromBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] restoreTableFromBackup:[AWSDynamoDBRestoreTableFromBackupInput new] completionHandler:^(AWSDynamoDBRestoreTableFromBackupOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testRestoreTableToPointInTime {
    NSString *key = @"testRestoreTableToPointInTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] restoreTableToPointInTime:[AWSDynamoDBRestoreTableToPointInTimeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testRestoreTableToPointInTimeCompletionHandler {
    NSString *key = @"testRestoreTableToPointInTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] restoreTableToPointInTime:[AWSDynamoDBRestoreTableToPointInTimeInput new] completionHandler:^(AWSDynamoDBRestoreTableToPointInTimeOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] tagResource:[AWSDynamoDBTagResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] tagResource:[AWSDynamoDBTagResourceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testTransactGetItems {
    NSString *key = @"testTransactGetItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] transactGetItems:[AWSDynamoDBTransactGetItemsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testTransactGetItemsCompletionHandler {
    NSString *key = @"testTransactGetItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] transactGetItems:[AWSDynamoDBTransactGetItemsInput new] completionHandler:^(AWSDynamoDBTransactGetItemsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testTransactWriteItems {
    NSString *key = @"testTransactWriteItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] transactWriteItems:[AWSDynamoDBTransactWriteItemsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testTransactWriteItemsCompletionHandler {
    NSString *key = @"testTransactWriteItems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] transactWriteItems:[AWSDynamoDBTransactWriteItemsInput new] completionHandler:^(AWSDynamoDBTransactWriteItemsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] untagResource:[AWSDynamoDBUntagResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] untagResource:[AWSDynamoDBUntagResourceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testUpdateContinuousBackups {
    NSString *key = @"testUpdateContinuousBackups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] updateContinuousBackups:[AWSDynamoDBUpdateContinuousBackupsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testUpdateContinuousBackupsCompletionHandler {
    NSString *key = @"testUpdateContinuousBackups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] updateContinuousBackups:[AWSDynamoDBUpdateContinuousBackupsInput new] completionHandler:^(AWSDynamoDBUpdateContinuousBackupsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testUpdateContributorInsights {
    NSString *key = @"testUpdateContributorInsights";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] updateContributorInsights:[AWSDynamoDBUpdateContributorInsightsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testUpdateContributorInsightsCompletionHandler {
    NSString *key = @"testUpdateContributorInsights";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] updateContributorInsights:[AWSDynamoDBUpdateContributorInsightsInput new] completionHandler:^(AWSDynamoDBUpdateContributorInsightsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testUpdateGlobalTable {
    NSString *key = @"testUpdateGlobalTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] updateGlobalTable:[AWSDynamoDBUpdateGlobalTableInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testUpdateGlobalTableCompletionHandler {
    NSString *key = @"testUpdateGlobalTable";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] updateGlobalTable:[AWSDynamoDBUpdateGlobalTableInput new] completionHandler:^(AWSDynamoDBUpdateGlobalTableOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testUpdateGlobalTableSettings {
    NSString *key = @"testUpdateGlobalTableSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] updateGlobalTableSettings:[AWSDynamoDBUpdateGlobalTableSettingsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testUpdateGlobalTableSettingsCompletionHandler {
    NSString *key = @"testUpdateGlobalTableSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] updateGlobalTableSettings:[AWSDynamoDBUpdateGlobalTableSettingsInput new] completionHandler:^(AWSDynamoDBUpdateGlobalTableSettingsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testUpdateTableReplicaAutoScaling {
    NSString *key = @"testUpdateTableReplicaAutoScaling";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] updateTableReplicaAutoScaling:[AWSDynamoDBUpdateTableReplicaAutoScalingInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testUpdateTableReplicaAutoScalingCompletionHandler {
    NSString *key = @"testUpdateTableReplicaAutoScaling";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] updateTableReplicaAutoScaling:[AWSDynamoDBUpdateTableReplicaAutoScalingInput new] completionHandler:^(AWSDynamoDBUpdateTableReplicaAutoScalingOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testUpdateTimeToLive {
    NSString *key = @"testUpdateTimeToLive";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDynamoDB DynamoDBForKey:key] updateTimeToLive:[AWSDynamoDBUpdateTimeToLiveInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDynamoDB removeDynamoDBForKey:key];
}

- (void)testUpdateTimeToLiveCompletionHandler {
    NSString *key = @"testUpdateTimeToLive";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDynamoDB registerDynamoDBWithConfiguration:configuration forKey:key];

    AWSDynamoDB *awsClient = [AWSDynamoDB DynamoDBForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDynamoDB DynamoDBForKey:key] updateTimeToLive:[AWSDynamoDBUpdateTimeToLiveInput new] completionHandler:^(AWSDynamoDBUpdateTimeToLiveOutput* _Nullable response, NSError * _Nullable error) {
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
