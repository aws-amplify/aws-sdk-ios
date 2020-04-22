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
#import "AWSredshiftService.h"

static id mockNetworking = nil;

@interface AWSGeneralredshiftTests : XCTestCase

@end

@implementation AWSGeneralredshiftTests

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
    NSString *key = @"testredshiftConstructors";
    XCTAssertNotNil([AWSredshift defaultredshift]);
    XCTAssertEqual([[AWSredshift defaultredshift] class], [AWSredshift class]);
    XCTAssertNil([AWSredshift redshiftForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSredshift redshiftForKey:key]);
    XCTAssertEqual([[AWSredshift redshiftForKey:key] class], [AWSredshift class]);
    XCTAssertEqual([AWSredshift redshiftForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSredshift removeredshiftForKey:key];
    XCTAssertNil([AWSredshift redshiftForKey:key]);

}

- (void)testAcceptReservedNodeExchange {
    NSString *key = @"testAcceptReservedNodeExchange";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] acceptReservedNodeExchange:[AWSredshiftAcceptReservedNodeExchangeInputMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testAcceptReservedNodeExchangeCompletionHandler {
    NSString *key = @"testAcceptReservedNodeExchange";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] acceptReservedNodeExchange:[AWSredshiftAcceptReservedNodeExchangeInputMessage new] completionHandler:^(AWSredshiftAcceptReservedNodeExchangeOutputMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testAuthorizeClusterSecurityGroupIngress {
    NSString *key = @"testAuthorizeClusterSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] authorizeClusterSecurityGroupIngress:[AWSredshiftAuthorizeClusterSecurityGroupIngressMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testAuthorizeClusterSecurityGroupIngressCompletionHandler {
    NSString *key = @"testAuthorizeClusterSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] authorizeClusterSecurityGroupIngress:[AWSredshiftAuthorizeClusterSecurityGroupIngressMessage new] completionHandler:^(AWSredshiftAuthorizeClusterSecurityGroupIngressResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testAuthorizeSnapshotAccess {
    NSString *key = @"testAuthorizeSnapshotAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] authorizeSnapshotAccess:[AWSredshiftAuthorizeSnapshotAccessMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testAuthorizeSnapshotAccessCompletionHandler {
    NSString *key = @"testAuthorizeSnapshotAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] authorizeSnapshotAccess:[AWSredshiftAuthorizeSnapshotAccessMessage new] completionHandler:^(AWSredshiftAuthorizeSnapshotAccessResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testBatchDeleteClusterSnapshots {
    NSString *key = @"testBatchDeleteClusterSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] batchDeleteClusterSnapshots:[AWSredshiftBatchDeleteClusterSnapshotsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testBatchDeleteClusterSnapshotsCompletionHandler {
    NSString *key = @"testBatchDeleteClusterSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] batchDeleteClusterSnapshots:[AWSredshiftBatchDeleteClusterSnapshotsRequest new] completionHandler:^(AWSredshiftBatchDeleteClusterSnapshotsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testBatchModifyClusterSnapshots {
    NSString *key = @"testBatchModifyClusterSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] batchModifyClusterSnapshots:[AWSredshiftBatchModifyClusterSnapshotsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testBatchModifyClusterSnapshotsCompletionHandler {
    NSString *key = @"testBatchModifyClusterSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] batchModifyClusterSnapshots:[AWSredshiftBatchModifyClusterSnapshotsMessage new] completionHandler:^(AWSredshiftBatchModifyClusterSnapshotsOutputMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCancelResize {
    NSString *key = @"testCancelResize";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] cancelResize:[AWSredshiftCancelResizeMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCancelResizeCompletionHandler {
    NSString *key = @"testCancelResize";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] cancelResize:[AWSredshiftCancelResizeMessage new] completionHandler:^(AWSredshiftResizeProgressMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCopyClusterSnapshot {
    NSString *key = @"testCopyClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] replicateClusterSnapshot:[AWSredshiftReplicateClusterSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCopyClusterSnapshotCompletionHandler {
    NSString *key = @"testCopyClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] replicateClusterSnapshot:[AWSredshiftReplicateClusterSnapshotMessage new] completionHandler:^(AWSredshiftReplicateClusterSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateCluster {
    NSString *key = @"testCreateCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] createCluster:[AWSredshiftCreateClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateClusterCompletionHandler {
    NSString *key = @"testCreateCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] createCluster:[AWSredshiftCreateClusterMessage new] completionHandler:^(AWSredshiftCreateClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateClusterParameterGroup {
    NSString *key = @"testCreateClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] createClusterParameterGroup:[AWSredshiftCreateClusterParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateClusterParameterGroupCompletionHandler {
    NSString *key = @"testCreateClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] createClusterParameterGroup:[AWSredshiftCreateClusterParameterGroupMessage new] completionHandler:^(AWSredshiftCreateClusterParameterGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateClusterSecurityGroup {
    NSString *key = @"testCreateClusterSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] createClusterSecurityGroup:[AWSredshiftCreateClusterSecurityGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateClusterSecurityGroupCompletionHandler {
    NSString *key = @"testCreateClusterSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] createClusterSecurityGroup:[AWSredshiftCreateClusterSecurityGroupMessage new] completionHandler:^(AWSredshiftCreateClusterSecurityGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateClusterSnapshot {
    NSString *key = @"testCreateClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] createClusterSnapshot:[AWSredshiftCreateClusterSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateClusterSnapshotCompletionHandler {
    NSString *key = @"testCreateClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] createClusterSnapshot:[AWSredshiftCreateClusterSnapshotMessage new] completionHandler:^(AWSredshiftCreateClusterSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateClusterSubnetGroup {
    NSString *key = @"testCreateClusterSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] createClusterSubnetGroup:[AWSredshiftCreateClusterSubnetGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateClusterSubnetGroupCompletionHandler {
    NSString *key = @"testCreateClusterSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] createClusterSubnetGroup:[AWSredshiftCreateClusterSubnetGroupMessage new] completionHandler:^(AWSredshiftCreateClusterSubnetGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateEventSubscription {
    NSString *key = @"testCreateEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] createEventSubscription:[AWSredshiftCreateEventSubscriptionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateEventSubscriptionCompletionHandler {
    NSString *key = @"testCreateEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] createEventSubscription:[AWSredshiftCreateEventSubscriptionMessage new] completionHandler:^(AWSredshiftCreateEventSubscriptionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateHsmClientCertificate {
    NSString *key = @"testCreateHsmClientCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] createHsmClientCertificate:[AWSredshiftCreateHsmClientCertificateMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateHsmClientCertificateCompletionHandler {
    NSString *key = @"testCreateHsmClientCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] createHsmClientCertificate:[AWSredshiftCreateHsmClientCertificateMessage new] completionHandler:^(AWSredshiftCreateHsmClientCertificateResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateHsmConfiguration {
    NSString *key = @"testCreateHsmConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] createHsmConfiguration:[AWSredshiftCreateHsmConfigurationMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateHsmConfigurationCompletionHandler {
    NSString *key = @"testCreateHsmConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] createHsmConfiguration:[AWSredshiftCreateHsmConfigurationMessage new] completionHandler:^(AWSredshiftCreateHsmConfigurationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateScheduledAction {
    NSString *key = @"testCreateScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] createScheduledAction:[AWSredshiftCreateScheduledActionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateScheduledActionCompletionHandler {
    NSString *key = @"testCreateScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] createScheduledAction:[AWSredshiftCreateScheduledActionMessage new] completionHandler:^(AWSredshiftScheduledAction* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateSnapshotCopyGrant {
    NSString *key = @"testCreateSnapshotCopyGrant";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] createSnapshotCopyGrant:[AWSredshiftCreateSnapshotCopyGrantMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateSnapshotCopyGrantCompletionHandler {
    NSString *key = @"testCreateSnapshotCopyGrant";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] createSnapshotCopyGrant:[AWSredshiftCreateSnapshotCopyGrantMessage new] completionHandler:^(AWSredshiftCreateSnapshotCopyGrantResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateSnapshotSchedule {
    NSString *key = @"testCreateSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] createSnapshotSchedule:[AWSredshiftCreateSnapshotScheduleMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateSnapshotScheduleCompletionHandler {
    NSString *key = @"testCreateSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] createSnapshotSchedule:[AWSredshiftCreateSnapshotScheduleMessage new] completionHandler:^(AWSredshiftSnapshotSchedule* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateTags {
    NSString *key = @"testCreateTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] createTags:[AWSredshiftCreateTagsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateTagsCompletionHandler {
    NSString *key = @"testCreateTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] createTags:[AWSredshiftCreateTagsMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateUsageLimit {
    NSString *key = @"testCreateUsageLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] createUsageLimit:[AWSredshiftCreateUsageLimitMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testCreateUsageLimitCompletionHandler {
    NSString *key = @"testCreateUsageLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] createUsageLimit:[AWSredshiftCreateUsageLimitMessage new] completionHandler:^(AWSredshiftUsageLimit* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteCluster {
    NSString *key = @"testDeleteCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] deleteCluster:[AWSredshiftDeleteClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteClusterCompletionHandler {
    NSString *key = @"testDeleteCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] deleteCluster:[AWSredshiftDeleteClusterMessage new] completionHandler:^(AWSredshiftDeleteClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteClusterParameterGroup {
    NSString *key = @"testDeleteClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] deleteClusterParameterGroup:[AWSredshiftDeleteClusterParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteClusterParameterGroupCompletionHandler {
    NSString *key = @"testDeleteClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] deleteClusterParameterGroup:[AWSredshiftDeleteClusterParameterGroupMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteClusterSecurityGroup {
    NSString *key = @"testDeleteClusterSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] deleteClusterSecurityGroup:[AWSredshiftDeleteClusterSecurityGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteClusterSecurityGroupCompletionHandler {
    NSString *key = @"testDeleteClusterSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] deleteClusterSecurityGroup:[AWSredshiftDeleteClusterSecurityGroupMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteClusterSnapshot {
    NSString *key = @"testDeleteClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] deleteClusterSnapshot:[AWSredshiftDeleteClusterSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteClusterSnapshotCompletionHandler {
    NSString *key = @"testDeleteClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] deleteClusterSnapshot:[AWSredshiftDeleteClusterSnapshotMessage new] completionHandler:^(AWSredshiftDeleteClusterSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteClusterSubnetGroup {
    NSString *key = @"testDeleteClusterSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] deleteClusterSubnetGroup:[AWSredshiftDeleteClusterSubnetGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteClusterSubnetGroupCompletionHandler {
    NSString *key = @"testDeleteClusterSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] deleteClusterSubnetGroup:[AWSredshiftDeleteClusterSubnetGroupMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteEventSubscription {
    NSString *key = @"testDeleteEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] deleteEventSubscription:[AWSredshiftDeleteEventSubscriptionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteEventSubscriptionCompletionHandler {
    NSString *key = @"testDeleteEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] deleteEventSubscription:[AWSredshiftDeleteEventSubscriptionMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteHsmClientCertificate {
    NSString *key = @"testDeleteHsmClientCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] deleteHsmClientCertificate:[AWSredshiftDeleteHsmClientCertificateMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteHsmClientCertificateCompletionHandler {
    NSString *key = @"testDeleteHsmClientCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] deleteHsmClientCertificate:[AWSredshiftDeleteHsmClientCertificateMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteHsmConfiguration {
    NSString *key = @"testDeleteHsmConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] deleteHsmConfiguration:[AWSredshiftDeleteHsmConfigurationMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteHsmConfigurationCompletionHandler {
    NSString *key = @"testDeleteHsmConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] deleteHsmConfiguration:[AWSredshiftDeleteHsmConfigurationMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteScheduledAction {
    NSString *key = @"testDeleteScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] deleteScheduledAction:[AWSredshiftDeleteScheduledActionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteScheduledActionCompletionHandler {
    NSString *key = @"testDeleteScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] deleteScheduledAction:[AWSredshiftDeleteScheduledActionMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteSnapshotCopyGrant {
    NSString *key = @"testDeleteSnapshotCopyGrant";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] deleteSnapshotCopyGrant:[AWSredshiftDeleteSnapshotCopyGrantMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteSnapshotCopyGrantCompletionHandler {
    NSString *key = @"testDeleteSnapshotCopyGrant";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] deleteSnapshotCopyGrant:[AWSredshiftDeleteSnapshotCopyGrantMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteSnapshotSchedule {
    NSString *key = @"testDeleteSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] deleteSnapshotSchedule:[AWSredshiftDeleteSnapshotScheduleMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteSnapshotScheduleCompletionHandler {
    NSString *key = @"testDeleteSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] deleteSnapshotSchedule:[AWSredshiftDeleteSnapshotScheduleMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteTags {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] deleteTags:[AWSredshiftDeleteTagsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteTagsCompletionHandler {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] deleteTags:[AWSredshiftDeleteTagsMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteUsageLimit {
    NSString *key = @"testDeleteUsageLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] deleteUsageLimit:[AWSredshiftDeleteUsageLimitMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDeleteUsageLimitCompletionHandler {
    NSString *key = @"testDeleteUsageLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] deleteUsageLimit:[AWSredshiftDeleteUsageLimitMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeAccountAttributes {
    NSString *key = @"testDescribeAccountAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeAccountAttributes:[AWSredshiftDescribeAccountAttributesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeAccountAttributesCompletionHandler {
    NSString *key = @"testDescribeAccountAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeAccountAttributes:[AWSredshiftDescribeAccountAttributesMessage new] completionHandler:^(AWSredshiftAccountAttributeList* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterDbRevisions {
    NSString *key = @"testDescribeClusterDbRevisions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeClusterDbRevisions:[AWSredshiftDescribeClusterDbRevisionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterDbRevisionsCompletionHandler {
    NSString *key = @"testDescribeClusterDbRevisions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeClusterDbRevisions:[AWSredshiftDescribeClusterDbRevisionsMessage new] completionHandler:^(AWSredshiftClusterDbRevisionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterParameterGroups {
    NSString *key = @"testDescribeClusterParameterGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeClusterParameterGroups:[AWSredshiftDescribeClusterParameterGroupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterParameterGroupsCompletionHandler {
    NSString *key = @"testDescribeClusterParameterGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeClusterParameterGroups:[AWSredshiftDescribeClusterParameterGroupsMessage new] completionHandler:^(AWSredshiftClusterParameterGroupsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterParameters {
    NSString *key = @"testDescribeClusterParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeClusterParameters:[AWSredshiftDescribeClusterParametersMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterParametersCompletionHandler {
    NSString *key = @"testDescribeClusterParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeClusterParameters:[AWSredshiftDescribeClusterParametersMessage new] completionHandler:^(AWSredshiftClusterParameterGroupDetails* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterSecurityGroups {
    NSString *key = @"testDescribeClusterSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeClusterSecurityGroups:[AWSredshiftDescribeClusterSecurityGroupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterSecurityGroupsCompletionHandler {
    NSString *key = @"testDescribeClusterSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeClusterSecurityGroups:[AWSredshiftDescribeClusterSecurityGroupsMessage new] completionHandler:^(AWSredshiftClusterSecurityGroupMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterSnapshots {
    NSString *key = @"testDescribeClusterSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeClusterSnapshots:[AWSredshiftDescribeClusterSnapshotsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterSnapshotsCompletionHandler {
    NSString *key = @"testDescribeClusterSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeClusterSnapshots:[AWSredshiftDescribeClusterSnapshotsMessage new] completionHandler:^(AWSredshiftSnapshotMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterSubnetGroups {
    NSString *key = @"testDescribeClusterSubnetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeClusterSubnetGroups:[AWSredshiftDescribeClusterSubnetGroupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterSubnetGroupsCompletionHandler {
    NSString *key = @"testDescribeClusterSubnetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeClusterSubnetGroups:[AWSredshiftDescribeClusterSubnetGroupsMessage new] completionHandler:^(AWSredshiftClusterSubnetGroupMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterTracks {
    NSString *key = @"testDescribeClusterTracks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeClusterTracks:[AWSredshiftDescribeClusterTracksMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterTracksCompletionHandler {
    NSString *key = @"testDescribeClusterTracks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeClusterTracks:[AWSredshiftDescribeClusterTracksMessage new] completionHandler:^(AWSredshiftTrackListMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterVersions {
    NSString *key = @"testDescribeClusterVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeClusterVersions:[AWSredshiftDescribeClusterVersionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusterVersionsCompletionHandler {
    NSString *key = @"testDescribeClusterVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeClusterVersions:[AWSredshiftDescribeClusterVersionsMessage new] completionHandler:^(AWSredshiftClusterVersionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClusters {
    NSString *key = @"testDescribeClusters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeClusters:[AWSredshiftDescribeClustersMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeClustersCompletionHandler {
    NSString *key = @"testDescribeClusters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeClusters:[AWSredshiftDescribeClustersMessage new] completionHandler:^(AWSredshiftClustersMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeDefaultClusterParameters {
    NSString *key = @"testDescribeDefaultClusterParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeDefaultClusterParameters:[AWSredshiftDescribeDefaultClusterParametersMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeDefaultClusterParametersCompletionHandler {
    NSString *key = @"testDescribeDefaultClusterParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeDefaultClusterParameters:[AWSredshiftDescribeDefaultClusterParametersMessage new] completionHandler:^(AWSredshiftDescribeDefaultClusterParametersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeEventCategories {
    NSString *key = @"testDescribeEventCategories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeEventCategories:[AWSredshiftDescribeEventCategoriesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeEventCategoriesCompletionHandler {
    NSString *key = @"testDescribeEventCategories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeEventCategories:[AWSredshiftDescribeEventCategoriesMessage new] completionHandler:^(AWSredshiftEventCategoriesMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeEventSubscriptions {
    NSString *key = @"testDescribeEventSubscriptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeEventSubscriptions:[AWSredshiftDescribeEventSubscriptionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeEventSubscriptionsCompletionHandler {
    NSString *key = @"testDescribeEventSubscriptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeEventSubscriptions:[AWSredshiftDescribeEventSubscriptionsMessage new] completionHandler:^(AWSredshiftEventSubscriptionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeEvents {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeEvents:[AWSredshiftDescribeEventsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeEventsCompletionHandler {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeEvents:[AWSredshiftDescribeEventsMessage new] completionHandler:^(AWSredshiftEventsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeHsmClientCertificates {
    NSString *key = @"testDescribeHsmClientCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeHsmClientCertificates:[AWSredshiftDescribeHsmClientCertificatesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeHsmClientCertificatesCompletionHandler {
    NSString *key = @"testDescribeHsmClientCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeHsmClientCertificates:[AWSredshiftDescribeHsmClientCertificatesMessage new] completionHandler:^(AWSredshiftHsmClientCertificateMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeHsmConfigurations {
    NSString *key = @"testDescribeHsmConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeHsmConfigurations:[AWSredshiftDescribeHsmConfigurationsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeHsmConfigurationsCompletionHandler {
    NSString *key = @"testDescribeHsmConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeHsmConfigurations:[AWSredshiftDescribeHsmConfigurationsMessage new] completionHandler:^(AWSredshiftHsmConfigurationMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeLoggingStatus {
    NSString *key = @"testDescribeLoggingStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeLoggingStatus:[AWSredshiftDescribeLoggingStatusMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeLoggingStatusCompletionHandler {
    NSString *key = @"testDescribeLoggingStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeLoggingStatus:[AWSredshiftDescribeLoggingStatusMessage new] completionHandler:^(AWSredshiftLoggingStatus* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeNodeConfigurationOptions {
    NSString *key = @"testDescribeNodeConfigurationOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeNodeConfigurationOptions:[AWSredshiftDescribeNodeConfigurationOptionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeNodeConfigurationOptionsCompletionHandler {
    NSString *key = @"testDescribeNodeConfigurationOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeNodeConfigurationOptions:[AWSredshiftDescribeNodeConfigurationOptionsMessage new] completionHandler:^(AWSredshiftNodeConfigurationOptionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeOrderableClusterOptions {
    NSString *key = @"testDescribeOrderableClusterOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeOrderableClusterOptions:[AWSredshiftDescribeOrderableClusterOptionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeOrderableClusterOptionsCompletionHandler {
    NSString *key = @"testDescribeOrderableClusterOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeOrderableClusterOptions:[AWSredshiftDescribeOrderableClusterOptionsMessage new] completionHandler:^(AWSredshiftOrderableClusterOptionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeReservedNodeOfferings {
    NSString *key = @"testDescribeReservedNodeOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeReservedNodeOfferings:[AWSredshiftDescribeReservedNodeOfferingsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeReservedNodeOfferingsCompletionHandler {
    NSString *key = @"testDescribeReservedNodeOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeReservedNodeOfferings:[AWSredshiftDescribeReservedNodeOfferingsMessage new] completionHandler:^(AWSredshiftReservedNodeOfferingsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeReservedNodes {
    NSString *key = @"testDescribeReservedNodes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeReservedNodes:[AWSredshiftDescribeReservedNodesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeReservedNodesCompletionHandler {
    NSString *key = @"testDescribeReservedNodes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeReservedNodes:[AWSredshiftDescribeReservedNodesMessage new] completionHandler:^(AWSredshiftReservedNodesMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeResize {
    NSString *key = @"testDescribeResize";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeResize:[AWSredshiftDescribeResizeMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeResizeCompletionHandler {
    NSString *key = @"testDescribeResize";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeResize:[AWSredshiftDescribeResizeMessage new] completionHandler:^(AWSredshiftResizeProgressMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeScheduledActions {
    NSString *key = @"testDescribeScheduledActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeScheduledActions:[AWSredshiftDescribeScheduledActionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeScheduledActionsCompletionHandler {
    NSString *key = @"testDescribeScheduledActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeScheduledActions:[AWSredshiftDescribeScheduledActionsMessage new] completionHandler:^(AWSredshiftScheduledActionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeSnapshotCopyGrants {
    NSString *key = @"testDescribeSnapshotCopyGrants";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeSnapshotCopyGrants:[AWSredshiftDescribeSnapshotCopyGrantsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeSnapshotCopyGrantsCompletionHandler {
    NSString *key = @"testDescribeSnapshotCopyGrants";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeSnapshotCopyGrants:[AWSredshiftDescribeSnapshotCopyGrantsMessage new] completionHandler:^(AWSredshiftSnapshotCopyGrantMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeSnapshotSchedules {
    NSString *key = @"testDescribeSnapshotSchedules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeSnapshotSchedules:[AWSredshiftDescribeSnapshotSchedulesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeSnapshotSchedulesCompletionHandler {
    NSString *key = @"testDescribeSnapshotSchedules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeSnapshotSchedules:[AWSredshiftDescribeSnapshotSchedulesMessage new] completionHandler:^(AWSredshiftDescribeSnapshotSchedulesOutputMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeStorage {
    NSString *key = @"testDescribeStorage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeStorage:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeStorageCompletionHandler {
    NSString *key = @"testDescribeStorage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeStorage:[AWSRequest new] completionHandler:^(AWSredshiftCustomerStorageMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeTableRestoreStatus {
    NSString *key = @"testDescribeTableRestoreStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeTableRestoreStatus:[AWSredshiftDescribeTableRestoreStatusMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeTableRestoreStatusCompletionHandler {
    NSString *key = @"testDescribeTableRestoreStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeTableRestoreStatus:[AWSredshiftDescribeTableRestoreStatusMessage new] completionHandler:^(AWSredshiftTableRestoreStatusMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeTags {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeTags:[AWSredshiftDescribeTagsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeTagsCompletionHandler {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeTags:[AWSredshiftDescribeTagsMessage new] completionHandler:^(AWSredshiftTaggedResourceListMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeUsageLimits {
    NSString *key = @"testDescribeUsageLimits";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] describeUsageLimits:[AWSredshiftDescribeUsageLimitsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDescribeUsageLimitsCompletionHandler {
    NSString *key = @"testDescribeUsageLimits";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] describeUsageLimits:[AWSredshiftDescribeUsageLimitsMessage new] completionHandler:^(AWSredshiftUsageLimitList* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDisableLogging {
    NSString *key = @"testDisableLogging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] disableLogging:[AWSredshiftDisableLoggingMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDisableLoggingCompletionHandler {
    NSString *key = @"testDisableLogging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] disableLogging:[AWSredshiftDisableLoggingMessage new] completionHandler:^(AWSredshiftLoggingStatus* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDisableSnapshotCopy {
    NSString *key = @"testDisableSnapshotCopy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] disableSnapshotCopy:[AWSredshiftDisableSnapshotCopyMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testDisableSnapshotCopyCompletionHandler {
    NSString *key = @"testDisableSnapshotCopy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] disableSnapshotCopy:[AWSredshiftDisableSnapshotCopyMessage new] completionHandler:^(AWSredshiftDisableSnapshotCopyResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testEnableLogging {
    NSString *key = @"testEnableLogging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] enableLogging:[AWSredshiftEnableLoggingMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testEnableLoggingCompletionHandler {
    NSString *key = @"testEnableLogging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] enableLogging:[AWSredshiftEnableLoggingMessage new] completionHandler:^(AWSredshiftLoggingStatus* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testEnableSnapshotCopy {
    NSString *key = @"testEnableSnapshotCopy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] enableSnapshotCopy:[AWSredshiftEnableSnapshotCopyMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testEnableSnapshotCopyCompletionHandler {
    NSString *key = @"testEnableSnapshotCopy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] enableSnapshotCopy:[AWSredshiftEnableSnapshotCopyMessage new] completionHandler:^(AWSredshiftEnableSnapshotCopyResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testGetClusterCredentials {
    NSString *key = @"testGetClusterCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] getClusterCredentials:[AWSredshiftGetClusterCredentialsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testGetClusterCredentialsCompletionHandler {
    NSString *key = @"testGetClusterCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] getClusterCredentials:[AWSredshiftGetClusterCredentialsMessage new] completionHandler:^(AWSredshiftClusterCredentials* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testGetReservedNodeExchangeOfferings {
    NSString *key = @"testGetReservedNodeExchangeOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] getReservedNodeExchangeOfferings:[AWSredshiftGetReservedNodeExchangeOfferingsInputMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testGetReservedNodeExchangeOfferingsCompletionHandler {
    NSString *key = @"testGetReservedNodeExchangeOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] getReservedNodeExchangeOfferings:[AWSredshiftGetReservedNodeExchangeOfferingsInputMessage new] completionHandler:^(AWSredshiftGetReservedNodeExchangeOfferingsOutputMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyCluster {
    NSString *key = @"testModifyCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] modifyCluster:[AWSredshiftModifyClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterCompletionHandler {
    NSString *key = @"testModifyCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] modifyCluster:[AWSredshiftModifyClusterMessage new] completionHandler:^(AWSredshiftModifyClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterDbRevision {
    NSString *key = @"testModifyClusterDbRevision";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] modifyClusterDbRevision:[AWSredshiftModifyClusterDbRevisionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterDbRevisionCompletionHandler {
    NSString *key = @"testModifyClusterDbRevision";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] modifyClusterDbRevision:[AWSredshiftModifyClusterDbRevisionMessage new] completionHandler:^(AWSredshiftModifyClusterDbRevisionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterIamRoles {
    NSString *key = @"testModifyClusterIamRoles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] modifyClusterIamRoles:[AWSredshiftModifyClusterIamRolesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterIamRolesCompletionHandler {
    NSString *key = @"testModifyClusterIamRoles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] modifyClusterIamRoles:[AWSredshiftModifyClusterIamRolesMessage new] completionHandler:^(AWSredshiftModifyClusterIamRolesResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterMaintenance {
    NSString *key = @"testModifyClusterMaintenance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] modifyClusterMaintenance:[AWSredshiftModifyClusterMaintenanceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterMaintenanceCompletionHandler {
    NSString *key = @"testModifyClusterMaintenance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] modifyClusterMaintenance:[AWSredshiftModifyClusterMaintenanceMessage new] completionHandler:^(AWSredshiftModifyClusterMaintenanceResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterParameterGroup {
    NSString *key = @"testModifyClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] modifyClusterParameterGroup:[AWSredshiftModifyClusterParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterParameterGroupCompletionHandler {
    NSString *key = @"testModifyClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] modifyClusterParameterGroup:[AWSredshiftModifyClusterParameterGroupMessage new] completionHandler:^(AWSredshiftClusterParameterGroupNameMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterSnapshot {
    NSString *key = @"testModifyClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] modifyClusterSnapshot:[AWSredshiftModifyClusterSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterSnapshotCompletionHandler {
    NSString *key = @"testModifyClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] modifyClusterSnapshot:[AWSredshiftModifyClusterSnapshotMessage new] completionHandler:^(AWSredshiftModifyClusterSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterSnapshotSchedule {
    NSString *key = @"testModifyClusterSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] modifyClusterSnapshotSchedule:[AWSredshiftModifyClusterSnapshotScheduleMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterSnapshotScheduleCompletionHandler {
    NSString *key = @"testModifyClusterSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] modifyClusterSnapshotSchedule:[AWSredshiftModifyClusterSnapshotScheduleMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterSubnetGroup {
    NSString *key = @"testModifyClusterSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] modifyClusterSubnetGroup:[AWSredshiftModifyClusterSubnetGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyClusterSubnetGroupCompletionHandler {
    NSString *key = @"testModifyClusterSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] modifyClusterSubnetGroup:[AWSredshiftModifyClusterSubnetGroupMessage new] completionHandler:^(AWSredshiftModifyClusterSubnetGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyEventSubscription {
    NSString *key = @"testModifyEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] modifyEventSubscription:[AWSredshiftModifyEventSubscriptionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyEventSubscriptionCompletionHandler {
    NSString *key = @"testModifyEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] modifyEventSubscription:[AWSredshiftModifyEventSubscriptionMessage new] completionHandler:^(AWSredshiftModifyEventSubscriptionResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyScheduledAction {
    NSString *key = @"testModifyScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] modifyScheduledAction:[AWSredshiftModifyScheduledActionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyScheduledActionCompletionHandler {
    NSString *key = @"testModifyScheduledAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] modifyScheduledAction:[AWSredshiftModifyScheduledActionMessage new] completionHandler:^(AWSredshiftScheduledAction* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifySnapshotCopyRetentionPeriod {
    NSString *key = @"testModifySnapshotCopyRetentionPeriod";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] modifySnapshotCopyRetentionPeriod:[AWSredshiftModifySnapshotCopyRetentionPeriodMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifySnapshotCopyRetentionPeriodCompletionHandler {
    NSString *key = @"testModifySnapshotCopyRetentionPeriod";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] modifySnapshotCopyRetentionPeriod:[AWSredshiftModifySnapshotCopyRetentionPeriodMessage new] completionHandler:^(AWSredshiftModifySnapshotCopyRetentionPeriodResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifySnapshotSchedule {
    NSString *key = @"testModifySnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] modifySnapshotSchedule:[AWSredshiftModifySnapshotScheduleMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifySnapshotScheduleCompletionHandler {
    NSString *key = @"testModifySnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] modifySnapshotSchedule:[AWSredshiftModifySnapshotScheduleMessage new] completionHandler:^(AWSredshiftSnapshotSchedule* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyUsageLimit {
    NSString *key = @"testModifyUsageLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] modifyUsageLimit:[AWSredshiftModifyUsageLimitMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testModifyUsageLimitCompletionHandler {
    NSString *key = @"testModifyUsageLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] modifyUsageLimit:[AWSredshiftModifyUsageLimitMessage new] completionHandler:^(AWSredshiftUsageLimit* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testPauseCluster {
    NSString *key = @"testPauseCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] pauseCluster:[AWSredshiftPauseClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testPauseClusterCompletionHandler {
    NSString *key = @"testPauseCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] pauseCluster:[AWSredshiftPauseClusterMessage new] completionHandler:^(AWSredshiftPauseClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testPurchaseReservedNodeOffering {
    NSString *key = @"testPurchaseReservedNodeOffering";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] purchaseReservedNodeOffering:[AWSredshiftPurchaseReservedNodeOfferingMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testPurchaseReservedNodeOfferingCompletionHandler {
    NSString *key = @"testPurchaseReservedNodeOffering";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] purchaseReservedNodeOffering:[AWSredshiftPurchaseReservedNodeOfferingMessage new] completionHandler:^(AWSredshiftPurchaseReservedNodeOfferingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testRebootCluster {
    NSString *key = @"testRebootCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] rebootCluster:[AWSredshiftRebootClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testRebootClusterCompletionHandler {
    NSString *key = @"testRebootCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] rebootCluster:[AWSredshiftRebootClusterMessage new] completionHandler:^(AWSredshiftRebootClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testResetClusterParameterGroup {
    NSString *key = @"testResetClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] resetClusterParameterGroup:[AWSredshiftResetClusterParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testResetClusterParameterGroupCompletionHandler {
    NSString *key = @"testResetClusterParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] resetClusterParameterGroup:[AWSredshiftResetClusterParameterGroupMessage new] completionHandler:^(AWSredshiftClusterParameterGroupNameMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testResizeCluster {
    NSString *key = @"testResizeCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] resizeCluster:[AWSredshiftResizeClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testResizeClusterCompletionHandler {
    NSString *key = @"testResizeCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] resizeCluster:[AWSredshiftResizeClusterMessage new] completionHandler:^(AWSredshiftResizeClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testRestoreFromClusterSnapshot {
    NSString *key = @"testRestoreFromClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] restoreFromClusterSnapshot:[AWSredshiftRestoreFromClusterSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testRestoreFromClusterSnapshotCompletionHandler {
    NSString *key = @"testRestoreFromClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] restoreFromClusterSnapshot:[AWSredshiftRestoreFromClusterSnapshotMessage new] completionHandler:^(AWSredshiftRestoreFromClusterSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testRestoreTableFromClusterSnapshot {
    NSString *key = @"testRestoreTableFromClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] restoreTableFromClusterSnapshot:[AWSredshiftRestoreTableFromClusterSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testRestoreTableFromClusterSnapshotCompletionHandler {
    NSString *key = @"testRestoreTableFromClusterSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] restoreTableFromClusterSnapshot:[AWSredshiftRestoreTableFromClusterSnapshotMessage new] completionHandler:^(AWSredshiftRestoreTableFromClusterSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testResumeCluster {
    NSString *key = @"testResumeCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] resumeCluster:[AWSredshiftResumeClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testResumeClusterCompletionHandler {
    NSString *key = @"testResumeCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] resumeCluster:[AWSredshiftResumeClusterMessage new] completionHandler:^(AWSredshiftResumeClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testRevokeClusterSecurityGroupIngress {
    NSString *key = @"testRevokeClusterSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] revokeClusterSecurityGroupIngress:[AWSredshiftRevokeClusterSecurityGroupIngressMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testRevokeClusterSecurityGroupIngressCompletionHandler {
    NSString *key = @"testRevokeClusterSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] revokeClusterSecurityGroupIngress:[AWSredshiftRevokeClusterSecurityGroupIngressMessage new] completionHandler:^(AWSredshiftRevokeClusterSecurityGroupIngressResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testRevokeSnapshotAccess {
    NSString *key = @"testRevokeSnapshotAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] revokeSnapshotAccess:[AWSredshiftRevokeSnapshotAccessMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testRevokeSnapshotAccessCompletionHandler {
    NSString *key = @"testRevokeSnapshotAccess";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] revokeSnapshotAccess:[AWSredshiftRevokeSnapshotAccessMessage new] completionHandler:^(AWSredshiftRevokeSnapshotAccessResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testRotateEncryptionKey {
    NSString *key = @"testRotateEncryptionKey";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSredshift redshiftForKey:key] rotateEncryptionKey:[AWSredshiftRotateEncryptionKeyMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

- (void)testRotateEncryptionKeyCompletionHandler {
    NSString *key = @"testRotateEncryptionKey";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSredshift registerredshiftWithConfiguration:configuration forKey:key];

    AWSredshift *awsClient = [AWSredshift redshiftForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSredshift redshiftForKey:key] rotateEncryptionKey:[AWSredshiftRotateEncryptionKeyMessage new] completionHandler:^(AWSredshiftRotateEncryptionKeyResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSredshift removeredshiftForKey:key];
}

@end
