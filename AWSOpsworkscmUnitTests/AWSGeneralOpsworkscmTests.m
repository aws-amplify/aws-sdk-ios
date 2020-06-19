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
#import "AWSOpsworkscmService.h"

static id mockNetworking = nil;

@interface AWSGeneralOpsworkscmTests : XCTestCase

@end

@implementation AWSGeneralOpsworkscmTests

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
    NSString *key = @"testOpsworkscmConstructors";
    XCTAssertNotNil([AWSOpsworkscm defaultOpsworkscm]);
    XCTAssertEqual([[AWSOpsworkscm defaultOpsworkscm] class], [AWSOpsworkscm class]);
    XCTAssertNil([AWSOpsworkscm OpsworkscmForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSOpsworkscm OpsworkscmForKey:key]);
    XCTAssertEqual([[AWSOpsworkscm OpsworkscmForKey:key] class], [AWSOpsworkscm class]);
    XCTAssertEqual([AWSOpsworkscm OpsworkscmForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
    XCTAssertNil([AWSOpsworkscm OpsworkscmForKey:key]);

}

- (void)testAssociateNode {
    NSString *key = @"testAssociateNode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] associateNode:[AWSOpsworkscmAssociateNodeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testAssociateNodeCompletionHandler {
    NSString *key = @"testAssociateNode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] associateNode:[AWSOpsworkscmAssociateNodeRequest new] completionHandler:^(AWSOpsworkscmAssociateNodeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testCreateBackup {
    NSString *key = @"testCreateBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] createBackup:[AWSOpsworkscmCreateBackupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testCreateBackupCompletionHandler {
    NSString *key = @"testCreateBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] createBackup:[AWSOpsworkscmCreateBackupRequest new] completionHandler:^(AWSOpsworkscmCreateBackupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testCreateServer {
    NSString *key = @"testCreateServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] createServer:[AWSOpsworkscmCreateServerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testCreateServerCompletionHandler {
    NSString *key = @"testCreateServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] createServer:[AWSOpsworkscmCreateServerRequest new] completionHandler:^(AWSOpsworkscmCreateServerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDeleteBackup {
    NSString *key = @"testDeleteBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] deleteBackup:[AWSOpsworkscmDeleteBackupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDeleteBackupCompletionHandler {
    NSString *key = @"testDeleteBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] deleteBackup:[AWSOpsworkscmDeleteBackupRequest new] completionHandler:^(AWSOpsworkscmDeleteBackupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDeleteServer {
    NSString *key = @"testDeleteServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] deleteServer:[AWSOpsworkscmDeleteServerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDeleteServerCompletionHandler {
    NSString *key = @"testDeleteServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] deleteServer:[AWSOpsworkscmDeleteServerRequest new] completionHandler:^(AWSOpsworkscmDeleteServerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDescribeAccountAttributes {
    NSString *key = @"testDescribeAccountAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] describeAccountAttributes:[AWSOpsworkscmDescribeAccountAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDescribeAccountAttributesCompletionHandler {
    NSString *key = @"testDescribeAccountAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] describeAccountAttributes:[AWSOpsworkscmDescribeAccountAttributesRequest new] completionHandler:^(AWSOpsworkscmDescribeAccountAttributesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDescribeBackups {
    NSString *key = @"testDescribeBackups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] describeBackups:[AWSOpsworkscmDescribeBackupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDescribeBackupsCompletionHandler {
    NSString *key = @"testDescribeBackups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] describeBackups:[AWSOpsworkscmDescribeBackupsRequest new] completionHandler:^(AWSOpsworkscmDescribeBackupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDescribeEvents {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] describeEvents:[AWSOpsworkscmDescribeEventsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDescribeEventsCompletionHandler {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] describeEvents:[AWSOpsworkscmDescribeEventsRequest new] completionHandler:^(AWSOpsworkscmDescribeEventsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDescribeNodeAssociationStatus {
    NSString *key = @"testDescribeNodeAssociationStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] describeNodeAssociationStatus:[AWSOpsworkscmDescribeNodeAssociationStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDescribeNodeAssociationStatusCompletionHandler {
    NSString *key = @"testDescribeNodeAssociationStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] describeNodeAssociationStatus:[AWSOpsworkscmDescribeNodeAssociationStatusRequest new] completionHandler:^(AWSOpsworkscmDescribeNodeAssociationStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDescribeServers {
    NSString *key = @"testDescribeServers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] describeServers:[AWSOpsworkscmDescribeServersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDescribeServersCompletionHandler {
    NSString *key = @"testDescribeServers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] describeServers:[AWSOpsworkscmDescribeServersRequest new] completionHandler:^(AWSOpsworkscmDescribeServersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDisassociateNode {
    NSString *key = @"testDisassociateNode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] disassociateNode:[AWSOpsworkscmDisassociateNodeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testDisassociateNodeCompletionHandler {
    NSString *key = @"testDisassociateNode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] disassociateNode:[AWSOpsworkscmDisassociateNodeRequest new] completionHandler:^(AWSOpsworkscmDisassociateNodeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testExportServerEngineAttribute {
    NSString *key = @"testExportServerEngineAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] exportServerEngineAttribute:[AWSOpsworkscmExportServerEngineAttributeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testExportServerEngineAttributeCompletionHandler {
    NSString *key = @"testExportServerEngineAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] exportServerEngineAttribute:[AWSOpsworkscmExportServerEngineAttributeRequest new] completionHandler:^(AWSOpsworkscmExportServerEngineAttributeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] listTagsForResource:[AWSOpsworkscmListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] listTagsForResource:[AWSOpsworkscmListTagsForResourceRequest new] completionHandler:^(AWSOpsworkscmListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testRestoreServer {
    NSString *key = @"testRestoreServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] restoreServer:[AWSOpsworkscmRestoreServerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testRestoreServerCompletionHandler {
    NSString *key = @"testRestoreServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] restoreServer:[AWSOpsworkscmRestoreServerRequest new] completionHandler:^(AWSOpsworkscmRestoreServerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testStartMaintenance {
    NSString *key = @"testStartMaintenance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] startMaintenance:[AWSOpsworkscmStartMaintenanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testStartMaintenanceCompletionHandler {
    NSString *key = @"testStartMaintenance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] startMaintenance:[AWSOpsworkscmStartMaintenanceRequest new] completionHandler:^(AWSOpsworkscmStartMaintenanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] tagResource:[AWSOpsworkscmTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] tagResource:[AWSOpsworkscmTagResourceRequest new] completionHandler:^(AWSOpsworkscmTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] untagResource:[AWSOpsworkscmUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] untagResource:[AWSOpsworkscmUntagResourceRequest new] completionHandler:^(AWSOpsworkscmUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testUpdateServer {
    NSString *key = @"testUpdateServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] updateServer:[AWSOpsworkscmUpdateServerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testUpdateServerCompletionHandler {
    NSString *key = @"testUpdateServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] updateServer:[AWSOpsworkscmUpdateServerRequest new] completionHandler:^(AWSOpsworkscmUpdateServerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testUpdateServerEngineAttributes {
    NSString *key = @"testUpdateServerEngineAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSOpsworkscm OpsworkscmForKey:key] updateServerEngineAttributes:[AWSOpsworkscmUpdateServerEngineAttributesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

- (void)testUpdateServerEngineAttributesCompletionHandler {
    NSString *key = @"testUpdateServerEngineAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSOpsworkscm registerOpsworkscmWithConfiguration:configuration forKey:key];

    AWSOpsworkscm *awsClient = [AWSOpsworkscm OpsworkscmForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSOpsworkscm OpsworkscmForKey:key] updateServerEngineAttributes:[AWSOpsworkscmUpdateServerEngineAttributesRequest new] completionHandler:^(AWSOpsworkscmUpdateServerEngineAttributesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSOpsworkscm removeOpsworkscmForKey:key];
}

@end
