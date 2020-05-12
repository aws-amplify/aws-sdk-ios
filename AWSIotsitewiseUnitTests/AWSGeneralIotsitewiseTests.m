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
#import "AWSIotsitewiseService.h"

static id mockNetworking = nil;

@interface AWSGeneralIotsitewiseTests : XCTestCase

@end

@implementation AWSGeneralIotsitewiseTests

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
    NSString *key = @"testIotsitewiseConstructors";
    XCTAssertNotNil([AWSIotsitewise defaultIotsitewise]);
    XCTAssertEqual([[AWSIotsitewise defaultIotsitewise] class], [AWSIotsitewise class]);
    XCTAssertNil([AWSIotsitewise IotsitewiseForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSIotsitewise IotsitewiseForKey:key]);
    XCTAssertEqual([[AWSIotsitewise IotsitewiseForKey:key] class], [AWSIotsitewise class]);
    XCTAssertEqual([AWSIotsitewise IotsitewiseForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSIotsitewise removeIotsitewiseForKey:key];
    XCTAssertNil([AWSIotsitewise IotsitewiseForKey:key]);

}

- (void)testAssociateAssets {
    NSString *key = @"testAssociateAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] associateAssets:[AWSIotsitewiseAssociateAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testAssociateAssetsCompletionHandler {
    NSString *key = @"testAssociateAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] associateAssets:[AWSIotsitewiseAssociateAssetsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testBatchAssociateProjectAssets {
    NSString *key = @"testBatchAssociateProjectAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] batchAssociateProjectAssets:[AWSIotsitewiseBatchAssociateProjectAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testBatchAssociateProjectAssetsCompletionHandler {
    NSString *key = @"testBatchAssociateProjectAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] batchAssociateProjectAssets:[AWSIotsitewiseBatchAssociateProjectAssetsRequest new] completionHandler:^(AWSIotsitewiseBatchAssociateProjectAssetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testBatchDisassociateProjectAssets {
    NSString *key = @"testBatchDisassociateProjectAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] batchDisassociateProjectAssets:[AWSIotsitewiseBatchDisassociateProjectAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testBatchDisassociateProjectAssetsCompletionHandler {
    NSString *key = @"testBatchDisassociateProjectAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] batchDisassociateProjectAssets:[AWSIotsitewiseBatchDisassociateProjectAssetsRequest new] completionHandler:^(AWSIotsitewiseBatchDisassociateProjectAssetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testBatchPutAssetPropertyValue {
    NSString *key = @"testBatchPutAssetPropertyValue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] batchPutAssetPropertyValue:[AWSIotsitewiseBatchPutAssetPropertyValueRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testBatchPutAssetPropertyValueCompletionHandler {
    NSString *key = @"testBatchPutAssetPropertyValue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] batchPutAssetPropertyValue:[AWSIotsitewiseBatchPutAssetPropertyValueRequest new] completionHandler:^(AWSIotsitewiseBatchPutAssetPropertyValueResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testCreateAccessPolicy {
    NSString *key = @"testCreateAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] createAccessPolicy:[AWSIotsitewiseCreateAccessPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testCreateAccessPolicyCompletionHandler {
    NSString *key = @"testCreateAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] createAccessPolicy:[AWSIotsitewiseCreateAccessPolicyRequest new] completionHandler:^(AWSIotsitewiseCreateAccessPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testCreateAsset {
    NSString *key = @"testCreateAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] createAsset:[AWSIotsitewiseCreateAssetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testCreateAssetCompletionHandler {
    NSString *key = @"testCreateAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] createAsset:[AWSIotsitewiseCreateAssetRequest new] completionHandler:^(AWSIotsitewiseCreateAssetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testCreateAssetModel {
    NSString *key = @"testCreateAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] createAssetModel:[AWSIotsitewiseCreateAssetModelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testCreateAssetModelCompletionHandler {
    NSString *key = @"testCreateAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] createAssetModel:[AWSIotsitewiseCreateAssetModelRequest new] completionHandler:^(AWSIotsitewiseCreateAssetModelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testCreateDashboard {
    NSString *key = @"testCreateDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] createDashboard:[AWSIotsitewiseCreateDashboardRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testCreateDashboardCompletionHandler {
    NSString *key = @"testCreateDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] createDashboard:[AWSIotsitewiseCreateDashboardRequest new] completionHandler:^(AWSIotsitewiseCreateDashboardResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testCreateGateway {
    NSString *key = @"testCreateGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] createGateway:[AWSIotsitewiseCreateGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testCreateGatewayCompletionHandler {
    NSString *key = @"testCreateGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] createGateway:[AWSIotsitewiseCreateGatewayRequest new] completionHandler:^(AWSIotsitewiseCreateGatewayResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testCreatePortal {
    NSString *key = @"testCreatePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] createPortal:[AWSIotsitewiseCreatePortalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testCreatePortalCompletionHandler {
    NSString *key = @"testCreatePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] createPortal:[AWSIotsitewiseCreatePortalRequest new] completionHandler:^(AWSIotsitewiseCreatePortalResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testCreateProject {
    NSString *key = @"testCreateProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] createProject:[AWSIotsitewiseCreateProjectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testCreateProjectCompletionHandler {
    NSString *key = @"testCreateProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] createProject:[AWSIotsitewiseCreateProjectRequest new] completionHandler:^(AWSIotsitewiseCreateProjectResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDeleteAccessPolicy {
    NSString *key = @"testDeleteAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] deleteAccessPolicy:[AWSIotsitewiseDeleteAccessPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDeleteAccessPolicyCompletionHandler {
    NSString *key = @"testDeleteAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] deleteAccessPolicy:[AWSIotsitewiseDeleteAccessPolicyRequest new] completionHandler:^(AWSIotsitewiseDeleteAccessPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDeleteAsset {
    NSString *key = @"testDeleteAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] deleteAsset:[AWSIotsitewiseDeleteAssetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDeleteAssetCompletionHandler {
    NSString *key = @"testDeleteAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] deleteAsset:[AWSIotsitewiseDeleteAssetRequest new] completionHandler:^(AWSIotsitewiseDeleteAssetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDeleteAssetModel {
    NSString *key = @"testDeleteAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] deleteAssetModel:[AWSIotsitewiseDeleteAssetModelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDeleteAssetModelCompletionHandler {
    NSString *key = @"testDeleteAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] deleteAssetModel:[AWSIotsitewiseDeleteAssetModelRequest new] completionHandler:^(AWSIotsitewiseDeleteAssetModelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDeleteDashboard {
    NSString *key = @"testDeleteDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] deleteDashboard:[AWSIotsitewiseDeleteDashboardRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDeleteDashboardCompletionHandler {
    NSString *key = @"testDeleteDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] deleteDashboard:[AWSIotsitewiseDeleteDashboardRequest new] completionHandler:^(AWSIotsitewiseDeleteDashboardResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDeleteGateway {
    NSString *key = @"testDeleteGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] deleteGateway:[AWSIotsitewiseDeleteGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDeleteGatewayCompletionHandler {
    NSString *key = @"testDeleteGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] deleteGateway:[AWSIotsitewiseDeleteGatewayRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDeletePortal {
    NSString *key = @"testDeletePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] deletePortal:[AWSIotsitewiseDeletePortalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDeletePortalCompletionHandler {
    NSString *key = @"testDeletePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] deletePortal:[AWSIotsitewiseDeletePortalRequest new] completionHandler:^(AWSIotsitewiseDeletePortalResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDeleteProject {
    NSString *key = @"testDeleteProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] deleteProject:[AWSIotsitewiseDeleteProjectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDeleteProjectCompletionHandler {
    NSString *key = @"testDeleteProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] deleteProject:[AWSIotsitewiseDeleteProjectRequest new] completionHandler:^(AWSIotsitewiseDeleteProjectResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeAccessPolicy {
    NSString *key = @"testDescribeAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] describeAccessPolicy:[AWSIotsitewiseDescribeAccessPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeAccessPolicyCompletionHandler {
    NSString *key = @"testDescribeAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] describeAccessPolicy:[AWSIotsitewiseDescribeAccessPolicyRequest new] completionHandler:^(AWSIotsitewiseDescribeAccessPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeAsset {
    NSString *key = @"testDescribeAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] describeAsset:[AWSIotsitewiseDescribeAssetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeAssetCompletionHandler {
    NSString *key = @"testDescribeAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] describeAsset:[AWSIotsitewiseDescribeAssetRequest new] completionHandler:^(AWSIotsitewiseDescribeAssetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeAssetModel {
    NSString *key = @"testDescribeAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] describeAssetModel:[AWSIotsitewiseDescribeAssetModelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeAssetModelCompletionHandler {
    NSString *key = @"testDescribeAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] describeAssetModel:[AWSIotsitewiseDescribeAssetModelRequest new] completionHandler:^(AWSIotsitewiseDescribeAssetModelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeAssetProperty {
    NSString *key = @"testDescribeAssetProperty";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] describeAssetProperty:[AWSIotsitewiseDescribeAssetPropertyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeAssetPropertyCompletionHandler {
    NSString *key = @"testDescribeAssetProperty";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] describeAssetProperty:[AWSIotsitewiseDescribeAssetPropertyRequest new] completionHandler:^(AWSIotsitewiseDescribeAssetPropertyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeDashboard {
    NSString *key = @"testDescribeDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] describeDashboard:[AWSIotsitewiseDescribeDashboardRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeDashboardCompletionHandler {
    NSString *key = @"testDescribeDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] describeDashboard:[AWSIotsitewiseDescribeDashboardRequest new] completionHandler:^(AWSIotsitewiseDescribeDashboardResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeGateway {
    NSString *key = @"testDescribeGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] describeGateway:[AWSIotsitewiseDescribeGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeGatewayCompletionHandler {
    NSString *key = @"testDescribeGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] describeGateway:[AWSIotsitewiseDescribeGatewayRequest new] completionHandler:^(AWSIotsitewiseDescribeGatewayResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeGatewayCapabilityConfiguration {
    NSString *key = @"testDescribeGatewayCapabilityConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] describeGatewayCapabilityConfiguration:[AWSIotsitewiseDescribeGatewayCapabilityConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeGatewayCapabilityConfigurationCompletionHandler {
    NSString *key = @"testDescribeGatewayCapabilityConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] describeGatewayCapabilityConfiguration:[AWSIotsitewiseDescribeGatewayCapabilityConfigurationRequest new] completionHandler:^(AWSIotsitewiseDescribeGatewayCapabilityConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeLoggingOptions {
    NSString *key = @"testDescribeLoggingOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] describeLoggingOptions:[AWSIotsitewiseDescribeLoggingOptionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeLoggingOptionsCompletionHandler {
    NSString *key = @"testDescribeLoggingOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] describeLoggingOptions:[AWSIotsitewiseDescribeLoggingOptionsRequest new] completionHandler:^(AWSIotsitewiseDescribeLoggingOptionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribePortal {
    NSString *key = @"testDescribePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] describePortal:[AWSIotsitewiseDescribePortalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribePortalCompletionHandler {
    NSString *key = @"testDescribePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] describePortal:[AWSIotsitewiseDescribePortalRequest new] completionHandler:^(AWSIotsitewiseDescribePortalResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeProject {
    NSString *key = @"testDescribeProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] describeProject:[AWSIotsitewiseDescribeProjectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDescribeProjectCompletionHandler {
    NSString *key = @"testDescribeProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] describeProject:[AWSIotsitewiseDescribeProjectRequest new] completionHandler:^(AWSIotsitewiseDescribeProjectResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDisassociateAssets {
    NSString *key = @"testDisassociateAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] disassociateAssets:[AWSIotsitewiseDisassociateAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testDisassociateAssetsCompletionHandler {
    NSString *key = @"testDisassociateAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] disassociateAssets:[AWSIotsitewiseDisassociateAssetsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testGetAssetPropertyAggregates {
    NSString *key = @"testGetAssetPropertyAggregates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] getAssetPropertyAggregates:[AWSIotsitewiseGetAssetPropertyAggregatesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testGetAssetPropertyAggregatesCompletionHandler {
    NSString *key = @"testGetAssetPropertyAggregates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] getAssetPropertyAggregates:[AWSIotsitewiseGetAssetPropertyAggregatesRequest new] completionHandler:^(AWSIotsitewiseGetAssetPropertyAggregatesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testGetAssetPropertyValue {
    NSString *key = @"testGetAssetPropertyValue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] getAssetPropertyValue:[AWSIotsitewiseGetAssetPropertyValueRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testGetAssetPropertyValueCompletionHandler {
    NSString *key = @"testGetAssetPropertyValue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] getAssetPropertyValue:[AWSIotsitewiseGetAssetPropertyValueRequest new] completionHandler:^(AWSIotsitewiseGetAssetPropertyValueResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testGetAssetPropertyValueHistory {
    NSString *key = @"testGetAssetPropertyValueHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] getAssetPropertyValueHistory:[AWSIotsitewiseGetAssetPropertyValueHistoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testGetAssetPropertyValueHistoryCompletionHandler {
    NSString *key = @"testGetAssetPropertyValueHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] getAssetPropertyValueHistory:[AWSIotsitewiseGetAssetPropertyValueHistoryRequest new] completionHandler:^(AWSIotsitewiseGetAssetPropertyValueHistoryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListAccessPolicies {
    NSString *key = @"testListAccessPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] listAccessPolicies:[AWSIotsitewiseListAccessPoliciesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListAccessPoliciesCompletionHandler {
    NSString *key = @"testListAccessPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] listAccessPolicies:[AWSIotsitewiseListAccessPoliciesRequest new] completionHandler:^(AWSIotsitewiseListAccessPoliciesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListAssetModels {
    NSString *key = @"testListAssetModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] listAssetModels:[AWSIotsitewiseListAssetModelsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListAssetModelsCompletionHandler {
    NSString *key = @"testListAssetModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] listAssetModels:[AWSIotsitewiseListAssetModelsRequest new] completionHandler:^(AWSIotsitewiseListAssetModelsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListAssets {
    NSString *key = @"testListAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] listAssets:[AWSIotsitewiseListAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListAssetsCompletionHandler {
    NSString *key = @"testListAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] listAssets:[AWSIotsitewiseListAssetsRequest new] completionHandler:^(AWSIotsitewiseListAssetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListAssociatedAssets {
    NSString *key = @"testListAssociatedAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] listAssociatedAssets:[AWSIotsitewiseListAssociatedAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListAssociatedAssetsCompletionHandler {
    NSString *key = @"testListAssociatedAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] listAssociatedAssets:[AWSIotsitewiseListAssociatedAssetsRequest new] completionHandler:^(AWSIotsitewiseListAssociatedAssetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListDashboards {
    NSString *key = @"testListDashboards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] listDashboards:[AWSIotsitewiseListDashboardsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListDashboardsCompletionHandler {
    NSString *key = @"testListDashboards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] listDashboards:[AWSIotsitewiseListDashboardsRequest new] completionHandler:^(AWSIotsitewiseListDashboardsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListGateways {
    NSString *key = @"testListGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] listGateways:[AWSIotsitewiseListGatewaysRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListGatewaysCompletionHandler {
    NSString *key = @"testListGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] listGateways:[AWSIotsitewiseListGatewaysRequest new] completionHandler:^(AWSIotsitewiseListGatewaysResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListPortals {
    NSString *key = @"testListPortals";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] listPortals:[AWSIotsitewiseListPortalsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListPortalsCompletionHandler {
    NSString *key = @"testListPortals";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] listPortals:[AWSIotsitewiseListPortalsRequest new] completionHandler:^(AWSIotsitewiseListPortalsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListProjectAssets {
    NSString *key = @"testListProjectAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] listProjectAssets:[AWSIotsitewiseListProjectAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListProjectAssetsCompletionHandler {
    NSString *key = @"testListProjectAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] listProjectAssets:[AWSIotsitewiseListProjectAssetsRequest new] completionHandler:^(AWSIotsitewiseListProjectAssetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListProjects {
    NSString *key = @"testListProjects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] listProjects:[AWSIotsitewiseListProjectsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListProjectsCompletionHandler {
    NSString *key = @"testListProjects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] listProjects:[AWSIotsitewiseListProjectsRequest new] completionHandler:^(AWSIotsitewiseListProjectsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] listTagsForResource:[AWSIotsitewiseListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] listTagsForResource:[AWSIotsitewiseListTagsForResourceRequest new] completionHandler:^(AWSIotsitewiseListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testPutLoggingOptions {
    NSString *key = @"testPutLoggingOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] putLoggingOptions:[AWSIotsitewisePutLoggingOptionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testPutLoggingOptionsCompletionHandler {
    NSString *key = @"testPutLoggingOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] putLoggingOptions:[AWSIotsitewisePutLoggingOptionsRequest new] completionHandler:^(AWSIotsitewisePutLoggingOptionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] tagResource:[AWSIotsitewiseTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] tagResource:[AWSIotsitewiseTagResourceRequest new] completionHandler:^(AWSIotsitewiseTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] untagResource:[AWSIotsitewiseUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] untagResource:[AWSIotsitewiseUntagResourceRequest new] completionHandler:^(AWSIotsitewiseUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateAccessPolicy {
    NSString *key = @"testUpdateAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] updateAccessPolicy:[AWSIotsitewiseUpdateAccessPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateAccessPolicyCompletionHandler {
    NSString *key = @"testUpdateAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] updateAccessPolicy:[AWSIotsitewiseUpdateAccessPolicyRequest new] completionHandler:^(AWSIotsitewiseUpdateAccessPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateAsset {
    NSString *key = @"testUpdateAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] updateAsset:[AWSIotsitewiseUpdateAssetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateAssetCompletionHandler {
    NSString *key = @"testUpdateAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] updateAsset:[AWSIotsitewiseUpdateAssetRequest new] completionHandler:^(AWSIotsitewiseUpdateAssetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateAssetModel {
    NSString *key = @"testUpdateAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] updateAssetModel:[AWSIotsitewiseUpdateAssetModelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateAssetModelCompletionHandler {
    NSString *key = @"testUpdateAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] updateAssetModel:[AWSIotsitewiseUpdateAssetModelRequest new] completionHandler:^(AWSIotsitewiseUpdateAssetModelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateAssetProperty {
    NSString *key = @"testUpdateAssetProperty";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] updateAssetProperty:[AWSIotsitewiseUpdateAssetPropertyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateAssetPropertyCompletionHandler {
    NSString *key = @"testUpdateAssetProperty";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] updateAssetProperty:[AWSIotsitewiseUpdateAssetPropertyRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateDashboard {
    NSString *key = @"testUpdateDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] updateDashboard:[AWSIotsitewiseUpdateDashboardRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateDashboardCompletionHandler {
    NSString *key = @"testUpdateDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] updateDashboard:[AWSIotsitewiseUpdateDashboardRequest new] completionHandler:^(AWSIotsitewiseUpdateDashboardResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateGateway {
    NSString *key = @"testUpdateGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] updateGateway:[AWSIotsitewiseUpdateGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateGatewayCompletionHandler {
    NSString *key = @"testUpdateGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] updateGateway:[AWSIotsitewiseUpdateGatewayRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateGatewayCapabilityConfiguration {
    NSString *key = @"testUpdateGatewayCapabilityConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] updateGatewayCapabilityConfiguration:[AWSIotsitewiseUpdateGatewayCapabilityConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateGatewayCapabilityConfigurationCompletionHandler {
    NSString *key = @"testUpdateGatewayCapabilityConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] updateGatewayCapabilityConfiguration:[AWSIotsitewiseUpdateGatewayCapabilityConfigurationRequest new] completionHandler:^(AWSIotsitewiseUpdateGatewayCapabilityConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdatePortal {
    NSString *key = @"testUpdatePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] updatePortal:[AWSIotsitewiseUpdatePortalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdatePortalCompletionHandler {
    NSString *key = @"testUpdatePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] updatePortal:[AWSIotsitewiseUpdatePortalRequest new] completionHandler:^(AWSIotsitewiseUpdatePortalResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateProject {
    NSString *key = @"testUpdateProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSIotsitewise IotsitewiseForKey:key] updateProject:[AWSIotsitewiseUpdateProjectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

- (void)testUpdateProjectCompletionHandler {
    NSString *key = @"testUpdateProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSIotsitewise registerIotsitewiseWithConfiguration:configuration forKey:key];

    AWSIotsitewise *awsClient = [AWSIotsitewise IotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSIotsitewise IotsitewiseForKey:key] updateProject:[AWSIotsitewiseUpdateProjectRequest new] completionHandler:^(AWSIotsitewiseUpdateProjectResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSIotsitewise removeIotsitewiseForKey:key];
}

@end
