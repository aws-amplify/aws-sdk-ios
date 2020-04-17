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
#import "AWSopsworks-cmService.h"

static id mockNetworking = nil;

@interface AWSGeneralopsworks-cmTests : XCTestCase

@end

@implementation AWSGeneralopsworks-cmTests

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
    NSString *key = @"testopsworks-cmConstructors";
    XCTAssertNotNil([AWSopsworks-cm defaultopsworks-cm]);
    XCTAssertEqual([[AWSopsworks-cm defaultopsworks-cm] class], [AWSopsworks-cm class]);
    XCTAssertNil([AWSopsworks-cm opsworks-cmForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSopsworks-cm opsworks-cmForKey:key]);
    XCTAssertEqual([[AWSopsworks-cm opsworks-cmForKey:key] class], [AWSopsworks-cm class]);
    XCTAssertEqual([AWSopsworks-cm opsworks-cmForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
    XCTAssertNil([AWSopsworks-cm opsworks-cmForKey:key]);

}

- (void)testAssociateNode {
    NSString *key = @"testAssociateNode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] associateNode:[AWSopsworks-cmAssociateNodeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testAssociateNodeCompletionHandler {
    NSString *key = @"testAssociateNode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] associateNode:[AWSopsworks-cmAssociateNodeRequest new] completionHandler:^(AWSopsworks-cmAssociateNodeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testCreateBackup {
    NSString *key = @"testCreateBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] createBackup:[AWSopsworks-cmCreateBackupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testCreateBackupCompletionHandler {
    NSString *key = @"testCreateBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] createBackup:[AWSopsworks-cmCreateBackupRequest new] completionHandler:^(AWSopsworks-cmCreateBackupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testCreateServer {
    NSString *key = @"testCreateServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] createServer:[AWSopsworks-cmCreateServerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testCreateServerCompletionHandler {
    NSString *key = @"testCreateServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] createServer:[AWSopsworks-cmCreateServerRequest new] completionHandler:^(AWSopsworks-cmCreateServerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDeleteBackup {
    NSString *key = @"testDeleteBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] deleteBackup:[AWSopsworks-cmDeleteBackupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDeleteBackupCompletionHandler {
    NSString *key = @"testDeleteBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] deleteBackup:[AWSopsworks-cmDeleteBackupRequest new] completionHandler:^(AWSopsworks-cmDeleteBackupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDeleteServer {
    NSString *key = @"testDeleteServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] deleteServer:[AWSopsworks-cmDeleteServerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDeleteServerCompletionHandler {
    NSString *key = @"testDeleteServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] deleteServer:[AWSopsworks-cmDeleteServerRequest new] completionHandler:^(AWSopsworks-cmDeleteServerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDescribeAccountAttributes {
    NSString *key = @"testDescribeAccountAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] describeAccountAttributes:[AWSopsworks-cmDescribeAccountAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDescribeAccountAttributesCompletionHandler {
    NSString *key = @"testDescribeAccountAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] describeAccountAttributes:[AWSopsworks-cmDescribeAccountAttributesRequest new] completionHandler:^(AWSopsworks-cmDescribeAccountAttributesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDescribeBackups {
    NSString *key = @"testDescribeBackups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] describeBackups:[AWSopsworks-cmDescribeBackupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDescribeBackupsCompletionHandler {
    NSString *key = @"testDescribeBackups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] describeBackups:[AWSopsworks-cmDescribeBackupsRequest new] completionHandler:^(AWSopsworks-cmDescribeBackupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDescribeEvents {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] describeEvents:[AWSopsworks-cmDescribeEventsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDescribeEventsCompletionHandler {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] describeEvents:[AWSopsworks-cmDescribeEventsRequest new] completionHandler:^(AWSopsworks-cmDescribeEventsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDescribeNodeAssociationStatus {
    NSString *key = @"testDescribeNodeAssociationStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] describeNodeAssociationStatus:[AWSopsworks-cmDescribeNodeAssociationStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDescribeNodeAssociationStatusCompletionHandler {
    NSString *key = @"testDescribeNodeAssociationStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] describeNodeAssociationStatus:[AWSopsworks-cmDescribeNodeAssociationStatusRequest new] completionHandler:^(AWSopsworks-cmDescribeNodeAssociationStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDescribeServers {
    NSString *key = @"testDescribeServers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] describeServers:[AWSopsworks-cmDescribeServersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDescribeServersCompletionHandler {
    NSString *key = @"testDescribeServers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] describeServers:[AWSopsworks-cmDescribeServersRequest new] completionHandler:^(AWSopsworks-cmDescribeServersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDisassociateNode {
    NSString *key = @"testDisassociateNode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] disassociateNode:[AWSopsworks-cmDisassociateNodeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testDisassociateNodeCompletionHandler {
    NSString *key = @"testDisassociateNode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] disassociateNode:[AWSopsworks-cmDisassociateNodeRequest new] completionHandler:^(AWSopsworks-cmDisassociateNodeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testExportServerEngineAttribute {
    NSString *key = @"testExportServerEngineAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] exportServerEngineAttribute:[AWSopsworks-cmExportServerEngineAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testExportServerEngineAttributeCompletionHandler {
    NSString *key = @"testExportServerEngineAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] exportServerEngineAttribute:[AWSopsworks-cmExportServerEngineAttributeRequest new] completionHandler:^(AWSopsworks-cmExportServerEngineAttributeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] listTagsForResource:[AWSopsworks-cmListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] listTagsForResource:[AWSopsworks-cmListTagsForResourceRequest new] completionHandler:^(AWSopsworks-cmListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testRestoreServer {
    NSString *key = @"testRestoreServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] restoreServer:[AWSopsworks-cmRestoreServerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testRestoreServerCompletionHandler {
    NSString *key = @"testRestoreServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] restoreServer:[AWSopsworks-cmRestoreServerRequest new] completionHandler:^(AWSopsworks-cmRestoreServerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testStartMaintenance {
    NSString *key = @"testStartMaintenance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] startMaintenance:[AWSopsworks-cmStartMaintenanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testStartMaintenanceCompletionHandler {
    NSString *key = @"testStartMaintenance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] startMaintenance:[AWSopsworks-cmStartMaintenanceRequest new] completionHandler:^(AWSopsworks-cmStartMaintenanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] tagResource:[AWSopsworks-cmTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] tagResource:[AWSopsworks-cmTagResourceRequest new] completionHandler:^(AWSopsworks-cmTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] untagResource:[AWSopsworks-cmUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] untagResource:[AWSopsworks-cmUntagResourceRequest new] completionHandler:^(AWSopsworks-cmUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testUpdateServer {
    NSString *key = @"testUpdateServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] updateServer:[AWSopsworks-cmUpdateServerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testUpdateServerCompletionHandler {
    NSString *key = @"testUpdateServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] updateServer:[AWSopsworks-cmUpdateServerRequest new] completionHandler:^(AWSopsworks-cmUpdateServerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testUpdateServerEngineAttributes {
    NSString *key = @"testUpdateServerEngineAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSopsworks-cm opsworks-cmForKey:key] updateServerEngineAttributes:[AWSopsworks-cmUpdateServerEngineAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

- (void)testUpdateServerEngineAttributesCompletionHandler {
    NSString *key = @"testUpdateServerEngineAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSopsworks-cm registeropsworks-cmWithConfiguration:configuration forKey:key];

    AWSopsworks-cm *awsClient = [AWSopsworks-cm opsworks-cmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSopsworks-cm opsworks-cmForKey:key] updateServerEngineAttributes:[AWSopsworks-cmUpdateServerEngineAttributesRequest new] completionHandler:^(AWSopsworks-cmUpdateServerEngineAttributesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSopsworks-cm removeopsworks-cmForKey:key];
}

@end
