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
#import "AWSiotsitewiseService.h"

static id mockNetworking = nil;

@interface AWSGeneraliotsitewiseTests : XCTestCase

@end

@implementation AWSGeneraliotsitewiseTests

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
    NSString *key = @"testiotsitewiseConstructors";
    XCTAssertNotNil([AWSiotsitewise defaultiotsitewise]);
    XCTAssertEqual([[AWSiotsitewise defaultiotsitewise] class], [AWSiotsitewise class]);
    XCTAssertNil([AWSiotsitewise iotsitewiseForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSiotsitewise iotsitewiseForKey:key]);
    XCTAssertEqual([[AWSiotsitewise iotsitewiseForKey:key] class], [AWSiotsitewise class]);
    XCTAssertEqual([AWSiotsitewise iotsitewiseForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSiotsitewise removeiotsitewiseForKey:key];
    XCTAssertNil([AWSiotsitewise iotsitewiseForKey:key]);

}

- (void)testAssociateAssets {
    NSString *key = @"testAssociateAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] associateAssets:[AWSiotsitewiseAssociateAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testAssociateAssetsCompletionHandler {
    NSString *key = @"testAssociateAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] associateAssets:[AWSiotsitewiseAssociateAssetsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testBatchAssociateProjectAssets {
    NSString *key = @"testBatchAssociateProjectAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] batchAssociateProjectAssets:[AWSiotsitewiseBatchAssociateProjectAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testBatchAssociateProjectAssetsCompletionHandler {
    NSString *key = @"testBatchAssociateProjectAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] batchAssociateProjectAssets:[AWSiotsitewiseBatchAssociateProjectAssetsRequest new] completionHandler:^(AWSiotsitewiseBatchAssociateProjectAssetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testBatchDisassociateProjectAssets {
    NSString *key = @"testBatchDisassociateProjectAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] batchDisassociateProjectAssets:[AWSiotsitewiseBatchDisassociateProjectAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testBatchDisassociateProjectAssetsCompletionHandler {
    NSString *key = @"testBatchDisassociateProjectAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] batchDisassociateProjectAssets:[AWSiotsitewiseBatchDisassociateProjectAssetsRequest new] completionHandler:^(AWSiotsitewiseBatchDisassociateProjectAssetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testBatchPutAssetPropertyValue {
    NSString *key = @"testBatchPutAssetPropertyValue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] batchPutAssetPropertyValue:[AWSiotsitewiseBatchPutAssetPropertyValueRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testBatchPutAssetPropertyValueCompletionHandler {
    NSString *key = @"testBatchPutAssetPropertyValue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] batchPutAssetPropertyValue:[AWSiotsitewiseBatchPutAssetPropertyValueRequest new] completionHandler:^(AWSiotsitewiseBatchPutAssetPropertyValueResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testCreateAccessPolicy {
    NSString *key = @"testCreateAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] createAccessPolicy:[AWSiotsitewiseCreateAccessPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testCreateAccessPolicyCompletionHandler {
    NSString *key = @"testCreateAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] createAccessPolicy:[AWSiotsitewiseCreateAccessPolicyRequest new] completionHandler:^(AWSiotsitewiseCreateAccessPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testCreateAsset {
    NSString *key = @"testCreateAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] createAsset:[AWSiotsitewiseCreateAssetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testCreateAssetCompletionHandler {
    NSString *key = @"testCreateAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] createAsset:[AWSiotsitewiseCreateAssetRequest new] completionHandler:^(AWSiotsitewiseCreateAssetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testCreateAssetModel {
    NSString *key = @"testCreateAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] createAssetModel:[AWSiotsitewiseCreateAssetModelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testCreateAssetModelCompletionHandler {
    NSString *key = @"testCreateAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] createAssetModel:[AWSiotsitewiseCreateAssetModelRequest new] completionHandler:^(AWSiotsitewiseCreateAssetModelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testCreateDashboard {
    NSString *key = @"testCreateDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] createDashboard:[AWSiotsitewiseCreateDashboardRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testCreateDashboardCompletionHandler {
    NSString *key = @"testCreateDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] createDashboard:[AWSiotsitewiseCreateDashboardRequest new] completionHandler:^(AWSiotsitewiseCreateDashboardResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testCreateGateway {
    NSString *key = @"testCreateGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] createGateway:[AWSiotsitewiseCreateGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testCreateGatewayCompletionHandler {
    NSString *key = @"testCreateGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] createGateway:[AWSiotsitewiseCreateGatewayRequest new] completionHandler:^(AWSiotsitewiseCreateGatewayResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testCreatePortal {
    NSString *key = @"testCreatePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] createPortal:[AWSiotsitewiseCreatePortalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testCreatePortalCompletionHandler {
    NSString *key = @"testCreatePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] createPortal:[AWSiotsitewiseCreatePortalRequest new] completionHandler:^(AWSiotsitewiseCreatePortalResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testCreateProject {
    NSString *key = @"testCreateProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] createProject:[AWSiotsitewiseCreateProjectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testCreateProjectCompletionHandler {
    NSString *key = @"testCreateProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] createProject:[AWSiotsitewiseCreateProjectRequest new] completionHandler:^(AWSiotsitewiseCreateProjectResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDeleteAccessPolicy {
    NSString *key = @"testDeleteAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] deleteAccessPolicy:[AWSiotsitewiseDeleteAccessPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDeleteAccessPolicyCompletionHandler {
    NSString *key = @"testDeleteAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] deleteAccessPolicy:[AWSiotsitewiseDeleteAccessPolicyRequest new] completionHandler:^(AWSiotsitewiseDeleteAccessPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDeleteAsset {
    NSString *key = @"testDeleteAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] deleteAsset:[AWSiotsitewiseDeleteAssetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDeleteAssetCompletionHandler {
    NSString *key = @"testDeleteAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] deleteAsset:[AWSiotsitewiseDeleteAssetRequest new] completionHandler:^(AWSiotsitewiseDeleteAssetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDeleteAssetModel {
    NSString *key = @"testDeleteAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] deleteAssetModel:[AWSiotsitewiseDeleteAssetModelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDeleteAssetModelCompletionHandler {
    NSString *key = @"testDeleteAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] deleteAssetModel:[AWSiotsitewiseDeleteAssetModelRequest new] completionHandler:^(AWSiotsitewiseDeleteAssetModelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDeleteDashboard {
    NSString *key = @"testDeleteDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] deleteDashboard:[AWSiotsitewiseDeleteDashboardRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDeleteDashboardCompletionHandler {
    NSString *key = @"testDeleteDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] deleteDashboard:[AWSiotsitewiseDeleteDashboardRequest new] completionHandler:^(AWSiotsitewiseDeleteDashboardResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDeleteGateway {
    NSString *key = @"testDeleteGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] deleteGateway:[AWSiotsitewiseDeleteGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDeleteGatewayCompletionHandler {
    NSString *key = @"testDeleteGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] deleteGateway:[AWSiotsitewiseDeleteGatewayRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDeletePortal {
    NSString *key = @"testDeletePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] deletePortal:[AWSiotsitewiseDeletePortalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDeletePortalCompletionHandler {
    NSString *key = @"testDeletePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] deletePortal:[AWSiotsitewiseDeletePortalRequest new] completionHandler:^(AWSiotsitewiseDeletePortalResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDeleteProject {
    NSString *key = @"testDeleteProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] deleteProject:[AWSiotsitewiseDeleteProjectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDeleteProjectCompletionHandler {
    NSString *key = @"testDeleteProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] deleteProject:[AWSiotsitewiseDeleteProjectRequest new] completionHandler:^(AWSiotsitewiseDeleteProjectResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeAccessPolicy {
    NSString *key = @"testDescribeAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] describeAccessPolicy:[AWSiotsitewiseDescribeAccessPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeAccessPolicyCompletionHandler {
    NSString *key = @"testDescribeAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] describeAccessPolicy:[AWSiotsitewiseDescribeAccessPolicyRequest new] completionHandler:^(AWSiotsitewiseDescribeAccessPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeAsset {
    NSString *key = @"testDescribeAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] describeAsset:[AWSiotsitewiseDescribeAssetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeAssetCompletionHandler {
    NSString *key = @"testDescribeAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] describeAsset:[AWSiotsitewiseDescribeAssetRequest new] completionHandler:^(AWSiotsitewiseDescribeAssetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeAssetModel {
    NSString *key = @"testDescribeAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] describeAssetModel:[AWSiotsitewiseDescribeAssetModelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeAssetModelCompletionHandler {
    NSString *key = @"testDescribeAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] describeAssetModel:[AWSiotsitewiseDescribeAssetModelRequest new] completionHandler:^(AWSiotsitewiseDescribeAssetModelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeAssetProperty {
    NSString *key = @"testDescribeAssetProperty";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] describeAssetProperty:[AWSiotsitewiseDescribeAssetPropertyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeAssetPropertyCompletionHandler {
    NSString *key = @"testDescribeAssetProperty";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] describeAssetProperty:[AWSiotsitewiseDescribeAssetPropertyRequest new] completionHandler:^(AWSiotsitewiseDescribeAssetPropertyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeDashboard {
    NSString *key = @"testDescribeDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] describeDashboard:[AWSiotsitewiseDescribeDashboardRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeDashboardCompletionHandler {
    NSString *key = @"testDescribeDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] describeDashboard:[AWSiotsitewiseDescribeDashboardRequest new] completionHandler:^(AWSiotsitewiseDescribeDashboardResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeGateway {
    NSString *key = @"testDescribeGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] describeGateway:[AWSiotsitewiseDescribeGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeGatewayCompletionHandler {
    NSString *key = @"testDescribeGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] describeGateway:[AWSiotsitewiseDescribeGatewayRequest new] completionHandler:^(AWSiotsitewiseDescribeGatewayResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeGatewayCapabilityConfiguration {
    NSString *key = @"testDescribeGatewayCapabilityConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] describeGatewayCapabilityConfiguration:[AWSiotsitewiseDescribeGatewayCapabilityConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeGatewayCapabilityConfigurationCompletionHandler {
    NSString *key = @"testDescribeGatewayCapabilityConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] describeGatewayCapabilityConfiguration:[AWSiotsitewiseDescribeGatewayCapabilityConfigurationRequest new] completionHandler:^(AWSiotsitewiseDescribeGatewayCapabilityConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeLoggingOptions {
    NSString *key = @"testDescribeLoggingOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] describeLoggingOptions:[AWSiotsitewiseDescribeLoggingOptionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeLoggingOptionsCompletionHandler {
    NSString *key = @"testDescribeLoggingOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] describeLoggingOptions:[AWSiotsitewiseDescribeLoggingOptionsRequest new] completionHandler:^(AWSiotsitewiseDescribeLoggingOptionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribePortal {
    NSString *key = @"testDescribePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] describePortal:[AWSiotsitewiseDescribePortalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribePortalCompletionHandler {
    NSString *key = @"testDescribePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] describePortal:[AWSiotsitewiseDescribePortalRequest new] completionHandler:^(AWSiotsitewiseDescribePortalResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeProject {
    NSString *key = @"testDescribeProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] describeProject:[AWSiotsitewiseDescribeProjectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDescribeProjectCompletionHandler {
    NSString *key = @"testDescribeProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] describeProject:[AWSiotsitewiseDescribeProjectRequest new] completionHandler:^(AWSiotsitewiseDescribeProjectResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDisassociateAssets {
    NSString *key = @"testDisassociateAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] disassociateAssets:[AWSiotsitewiseDisassociateAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testDisassociateAssetsCompletionHandler {
    NSString *key = @"testDisassociateAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] disassociateAssets:[AWSiotsitewiseDisassociateAssetsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testGetAssetPropertyAggregates {
    NSString *key = @"testGetAssetPropertyAggregates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] getAssetPropertyAggregates:[AWSiotsitewiseGetAssetPropertyAggregatesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testGetAssetPropertyAggregatesCompletionHandler {
    NSString *key = @"testGetAssetPropertyAggregates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] getAssetPropertyAggregates:[AWSiotsitewiseGetAssetPropertyAggregatesRequest new] completionHandler:^(AWSiotsitewiseGetAssetPropertyAggregatesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testGetAssetPropertyValue {
    NSString *key = @"testGetAssetPropertyValue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] getAssetPropertyValue:[AWSiotsitewiseGetAssetPropertyValueRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testGetAssetPropertyValueCompletionHandler {
    NSString *key = @"testGetAssetPropertyValue";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] getAssetPropertyValue:[AWSiotsitewiseGetAssetPropertyValueRequest new] completionHandler:^(AWSiotsitewiseGetAssetPropertyValueResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testGetAssetPropertyValueHistory {
    NSString *key = @"testGetAssetPropertyValueHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] getAssetPropertyValueHistory:[AWSiotsitewiseGetAssetPropertyValueHistoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testGetAssetPropertyValueHistoryCompletionHandler {
    NSString *key = @"testGetAssetPropertyValueHistory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] getAssetPropertyValueHistory:[AWSiotsitewiseGetAssetPropertyValueHistoryRequest new] completionHandler:^(AWSiotsitewiseGetAssetPropertyValueHistoryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListAccessPolicies {
    NSString *key = @"testListAccessPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] listAccessPolicies:[AWSiotsitewiseListAccessPoliciesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListAccessPoliciesCompletionHandler {
    NSString *key = @"testListAccessPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] listAccessPolicies:[AWSiotsitewiseListAccessPoliciesRequest new] completionHandler:^(AWSiotsitewiseListAccessPoliciesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListAssetModels {
    NSString *key = @"testListAssetModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] listAssetModels:[AWSiotsitewiseListAssetModelsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListAssetModelsCompletionHandler {
    NSString *key = @"testListAssetModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] listAssetModels:[AWSiotsitewiseListAssetModelsRequest new] completionHandler:^(AWSiotsitewiseListAssetModelsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListAssets {
    NSString *key = @"testListAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] listAssets:[AWSiotsitewiseListAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListAssetsCompletionHandler {
    NSString *key = @"testListAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] listAssets:[AWSiotsitewiseListAssetsRequest new] completionHandler:^(AWSiotsitewiseListAssetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListAssociatedAssets {
    NSString *key = @"testListAssociatedAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] listAssociatedAssets:[AWSiotsitewiseListAssociatedAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListAssociatedAssetsCompletionHandler {
    NSString *key = @"testListAssociatedAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] listAssociatedAssets:[AWSiotsitewiseListAssociatedAssetsRequest new] completionHandler:^(AWSiotsitewiseListAssociatedAssetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListDashboards {
    NSString *key = @"testListDashboards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] listDashboards:[AWSiotsitewiseListDashboardsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListDashboardsCompletionHandler {
    NSString *key = @"testListDashboards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] listDashboards:[AWSiotsitewiseListDashboardsRequest new] completionHandler:^(AWSiotsitewiseListDashboardsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListGateways {
    NSString *key = @"testListGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] listGateways:[AWSiotsitewiseListGatewaysRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListGatewaysCompletionHandler {
    NSString *key = @"testListGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] listGateways:[AWSiotsitewiseListGatewaysRequest new] completionHandler:^(AWSiotsitewiseListGatewaysResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListPortals {
    NSString *key = @"testListPortals";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] listPortals:[AWSiotsitewiseListPortalsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListPortalsCompletionHandler {
    NSString *key = @"testListPortals";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] listPortals:[AWSiotsitewiseListPortalsRequest new] completionHandler:^(AWSiotsitewiseListPortalsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListProjectAssets {
    NSString *key = @"testListProjectAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] listProjectAssets:[AWSiotsitewiseListProjectAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListProjectAssetsCompletionHandler {
    NSString *key = @"testListProjectAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] listProjectAssets:[AWSiotsitewiseListProjectAssetsRequest new] completionHandler:^(AWSiotsitewiseListProjectAssetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListProjects {
    NSString *key = @"testListProjects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] listProjects:[AWSiotsitewiseListProjectsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListProjectsCompletionHandler {
    NSString *key = @"testListProjects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] listProjects:[AWSiotsitewiseListProjectsRequest new] completionHandler:^(AWSiotsitewiseListProjectsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] listTagsForResource:[AWSiotsitewiseListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] listTagsForResource:[AWSiotsitewiseListTagsForResourceRequest new] completionHandler:^(AWSiotsitewiseListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testPutLoggingOptions {
    NSString *key = @"testPutLoggingOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] putLoggingOptions:[AWSiotsitewisePutLoggingOptionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testPutLoggingOptionsCompletionHandler {
    NSString *key = @"testPutLoggingOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] putLoggingOptions:[AWSiotsitewisePutLoggingOptionsRequest new] completionHandler:^(AWSiotsitewisePutLoggingOptionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] tagResource:[AWSiotsitewiseTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] tagResource:[AWSiotsitewiseTagResourceRequest new] completionHandler:^(AWSiotsitewiseTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] untagResource:[AWSiotsitewiseUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] untagResource:[AWSiotsitewiseUntagResourceRequest new] completionHandler:^(AWSiotsitewiseUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateAccessPolicy {
    NSString *key = @"testUpdateAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] updateAccessPolicy:[AWSiotsitewiseUpdateAccessPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateAccessPolicyCompletionHandler {
    NSString *key = @"testUpdateAccessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] updateAccessPolicy:[AWSiotsitewiseUpdateAccessPolicyRequest new] completionHandler:^(AWSiotsitewiseUpdateAccessPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateAsset {
    NSString *key = @"testUpdateAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] updateAsset:[AWSiotsitewiseUpdateAssetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateAssetCompletionHandler {
    NSString *key = @"testUpdateAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] updateAsset:[AWSiotsitewiseUpdateAssetRequest new] completionHandler:^(AWSiotsitewiseUpdateAssetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateAssetModel {
    NSString *key = @"testUpdateAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] updateAssetModel:[AWSiotsitewiseUpdateAssetModelRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateAssetModelCompletionHandler {
    NSString *key = @"testUpdateAssetModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] updateAssetModel:[AWSiotsitewiseUpdateAssetModelRequest new] completionHandler:^(AWSiotsitewiseUpdateAssetModelResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateAssetProperty {
    NSString *key = @"testUpdateAssetProperty";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] updateAssetProperty:[AWSiotsitewiseUpdateAssetPropertyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateAssetPropertyCompletionHandler {
    NSString *key = @"testUpdateAssetProperty";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] updateAssetProperty:[AWSiotsitewiseUpdateAssetPropertyRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateDashboard {
    NSString *key = @"testUpdateDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] updateDashboard:[AWSiotsitewiseUpdateDashboardRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateDashboardCompletionHandler {
    NSString *key = @"testUpdateDashboard";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] updateDashboard:[AWSiotsitewiseUpdateDashboardRequest new] completionHandler:^(AWSiotsitewiseUpdateDashboardResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateGateway {
    NSString *key = @"testUpdateGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] updateGateway:[AWSiotsitewiseUpdateGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateGatewayCompletionHandler {
    NSString *key = @"testUpdateGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] updateGateway:[AWSiotsitewiseUpdateGatewayRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateGatewayCapabilityConfiguration {
    NSString *key = @"testUpdateGatewayCapabilityConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] updateGatewayCapabilityConfiguration:[AWSiotsitewiseUpdateGatewayCapabilityConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateGatewayCapabilityConfigurationCompletionHandler {
    NSString *key = @"testUpdateGatewayCapabilityConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] updateGatewayCapabilityConfiguration:[AWSiotsitewiseUpdateGatewayCapabilityConfigurationRequest new] completionHandler:^(AWSiotsitewiseUpdateGatewayCapabilityConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdatePortal {
    NSString *key = @"testUpdatePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] updatePortal:[AWSiotsitewiseUpdatePortalRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdatePortalCompletionHandler {
    NSString *key = @"testUpdatePortal";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] updatePortal:[AWSiotsitewiseUpdatePortalRequest new] completionHandler:^(AWSiotsitewiseUpdatePortalResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateProject {
    NSString *key = @"testUpdateProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSiotsitewise iotsitewiseForKey:key] updateProject:[AWSiotsitewiseUpdateProjectRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

- (void)testUpdateProjectCompletionHandler {
    NSString *key = @"testUpdateProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSiotsitewise registeriotsitewiseWithConfiguration:configuration forKey:key];

    AWSiotsitewise *awsClient = [AWSiotsitewise iotsitewiseForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSiotsitewise iotsitewiseForKey:key] updateProject:[AWSiotsitewiseUpdateProjectRequest new] completionHandler:^(AWSiotsitewiseUpdateProjectResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSiotsitewise removeiotsitewiseForKey:key];
}

@end
