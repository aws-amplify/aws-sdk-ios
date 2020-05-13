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
#import "AWSElasticacheService.h"

static id mockNetworking = nil;

@interface AWSGeneralElasticacheTests : XCTestCase

@end

@implementation AWSGeneralElasticacheTests

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
    NSString *key = @"testElasticacheConstructors";
    XCTAssertNotNil([AWSElasticache defaultElasticache]);
    XCTAssertEqual([[AWSElasticache defaultElasticache] class], [AWSElasticache class]);
    XCTAssertNil([AWSElasticache ElasticacheForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSElasticache ElasticacheForKey:key]);
    XCTAssertEqual([[AWSElasticache ElasticacheForKey:key] class], [AWSElasticache class]);
    XCTAssertEqual([AWSElasticache ElasticacheForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSElasticache removeElasticacheForKey:key];
    XCTAssertNil([AWSElasticache ElasticacheForKey:key]);

}

- (void)testAddTagsToResource {
    NSString *key = @"testAddTagsToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] addTagsToResource:[AWSElasticacheAddTagsToResourceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testAddTagsToResourceCompletionHandler {
    NSString *key = @"testAddTagsToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] addTagsToResource:[AWSElasticacheAddTagsToResourceMessage new] completionHandler:^(AWSElasticacheTagListMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testAuthorizeCacheSecurityGroupIngress {
    NSString *key = @"testAuthorizeCacheSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] authorizeCacheSecurityGroupIngress:[AWSElasticacheAuthorizeCacheSecurityGroupIngressMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testAuthorizeCacheSecurityGroupIngressCompletionHandler {
    NSString *key = @"testAuthorizeCacheSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] authorizeCacheSecurityGroupIngress:[AWSElasticacheAuthorizeCacheSecurityGroupIngressMessage new] completionHandler:^(AWSElasticacheAuthorizeCacheSecurityGroupIngressResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testBatchApplyUpdateAction {
    NSString *key = @"testBatchApplyUpdateAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] batchApplyUpdateAction:[AWSElasticacheBatchApplyUpdateActionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testBatchApplyUpdateActionCompletionHandler {
    NSString *key = @"testBatchApplyUpdateAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] batchApplyUpdateAction:[AWSElasticacheBatchApplyUpdateActionMessage new] completionHandler:^(AWSElasticacheUpdateActionResultsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testBatchStopUpdateAction {
    NSString *key = @"testBatchStopUpdateAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] batchStopUpdateAction:[AWSElasticacheBatchStopUpdateActionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testBatchStopUpdateActionCompletionHandler {
    NSString *key = @"testBatchStopUpdateAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] batchStopUpdateAction:[AWSElasticacheBatchStopUpdateActionMessage new] completionHandler:^(AWSElasticacheUpdateActionResultsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCompleteMigration {
    NSString *key = @"testCompleteMigration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] completeMigration:[AWSElasticacheCompleteMigrationMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCompleteMigrationCompletionHandler {
    NSString *key = @"testCompleteMigration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] completeMigration:[AWSElasticacheCompleteMigrationMessage new] completionHandler:^(AWSElasticacheCompleteMigrationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCopySnapshot {
    NSString *key = @"testCopySnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] replicateSnapshot:[AWSElasticacheReplicateSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCopySnapshotCompletionHandler {
    NSString *key = @"testCopySnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] replicateSnapshot:[AWSElasticacheReplicateSnapshotMessage new] completionHandler:^(AWSElasticacheReplicateSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCreateCacheCluster {
    NSString *key = @"testCreateCacheCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] createCacheCluster:[AWSElasticacheCreateCacheClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCreateCacheClusterCompletionHandler {
    NSString *key = @"testCreateCacheCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] createCacheCluster:[AWSElasticacheCreateCacheClusterMessage new] completionHandler:^(AWSElasticacheCreateCacheClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCreateCacheParameterGroup {
    NSString *key = @"testCreateCacheParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] createCacheParameterGroup:[AWSElasticacheCreateCacheParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCreateCacheParameterGroupCompletionHandler {
    NSString *key = @"testCreateCacheParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] createCacheParameterGroup:[AWSElasticacheCreateCacheParameterGroupMessage new] completionHandler:^(AWSElasticacheCreateCacheParameterGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCreateCacheSecurityGroup {
    NSString *key = @"testCreateCacheSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] createCacheSecurityGroup:[AWSElasticacheCreateCacheSecurityGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCreateCacheSecurityGroupCompletionHandler {
    NSString *key = @"testCreateCacheSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] createCacheSecurityGroup:[AWSElasticacheCreateCacheSecurityGroupMessage new] completionHandler:^(AWSElasticacheCreateCacheSecurityGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCreateCacheSubnetGroup {
    NSString *key = @"testCreateCacheSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] createCacheSubnetGroup:[AWSElasticacheCreateCacheSubnetGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCreateCacheSubnetGroupCompletionHandler {
    NSString *key = @"testCreateCacheSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] createCacheSubnetGroup:[AWSElasticacheCreateCacheSubnetGroupMessage new] completionHandler:^(AWSElasticacheCreateCacheSubnetGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCreateGlobalReplicationGroup {
    NSString *key = @"testCreateGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] createGlobalReplicationGroup:[AWSElasticacheCreateGlobalReplicationGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCreateGlobalReplicationGroupCompletionHandler {
    NSString *key = @"testCreateGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] createGlobalReplicationGroup:[AWSElasticacheCreateGlobalReplicationGroupMessage new] completionHandler:^(AWSElasticacheCreateGlobalReplicationGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCreateReplicationGroup {
    NSString *key = @"testCreateReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] createReplicationGroup:[AWSElasticacheCreateReplicationGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCreateReplicationGroupCompletionHandler {
    NSString *key = @"testCreateReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] createReplicationGroup:[AWSElasticacheCreateReplicationGroupMessage new] completionHandler:^(AWSElasticacheCreateReplicationGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCreateSnapshot {
    NSString *key = @"testCreateSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] createSnapshot:[AWSElasticacheCreateSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testCreateSnapshotCompletionHandler {
    NSString *key = @"testCreateSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] createSnapshot:[AWSElasticacheCreateSnapshotMessage new] completionHandler:^(AWSElasticacheCreateSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDecreaseNodeGroupsInGlobalReplicationGroup {
    NSString *key = @"testDecreaseNodeGroupsInGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] decreaseNodeGroupsInGlobalReplicationGroup:[AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDecreaseNodeGroupsInGlobalReplicationGroupCompletionHandler {
    NSString *key = @"testDecreaseNodeGroupsInGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] decreaseNodeGroupsInGlobalReplicationGroup:[AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupMessage new] completionHandler:^(AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDecreaseReplicaCount {
    NSString *key = @"testDecreaseReplicaCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] decreaseReplicaCount:[AWSElasticacheDecreaseReplicaCountMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDecreaseReplicaCountCompletionHandler {
    NSString *key = @"testDecreaseReplicaCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] decreaseReplicaCount:[AWSElasticacheDecreaseReplicaCountMessage new] completionHandler:^(AWSElasticacheDecreaseReplicaCountResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDeleteCacheCluster {
    NSString *key = @"testDeleteCacheCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] deleteCacheCluster:[AWSElasticacheDeleteCacheClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDeleteCacheClusterCompletionHandler {
    NSString *key = @"testDeleteCacheCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] deleteCacheCluster:[AWSElasticacheDeleteCacheClusterMessage new] completionHandler:^(AWSElasticacheDeleteCacheClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDeleteCacheParameterGroup {
    NSString *key = @"testDeleteCacheParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] deleteCacheParameterGroup:[AWSElasticacheDeleteCacheParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDeleteCacheParameterGroupCompletionHandler {
    NSString *key = @"testDeleteCacheParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] deleteCacheParameterGroup:[AWSElasticacheDeleteCacheParameterGroupMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDeleteCacheSecurityGroup {
    NSString *key = @"testDeleteCacheSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] deleteCacheSecurityGroup:[AWSElasticacheDeleteCacheSecurityGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDeleteCacheSecurityGroupCompletionHandler {
    NSString *key = @"testDeleteCacheSecurityGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] deleteCacheSecurityGroup:[AWSElasticacheDeleteCacheSecurityGroupMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDeleteCacheSubnetGroup {
    NSString *key = @"testDeleteCacheSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] deleteCacheSubnetGroup:[AWSElasticacheDeleteCacheSubnetGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDeleteCacheSubnetGroupCompletionHandler {
    NSString *key = @"testDeleteCacheSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] deleteCacheSubnetGroup:[AWSElasticacheDeleteCacheSubnetGroupMessage new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDeleteGlobalReplicationGroup {
    NSString *key = @"testDeleteGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] deleteGlobalReplicationGroup:[AWSElasticacheDeleteGlobalReplicationGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDeleteGlobalReplicationGroupCompletionHandler {
    NSString *key = @"testDeleteGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] deleteGlobalReplicationGroup:[AWSElasticacheDeleteGlobalReplicationGroupMessage new] completionHandler:^(AWSElasticacheDeleteGlobalReplicationGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDeleteReplicationGroup {
    NSString *key = @"testDeleteReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] deleteReplicationGroup:[AWSElasticacheDeleteReplicationGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDeleteReplicationGroupCompletionHandler {
    NSString *key = @"testDeleteReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] deleteReplicationGroup:[AWSElasticacheDeleteReplicationGroupMessage new] completionHandler:^(AWSElasticacheDeleteReplicationGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDeleteSnapshot {
    NSString *key = @"testDeleteSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] deleteSnapshot:[AWSElasticacheDeleteSnapshotMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDeleteSnapshotCompletionHandler {
    NSString *key = @"testDeleteSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] deleteSnapshot:[AWSElasticacheDeleteSnapshotMessage new] completionHandler:^(AWSElasticacheDeleteSnapshotResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeCacheClusters {
    NSString *key = @"testDescribeCacheClusters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeCacheClusters:[AWSElasticacheDescribeCacheClustersMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeCacheClustersCompletionHandler {
    NSString *key = @"testDescribeCacheClusters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeCacheClusters:[AWSElasticacheDescribeCacheClustersMessage new] completionHandler:^(AWSElasticacheCacheClusterMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeCacheEngineVersions {
    NSString *key = @"testDescribeCacheEngineVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeCacheEngineVersions:[AWSElasticacheDescribeCacheEngineVersionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeCacheEngineVersionsCompletionHandler {
    NSString *key = @"testDescribeCacheEngineVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeCacheEngineVersions:[AWSElasticacheDescribeCacheEngineVersionsMessage new] completionHandler:^(AWSElasticacheCacheEngineVersionMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeCacheParameterGroups {
    NSString *key = @"testDescribeCacheParameterGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeCacheParameterGroups:[AWSElasticacheDescribeCacheParameterGroupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeCacheParameterGroupsCompletionHandler {
    NSString *key = @"testDescribeCacheParameterGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeCacheParameterGroups:[AWSElasticacheDescribeCacheParameterGroupsMessage new] completionHandler:^(AWSElasticacheCacheParameterGroupsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeCacheParameters {
    NSString *key = @"testDescribeCacheParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeCacheParameters:[AWSElasticacheDescribeCacheParametersMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeCacheParametersCompletionHandler {
    NSString *key = @"testDescribeCacheParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeCacheParameters:[AWSElasticacheDescribeCacheParametersMessage new] completionHandler:^(AWSElasticacheCacheParameterGroupDetails* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeCacheSecurityGroups {
    NSString *key = @"testDescribeCacheSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeCacheSecurityGroups:[AWSElasticacheDescribeCacheSecurityGroupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeCacheSecurityGroupsCompletionHandler {
    NSString *key = @"testDescribeCacheSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeCacheSecurityGroups:[AWSElasticacheDescribeCacheSecurityGroupsMessage new] completionHandler:^(AWSElasticacheCacheSecurityGroupMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeCacheSubnetGroups {
    NSString *key = @"testDescribeCacheSubnetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeCacheSubnetGroups:[AWSElasticacheDescribeCacheSubnetGroupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeCacheSubnetGroupsCompletionHandler {
    NSString *key = @"testDescribeCacheSubnetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeCacheSubnetGroups:[AWSElasticacheDescribeCacheSubnetGroupsMessage new] completionHandler:^(AWSElasticacheCacheSubnetGroupMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeEngineDefaultParameters {
    NSString *key = @"testDescribeEngineDefaultParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeEngineDefaultParameters:[AWSElasticacheDescribeEngineDefaultParametersMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeEngineDefaultParametersCompletionHandler {
    NSString *key = @"testDescribeEngineDefaultParameters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeEngineDefaultParameters:[AWSElasticacheDescribeEngineDefaultParametersMessage new] completionHandler:^(AWSElasticacheDescribeEngineDefaultParametersResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeEvents {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeEvents:[AWSElasticacheDescribeEventsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeEventsCompletionHandler {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeEvents:[AWSElasticacheDescribeEventsMessage new] completionHandler:^(AWSElasticacheEventsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeGlobalReplicationGroups {
    NSString *key = @"testDescribeGlobalReplicationGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeGlobalReplicationGroups:[AWSElasticacheDescribeGlobalReplicationGroupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeGlobalReplicationGroupsCompletionHandler {
    NSString *key = @"testDescribeGlobalReplicationGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeGlobalReplicationGroups:[AWSElasticacheDescribeGlobalReplicationGroupsMessage new] completionHandler:^(AWSElasticacheDescribeGlobalReplicationGroupsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeReplicationGroups {
    NSString *key = @"testDescribeReplicationGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeReplicationGroups:[AWSElasticacheDescribeReplicationGroupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeReplicationGroupsCompletionHandler {
    NSString *key = @"testDescribeReplicationGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeReplicationGroups:[AWSElasticacheDescribeReplicationGroupsMessage new] completionHandler:^(AWSElasticacheReplicationGroupMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeReservedCacheNodes {
    NSString *key = @"testDescribeReservedCacheNodes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeReservedCacheNodes:[AWSElasticacheDescribeReservedCacheNodesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeReservedCacheNodesCompletionHandler {
    NSString *key = @"testDescribeReservedCacheNodes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeReservedCacheNodes:[AWSElasticacheDescribeReservedCacheNodesMessage new] completionHandler:^(AWSElasticacheReservedCacheNodeMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeReservedCacheNodesOfferings {
    NSString *key = @"testDescribeReservedCacheNodesOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeReservedCacheNodesOfferings:[AWSElasticacheDescribeReservedCacheNodesOfferingsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeReservedCacheNodesOfferingsCompletionHandler {
    NSString *key = @"testDescribeReservedCacheNodesOfferings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeReservedCacheNodesOfferings:[AWSElasticacheDescribeReservedCacheNodesOfferingsMessage new] completionHandler:^(AWSElasticacheReservedCacheNodesOfferingMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeServiceUpdates {
    NSString *key = @"testDescribeServiceUpdates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeServiceUpdates:[AWSElasticacheDescribeServiceUpdatesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeServiceUpdatesCompletionHandler {
    NSString *key = @"testDescribeServiceUpdates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeServiceUpdates:[AWSElasticacheDescribeServiceUpdatesMessage new] completionHandler:^(AWSElasticacheServiceUpdatesMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeSnapshots {
    NSString *key = @"testDescribeSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeSnapshots:[AWSElasticacheDescribeSnapshotsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeSnapshotsCompletionHandler {
    NSString *key = @"testDescribeSnapshots";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeSnapshots:[AWSElasticacheDescribeSnapshotsMessage new] completionHandler:^(AWSElasticacheDescribeSnapshotsListMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeUpdateActions {
    NSString *key = @"testDescribeUpdateActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] describeUpdateActions:[AWSElasticacheDescribeUpdateActionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDescribeUpdateActionsCompletionHandler {
    NSString *key = @"testDescribeUpdateActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] describeUpdateActions:[AWSElasticacheDescribeUpdateActionsMessage new] completionHandler:^(AWSElasticacheUpdateActionsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDisassociateGlobalReplicationGroup {
    NSString *key = @"testDisassociateGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] disassociateGlobalReplicationGroup:[AWSElasticacheDisassociateGlobalReplicationGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testDisassociateGlobalReplicationGroupCompletionHandler {
    NSString *key = @"testDisassociateGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] disassociateGlobalReplicationGroup:[AWSElasticacheDisassociateGlobalReplicationGroupMessage new] completionHandler:^(AWSElasticacheDisassociateGlobalReplicationGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testFailoverGlobalReplicationGroup {
    NSString *key = @"testFailoverGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] failoverGlobalReplicationGroup:[AWSElasticacheFailoverGlobalReplicationGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testFailoverGlobalReplicationGroupCompletionHandler {
    NSString *key = @"testFailoverGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] failoverGlobalReplicationGroup:[AWSElasticacheFailoverGlobalReplicationGroupMessage new] completionHandler:^(AWSElasticacheFailoverGlobalReplicationGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testIncreaseNodeGroupsInGlobalReplicationGroup {
    NSString *key = @"testIncreaseNodeGroupsInGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] increaseNodeGroupsInGlobalReplicationGroup:[AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testIncreaseNodeGroupsInGlobalReplicationGroupCompletionHandler {
    NSString *key = @"testIncreaseNodeGroupsInGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] increaseNodeGroupsInGlobalReplicationGroup:[AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupMessage new] completionHandler:^(AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testIncreaseReplicaCount {
    NSString *key = @"testIncreaseReplicaCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] increaseReplicaCount:[AWSElasticacheIncreaseReplicaCountMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testIncreaseReplicaCountCompletionHandler {
    NSString *key = @"testIncreaseReplicaCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] increaseReplicaCount:[AWSElasticacheIncreaseReplicaCountMessage new] completionHandler:^(AWSElasticacheIncreaseReplicaCountResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testListAllowedNodeTypeModifications {
    NSString *key = @"testListAllowedNodeTypeModifications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] listAllowedNodeTypeModifications:[AWSElasticacheListAllowedNodeTypeModificationsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testListAllowedNodeTypeModificationsCompletionHandler {
    NSString *key = @"testListAllowedNodeTypeModifications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] listAllowedNodeTypeModifications:[AWSElasticacheListAllowedNodeTypeModificationsMessage new] completionHandler:^(AWSElasticacheAllowedNodeTypeModificationsMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] listTagsForResource:[AWSElasticacheListTagsForResourceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] listTagsForResource:[AWSElasticacheListTagsForResourceMessage new] completionHandler:^(AWSElasticacheTagListMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testModifyCacheCluster {
    NSString *key = @"testModifyCacheCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] modifyCacheCluster:[AWSElasticacheModifyCacheClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testModifyCacheClusterCompletionHandler {
    NSString *key = @"testModifyCacheCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] modifyCacheCluster:[AWSElasticacheModifyCacheClusterMessage new] completionHandler:^(AWSElasticacheModifyCacheClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testModifyCacheParameterGroup {
    NSString *key = @"testModifyCacheParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] modifyCacheParameterGroup:[AWSElasticacheModifyCacheParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testModifyCacheParameterGroupCompletionHandler {
    NSString *key = @"testModifyCacheParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] modifyCacheParameterGroup:[AWSElasticacheModifyCacheParameterGroupMessage new] completionHandler:^(AWSElasticacheCacheParameterGroupNameMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testModifyCacheSubnetGroup {
    NSString *key = @"testModifyCacheSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] modifyCacheSubnetGroup:[AWSElasticacheModifyCacheSubnetGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testModifyCacheSubnetGroupCompletionHandler {
    NSString *key = @"testModifyCacheSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] modifyCacheSubnetGroup:[AWSElasticacheModifyCacheSubnetGroupMessage new] completionHandler:^(AWSElasticacheModifyCacheSubnetGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testModifyGlobalReplicationGroup {
    NSString *key = @"testModifyGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] modifyGlobalReplicationGroup:[AWSElasticacheModifyGlobalReplicationGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testModifyGlobalReplicationGroupCompletionHandler {
    NSString *key = @"testModifyGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] modifyGlobalReplicationGroup:[AWSElasticacheModifyGlobalReplicationGroupMessage new] completionHandler:^(AWSElasticacheModifyGlobalReplicationGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testModifyReplicationGroup {
    NSString *key = @"testModifyReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] modifyReplicationGroup:[AWSElasticacheModifyReplicationGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testModifyReplicationGroupCompletionHandler {
    NSString *key = @"testModifyReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] modifyReplicationGroup:[AWSElasticacheModifyReplicationGroupMessage new] completionHandler:^(AWSElasticacheModifyReplicationGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testModifyReplicationGroupShardConfiguration {
    NSString *key = @"testModifyReplicationGroupShardConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] modifyReplicationGroupShardConfiguration:[AWSElasticacheModifyReplicationGroupShardConfigurationMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testModifyReplicationGroupShardConfigurationCompletionHandler {
    NSString *key = @"testModifyReplicationGroupShardConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] modifyReplicationGroupShardConfiguration:[AWSElasticacheModifyReplicationGroupShardConfigurationMessage new] completionHandler:^(AWSElasticacheModifyReplicationGroupShardConfigurationResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testPurchaseReservedCacheNodesOffering {
    NSString *key = @"testPurchaseReservedCacheNodesOffering";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] purchaseReservedCacheNodesOffering:[AWSElasticachePurchaseReservedCacheNodesOfferingMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testPurchaseReservedCacheNodesOfferingCompletionHandler {
    NSString *key = @"testPurchaseReservedCacheNodesOffering";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] purchaseReservedCacheNodesOffering:[AWSElasticachePurchaseReservedCacheNodesOfferingMessage new] completionHandler:^(AWSElasticachePurchaseReservedCacheNodesOfferingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testRebalanceSlotsInGlobalReplicationGroup {
    NSString *key = @"testRebalanceSlotsInGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] rebalanceSlotsInGlobalReplicationGroup:[AWSElasticacheRebalanceSlotsInGlobalReplicationGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testRebalanceSlotsInGlobalReplicationGroupCompletionHandler {
    NSString *key = @"testRebalanceSlotsInGlobalReplicationGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] rebalanceSlotsInGlobalReplicationGroup:[AWSElasticacheRebalanceSlotsInGlobalReplicationGroupMessage new] completionHandler:^(AWSElasticacheRebalanceSlotsInGlobalReplicationGroupResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testRebootCacheCluster {
    NSString *key = @"testRebootCacheCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] rebootCacheCluster:[AWSElasticacheRebootCacheClusterMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testRebootCacheClusterCompletionHandler {
    NSString *key = @"testRebootCacheCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] rebootCacheCluster:[AWSElasticacheRebootCacheClusterMessage new] completionHandler:^(AWSElasticacheRebootCacheClusterResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testRemoveTagsFromResource {
    NSString *key = @"testRemoveTagsFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] removeTagsFromResource:[AWSElasticacheRemoveTagsFromResourceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testRemoveTagsFromResourceCompletionHandler {
    NSString *key = @"testRemoveTagsFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] removeTagsFromResource:[AWSElasticacheRemoveTagsFromResourceMessage new] completionHandler:^(AWSElasticacheTagListMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testResetCacheParameterGroup {
    NSString *key = @"testResetCacheParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] resetCacheParameterGroup:[AWSElasticacheResetCacheParameterGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testResetCacheParameterGroupCompletionHandler {
    NSString *key = @"testResetCacheParameterGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] resetCacheParameterGroup:[AWSElasticacheResetCacheParameterGroupMessage new] completionHandler:^(AWSElasticacheCacheParameterGroupNameMessage* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testRevokeCacheSecurityGroupIngress {
    NSString *key = @"testRevokeCacheSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] revokeCacheSecurityGroupIngress:[AWSElasticacheRevokeCacheSecurityGroupIngressMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testRevokeCacheSecurityGroupIngressCompletionHandler {
    NSString *key = @"testRevokeCacheSecurityGroupIngress";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] revokeCacheSecurityGroupIngress:[AWSElasticacheRevokeCacheSecurityGroupIngressMessage new] completionHandler:^(AWSElasticacheRevokeCacheSecurityGroupIngressResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testStartMigration {
    NSString *key = @"testStartMigration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] startMigration:[AWSElasticacheStartMigrationMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testStartMigrationCompletionHandler {
    NSString *key = @"testStartMigration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] startMigration:[AWSElasticacheStartMigrationMessage new] completionHandler:^(AWSElasticacheStartMigrationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testTestFailover {
    NSString *key = @"testTestFailover";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticache ElasticacheForKey:key] testFailover:[AWSElasticacheTestFailoverMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

- (void)testTestFailoverCompletionHandler {
    NSString *key = @"testTestFailover";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticache registerElasticacheWithConfiguration:configuration forKey:key];

    AWSElasticache *awsClient = [AWSElasticache ElasticacheForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticache ElasticacheForKey:key] testFailover:[AWSElasticacheTestFailoverMessage new] completionHandler:^(AWSElasticacheTestFailoverResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticache removeElasticacheForKey:key];
}

@end
