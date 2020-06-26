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
#import "AWSDatabasemigrationserviceService.h"

static id mockNetworking = nil;

@interface AWSGeneralDatabasemigrationserviceTests : XCTestCase

@end

@implementation AWSGeneralDatabasemigrationserviceTests

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
    NSString *key = @"testDatabasemigrationserviceConstructors";
    XCTAssertNotNil([AWSDatabasemigrationservice defaultDatabasemigrationservice]);
    XCTAssertEqual([[AWSDatabasemigrationservice defaultDatabasemigrationservice] class], [AWSDatabasemigrationservice class]);
    XCTAssertNil([AWSDatabasemigrationservice DatabasemigrationserviceForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSDatabasemigrationservice DatabasemigrationserviceForKey:key]);
    XCTAssertEqual([[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] class], [AWSDatabasemigrationservice class]);
    XCTAssertEqual([AWSDatabasemigrationservice DatabasemigrationserviceForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
    XCTAssertNil([AWSDatabasemigrationservice DatabasemigrationserviceForKey:key]);

}

- (void)testAddTagsToResource {
    NSString *key = @"testAddTagsToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] addTagsToResource:[AWSDatabasemigrationserviceAddTagsToResourceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testAddTagsToResourceCompletionHandler {
    NSString *key = @"testAddTagsToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] addTagsToResource:[AWSDatabasemigrationserviceAddTagsToResourceMessage new] completionHandler:^(AWSDatabasemigrationserviceAddTagsToResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testApplyPendingMaintenanceAction {
    NSString *key = @"testApplyPendingMaintenanceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] applyPendingMaintenanceAction:[AWSDatabasemigrationserviceApplyPendingMaintenanceActionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testApplyPendingMaintenanceActionCompletionHandler {
    NSString *key = @"testApplyPendingMaintenanceAction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] applyPendingMaintenanceAction:[AWSDatabasemigrationserviceApplyPendingMaintenanceActionMessage new] completionHandler:^(AWSDatabasemigrationserviceApplyPendingMaintenanceActionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testCreateEndpoint {
    NSString *key = @"testCreateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] createEndpoint:[AWSDatabasemigrationserviceCreateEndpointMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testCreateEndpointCompletionHandler {
    NSString *key = @"testCreateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] createEndpoint:[AWSDatabasemigrationserviceCreateEndpointMessage new] completionHandler:^(AWSDatabasemigrationserviceCreateEndpointResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testCreateEventSubscription {
    NSString *key = @"testCreateEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] createEventSubscription:[AWSDatabasemigrationserviceCreateEventSubscriptionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testCreateEventSubscriptionCompletionHandler {
    NSString *key = @"testCreateEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] createEventSubscription:[AWSDatabasemigrationserviceCreateEventSubscriptionMessage new] completionHandler:^(AWSDatabasemigrationserviceCreateEventSubscriptionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testCreateReplicationInstance {
    NSString *key = @"testCreateReplicationInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] createReplicationInstance:[AWSDatabasemigrationserviceCreateReplicationInstanceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testCreateReplicationInstanceCompletionHandler {
    NSString *key = @"testCreateReplicationInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] createReplicationInstance:[AWSDatabasemigrationserviceCreateReplicationInstanceMessage new] completionHandler:^(AWSDatabasemigrationserviceCreateReplicationInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testCreateReplicationSubnetGroup {
    NSString *key = @"testCreateReplicationSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] createReplicationSubnetGroup:[AWSDatabasemigrationserviceCreateReplicationSubnetGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testCreateReplicationSubnetGroupCompletionHandler {
    NSString *key = @"testCreateReplicationSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] createReplicationSubnetGroup:[AWSDatabasemigrationserviceCreateReplicationSubnetGroupMessage new] completionHandler:^(AWSDatabasemigrationserviceCreateReplicationSubnetGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testCreateReplicationTask {
    NSString *key = @"testCreateReplicationTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] createReplicationTask:[AWSDatabasemigrationserviceCreateReplicationTaskMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testCreateReplicationTaskCompletionHandler {
    NSString *key = @"testCreateReplicationTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] createReplicationTask:[AWSDatabasemigrationserviceCreateReplicationTaskMessage new] completionHandler:^(AWSDatabasemigrationserviceCreateReplicationTaskResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDeleteCertificate {
    NSString *key = @"testDeleteCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] deleteCertificate:[AWSDatabasemigrationserviceDeleteCertificateMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDeleteCertificateCompletionHandler {
    NSString *key = @"testDeleteCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] deleteCertificate:[AWSDatabasemigrationserviceDeleteCertificateMessage new] completionHandler:^(AWSDatabasemigrationserviceDeleteCertificateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDeleteConnection {
    NSString *key = @"testDeleteConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] deleteConnection:[AWSDatabasemigrationserviceDeleteConnectionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDeleteConnectionCompletionHandler {
    NSString *key = @"testDeleteConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] deleteConnection:[AWSDatabasemigrationserviceDeleteConnectionMessage new] completionHandler:^(AWSDatabasemigrationserviceDeleteConnectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDeleteEndpoint {
    NSString *key = @"testDeleteEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] deleteEndpoint:[AWSDatabasemigrationserviceDeleteEndpointMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDeleteEndpointCompletionHandler {
    NSString *key = @"testDeleteEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] deleteEndpoint:[AWSDatabasemigrationserviceDeleteEndpointMessage new] completionHandler:^(AWSDatabasemigrationserviceDeleteEndpointResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDeleteEventSubscription {
    NSString *key = @"testDeleteEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] deleteEventSubscription:[AWSDatabasemigrationserviceDeleteEventSubscriptionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDeleteEventSubscriptionCompletionHandler {
    NSString *key = @"testDeleteEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] deleteEventSubscription:[AWSDatabasemigrationserviceDeleteEventSubscriptionMessage new] completionHandler:^(AWSDatabasemigrationserviceDeleteEventSubscriptionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDeleteReplicationInstance {
    NSString *key = @"testDeleteReplicationInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] deleteReplicationInstance:[AWSDatabasemigrationserviceDeleteReplicationInstanceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDeleteReplicationInstanceCompletionHandler {
    NSString *key = @"testDeleteReplicationInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] deleteReplicationInstance:[AWSDatabasemigrationserviceDeleteReplicationInstanceMessage new] completionHandler:^(AWSDatabasemigrationserviceDeleteReplicationInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDeleteReplicationSubnetGroup {
    NSString *key = @"testDeleteReplicationSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] deleteReplicationSubnetGroup:[AWSDatabasemigrationserviceDeleteReplicationSubnetGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDeleteReplicationSubnetGroupCompletionHandler {
    NSString *key = @"testDeleteReplicationSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] deleteReplicationSubnetGroup:[AWSDatabasemigrationserviceDeleteReplicationSubnetGroupMessage new] completionHandler:^(AWSDatabasemigrationserviceDeleteReplicationSubnetGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDeleteReplicationTask {
    NSString *key = @"testDeleteReplicationTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] deleteReplicationTask:[AWSDatabasemigrationserviceDeleteReplicationTaskMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDeleteReplicationTaskCompletionHandler {
    NSString *key = @"testDeleteReplicationTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] deleteReplicationTask:[AWSDatabasemigrationserviceDeleteReplicationTaskMessage new] completionHandler:^(AWSDatabasemigrationserviceDeleteReplicationTaskResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeAccountAttributes {
    NSString *key = @"testDescribeAccountAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeAccountAttributes:[AWSDatabasemigrationserviceDescribeAccountAttributesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeAccountAttributesCompletionHandler {
    NSString *key = @"testDescribeAccountAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeAccountAttributes:[AWSDatabasemigrationserviceDescribeAccountAttributesMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeAccountAttributesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeCertificates {
    NSString *key = @"testDescribeCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeCertificates:[AWSDatabasemigrationserviceDescribeCertificatesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeCertificatesCompletionHandler {
    NSString *key = @"testDescribeCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeCertificates:[AWSDatabasemigrationserviceDescribeCertificatesMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeCertificatesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeConnections {
    NSString *key = @"testDescribeConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeConnections:[AWSDatabasemigrationserviceDescribeConnectionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeConnectionsCompletionHandler {
    NSString *key = @"testDescribeConnections";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeConnections:[AWSDatabasemigrationserviceDescribeConnectionsMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeConnectionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeEndpointTypes {
    NSString *key = @"testDescribeEndpointTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeEndpointTypes:[AWSDatabasemigrationserviceDescribeEndpointTypesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeEndpointTypesCompletionHandler {
    NSString *key = @"testDescribeEndpointTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeEndpointTypes:[AWSDatabasemigrationserviceDescribeEndpointTypesMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeEndpointTypesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeEndpoints {
    NSString *key = @"testDescribeEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeEndpoints:[AWSDatabasemigrationserviceDescribeEndpointsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeEndpointsCompletionHandler {
    NSString *key = @"testDescribeEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeEndpoints:[AWSDatabasemigrationserviceDescribeEndpointsMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeEndpointsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeEventCategories {
    NSString *key = @"testDescribeEventCategories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeEventCategories:[AWSDatabasemigrationserviceDescribeEventCategoriesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeEventCategoriesCompletionHandler {
    NSString *key = @"testDescribeEventCategories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeEventCategories:[AWSDatabasemigrationserviceDescribeEventCategoriesMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeEventCategoriesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeEventSubscriptions {
    NSString *key = @"testDescribeEventSubscriptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeEventSubscriptions:[AWSDatabasemigrationserviceDescribeEventSubscriptionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeEventSubscriptionsCompletionHandler {
    NSString *key = @"testDescribeEventSubscriptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeEventSubscriptions:[AWSDatabasemigrationserviceDescribeEventSubscriptionsMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeEventSubscriptionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeEvents {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeEvents:[AWSDatabasemigrationserviceDescribeEventsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeEventsCompletionHandler {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeEvents:[AWSDatabasemigrationserviceDescribeEventsMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeEventsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeOrderableReplicationInstances {
    NSString *key = @"testDescribeOrderableReplicationInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeOrderableReplicationInstances:[AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeOrderableReplicationInstancesCompletionHandler {
    NSString *key = @"testDescribeOrderableReplicationInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeOrderableReplicationInstances:[AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribePendingMaintenanceActions {
    NSString *key = @"testDescribePendingMaintenanceActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describePendingMaintenanceActions:[AWSDatabasemigrationserviceDescribePendingMaintenanceActionsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribePendingMaintenanceActionsCompletionHandler {
    NSString *key = @"testDescribePendingMaintenanceActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describePendingMaintenanceActions:[AWSDatabasemigrationserviceDescribePendingMaintenanceActionsMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribePendingMaintenanceActionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeRefreshSchemasStatus {
    NSString *key = @"testDescribeRefreshSchemasStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeRefreshSchemasStatus:[AWSDatabasemigrationserviceDescribeRefreshSchemasStatusMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeRefreshSchemasStatusCompletionHandler {
    NSString *key = @"testDescribeRefreshSchemasStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeRefreshSchemasStatus:[AWSDatabasemigrationserviceDescribeRefreshSchemasStatusMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeRefreshSchemasStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeReplicationInstanceTaskLogs {
    NSString *key = @"testDescribeReplicationInstanceTaskLogs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeReplicationInstanceTaskLogs:[AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeReplicationInstanceTaskLogsCompletionHandler {
    NSString *key = @"testDescribeReplicationInstanceTaskLogs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeReplicationInstanceTaskLogs:[AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeReplicationInstances {
    NSString *key = @"testDescribeReplicationInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeReplicationInstances:[AWSDatabasemigrationserviceDescribeReplicationInstancesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeReplicationInstancesCompletionHandler {
    NSString *key = @"testDescribeReplicationInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeReplicationInstances:[AWSDatabasemigrationserviceDescribeReplicationInstancesMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeReplicationInstancesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeReplicationSubnetGroups {
    NSString *key = @"testDescribeReplicationSubnetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeReplicationSubnetGroups:[AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeReplicationSubnetGroupsCompletionHandler {
    NSString *key = @"testDescribeReplicationSubnetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeReplicationSubnetGroups:[AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeReplicationTaskAssessmentResults {
    NSString *key = @"testDescribeReplicationTaskAssessmentResults";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeReplicationTaskAssessmentResults:[AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeReplicationTaskAssessmentResultsCompletionHandler {
    NSString *key = @"testDescribeReplicationTaskAssessmentResults";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeReplicationTaskAssessmentResults:[AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeReplicationTasks {
    NSString *key = @"testDescribeReplicationTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeReplicationTasks:[AWSDatabasemigrationserviceDescribeReplicationTasksMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeReplicationTasksCompletionHandler {
    NSString *key = @"testDescribeReplicationTasks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeReplicationTasks:[AWSDatabasemigrationserviceDescribeReplicationTasksMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeReplicationTasksResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeSchemas {
    NSString *key = @"testDescribeSchemas";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeSchemas:[AWSDatabasemigrationserviceDescribeSchemasMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeSchemasCompletionHandler {
    NSString *key = @"testDescribeSchemas";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeSchemas:[AWSDatabasemigrationserviceDescribeSchemasMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeSchemasResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeTableStatistics {
    NSString *key = @"testDescribeTableStatistics";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeTableStatistics:[AWSDatabasemigrationserviceDescribeTableStatisticsMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testDescribeTableStatisticsCompletionHandler {
    NSString *key = @"testDescribeTableStatistics";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] describeTableStatistics:[AWSDatabasemigrationserviceDescribeTableStatisticsMessage new] completionHandler:^(AWSDatabasemigrationserviceDescribeTableStatisticsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testImportCertificate {
    NSString *key = @"testImportCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] importCertificate:[AWSDatabasemigrationserviceImportCertificateMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testImportCertificateCompletionHandler {
    NSString *key = @"testImportCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] importCertificate:[AWSDatabasemigrationserviceImportCertificateMessage new] completionHandler:^(AWSDatabasemigrationserviceImportCertificateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] listTagsForResource:[AWSDatabasemigrationserviceListTagsForResourceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] listTagsForResource:[AWSDatabasemigrationserviceListTagsForResourceMessage new] completionHandler:^(AWSDatabasemigrationserviceListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testModifyEndpoint {
    NSString *key = @"testModifyEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] modifyEndpoint:[AWSDatabasemigrationserviceModifyEndpointMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testModifyEndpointCompletionHandler {
    NSString *key = @"testModifyEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] modifyEndpoint:[AWSDatabasemigrationserviceModifyEndpointMessage new] completionHandler:^(AWSDatabasemigrationserviceModifyEndpointResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testModifyEventSubscription {
    NSString *key = @"testModifyEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] modifyEventSubscription:[AWSDatabasemigrationserviceModifyEventSubscriptionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testModifyEventSubscriptionCompletionHandler {
    NSString *key = @"testModifyEventSubscription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] modifyEventSubscription:[AWSDatabasemigrationserviceModifyEventSubscriptionMessage new] completionHandler:^(AWSDatabasemigrationserviceModifyEventSubscriptionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testModifyReplicationInstance {
    NSString *key = @"testModifyReplicationInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] modifyReplicationInstance:[AWSDatabasemigrationserviceModifyReplicationInstanceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testModifyReplicationInstanceCompletionHandler {
    NSString *key = @"testModifyReplicationInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] modifyReplicationInstance:[AWSDatabasemigrationserviceModifyReplicationInstanceMessage new] completionHandler:^(AWSDatabasemigrationserviceModifyReplicationInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testModifyReplicationSubnetGroup {
    NSString *key = @"testModifyReplicationSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] modifyReplicationSubnetGroup:[AWSDatabasemigrationserviceModifyReplicationSubnetGroupMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testModifyReplicationSubnetGroupCompletionHandler {
    NSString *key = @"testModifyReplicationSubnetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] modifyReplicationSubnetGroup:[AWSDatabasemigrationserviceModifyReplicationSubnetGroupMessage new] completionHandler:^(AWSDatabasemigrationserviceModifyReplicationSubnetGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testModifyReplicationTask {
    NSString *key = @"testModifyReplicationTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] modifyReplicationTask:[AWSDatabasemigrationserviceModifyReplicationTaskMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testModifyReplicationTaskCompletionHandler {
    NSString *key = @"testModifyReplicationTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] modifyReplicationTask:[AWSDatabasemigrationserviceModifyReplicationTaskMessage new] completionHandler:^(AWSDatabasemigrationserviceModifyReplicationTaskResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testRebootReplicationInstance {
    NSString *key = @"testRebootReplicationInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] rebootReplicationInstance:[AWSDatabasemigrationserviceRebootReplicationInstanceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testRebootReplicationInstanceCompletionHandler {
    NSString *key = @"testRebootReplicationInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] rebootReplicationInstance:[AWSDatabasemigrationserviceRebootReplicationInstanceMessage new] completionHandler:^(AWSDatabasemigrationserviceRebootReplicationInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testRefreshSchemas {
    NSString *key = @"testRefreshSchemas";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] refreshSchemas:[AWSDatabasemigrationserviceRefreshSchemasMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testRefreshSchemasCompletionHandler {
    NSString *key = @"testRefreshSchemas";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] refreshSchemas:[AWSDatabasemigrationserviceRefreshSchemasMessage new] completionHandler:^(AWSDatabasemigrationserviceRefreshSchemasResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testReloadTables {
    NSString *key = @"testReloadTables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] reloadTables:[AWSDatabasemigrationserviceReloadTablesMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testReloadTablesCompletionHandler {
    NSString *key = @"testReloadTables";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] reloadTables:[AWSDatabasemigrationserviceReloadTablesMessage new] completionHandler:^(AWSDatabasemigrationserviceReloadTablesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testRemoveTagsFromResource {
    NSString *key = @"testRemoveTagsFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] removeTagsFromResource:[AWSDatabasemigrationserviceRemoveTagsFromResourceMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testRemoveTagsFromResourceCompletionHandler {
    NSString *key = @"testRemoveTagsFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] removeTagsFromResource:[AWSDatabasemigrationserviceRemoveTagsFromResourceMessage new] completionHandler:^(AWSDatabasemigrationserviceRemoveTagsFromResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testStartReplicationTask {
    NSString *key = @"testStartReplicationTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] startReplicationTask:[AWSDatabasemigrationserviceStartReplicationTaskMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testStartReplicationTaskCompletionHandler {
    NSString *key = @"testStartReplicationTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] startReplicationTask:[AWSDatabasemigrationserviceStartReplicationTaskMessage new] completionHandler:^(AWSDatabasemigrationserviceStartReplicationTaskResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testStartReplicationTaskAssessment {
    NSString *key = @"testStartReplicationTaskAssessment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] startReplicationTaskAssessment:[AWSDatabasemigrationserviceStartReplicationTaskAssessmentMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testStartReplicationTaskAssessmentCompletionHandler {
    NSString *key = @"testStartReplicationTaskAssessment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] startReplicationTaskAssessment:[AWSDatabasemigrationserviceStartReplicationTaskAssessmentMessage new] completionHandler:^(AWSDatabasemigrationserviceStartReplicationTaskAssessmentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testStopReplicationTask {
    NSString *key = @"testStopReplicationTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] stopReplicationTask:[AWSDatabasemigrationserviceStopReplicationTaskMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testStopReplicationTaskCompletionHandler {
    NSString *key = @"testStopReplicationTask";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] stopReplicationTask:[AWSDatabasemigrationserviceStopReplicationTaskMessage new] completionHandler:^(AWSDatabasemigrationserviceStopReplicationTaskResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testTestConnection {
    NSString *key = @"testTestConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] testConnection:[AWSDatabasemigrationserviceTestConnectionMessage new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

- (void)testTestConnectionCompletionHandler {
    NSString *key = @"testTestConnection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:configuration forKey:key];

    AWSDatabasemigrationservice *awsClient = [AWSDatabasemigrationservice DatabasemigrationserviceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSDatabasemigrationservice DatabasemigrationserviceForKey:key] testConnection:[AWSDatabasemigrationserviceTestConnectionMessage new] completionHandler:^(AWSDatabasemigrationserviceTestConnectionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSDatabasemigrationservice removeDatabasemigrationserviceForKey:key];
}

@end
