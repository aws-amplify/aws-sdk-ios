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
#import "AWSRdsService.h"

static id mockNetworking = nil;

@interface AWSGeneralRdsTests : XCTestCase

@end

@implementation AWSGeneralRdsTests

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
    NSString *key = @"testRdsConstructors";
    XCTAssertNotNil([AWSRds defaultRds]);
    XCTAssertEqual([[AWSRds defaultRds] class], [AWSRds class]);
    XCTAssertNil([AWSRds RdsForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSRds RdsForKey:key]);
    XCTAssertEqual([[AWSRds RdsForKey:key] class], [AWSRds class]);
    XCTAssertEqual([AWSRds RdsForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSRds removeRdsForKey:key];
    XCTAssertNil([AWSRds RdsForKey:key]);

}

- (void)testAddRoleToDBCluster {
    NSString *key = @"testAddRoleToDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] addRoleToDBCluster:[AWSRdsAddRoleToDBClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testAddRoleToDBClusterCompletionHandler {
    NSString *key = @"testAddRoleToDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] addRoleToDBCluster:[AWSRdsAddRoleToDBClusterMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testAddRoleToDBInstance {
    NSString *key = @"testAddRoleToDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] addRoleToDBInstance:[AWSRdsAddRoleToDBInstanceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testAddRoleToDBInstanceCompletionHandler {
    NSString *key = @"testAddRoleToDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] addRoleToDBInstance:[AWSRdsAddRoleToDBInstanceMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testAddSourceIdentifierToSubscription {
    NSString *key = @"testAddSourceIdentifierToSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] addSourceIdentifierToSubscription:[AWSRdsAddSourceIdentifierToSubscriptionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testAddSourceIdentifierToSubscriptionCompletionHandler {
    NSString *key = @"testAddSourceIdentifierToSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] addSourceIdentifierToSubscription:[AWSRdsAddSourceIdentifierToSubscriptionMessage new] completionHandler:^(AWSRdsAddSourceIdentifierToSubscriptionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testAddTagsToResource {
    NSString *key = @"testAddTagsToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] addTagsToResource:[AWSRdsAddTagsToResourceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testAddTagsToResourceCompletionHandler {
    NSString *key = @"testAddTagsToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] addTagsToResource:[AWSRdsAddTagsToResourceMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testApplyPendingMaintenanceAction {
    NSString *key = @"testApplyPendingMaintenanceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] applyPendingMaintenanceAction:[AWSRdsApplyPendingMaintenanceActionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testApplyPendingMaintenanceActionCompletionHandler {
    NSString *key = @"testApplyPendingMaintenanceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] applyPendingMaintenanceAction:[AWSRdsApplyPendingMaintenanceActionMessage new] completionHandler:^(AWSRdsApplyPendingMaintenanceActionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testAuthorizeDBSecurityGroupIngress {
    NSString *key = @"testAuthorizeDBSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] authorizeDBSecurityGroupIngress:[AWSRdsAuthorizeDBSecurityGroupIngressMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testAuthorizeDBSecurityGroupIngressCompletionHandler {
    NSString *key = @"testAuthorizeDBSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] authorizeDBSecurityGroupIngress:[AWSRdsAuthorizeDBSecurityGroupIngressMessage new] completionHandler:^(AWSRdsAuthorizeDBSecurityGroupIngressResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testBacktrackDBCluster {
    NSString *key = @"testBacktrackDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] backtrackDBCluster:[AWSRdsBacktrackDBClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testBacktrackDBClusterCompletionHandler {
    NSString *key = @"testBacktrackDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] backtrackDBCluster:[AWSRdsBacktrackDBClusterMessage new] completionHandler:^(AWSRdsDBClusterBacktrack* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCancelExportTask {
    NSString *key = @"testCancelExportTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] cancelExportTask:[AWSRdsCancelExportTaskMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCancelExportTaskCompletionHandler {
    NSString *key = @"testCancelExportTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] cancelExportTask:[AWSRdsCancelExportTaskMessage new] completionHandler:^(AWSRdsExportTask* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCopyDBClusterParameterGroup {
    NSString *key = @"testCopyDBClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] replicateDBClusterParameterGroup:[AWSRdsReplicateDBClusterParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCopyDBClusterParameterGroupCompletionHandler {
    NSString *key = @"testCopyDBClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] replicateDBClusterParameterGroup:[AWSRdsReplicateDBClusterParameterGroupMessage new] completionHandler:^(AWSRdsReplicateDBClusterParameterGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCopyDBClusterSnapshot {
    NSString *key = @"testCopyDBClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] replicateDBClusterSnapshot:[AWSRdsReplicateDBClusterSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCopyDBClusterSnapshotCompletionHandler {
    NSString *key = @"testCopyDBClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] replicateDBClusterSnapshot:[AWSRdsReplicateDBClusterSnapshotMessage new] completionHandler:^(AWSRdsReplicateDBClusterSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCopyDBParameterGroup {
    NSString *key = @"testCopyDBParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] replicateDBParameterGroup:[AWSRdsReplicateDBParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCopyDBParameterGroupCompletionHandler {
    NSString *key = @"testCopyDBParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] replicateDBParameterGroup:[AWSRdsReplicateDBParameterGroupMessage new] completionHandler:^(AWSRdsReplicateDBParameterGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCopyDBSnapshot {
    NSString *key = @"testCopyDBSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] replicateDBSnapshot:[AWSRdsReplicateDBSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCopyDBSnapshotCompletionHandler {
    NSString *key = @"testCopyDBSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] replicateDBSnapshot:[AWSRdsReplicateDBSnapshotMessage new] completionHandler:^(AWSRdsReplicateDBSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCopyOptionGroup {
    NSString *key = @"testCopyOptionGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] replicateOptionGroup:[AWSRdsReplicateOptionGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCopyOptionGroupCompletionHandler {
    NSString *key = @"testCopyOptionGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] replicateOptionGroup:[AWSRdsReplicateOptionGroupMessage new] completionHandler:^(AWSRdsReplicateOptionGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateCustomAvailabilityZone {
    NSString *key = @"testCreateCustomAvailabilityZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createCustomAvailabilityZone:[AWSRdsCreateCustomAvailabilityZoneMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateCustomAvailabilityZoneCompletionHandler {
    NSString *key = @"testCreateCustomAvailabilityZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createCustomAvailabilityZone:[AWSRdsCreateCustomAvailabilityZoneMessage new] completionHandler:^(AWSRdsCreateCustomAvailabilityZoneResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBCluster {
    NSString *key = @"testCreateDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createDBCluster:[AWSRdsCreateDBClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBClusterCompletionHandler {
    NSString *key = @"testCreateDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createDBCluster:[AWSRdsCreateDBClusterMessage new] completionHandler:^(AWSRdsCreateDBClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBClusterEndpoint {
    NSString *key = @"testCreateDBClusterEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createDBClusterEndpoint:[AWSRdsCreateDBClusterEndpointMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBClusterEndpointCompletionHandler {
    NSString *key = @"testCreateDBClusterEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createDBClusterEndpoint:[AWSRdsCreateDBClusterEndpointMessage new] completionHandler:^(AWSRdsDBClusterEndpoint* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBClusterParameterGroup {
    NSString *key = @"testCreateDBClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createDBClusterParameterGroup:[AWSRdsCreateDBClusterParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBClusterParameterGroupCompletionHandler {
    NSString *key = @"testCreateDBClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createDBClusterParameterGroup:[AWSRdsCreateDBClusterParameterGroupMessage new] completionHandler:^(AWSRdsCreateDBClusterParameterGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBClusterSnapshot {
    NSString *key = @"testCreateDBClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createDBClusterSnapshot:[AWSRdsCreateDBClusterSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBClusterSnapshotCompletionHandler {
    NSString *key = @"testCreateDBClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createDBClusterSnapshot:[AWSRdsCreateDBClusterSnapshotMessage new] completionHandler:^(AWSRdsCreateDBClusterSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBInstance {
    NSString *key = @"testCreateDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createDBInstance:[AWSRdsCreateDBInstanceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBInstanceCompletionHandler {
    NSString *key = @"testCreateDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createDBInstance:[AWSRdsCreateDBInstanceMessage new] completionHandler:^(AWSRdsCreateDBInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBInstanceReadReplica {
    NSString *key = @"testCreateDBInstanceReadReplica";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createDBInstanceReadReplica:[AWSRdsCreateDBInstanceReadReplicaMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBInstanceReadReplicaCompletionHandler {
    NSString *key = @"testCreateDBInstanceReadReplica";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createDBInstanceReadReplica:[AWSRdsCreateDBInstanceReadReplicaMessage new] completionHandler:^(AWSRdsCreateDBInstanceReadReplicaResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBParameterGroup {
    NSString *key = @"testCreateDBParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createDBParameterGroup:[AWSRdsCreateDBParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBParameterGroupCompletionHandler {
    NSString *key = @"testCreateDBParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createDBParameterGroup:[AWSRdsCreateDBParameterGroupMessage new] completionHandler:^(AWSRdsCreateDBParameterGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBProxy {
    NSString *key = @"testCreateDBProxy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createDBProxy:[AWSRdsCreateDBProxyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBProxyCompletionHandler {
    NSString *key = @"testCreateDBProxy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createDBProxy:[AWSRdsCreateDBProxyRequest new] completionHandler:^(AWSRdsCreateDBProxyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBSecurityGroup {
    NSString *key = @"testCreateDBSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createDBSecurityGroup:[AWSRdsCreateDBSecurityGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBSecurityGroupCompletionHandler {
    NSString *key = @"testCreateDBSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createDBSecurityGroup:[AWSRdsCreateDBSecurityGroupMessage new] completionHandler:^(AWSRdsCreateDBSecurityGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBSnapshot {
    NSString *key = @"testCreateDBSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createDBSnapshot:[AWSRdsCreateDBSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBSnapshotCompletionHandler {
    NSString *key = @"testCreateDBSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createDBSnapshot:[AWSRdsCreateDBSnapshotMessage new] completionHandler:^(AWSRdsCreateDBSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBSubnetGroup {
    NSString *key = @"testCreateDBSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createDBSubnetGroup:[AWSRdsCreateDBSubnetGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateDBSubnetGroupCompletionHandler {
    NSString *key = @"testCreateDBSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createDBSubnetGroup:[AWSRdsCreateDBSubnetGroupMessage new] completionHandler:^(AWSRdsCreateDBSubnetGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateEventSubscription {
    NSString *key = @"testCreateEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createEventSubscription:[AWSRdsCreateEventSubscriptionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateEventSubscriptionCompletionHandler {
    NSString *key = @"testCreateEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createEventSubscription:[AWSRdsCreateEventSubscriptionMessage new] completionHandler:^(AWSRdsCreateEventSubscriptionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateGlobalCluster {
    NSString *key = @"testCreateGlobalCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createGlobalCluster:[AWSRdsCreateGlobalClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateGlobalClusterCompletionHandler {
    NSString *key = @"testCreateGlobalCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createGlobalCluster:[AWSRdsCreateGlobalClusterMessage new] completionHandler:^(AWSRdsCreateGlobalClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateOptionGroup {
    NSString *key = @"testCreateOptionGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] createOptionGroup:[AWSRdsCreateOptionGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testCreateOptionGroupCompletionHandler {
    NSString *key = @"testCreateOptionGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] createOptionGroup:[AWSRdsCreateOptionGroupMessage new] completionHandler:^(AWSRdsCreateOptionGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteCustomAvailabilityZone {
    NSString *key = @"testDeleteCustomAvailabilityZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteCustomAvailabilityZone:[AWSRdsDeleteCustomAvailabilityZoneMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteCustomAvailabilityZoneCompletionHandler {
    NSString *key = @"testDeleteCustomAvailabilityZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteCustomAvailabilityZone:[AWSRdsDeleteCustomAvailabilityZoneMessage new] completionHandler:^(AWSRdsDeleteCustomAvailabilityZoneResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBCluster {
    NSString *key = @"testDeleteDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteDBCluster:[AWSRdsDeleteDBClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBClusterCompletionHandler {
    NSString *key = @"testDeleteDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteDBCluster:[AWSRdsDeleteDBClusterMessage new] completionHandler:^(AWSRdsDeleteDBClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBClusterEndpoint {
    NSString *key = @"testDeleteDBClusterEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteDBClusterEndpoint:[AWSRdsDeleteDBClusterEndpointMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBClusterEndpointCompletionHandler {
    NSString *key = @"testDeleteDBClusterEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteDBClusterEndpoint:[AWSRdsDeleteDBClusterEndpointMessage new] completionHandler:^(AWSRdsDBClusterEndpoint* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBClusterParameterGroup {
    NSString *key = @"testDeleteDBClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteDBClusterParameterGroup:[AWSRdsDeleteDBClusterParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBClusterParameterGroupCompletionHandler {
    NSString *key = @"testDeleteDBClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteDBClusterParameterGroup:[AWSRdsDeleteDBClusterParameterGroupMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBClusterSnapshot {
    NSString *key = @"testDeleteDBClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteDBClusterSnapshot:[AWSRdsDeleteDBClusterSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBClusterSnapshotCompletionHandler {
    NSString *key = @"testDeleteDBClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteDBClusterSnapshot:[AWSRdsDeleteDBClusterSnapshotMessage new] completionHandler:^(AWSRdsDeleteDBClusterSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBInstance {
    NSString *key = @"testDeleteDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteDBInstance:[AWSRdsDeleteDBInstanceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBInstanceCompletionHandler {
    NSString *key = @"testDeleteDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteDBInstance:[AWSRdsDeleteDBInstanceMessage new] completionHandler:^(AWSRdsDeleteDBInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBInstanceAutomatedBackup {
    NSString *key = @"testDeleteDBInstanceAutomatedBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteDBInstanceAutomatedBackup:[AWSRdsDeleteDBInstanceAutomatedBackupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBInstanceAutomatedBackupCompletionHandler {
    NSString *key = @"testDeleteDBInstanceAutomatedBackup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteDBInstanceAutomatedBackup:[AWSRdsDeleteDBInstanceAutomatedBackupMessage new] completionHandler:^(AWSRdsDeleteDBInstanceAutomatedBackupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBParameterGroup {
    NSString *key = @"testDeleteDBParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteDBParameterGroup:[AWSRdsDeleteDBParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBParameterGroupCompletionHandler {
    NSString *key = @"testDeleteDBParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteDBParameterGroup:[AWSRdsDeleteDBParameterGroupMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBProxy {
    NSString *key = @"testDeleteDBProxy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteDBProxy:[AWSRdsDeleteDBProxyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBProxyCompletionHandler {
    NSString *key = @"testDeleteDBProxy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteDBProxy:[AWSRdsDeleteDBProxyRequest new] completionHandler:^(AWSRdsDeleteDBProxyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBSecurityGroup {
    NSString *key = @"testDeleteDBSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteDBSecurityGroup:[AWSRdsDeleteDBSecurityGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBSecurityGroupCompletionHandler {
    NSString *key = @"testDeleteDBSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteDBSecurityGroup:[AWSRdsDeleteDBSecurityGroupMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBSnapshot {
    NSString *key = @"testDeleteDBSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteDBSnapshot:[AWSRdsDeleteDBSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBSnapshotCompletionHandler {
    NSString *key = @"testDeleteDBSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteDBSnapshot:[AWSRdsDeleteDBSnapshotMessage new] completionHandler:^(AWSRdsDeleteDBSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBSubnetGroup {
    NSString *key = @"testDeleteDBSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteDBSubnetGroup:[AWSRdsDeleteDBSubnetGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteDBSubnetGroupCompletionHandler {
    NSString *key = @"testDeleteDBSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteDBSubnetGroup:[AWSRdsDeleteDBSubnetGroupMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteEventSubscription {
    NSString *key = @"testDeleteEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteEventSubscription:[AWSRdsDeleteEventSubscriptionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteEventSubscriptionCompletionHandler {
    NSString *key = @"testDeleteEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteEventSubscription:[AWSRdsDeleteEventSubscriptionMessage new] completionHandler:^(AWSRdsDeleteEventSubscriptionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteGlobalCluster {
    NSString *key = @"testDeleteGlobalCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteGlobalCluster:[AWSRdsDeleteGlobalClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteGlobalClusterCompletionHandler {
    NSString *key = @"testDeleteGlobalCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteGlobalCluster:[AWSRdsDeleteGlobalClusterMessage new] completionHandler:^(AWSRdsDeleteGlobalClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteInstallationMedia {
    NSString *key = @"testDeleteInstallationMedia";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteInstallationMedia:[AWSRdsDeleteInstallationMediaMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteInstallationMediaCompletionHandler {
    NSString *key = @"testDeleteInstallationMedia";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteInstallationMedia:[AWSRdsDeleteInstallationMediaMessage new] completionHandler:^(AWSRdsInstallationMedia* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteOptionGroup {
    NSString *key = @"testDeleteOptionGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deleteOptionGroup:[AWSRdsDeleteOptionGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeleteOptionGroupCompletionHandler {
    NSString *key = @"testDeleteOptionGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deleteOptionGroup:[AWSRdsDeleteOptionGroupMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeregisterDBProxyTargets {
    NSString *key = @"testDeregisterDBProxyTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] deregisterDBProxyTargets:[AWSRdsDeregisterDBProxyTargetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDeregisterDBProxyTargetsCompletionHandler {
    NSString *key = @"testDeregisterDBProxyTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] deregisterDBProxyTargets:[AWSRdsDeregisterDBProxyTargetsRequest new] completionHandler:^(AWSRdsDeregisterDBProxyTargetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeAccountAttributes {
    NSString *key = @"testDescribeAccountAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeAccountAttributes:[AWSRdsDescribeAccountAttributesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeAccountAttributesCompletionHandler {
    NSString *key = @"testDescribeAccountAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeAccountAttributes:[AWSRdsDescribeAccountAttributesMessage new] completionHandler:^(AWSRdsAccountAttributesMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeCertificates {
    NSString *key = @"testDescribeCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeCertificates:[AWSRdsDescribeCertificatesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeCertificatesCompletionHandler {
    NSString *key = @"testDescribeCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeCertificates:[AWSRdsDescribeCertificatesMessage new] completionHandler:^(AWSRdsCertificateMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeCustomAvailabilityZones {
    NSString *key = @"testDescribeCustomAvailabilityZones";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeCustomAvailabilityZones:[AWSRdsDescribeCustomAvailabilityZonesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeCustomAvailabilityZonesCompletionHandler {
    NSString *key = @"testDescribeCustomAvailabilityZones";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeCustomAvailabilityZones:[AWSRdsDescribeCustomAvailabilityZonesMessage new] completionHandler:^(AWSRdsCustomAvailabilityZoneMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBClusterBacktracks {
    NSString *key = @"testDescribeDBClusterBacktracks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBClusterBacktracks:[AWSRdsDescribeDBClusterBacktracksMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBClusterBacktracksCompletionHandler {
    NSString *key = @"testDescribeDBClusterBacktracks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBClusterBacktracks:[AWSRdsDescribeDBClusterBacktracksMessage new] completionHandler:^(AWSRdsDBClusterBacktrackMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBClusterEndpoints {
    NSString *key = @"testDescribeDBClusterEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBClusterEndpoints:[AWSRdsDescribeDBClusterEndpointsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBClusterEndpointsCompletionHandler {
    NSString *key = @"testDescribeDBClusterEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBClusterEndpoints:[AWSRdsDescribeDBClusterEndpointsMessage new] completionHandler:^(AWSRdsDBClusterEndpointMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBClusterParameterGroups {
    NSString *key = @"testDescribeDBClusterParameterGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBClusterParameterGroups:[AWSRdsDescribeDBClusterParameterGroupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBClusterParameterGroupsCompletionHandler {
    NSString *key = @"testDescribeDBClusterParameterGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBClusterParameterGroups:[AWSRdsDescribeDBClusterParameterGroupsMessage new] completionHandler:^(AWSRdsDBClusterParameterGroupsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBClusterParameters {
    NSString *key = @"testDescribeDBClusterParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBClusterParameters:[AWSRdsDescribeDBClusterParametersMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBClusterParametersCompletionHandler {
    NSString *key = @"testDescribeDBClusterParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBClusterParameters:[AWSRdsDescribeDBClusterParametersMessage new] completionHandler:^(AWSRdsDBClusterParameterGroupDetails* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBClusterSnapshotAttributes {
    NSString *key = @"testDescribeDBClusterSnapshotAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBClusterSnapshotAttributes:[AWSRdsDescribeDBClusterSnapshotAttributesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBClusterSnapshotAttributesCompletionHandler {
    NSString *key = @"testDescribeDBClusterSnapshotAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBClusterSnapshotAttributes:[AWSRdsDescribeDBClusterSnapshotAttributesMessage new] completionHandler:^(AWSRdsDescribeDBClusterSnapshotAttributesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBClusterSnapshots {
    NSString *key = @"testDescribeDBClusterSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBClusterSnapshots:[AWSRdsDescribeDBClusterSnapshotsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBClusterSnapshotsCompletionHandler {
    NSString *key = @"testDescribeDBClusterSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBClusterSnapshots:[AWSRdsDescribeDBClusterSnapshotsMessage new] completionHandler:^(AWSRdsDBClusterSnapshotMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBClusters {
    NSString *key = @"testDescribeDBClusters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBClusters:[AWSRdsDescribeDBClustersMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBClustersCompletionHandler {
    NSString *key = @"testDescribeDBClusters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBClusters:[AWSRdsDescribeDBClustersMessage new] completionHandler:^(AWSRdsDBClusterMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBEngineVersions {
    NSString *key = @"testDescribeDBEngineVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBEngineVersions:[AWSRdsDescribeDBEngineVersionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBEngineVersionsCompletionHandler {
    NSString *key = @"testDescribeDBEngineVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBEngineVersions:[AWSRdsDescribeDBEngineVersionsMessage new] completionHandler:^(AWSRdsDBEngineVersionMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBInstanceAutomatedBackups {
    NSString *key = @"testDescribeDBInstanceAutomatedBackups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBInstanceAutomatedBackups:[AWSRdsDescribeDBInstanceAutomatedBackupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBInstanceAutomatedBackupsCompletionHandler {
    NSString *key = @"testDescribeDBInstanceAutomatedBackups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBInstanceAutomatedBackups:[AWSRdsDescribeDBInstanceAutomatedBackupsMessage new] completionHandler:^(AWSRdsDBInstanceAutomatedBackupMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBInstances {
    NSString *key = @"testDescribeDBInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBInstances:[AWSRdsDescribeDBInstancesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBInstancesCompletionHandler {
    NSString *key = @"testDescribeDBInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBInstances:[AWSRdsDescribeDBInstancesMessage new] completionHandler:^(AWSRdsDBInstanceMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBLogFiles {
    NSString *key = @"testDescribeDBLogFiles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBLogFiles:[AWSRdsDescribeDBLogFilesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBLogFilesCompletionHandler {
    NSString *key = @"testDescribeDBLogFiles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBLogFiles:[AWSRdsDescribeDBLogFilesMessage new] completionHandler:^(AWSRdsDescribeDBLogFilesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBParameterGroups {
    NSString *key = @"testDescribeDBParameterGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBParameterGroups:[AWSRdsDescribeDBParameterGroupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBParameterGroupsCompletionHandler {
    NSString *key = @"testDescribeDBParameterGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBParameterGroups:[AWSRdsDescribeDBParameterGroupsMessage new] completionHandler:^(AWSRdsDBParameterGroupsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBParameters {
    NSString *key = @"testDescribeDBParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBParameters:[AWSRdsDescribeDBParametersMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBParametersCompletionHandler {
    NSString *key = @"testDescribeDBParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBParameters:[AWSRdsDescribeDBParametersMessage new] completionHandler:^(AWSRdsDBParameterGroupDetails* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBProxies {
    NSString *key = @"testDescribeDBProxies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBProxies:[AWSRdsDescribeDBProxiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBProxiesCompletionHandler {
    NSString *key = @"testDescribeDBProxies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBProxies:[AWSRdsDescribeDBProxiesRequest new] completionHandler:^(AWSRdsDescribeDBProxiesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBProxyTargetGroups {
    NSString *key = @"testDescribeDBProxyTargetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBProxyTargetGroups:[AWSRdsDescribeDBProxyTargetGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBProxyTargetGroupsCompletionHandler {
    NSString *key = @"testDescribeDBProxyTargetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBProxyTargetGroups:[AWSRdsDescribeDBProxyTargetGroupsRequest new] completionHandler:^(AWSRdsDescribeDBProxyTargetGroupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBProxyTargets {
    NSString *key = @"testDescribeDBProxyTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBProxyTargets:[AWSRdsDescribeDBProxyTargetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBProxyTargetsCompletionHandler {
    NSString *key = @"testDescribeDBProxyTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBProxyTargets:[AWSRdsDescribeDBProxyTargetsRequest new] completionHandler:^(AWSRdsDescribeDBProxyTargetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBSecurityGroups {
    NSString *key = @"testDescribeDBSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBSecurityGroups:[AWSRdsDescribeDBSecurityGroupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBSecurityGroupsCompletionHandler {
    NSString *key = @"testDescribeDBSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBSecurityGroups:[AWSRdsDescribeDBSecurityGroupsMessage new] completionHandler:^(AWSRdsDBSecurityGroupMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBSnapshotAttributes {
    NSString *key = @"testDescribeDBSnapshotAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBSnapshotAttributes:[AWSRdsDescribeDBSnapshotAttributesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBSnapshotAttributesCompletionHandler {
    NSString *key = @"testDescribeDBSnapshotAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBSnapshotAttributes:[AWSRdsDescribeDBSnapshotAttributesMessage new] completionHandler:^(AWSRdsDescribeDBSnapshotAttributesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBSnapshots {
    NSString *key = @"testDescribeDBSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBSnapshots:[AWSRdsDescribeDBSnapshotsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBSnapshotsCompletionHandler {
    NSString *key = @"testDescribeDBSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBSnapshots:[AWSRdsDescribeDBSnapshotsMessage new] completionHandler:^(AWSRdsDBSnapshotMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBSubnetGroups {
    NSString *key = @"testDescribeDBSubnetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeDBSubnetGroups:[AWSRdsDescribeDBSubnetGroupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeDBSubnetGroupsCompletionHandler {
    NSString *key = @"testDescribeDBSubnetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeDBSubnetGroups:[AWSRdsDescribeDBSubnetGroupsMessage new] completionHandler:^(AWSRdsDBSubnetGroupMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeEngineDefaultClusterParameters {
    NSString *key = @"testDescribeEngineDefaultClusterParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeEngineDefaultClusterParameters:[AWSRdsDescribeEngineDefaultClusterParametersMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeEngineDefaultClusterParametersCompletionHandler {
    NSString *key = @"testDescribeEngineDefaultClusterParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeEngineDefaultClusterParameters:[AWSRdsDescribeEngineDefaultClusterParametersMessage new] completionHandler:^(AWSRdsDescribeEngineDefaultClusterParametersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeEngineDefaultParameters {
    NSString *key = @"testDescribeEngineDefaultParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeEngineDefaultParameters:[AWSRdsDescribeEngineDefaultParametersMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeEngineDefaultParametersCompletionHandler {
    NSString *key = @"testDescribeEngineDefaultParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeEngineDefaultParameters:[AWSRdsDescribeEngineDefaultParametersMessage new] completionHandler:^(AWSRdsDescribeEngineDefaultParametersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeEventCategories {
    NSString *key = @"testDescribeEventCategories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeEventCategories:[AWSRdsDescribeEventCategoriesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeEventCategoriesCompletionHandler {
    NSString *key = @"testDescribeEventCategories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeEventCategories:[AWSRdsDescribeEventCategoriesMessage new] completionHandler:^(AWSRdsEventCategoriesMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeEventSubscriptions {
    NSString *key = @"testDescribeEventSubscriptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeEventSubscriptions:[AWSRdsDescribeEventSubscriptionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeEventSubscriptionsCompletionHandler {
    NSString *key = @"testDescribeEventSubscriptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeEventSubscriptions:[AWSRdsDescribeEventSubscriptionsMessage new] completionHandler:^(AWSRdsEventSubscriptionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeEvents {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeEvents:[AWSRdsDescribeEventsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeEventsCompletionHandler {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeEvents:[AWSRdsDescribeEventsMessage new] completionHandler:^(AWSRdsEventsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeExportTasks {
    NSString *key = @"testDescribeExportTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeExportTasks:[AWSRdsDescribeExportTasksMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeExportTasksCompletionHandler {
    NSString *key = @"testDescribeExportTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeExportTasks:[AWSRdsDescribeExportTasksMessage new] completionHandler:^(AWSRdsExportTasksMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeGlobalClusters {
    NSString *key = @"testDescribeGlobalClusters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeGlobalClusters:[AWSRdsDescribeGlobalClustersMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeGlobalClustersCompletionHandler {
    NSString *key = @"testDescribeGlobalClusters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeGlobalClusters:[AWSRdsDescribeGlobalClustersMessage new] completionHandler:^(AWSRdsGlobalClustersMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeInstallationMedia {
    NSString *key = @"testDescribeInstallationMedia";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeInstallationMedia:[AWSRdsDescribeInstallationMediaMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeInstallationMediaCompletionHandler {
    NSString *key = @"testDescribeInstallationMedia";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeInstallationMedia:[AWSRdsDescribeInstallationMediaMessage new] completionHandler:^(AWSRdsInstallationMediaMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeOptionGroupOptions {
    NSString *key = @"testDescribeOptionGroupOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeOptionGroupOptions:[AWSRdsDescribeOptionGroupOptionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeOptionGroupOptionsCompletionHandler {
    NSString *key = @"testDescribeOptionGroupOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeOptionGroupOptions:[AWSRdsDescribeOptionGroupOptionsMessage new] completionHandler:^(AWSRdsOptionGroupOptionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeOptionGroups {
    NSString *key = @"testDescribeOptionGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeOptionGroups:[AWSRdsDescribeOptionGroupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeOptionGroupsCompletionHandler {
    NSString *key = @"testDescribeOptionGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeOptionGroups:[AWSRdsDescribeOptionGroupsMessage new] completionHandler:^(AWSRdsOptionGroups* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeOrderableDBInstanceOptions {
    NSString *key = @"testDescribeOrderableDBInstanceOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeOrderableDBInstanceOptions:[AWSRdsDescribeOrderableDBInstanceOptionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeOrderableDBInstanceOptionsCompletionHandler {
    NSString *key = @"testDescribeOrderableDBInstanceOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeOrderableDBInstanceOptions:[AWSRdsDescribeOrderableDBInstanceOptionsMessage new] completionHandler:^(AWSRdsOrderableDBInstanceOptionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribePendingMaintenanceActions {
    NSString *key = @"testDescribePendingMaintenanceActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describePendingMaintenanceActions:[AWSRdsDescribePendingMaintenanceActionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribePendingMaintenanceActionsCompletionHandler {
    NSString *key = @"testDescribePendingMaintenanceActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describePendingMaintenanceActions:[AWSRdsDescribePendingMaintenanceActionsMessage new] completionHandler:^(AWSRdsPendingMaintenanceActionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeReservedDBInstances {
    NSString *key = @"testDescribeReservedDBInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeReservedDBInstances:[AWSRdsDescribeReservedDBInstancesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeReservedDBInstancesCompletionHandler {
    NSString *key = @"testDescribeReservedDBInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeReservedDBInstances:[AWSRdsDescribeReservedDBInstancesMessage new] completionHandler:^(AWSRdsReservedDBInstanceMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeReservedDBInstancesOfferings {
    NSString *key = @"testDescribeReservedDBInstancesOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeReservedDBInstancesOfferings:[AWSRdsDescribeReservedDBInstancesOfferingsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeReservedDBInstancesOfferingsCompletionHandler {
    NSString *key = @"testDescribeReservedDBInstancesOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeReservedDBInstancesOfferings:[AWSRdsDescribeReservedDBInstancesOfferingsMessage new] completionHandler:^(AWSRdsReservedDBInstancesOfferingMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeSourceRegions {
    NSString *key = @"testDescribeSourceRegions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeSourceRegions:[AWSRdsDescribeSourceRegionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeSourceRegionsCompletionHandler {
    NSString *key = @"testDescribeSourceRegions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeSourceRegions:[AWSRdsDescribeSourceRegionsMessage new] completionHandler:^(AWSRdsSourceRegionMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeValidDBInstanceModifications {
    NSString *key = @"testDescribeValidDBInstanceModifications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] describeValidDBInstanceModifications:[AWSRdsDescribeValidDBInstanceModificationsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDescribeValidDBInstanceModificationsCompletionHandler {
    NSString *key = @"testDescribeValidDBInstanceModifications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] describeValidDBInstanceModifications:[AWSRdsDescribeValidDBInstanceModificationsMessage new] completionHandler:^(AWSRdsDescribeValidDBInstanceModificationsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDownloadDBLogFilePortion {
    NSString *key = @"testDownloadDBLogFilePortion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] downloadDBLogFilePortion:[AWSRdsDownloadDBLogFilePortionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testDownloadDBLogFilePortionCompletionHandler {
    NSString *key = @"testDownloadDBLogFilePortion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] downloadDBLogFilePortion:[AWSRdsDownloadDBLogFilePortionMessage new] completionHandler:^(AWSRdsDownloadDBLogFilePortionDetails* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testFailoverDBCluster {
    NSString *key = @"testFailoverDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] failoverDBCluster:[AWSRdsFailoverDBClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testFailoverDBClusterCompletionHandler {
    NSString *key = @"testFailoverDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] failoverDBCluster:[AWSRdsFailoverDBClusterMessage new] completionHandler:^(AWSRdsFailoverDBClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testImportInstallationMedia {
    NSString *key = @"testImportInstallationMedia";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] importInstallationMedia:[AWSRdsImportInstallationMediaMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testImportInstallationMediaCompletionHandler {
    NSString *key = @"testImportInstallationMedia";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] importInstallationMedia:[AWSRdsImportInstallationMediaMessage new] completionHandler:^(AWSRdsInstallationMedia* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] listTagsForResource:[AWSRdsListTagsForResourceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] listTagsForResource:[AWSRdsListTagsForResourceMessage new] completionHandler:^(AWSRdsTagListMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyCertificates {
    NSString *key = @"testModifyCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyCertificates:[AWSRdsModifyCertificatesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyCertificatesCompletionHandler {
    NSString *key = @"testModifyCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyCertificates:[AWSRdsModifyCertificatesMessage new] completionHandler:^(AWSRdsModifyCertificatesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyCurrentDBClusterCapacity {
    NSString *key = @"testModifyCurrentDBClusterCapacity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyCurrentDBClusterCapacity:[AWSRdsModifyCurrentDBClusterCapacityMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyCurrentDBClusterCapacityCompletionHandler {
    NSString *key = @"testModifyCurrentDBClusterCapacity";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyCurrentDBClusterCapacity:[AWSRdsModifyCurrentDBClusterCapacityMessage new] completionHandler:^(AWSRdsDBClusterCapacityInfo* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBCluster {
    NSString *key = @"testModifyDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyDBCluster:[AWSRdsModifyDBClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBClusterCompletionHandler {
    NSString *key = @"testModifyDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyDBCluster:[AWSRdsModifyDBClusterMessage new] completionHandler:^(AWSRdsModifyDBClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBClusterEndpoint {
    NSString *key = @"testModifyDBClusterEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyDBClusterEndpoint:[AWSRdsModifyDBClusterEndpointMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBClusterEndpointCompletionHandler {
    NSString *key = @"testModifyDBClusterEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyDBClusterEndpoint:[AWSRdsModifyDBClusterEndpointMessage new] completionHandler:^(AWSRdsDBClusterEndpoint* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBClusterParameterGroup {
    NSString *key = @"testModifyDBClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyDBClusterParameterGroup:[AWSRdsModifyDBClusterParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBClusterParameterGroupCompletionHandler {
    NSString *key = @"testModifyDBClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyDBClusterParameterGroup:[AWSRdsModifyDBClusterParameterGroupMessage new] completionHandler:^(AWSRdsDBClusterParameterGroupNameMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBClusterSnapshotAttribute {
    NSString *key = @"testModifyDBClusterSnapshotAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyDBClusterSnapshotAttribute:[AWSRdsModifyDBClusterSnapshotAttributeMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBClusterSnapshotAttributeCompletionHandler {
    NSString *key = @"testModifyDBClusterSnapshotAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyDBClusterSnapshotAttribute:[AWSRdsModifyDBClusterSnapshotAttributeMessage new] completionHandler:^(AWSRdsModifyDBClusterSnapshotAttributeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBInstance {
    NSString *key = @"testModifyDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyDBInstance:[AWSRdsModifyDBInstanceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBInstanceCompletionHandler {
    NSString *key = @"testModifyDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyDBInstance:[AWSRdsModifyDBInstanceMessage new] completionHandler:^(AWSRdsModifyDBInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBParameterGroup {
    NSString *key = @"testModifyDBParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyDBParameterGroup:[AWSRdsModifyDBParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBParameterGroupCompletionHandler {
    NSString *key = @"testModifyDBParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyDBParameterGroup:[AWSRdsModifyDBParameterGroupMessage new] completionHandler:^(AWSRdsDBParameterGroupNameMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBProxy {
    NSString *key = @"testModifyDBProxy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyDBProxy:[AWSRdsModifyDBProxyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBProxyCompletionHandler {
    NSString *key = @"testModifyDBProxy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyDBProxy:[AWSRdsModifyDBProxyRequest new] completionHandler:^(AWSRdsModifyDBProxyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBProxyTargetGroup {
    NSString *key = @"testModifyDBProxyTargetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyDBProxyTargetGroup:[AWSRdsModifyDBProxyTargetGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBProxyTargetGroupCompletionHandler {
    NSString *key = @"testModifyDBProxyTargetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyDBProxyTargetGroup:[AWSRdsModifyDBProxyTargetGroupRequest new] completionHandler:^(AWSRdsModifyDBProxyTargetGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBSnapshot {
    NSString *key = @"testModifyDBSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyDBSnapshot:[AWSRdsModifyDBSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBSnapshotCompletionHandler {
    NSString *key = @"testModifyDBSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyDBSnapshot:[AWSRdsModifyDBSnapshotMessage new] completionHandler:^(AWSRdsModifyDBSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBSnapshotAttribute {
    NSString *key = @"testModifyDBSnapshotAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyDBSnapshotAttribute:[AWSRdsModifyDBSnapshotAttributeMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBSnapshotAttributeCompletionHandler {
    NSString *key = @"testModifyDBSnapshotAttribute";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyDBSnapshotAttribute:[AWSRdsModifyDBSnapshotAttributeMessage new] completionHandler:^(AWSRdsModifyDBSnapshotAttributeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBSubnetGroup {
    NSString *key = @"testModifyDBSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyDBSubnetGroup:[AWSRdsModifyDBSubnetGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyDBSubnetGroupCompletionHandler {
    NSString *key = @"testModifyDBSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyDBSubnetGroup:[AWSRdsModifyDBSubnetGroupMessage new] completionHandler:^(AWSRdsModifyDBSubnetGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyEventSubscription {
    NSString *key = @"testModifyEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyEventSubscription:[AWSRdsModifyEventSubscriptionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyEventSubscriptionCompletionHandler {
    NSString *key = @"testModifyEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyEventSubscription:[AWSRdsModifyEventSubscriptionMessage new] completionHandler:^(AWSRdsModifyEventSubscriptionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyGlobalCluster {
    NSString *key = @"testModifyGlobalCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyGlobalCluster:[AWSRdsModifyGlobalClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyGlobalClusterCompletionHandler {
    NSString *key = @"testModifyGlobalCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyGlobalCluster:[AWSRdsModifyGlobalClusterMessage new] completionHandler:^(AWSRdsModifyGlobalClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyOptionGroup {
    NSString *key = @"testModifyOptionGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] modifyOptionGroup:[AWSRdsModifyOptionGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testModifyOptionGroupCompletionHandler {
    NSString *key = @"testModifyOptionGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] modifyOptionGroup:[AWSRdsModifyOptionGroupMessage new] completionHandler:^(AWSRdsModifyOptionGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testPromoteReadReplica {
    NSString *key = @"testPromoteReadReplica";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] promoteReadReplica:[AWSRdsPromoteReadReplicaMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testPromoteReadReplicaCompletionHandler {
    NSString *key = @"testPromoteReadReplica";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] promoteReadReplica:[AWSRdsPromoteReadReplicaMessage new] completionHandler:^(AWSRdsPromoteReadReplicaResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testPromoteReadReplicaDBCluster {
    NSString *key = @"testPromoteReadReplicaDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] promoteReadReplicaDBCluster:[AWSRdsPromoteReadReplicaDBClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testPromoteReadReplicaDBClusterCompletionHandler {
    NSString *key = @"testPromoteReadReplicaDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] promoteReadReplicaDBCluster:[AWSRdsPromoteReadReplicaDBClusterMessage new] completionHandler:^(AWSRdsPromoteReadReplicaDBClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testPurchaseReservedDBInstancesOffering {
    NSString *key = @"testPurchaseReservedDBInstancesOffering";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] purchaseReservedDBInstancesOffering:[AWSRdsPurchaseReservedDBInstancesOfferingMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testPurchaseReservedDBInstancesOfferingCompletionHandler {
    NSString *key = @"testPurchaseReservedDBInstancesOffering";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] purchaseReservedDBInstancesOffering:[AWSRdsPurchaseReservedDBInstancesOfferingMessage new] completionHandler:^(AWSRdsPurchaseReservedDBInstancesOfferingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRebootDBInstance {
    NSString *key = @"testRebootDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] rebootDBInstance:[AWSRdsRebootDBInstanceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRebootDBInstanceCompletionHandler {
    NSString *key = @"testRebootDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] rebootDBInstance:[AWSRdsRebootDBInstanceMessage new] completionHandler:^(AWSRdsRebootDBInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRegisterDBProxyTargets {
    NSString *key = @"testRegisterDBProxyTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] registerDBProxyTargets:[AWSRdsRegisterDBProxyTargetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRegisterDBProxyTargetsCompletionHandler {
    NSString *key = @"testRegisterDBProxyTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] registerDBProxyTargets:[AWSRdsRegisterDBProxyTargetsRequest new] completionHandler:^(AWSRdsRegisterDBProxyTargetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRemoveFromGlobalCluster {
    NSString *key = @"testRemoveFromGlobalCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] removeFromGlobalCluster:[AWSRdsRemoveFromGlobalClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRemoveFromGlobalClusterCompletionHandler {
    NSString *key = @"testRemoveFromGlobalCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] removeFromGlobalCluster:[AWSRdsRemoveFromGlobalClusterMessage new] completionHandler:^(AWSRdsRemoveFromGlobalClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRemoveRoleFromDBCluster {
    NSString *key = @"testRemoveRoleFromDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] removeRoleFromDBCluster:[AWSRdsRemoveRoleFromDBClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRemoveRoleFromDBClusterCompletionHandler {
    NSString *key = @"testRemoveRoleFromDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] removeRoleFromDBCluster:[AWSRdsRemoveRoleFromDBClusterMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRemoveRoleFromDBInstance {
    NSString *key = @"testRemoveRoleFromDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] removeRoleFromDBInstance:[AWSRdsRemoveRoleFromDBInstanceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRemoveRoleFromDBInstanceCompletionHandler {
    NSString *key = @"testRemoveRoleFromDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] removeRoleFromDBInstance:[AWSRdsRemoveRoleFromDBInstanceMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRemoveSourceIdentifierFromSubscription {
    NSString *key = @"testRemoveSourceIdentifierFromSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] removeSourceIdentifierFromSubscription:[AWSRdsRemoveSourceIdentifierFromSubscriptionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRemoveSourceIdentifierFromSubscriptionCompletionHandler {
    NSString *key = @"testRemoveSourceIdentifierFromSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] removeSourceIdentifierFromSubscription:[AWSRdsRemoveSourceIdentifierFromSubscriptionMessage new] completionHandler:^(AWSRdsRemoveSourceIdentifierFromSubscriptionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRemoveTagsFromResource {
    NSString *key = @"testRemoveTagsFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] removeTagsFromResource:[AWSRdsRemoveTagsFromResourceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRemoveTagsFromResourceCompletionHandler {
    NSString *key = @"testRemoveTagsFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] removeTagsFromResource:[AWSRdsRemoveTagsFromResourceMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testResetDBClusterParameterGroup {
    NSString *key = @"testResetDBClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] resetDBClusterParameterGroup:[AWSRdsResetDBClusterParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testResetDBClusterParameterGroupCompletionHandler {
    NSString *key = @"testResetDBClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] resetDBClusterParameterGroup:[AWSRdsResetDBClusterParameterGroupMessage new] completionHandler:^(AWSRdsDBClusterParameterGroupNameMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testResetDBParameterGroup {
    NSString *key = @"testResetDBParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] resetDBParameterGroup:[AWSRdsResetDBParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testResetDBParameterGroupCompletionHandler {
    NSString *key = @"testResetDBParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] resetDBParameterGroup:[AWSRdsResetDBParameterGroupMessage new] completionHandler:^(AWSRdsDBParameterGroupNameMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRestoreDBClusterFromS3 {
    NSString *key = @"testRestoreDBClusterFromS3";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] restoreDBClusterFromS3:[AWSRdsRestoreDBClusterFromS3Message new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRestoreDBClusterFromS3CompletionHandler {
    NSString *key = @"testRestoreDBClusterFromS3";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] restoreDBClusterFromS3:[AWSRdsRestoreDBClusterFromS3Message new] completionHandler:^(AWSRdsRestoreDBClusterFromS3Result* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRestoreDBClusterFromSnapshot {
    NSString *key = @"testRestoreDBClusterFromSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] restoreDBClusterFromSnapshot:[AWSRdsRestoreDBClusterFromSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRestoreDBClusterFromSnapshotCompletionHandler {
    NSString *key = @"testRestoreDBClusterFromSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] restoreDBClusterFromSnapshot:[AWSRdsRestoreDBClusterFromSnapshotMessage new] completionHandler:^(AWSRdsRestoreDBClusterFromSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRestoreDBClusterToPointInTime {
    NSString *key = @"testRestoreDBClusterToPointInTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] restoreDBClusterToPointInTime:[AWSRdsRestoreDBClusterToPointInTimeMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRestoreDBClusterToPointInTimeCompletionHandler {
    NSString *key = @"testRestoreDBClusterToPointInTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] restoreDBClusterToPointInTime:[AWSRdsRestoreDBClusterToPointInTimeMessage new] completionHandler:^(AWSRdsRestoreDBClusterToPointInTimeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRestoreDBInstanceFromDBSnapshot {
    NSString *key = @"testRestoreDBInstanceFromDBSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] restoreDBInstanceFromDBSnapshot:[AWSRdsRestoreDBInstanceFromDBSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRestoreDBInstanceFromDBSnapshotCompletionHandler {
    NSString *key = @"testRestoreDBInstanceFromDBSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] restoreDBInstanceFromDBSnapshot:[AWSRdsRestoreDBInstanceFromDBSnapshotMessage new] completionHandler:^(AWSRdsRestoreDBInstanceFromDBSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRestoreDBInstanceFromS3 {
    NSString *key = @"testRestoreDBInstanceFromS3";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] restoreDBInstanceFromS3:[AWSRdsRestoreDBInstanceFromS3Message new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRestoreDBInstanceFromS3CompletionHandler {
    NSString *key = @"testRestoreDBInstanceFromS3";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] restoreDBInstanceFromS3:[AWSRdsRestoreDBInstanceFromS3Message new] completionHandler:^(AWSRdsRestoreDBInstanceFromS3Result* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRestoreDBInstanceToPointInTime {
    NSString *key = @"testRestoreDBInstanceToPointInTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] restoreDBInstanceToPointInTime:[AWSRdsRestoreDBInstanceToPointInTimeMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRestoreDBInstanceToPointInTimeCompletionHandler {
    NSString *key = @"testRestoreDBInstanceToPointInTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] restoreDBInstanceToPointInTime:[AWSRdsRestoreDBInstanceToPointInTimeMessage new] completionHandler:^(AWSRdsRestoreDBInstanceToPointInTimeResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRevokeDBSecurityGroupIngress {
    NSString *key = @"testRevokeDBSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] revokeDBSecurityGroupIngress:[AWSRdsRevokeDBSecurityGroupIngressMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testRevokeDBSecurityGroupIngressCompletionHandler {
    NSString *key = @"testRevokeDBSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] revokeDBSecurityGroupIngress:[AWSRdsRevokeDBSecurityGroupIngressMessage new] completionHandler:^(AWSRdsRevokeDBSecurityGroupIngressResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testStartActivityStream {
    NSString *key = @"testStartActivityStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] startActivityStream:[AWSRdsStartActivityStreamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testStartActivityStreamCompletionHandler {
    NSString *key = @"testStartActivityStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] startActivityStream:[AWSRdsStartActivityStreamRequest new] completionHandler:^(AWSRdsStartActivityStreamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testStartDBCluster {
    NSString *key = @"testStartDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] startDBCluster:[AWSRdsStartDBClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testStartDBClusterCompletionHandler {
    NSString *key = @"testStartDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] startDBCluster:[AWSRdsStartDBClusterMessage new] completionHandler:^(AWSRdsStartDBClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testStartDBInstance {
    NSString *key = @"testStartDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] startDBInstance:[AWSRdsStartDBInstanceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testStartDBInstanceCompletionHandler {
    NSString *key = @"testStartDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] startDBInstance:[AWSRdsStartDBInstanceMessage new] completionHandler:^(AWSRdsStartDBInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testStartExportTask {
    NSString *key = @"testStartExportTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] startExportTask:[AWSRdsStartExportTaskMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testStartExportTaskCompletionHandler {
    NSString *key = @"testStartExportTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] startExportTask:[AWSRdsStartExportTaskMessage new] completionHandler:^(AWSRdsExportTask* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testStopActivityStream {
    NSString *key = @"testStopActivityStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] stopActivityStream:[AWSRdsStopActivityStreamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testStopActivityStreamCompletionHandler {
    NSString *key = @"testStopActivityStream";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] stopActivityStream:[AWSRdsStopActivityStreamRequest new] completionHandler:^(AWSRdsStopActivityStreamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testStopDBCluster {
    NSString *key = @"testStopDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] stopDBCluster:[AWSRdsStopDBClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testStopDBClusterCompletionHandler {
    NSString *key = @"testStopDBCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] stopDBCluster:[AWSRdsStopDBClusterMessage new] completionHandler:^(AWSRdsStopDBClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testStopDBInstance {
    NSString *key = @"testStopDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRds RdsForKey:key] stopDBInstance:[AWSRdsStopDBInstanceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

- (void)testStopDBInstanceCompletionHandler {
    NSString *key = @"testStopDBInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRds registerRdsWithConfiguration:configuration forKey:key];

    AWSRds *awsClient = [AWSRds RdsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRds RdsForKey:key] stopDBInstance:[AWSRdsStopDBInstanceMessage new] completionHandler:^(AWSRdsStopDBInstanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRds removeRdsForKey:key];
}

@end
