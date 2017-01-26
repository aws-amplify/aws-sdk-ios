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
#import "AWSCognitoSyncService.h"

static id mockNetworking = nil;

@interface AWSGeneralCognitoSyncTests : XCTestCase

@end

@implementation AWSGeneralCognitoSyncTests

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
    NSString *key = @"testCognitoSyncConstructors";
    XCTAssertNotNil([AWSCognitoSync defaultCognitoSync]);
    XCTAssertEqual([[AWSCognitoSync defaultCognitoSync] class], [AWSCognitoSync class]);
    XCTAssertNil([AWSCognitoSync CognitoSyncForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSCognitoSync CognitoSyncForKey:key]);
    XCTAssertEqual([[AWSCognitoSync CognitoSyncForKey:key] class], [AWSCognitoSync class]);
    XCTAssertEqual([AWSCognitoSync CognitoSyncForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSCognitoSync removeCognitoSyncForKey:key];
    XCTAssertNil([AWSCognitoSync CognitoSyncForKey:key]);

}

- (void)testBulkPublish {
    NSString *key = @"testBulkPublish";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] bulkPublish:[AWSCognitoSyncBulkPublishRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testBulkPublishCompletionHandler {
    NSString *key = @"testBulkPublish";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] bulkPublish:[AWSCognitoSyncBulkPublishRequest new] completionHandler:^(AWSCognitoSyncBulkPublishResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testDeleteDataset {
    NSString *key = @"testDeleteDataset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] deleteDataset:[AWSCognitoSyncDeleteDatasetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testDeleteDatasetCompletionHandler {
    NSString *key = @"testDeleteDataset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] deleteDataset:[AWSCognitoSyncDeleteDatasetRequest new] completionHandler:^(AWSCognitoSyncDeleteDatasetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testDescribeDataset {
    NSString *key = @"testDescribeDataset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] describeDataset:[AWSCognitoSyncDescribeDatasetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testDescribeDatasetCompletionHandler {
    NSString *key = @"testDescribeDataset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] describeDataset:[AWSCognitoSyncDescribeDatasetRequest new] completionHandler:^(AWSCognitoSyncDescribeDatasetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testDescribeIdentityPoolUsage {
    NSString *key = @"testDescribeIdentityPoolUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] describeIdentityPoolUsage:[AWSCognitoSyncDescribeIdentityPoolUsageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testDescribeIdentityPoolUsageCompletionHandler {
    NSString *key = @"testDescribeIdentityPoolUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] describeIdentityPoolUsage:[AWSCognitoSyncDescribeIdentityPoolUsageRequest new] completionHandler:^(AWSCognitoSyncDescribeIdentityPoolUsageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testDescribeIdentityUsage {
    NSString *key = @"testDescribeIdentityUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] describeIdentityUsage:[AWSCognitoSyncDescribeIdentityUsageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testDescribeIdentityUsageCompletionHandler {
    NSString *key = @"testDescribeIdentityUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] describeIdentityUsage:[AWSCognitoSyncDescribeIdentityUsageRequest new] completionHandler:^(AWSCognitoSyncDescribeIdentityUsageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testGetBulkPublishDetails {
    NSString *key = @"testGetBulkPublishDetails";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] getBulkPublishDetails:[AWSCognitoSyncGetBulkPublishDetailsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testGetBulkPublishDetailsCompletionHandler {
    NSString *key = @"testGetBulkPublishDetails";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] getBulkPublishDetails:[AWSCognitoSyncGetBulkPublishDetailsRequest new] completionHandler:^(AWSCognitoSyncGetBulkPublishDetailsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testGetCognitoEvents {
    NSString *key = @"testGetCognitoEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] getCognitoEvents:[AWSCognitoSyncGetCognitoEventsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testGetCognitoEventsCompletionHandler {
    NSString *key = @"testGetCognitoEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] getCognitoEvents:[AWSCognitoSyncGetCognitoEventsRequest new] completionHandler:^(AWSCognitoSyncGetCognitoEventsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testGetIdentityPoolConfiguration {
    NSString *key = @"testGetIdentityPoolConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] getIdentityPoolConfiguration:[AWSCognitoSyncGetIdentityPoolConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testGetIdentityPoolConfigurationCompletionHandler {
    NSString *key = @"testGetIdentityPoolConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] getIdentityPoolConfiguration:[AWSCognitoSyncGetIdentityPoolConfigurationRequest new] completionHandler:^(AWSCognitoSyncGetIdentityPoolConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testListDatasets {
    NSString *key = @"testListDatasets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] listDatasets:[AWSCognitoSyncListDatasetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testListDatasetsCompletionHandler {
    NSString *key = @"testListDatasets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] listDatasets:[AWSCognitoSyncListDatasetsRequest new] completionHandler:^(AWSCognitoSyncListDatasetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testListIdentityPoolUsage {
    NSString *key = @"testListIdentityPoolUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] listIdentityPoolUsage:[AWSCognitoSyncListIdentityPoolUsageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testListIdentityPoolUsageCompletionHandler {
    NSString *key = @"testListIdentityPoolUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] listIdentityPoolUsage:[AWSCognitoSyncListIdentityPoolUsageRequest new] completionHandler:^(AWSCognitoSyncListIdentityPoolUsageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testListRecords {
    NSString *key = @"testListRecords";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] listRecords:[AWSCognitoSyncListRecordsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testListRecordsCompletionHandler {
    NSString *key = @"testListRecords";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] listRecords:[AWSCognitoSyncListRecordsRequest new] completionHandler:^(AWSCognitoSyncListRecordsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testRegisterDevice {
    NSString *key = @"testRegisterDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] registerDevice:[AWSCognitoSyncRegisterDeviceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testRegisterDeviceCompletionHandler {
    NSString *key = @"testRegisterDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] registerDevice:[AWSCognitoSyncRegisterDeviceRequest new] completionHandler:^(AWSCognitoSyncRegisterDeviceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testSetCognitoEvents {
    NSString *key = @"testSetCognitoEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] setCognitoEvents:[AWSCognitoSyncSetCognitoEventsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testSetCognitoEventsCompletionHandler {
    NSString *key = @"testSetCognitoEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] setCognitoEvents:[AWSCognitoSyncSetCognitoEventsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testSetIdentityPoolConfiguration {
    NSString *key = @"testSetIdentityPoolConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] setIdentityPoolConfiguration:[AWSCognitoSyncSetIdentityPoolConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testSetIdentityPoolConfigurationCompletionHandler {
    NSString *key = @"testSetIdentityPoolConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] setIdentityPoolConfiguration:[AWSCognitoSyncSetIdentityPoolConfigurationRequest new] completionHandler:^(AWSCognitoSyncSetIdentityPoolConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testSubscribeToDataset {
    NSString *key = @"testSubscribeToDataset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] subscribeToDataset:[AWSCognitoSyncSubscribeToDatasetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testSubscribeToDatasetCompletionHandler {
    NSString *key = @"testSubscribeToDataset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] subscribeToDataset:[AWSCognitoSyncSubscribeToDatasetRequest new] completionHandler:^(AWSCognitoSyncSubscribeToDatasetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testUnsubscribeFromDataset {
    NSString *key = @"testUnsubscribeFromDataset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] unsubscribeFromDataset:[AWSCognitoSyncUnsubscribeFromDatasetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testUnsubscribeFromDatasetCompletionHandler {
    NSString *key = @"testUnsubscribeFromDataset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] unsubscribeFromDataset:[AWSCognitoSyncUnsubscribeFromDatasetRequest new] completionHandler:^(AWSCognitoSyncUnsubscribeFromDatasetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testUpdateRecords {
    NSString *key = @"testUpdateRecords";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCognitoSync CognitoSyncForKey:key] updateRecords:[AWSCognitoSyncUpdateRecordsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

- (void)testUpdateRecordsCompletionHandler {
    NSString *key = @"testUpdateRecords";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:key];

    AWSCognitoSync *awsClient = [AWSCognitoSync CognitoSyncForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCognitoSync CognitoSyncForKey:key] updateRecords:[AWSCognitoSyncUpdateRecordsRequest new] completionHandler:^(AWSCognitoSyncUpdateRecordsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCognitoSync removeCognitoSyncForKey:key];
}

@end
