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
#import "AWSStoragegatewayService.h"

static id mockNetworking = nil;

@interface AWSGeneralStoragegatewayTests : XCTestCase

@end

@implementation AWSGeneralStoragegatewayTests

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
    NSString *key = @"testStoragegatewayConstructors";
    XCTAssertNotNil([AWSStoragegateway defaultStoragegateway]);
    XCTAssertEqual([[AWSStoragegateway defaultStoragegateway] class], [AWSStoragegateway class]);
    XCTAssertNil([AWSStoragegateway StoragegatewayForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSStoragegateway StoragegatewayForKey:key]);
    XCTAssertEqual([[AWSStoragegateway StoragegatewayForKey:key] class], [AWSStoragegateway class]);
    XCTAssertEqual([AWSStoragegateway StoragegatewayForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSStoragegateway removeStoragegatewayForKey:key];
    XCTAssertNil([AWSStoragegateway StoragegatewayForKey:key]);

}

- (void)testActivateGateway {
    NSString *key = @"testActivateGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] activateGateway:[AWSStoragegatewayActivateGatewayInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testActivateGatewayCompletionHandler {
    NSString *key = @"testActivateGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] activateGateway:[AWSStoragegatewayActivateGatewayInput new] completionHandler:^(AWSStoragegatewayActivateGatewayOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testAddCache {
    NSString *key = @"testAddCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] addCache:[AWSStoragegatewayAddCacheInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testAddCacheCompletionHandler {
    NSString *key = @"testAddCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] addCache:[AWSStoragegatewayAddCacheInput new] completionHandler:^(AWSStoragegatewayAddCacheOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testAddTagsToResource {
    NSString *key = @"testAddTagsToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] addTagsToResource:[AWSStoragegatewayAddTagsToResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testAddTagsToResourceCompletionHandler {
    NSString *key = @"testAddTagsToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] addTagsToResource:[AWSStoragegatewayAddTagsToResourceInput new] completionHandler:^(AWSStoragegatewayAddTagsToResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testAddUploadBuffer {
    NSString *key = @"testAddUploadBuffer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] addUploadBuffer:[AWSStoragegatewayAddUploadBufferInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testAddUploadBufferCompletionHandler {
    NSString *key = @"testAddUploadBuffer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] addUploadBuffer:[AWSStoragegatewayAddUploadBufferInput new] completionHandler:^(AWSStoragegatewayAddUploadBufferOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testAddWorkingStorage {
    NSString *key = @"testAddWorkingStorage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] addWorkingStorage:[AWSStoragegatewayAddWorkingStorageInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testAddWorkingStorageCompletionHandler {
    NSString *key = @"testAddWorkingStorage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] addWorkingStorage:[AWSStoragegatewayAddWorkingStorageInput new] completionHandler:^(AWSStoragegatewayAddWorkingStorageOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testAssignTapePool {
    NSString *key = @"testAssignTapePool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] assignTapePool:[AWSStoragegatewayAssignTapePoolInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testAssignTapePoolCompletionHandler {
    NSString *key = @"testAssignTapePool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] assignTapePool:[AWSStoragegatewayAssignTapePoolInput new] completionHandler:^(AWSStoragegatewayAssignTapePoolOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testAttachVolume {
    NSString *key = @"testAttachVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] attachVolume:[AWSStoragegatewayAttachVolumeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testAttachVolumeCompletionHandler {
    NSString *key = @"testAttachVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] attachVolume:[AWSStoragegatewayAttachVolumeInput new] completionHandler:^(AWSStoragegatewayAttachVolumeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCancelArchival {
    NSString *key = @"testCancelArchival";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] cancelArchival:[AWSStoragegatewayCancelArchivalInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCancelArchivalCompletionHandler {
    NSString *key = @"testCancelArchival";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] cancelArchival:[AWSStoragegatewayCancelArchivalInput new] completionHandler:^(AWSStoragegatewayCancelArchivalOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCancelRetrieval {
    NSString *key = @"testCancelRetrieval";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] cancelRetrieval:[AWSStoragegatewayCancelRetrievalInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCancelRetrievalCompletionHandler {
    NSString *key = @"testCancelRetrieval";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] cancelRetrieval:[AWSStoragegatewayCancelRetrievalInput new] completionHandler:^(AWSStoragegatewayCancelRetrievalOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateCachediSCSIVolume {
    NSString *key = @"testCreateCachediSCSIVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] createCachediSCSIVolume:[AWSStoragegatewayCreateCachediSCSIVolumeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateCachediSCSIVolumeCompletionHandler {
    NSString *key = @"testCreateCachediSCSIVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] createCachediSCSIVolume:[AWSStoragegatewayCreateCachediSCSIVolumeInput new] completionHandler:^(AWSStoragegatewayCreateCachediSCSIVolumeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateNFSFileShare {
    NSString *key = @"testCreateNFSFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] createNFSFileShare:[AWSStoragegatewayCreateNFSFileShareInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateNFSFileShareCompletionHandler {
    NSString *key = @"testCreateNFSFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] createNFSFileShare:[AWSStoragegatewayCreateNFSFileShareInput new] completionHandler:^(AWSStoragegatewayCreateNFSFileShareOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateSMBFileShare {
    NSString *key = @"testCreateSMBFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] createSMBFileShare:[AWSStoragegatewayCreateSMBFileShareInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateSMBFileShareCompletionHandler {
    NSString *key = @"testCreateSMBFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] createSMBFileShare:[AWSStoragegatewayCreateSMBFileShareInput new] completionHandler:^(AWSStoragegatewayCreateSMBFileShareOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateSnapshot {
    NSString *key = @"testCreateSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] createSnapshot:[AWSStoragegatewayCreateSnapshotInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateSnapshotCompletionHandler {
    NSString *key = @"testCreateSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] createSnapshot:[AWSStoragegatewayCreateSnapshotInput new] completionHandler:^(AWSStoragegatewayCreateSnapshotOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateSnapshotFromVolumeRecoveryPoint {
    NSString *key = @"testCreateSnapshotFromVolumeRecoveryPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] createSnapshotFromVolumeRecoveryPoint:[AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateSnapshotFromVolumeRecoveryPointCompletionHandler {
    NSString *key = @"testCreateSnapshotFromVolumeRecoveryPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] createSnapshotFromVolumeRecoveryPoint:[AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointInput new] completionHandler:^(AWSStoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateStorediSCSIVolume {
    NSString *key = @"testCreateStorediSCSIVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] createStorediSCSIVolume:[AWSStoragegatewayCreateStorediSCSIVolumeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateStorediSCSIVolumeCompletionHandler {
    NSString *key = @"testCreateStorediSCSIVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] createStorediSCSIVolume:[AWSStoragegatewayCreateStorediSCSIVolumeInput new] completionHandler:^(AWSStoragegatewayCreateStorediSCSIVolumeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateTapeWithBarcode {
    NSString *key = @"testCreateTapeWithBarcode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] createTapeWithBarcode:[AWSStoragegatewayCreateTapeWithBarcodeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateTapeWithBarcodeCompletionHandler {
    NSString *key = @"testCreateTapeWithBarcode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] createTapeWithBarcode:[AWSStoragegatewayCreateTapeWithBarcodeInput new] completionHandler:^(AWSStoragegatewayCreateTapeWithBarcodeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateTapes {
    NSString *key = @"testCreateTapes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] createTapes:[AWSStoragegatewayCreateTapesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testCreateTapesCompletionHandler {
    NSString *key = @"testCreateTapes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] createTapes:[AWSStoragegatewayCreateTapesInput new] completionHandler:^(AWSStoragegatewayCreateTapesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteAutomaticTapeCreationPolicy {
    NSString *key = @"testDeleteAutomaticTapeCreationPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] deleteAutomaticTapeCreationPolicy:[AWSStoragegatewayDeleteAutomaticTapeCreationPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteAutomaticTapeCreationPolicyCompletionHandler {
    NSString *key = @"testDeleteAutomaticTapeCreationPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] deleteAutomaticTapeCreationPolicy:[AWSStoragegatewayDeleteAutomaticTapeCreationPolicyInput new] completionHandler:^(AWSStoragegatewayDeleteAutomaticTapeCreationPolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteBandwidthRateLimit {
    NSString *key = @"testDeleteBandwidthRateLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] deleteBandwidthRateLimit:[AWSStoragegatewayDeleteBandwidthRateLimitInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteBandwidthRateLimitCompletionHandler {
    NSString *key = @"testDeleteBandwidthRateLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] deleteBandwidthRateLimit:[AWSStoragegatewayDeleteBandwidthRateLimitInput new] completionHandler:^(AWSStoragegatewayDeleteBandwidthRateLimitOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteChapCredentials {
    NSString *key = @"testDeleteChapCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] deleteChapCredentials:[AWSStoragegatewayDeleteChapCredentialsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteChapCredentialsCompletionHandler {
    NSString *key = @"testDeleteChapCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] deleteChapCredentials:[AWSStoragegatewayDeleteChapCredentialsInput new] completionHandler:^(AWSStoragegatewayDeleteChapCredentialsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteFileShare {
    NSString *key = @"testDeleteFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] deleteFileShare:[AWSStoragegatewayDeleteFileShareInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteFileShareCompletionHandler {
    NSString *key = @"testDeleteFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] deleteFileShare:[AWSStoragegatewayDeleteFileShareInput new] completionHandler:^(AWSStoragegatewayDeleteFileShareOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteGateway {
    NSString *key = @"testDeleteGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] deleteGateway:[AWSStoragegatewayDeleteGatewayInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteGatewayCompletionHandler {
    NSString *key = @"testDeleteGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] deleteGateway:[AWSStoragegatewayDeleteGatewayInput new] completionHandler:^(AWSStoragegatewayDeleteGatewayOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteSnapshotSchedule {
    NSString *key = @"testDeleteSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] deleteSnapshotSchedule:[AWSStoragegatewayDeleteSnapshotScheduleInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteSnapshotScheduleCompletionHandler {
    NSString *key = @"testDeleteSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] deleteSnapshotSchedule:[AWSStoragegatewayDeleteSnapshotScheduleInput new] completionHandler:^(AWSStoragegatewayDeleteSnapshotScheduleOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteTape {
    NSString *key = @"testDeleteTape";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] deleteTape:[AWSStoragegatewayDeleteTapeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteTapeCompletionHandler {
    NSString *key = @"testDeleteTape";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] deleteTape:[AWSStoragegatewayDeleteTapeInput new] completionHandler:^(AWSStoragegatewayDeleteTapeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteTapeArchive {
    NSString *key = @"testDeleteTapeArchive";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] deleteTapeArchive:[AWSStoragegatewayDeleteTapeArchiveInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteTapeArchiveCompletionHandler {
    NSString *key = @"testDeleteTapeArchive";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] deleteTapeArchive:[AWSStoragegatewayDeleteTapeArchiveInput new] completionHandler:^(AWSStoragegatewayDeleteTapeArchiveOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteVolume {
    NSString *key = @"testDeleteVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] deleteVolume:[AWSStoragegatewayDeleteVolumeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDeleteVolumeCompletionHandler {
    NSString *key = @"testDeleteVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] deleteVolume:[AWSStoragegatewayDeleteVolumeInput new] completionHandler:^(AWSStoragegatewayDeleteVolumeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeAvailabilityMonitorTest {
    NSString *key = @"testDescribeAvailabilityMonitorTest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeAvailabilityMonitorTest:[AWSStoragegatewayDescribeAvailabilityMonitorTestInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeAvailabilityMonitorTestCompletionHandler {
    NSString *key = @"testDescribeAvailabilityMonitorTest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeAvailabilityMonitorTest:[AWSStoragegatewayDescribeAvailabilityMonitorTestInput new] completionHandler:^(AWSStoragegatewayDescribeAvailabilityMonitorTestOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeBandwidthRateLimit {
    NSString *key = @"testDescribeBandwidthRateLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeBandwidthRateLimit:[AWSStoragegatewayDescribeBandwidthRateLimitInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeBandwidthRateLimitCompletionHandler {
    NSString *key = @"testDescribeBandwidthRateLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeBandwidthRateLimit:[AWSStoragegatewayDescribeBandwidthRateLimitInput new] completionHandler:^(AWSStoragegatewayDescribeBandwidthRateLimitOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeCache {
    NSString *key = @"testDescribeCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeCache:[AWSStoragegatewayDescribeCacheInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeCacheCompletionHandler {
    NSString *key = @"testDescribeCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeCache:[AWSStoragegatewayDescribeCacheInput new] completionHandler:^(AWSStoragegatewayDescribeCacheOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeCachediSCSIVolumes {
    NSString *key = @"testDescribeCachediSCSIVolumes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeCachediSCSIVolumes:[AWSStoragegatewayDescribeCachediSCSIVolumesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeCachediSCSIVolumesCompletionHandler {
    NSString *key = @"testDescribeCachediSCSIVolumes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeCachediSCSIVolumes:[AWSStoragegatewayDescribeCachediSCSIVolumesInput new] completionHandler:^(AWSStoragegatewayDescribeCachediSCSIVolumesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeChapCredentials {
    NSString *key = @"testDescribeChapCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeChapCredentials:[AWSStoragegatewayDescribeChapCredentialsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeChapCredentialsCompletionHandler {
    NSString *key = @"testDescribeChapCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeChapCredentials:[AWSStoragegatewayDescribeChapCredentialsInput new] completionHandler:^(AWSStoragegatewayDescribeChapCredentialsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeGatewayInformation {
    NSString *key = @"testDescribeGatewayInformation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeGatewayInformation:[AWSStoragegatewayDescribeGatewayInformationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeGatewayInformationCompletionHandler {
    NSString *key = @"testDescribeGatewayInformation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeGatewayInformation:[AWSStoragegatewayDescribeGatewayInformationInput new] completionHandler:^(AWSStoragegatewayDescribeGatewayInformationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeMaintenanceStartTime {
    NSString *key = @"testDescribeMaintenanceStartTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeMaintenanceStartTime:[AWSStoragegatewayDescribeMaintenanceStartTimeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeMaintenanceStartTimeCompletionHandler {
    NSString *key = @"testDescribeMaintenanceStartTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeMaintenanceStartTime:[AWSStoragegatewayDescribeMaintenanceStartTimeInput new] completionHandler:^(AWSStoragegatewayDescribeMaintenanceStartTimeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeNFSFileShares {
    NSString *key = @"testDescribeNFSFileShares";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeNFSFileShares:[AWSStoragegatewayDescribeNFSFileSharesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeNFSFileSharesCompletionHandler {
    NSString *key = @"testDescribeNFSFileShares";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeNFSFileShares:[AWSStoragegatewayDescribeNFSFileSharesInput new] completionHandler:^(AWSStoragegatewayDescribeNFSFileSharesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeSMBFileShares {
    NSString *key = @"testDescribeSMBFileShares";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeSMBFileShares:[AWSStoragegatewayDescribeSMBFileSharesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeSMBFileSharesCompletionHandler {
    NSString *key = @"testDescribeSMBFileShares";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeSMBFileShares:[AWSStoragegatewayDescribeSMBFileSharesInput new] completionHandler:^(AWSStoragegatewayDescribeSMBFileSharesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeSMBSettings {
    NSString *key = @"testDescribeSMBSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeSMBSettings:[AWSStoragegatewayDescribeSMBSettingsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeSMBSettingsCompletionHandler {
    NSString *key = @"testDescribeSMBSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeSMBSettings:[AWSStoragegatewayDescribeSMBSettingsInput new] completionHandler:^(AWSStoragegatewayDescribeSMBSettingsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeSnapshotSchedule {
    NSString *key = @"testDescribeSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeSnapshotSchedule:[AWSStoragegatewayDescribeSnapshotScheduleInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeSnapshotScheduleCompletionHandler {
    NSString *key = @"testDescribeSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeSnapshotSchedule:[AWSStoragegatewayDescribeSnapshotScheduleInput new] completionHandler:^(AWSStoragegatewayDescribeSnapshotScheduleOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeStorediSCSIVolumes {
    NSString *key = @"testDescribeStorediSCSIVolumes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeStorediSCSIVolumes:[AWSStoragegatewayDescribeStorediSCSIVolumesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeStorediSCSIVolumesCompletionHandler {
    NSString *key = @"testDescribeStorediSCSIVolumes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeStorediSCSIVolumes:[AWSStoragegatewayDescribeStorediSCSIVolumesInput new] completionHandler:^(AWSStoragegatewayDescribeStorediSCSIVolumesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeTapeArchives {
    NSString *key = @"testDescribeTapeArchives";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeTapeArchives:[AWSStoragegatewayDescribeTapeArchivesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeTapeArchivesCompletionHandler {
    NSString *key = @"testDescribeTapeArchives";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeTapeArchives:[AWSStoragegatewayDescribeTapeArchivesInput new] completionHandler:^(AWSStoragegatewayDescribeTapeArchivesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeTapeRecoveryPoints {
    NSString *key = @"testDescribeTapeRecoveryPoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeTapeRecoveryPoints:[AWSStoragegatewayDescribeTapeRecoveryPointsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeTapeRecoveryPointsCompletionHandler {
    NSString *key = @"testDescribeTapeRecoveryPoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeTapeRecoveryPoints:[AWSStoragegatewayDescribeTapeRecoveryPointsInput new] completionHandler:^(AWSStoragegatewayDescribeTapeRecoveryPointsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeTapes {
    NSString *key = @"testDescribeTapes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeTapes:[AWSStoragegatewayDescribeTapesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeTapesCompletionHandler {
    NSString *key = @"testDescribeTapes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeTapes:[AWSStoragegatewayDescribeTapesInput new] completionHandler:^(AWSStoragegatewayDescribeTapesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeUploadBuffer {
    NSString *key = @"testDescribeUploadBuffer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeUploadBuffer:[AWSStoragegatewayDescribeUploadBufferInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeUploadBufferCompletionHandler {
    NSString *key = @"testDescribeUploadBuffer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeUploadBuffer:[AWSStoragegatewayDescribeUploadBufferInput new] completionHandler:^(AWSStoragegatewayDescribeUploadBufferOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeVTLDevices {
    NSString *key = @"testDescribeVTLDevices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeVTLDevices:[AWSStoragegatewayDescribeVTLDevicesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeVTLDevicesCompletionHandler {
    NSString *key = @"testDescribeVTLDevices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeVTLDevices:[AWSStoragegatewayDescribeVTLDevicesInput new] completionHandler:^(AWSStoragegatewayDescribeVTLDevicesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeWorkingStorage {
    NSString *key = @"testDescribeWorkingStorage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] describeWorkingStorage:[AWSStoragegatewayDescribeWorkingStorageInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDescribeWorkingStorageCompletionHandler {
    NSString *key = @"testDescribeWorkingStorage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] describeWorkingStorage:[AWSStoragegatewayDescribeWorkingStorageInput new] completionHandler:^(AWSStoragegatewayDescribeWorkingStorageOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDetachVolume {
    NSString *key = @"testDetachVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] detachVolume:[AWSStoragegatewayDetachVolumeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDetachVolumeCompletionHandler {
    NSString *key = @"testDetachVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] detachVolume:[AWSStoragegatewayDetachVolumeInput new] completionHandler:^(AWSStoragegatewayDetachVolumeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDisableGateway {
    NSString *key = @"testDisableGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] disableGateway:[AWSStoragegatewayDisableGatewayInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testDisableGatewayCompletionHandler {
    NSString *key = @"testDisableGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] disableGateway:[AWSStoragegatewayDisableGatewayInput new] completionHandler:^(AWSStoragegatewayDisableGatewayOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testJoinDomain {
    NSString *key = @"testJoinDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] joinDomain:[AWSStoragegatewayJoinDomainInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testJoinDomainCompletionHandler {
    NSString *key = @"testJoinDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] joinDomain:[AWSStoragegatewayJoinDomainInput new] completionHandler:^(AWSStoragegatewayJoinDomainOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListAutomaticTapeCreationPolicies {
    NSString *key = @"testListAutomaticTapeCreationPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] listAutomaticTapeCreationPolicies:[AWSStoragegatewayListAutomaticTapeCreationPoliciesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListAutomaticTapeCreationPoliciesCompletionHandler {
    NSString *key = @"testListAutomaticTapeCreationPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] listAutomaticTapeCreationPolicies:[AWSStoragegatewayListAutomaticTapeCreationPoliciesInput new] completionHandler:^(AWSStoragegatewayListAutomaticTapeCreationPoliciesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListFileShares {
    NSString *key = @"testListFileShares";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] listFileShares:[AWSStoragegatewayListFileSharesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListFileSharesCompletionHandler {
    NSString *key = @"testListFileShares";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] listFileShares:[AWSStoragegatewayListFileSharesInput new] completionHandler:^(AWSStoragegatewayListFileSharesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListGateways {
    NSString *key = @"testListGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] listGateways:[AWSStoragegatewayListGatewaysInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListGatewaysCompletionHandler {
    NSString *key = @"testListGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] listGateways:[AWSStoragegatewayListGatewaysInput new] completionHandler:^(AWSStoragegatewayListGatewaysOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListLocalDisks {
    NSString *key = @"testListLocalDisks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] listLocalDisks:[AWSStoragegatewayListLocalDisksInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListLocalDisksCompletionHandler {
    NSString *key = @"testListLocalDisks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] listLocalDisks:[AWSStoragegatewayListLocalDisksInput new] completionHandler:^(AWSStoragegatewayListLocalDisksOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] listTagsForResource:[AWSStoragegatewayListTagsForResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] listTagsForResource:[AWSStoragegatewayListTagsForResourceInput new] completionHandler:^(AWSStoragegatewayListTagsForResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListTapes {
    NSString *key = @"testListTapes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] listTapes:[AWSStoragegatewayListTapesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListTapesCompletionHandler {
    NSString *key = @"testListTapes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] listTapes:[AWSStoragegatewayListTapesInput new] completionHandler:^(AWSStoragegatewayListTapesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListVolumeInitiators {
    NSString *key = @"testListVolumeInitiators";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] listVolumeInitiators:[AWSStoragegatewayListVolumeInitiatorsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListVolumeInitiatorsCompletionHandler {
    NSString *key = @"testListVolumeInitiators";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] listVolumeInitiators:[AWSStoragegatewayListVolumeInitiatorsInput new] completionHandler:^(AWSStoragegatewayListVolumeInitiatorsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListVolumeRecoveryPoints {
    NSString *key = @"testListVolumeRecoveryPoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] listVolumeRecoveryPoints:[AWSStoragegatewayListVolumeRecoveryPointsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListVolumeRecoveryPointsCompletionHandler {
    NSString *key = @"testListVolumeRecoveryPoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] listVolumeRecoveryPoints:[AWSStoragegatewayListVolumeRecoveryPointsInput new] completionHandler:^(AWSStoragegatewayListVolumeRecoveryPointsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListVolumes {
    NSString *key = @"testListVolumes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] listVolumes:[AWSStoragegatewayListVolumesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testListVolumesCompletionHandler {
    NSString *key = @"testListVolumes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] listVolumes:[AWSStoragegatewayListVolumesInput new] completionHandler:^(AWSStoragegatewayListVolumesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testNotifyWhenUploaded {
    NSString *key = @"testNotifyWhenUploaded";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] notifyWhenUploaded:[AWSStoragegatewayNotifyWhenUploadedInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testNotifyWhenUploadedCompletionHandler {
    NSString *key = @"testNotifyWhenUploaded";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] notifyWhenUploaded:[AWSStoragegatewayNotifyWhenUploadedInput new] completionHandler:^(AWSStoragegatewayNotifyWhenUploadedOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testRefreshCache {
    NSString *key = @"testRefreshCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] refreshCache:[AWSStoragegatewayRefreshCacheInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testRefreshCacheCompletionHandler {
    NSString *key = @"testRefreshCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] refreshCache:[AWSStoragegatewayRefreshCacheInput new] completionHandler:^(AWSStoragegatewayRefreshCacheOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testRemoveTagsFromResource {
    NSString *key = @"testRemoveTagsFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] removeTagsFromResource:[AWSStoragegatewayRemoveTagsFromResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testRemoveTagsFromResourceCompletionHandler {
    NSString *key = @"testRemoveTagsFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] removeTagsFromResource:[AWSStoragegatewayRemoveTagsFromResourceInput new] completionHandler:^(AWSStoragegatewayRemoveTagsFromResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testResetCache {
    NSString *key = @"testResetCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] resetCache:[AWSStoragegatewayResetCacheInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testResetCacheCompletionHandler {
    NSString *key = @"testResetCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] resetCache:[AWSStoragegatewayResetCacheInput new] completionHandler:^(AWSStoragegatewayResetCacheOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testRetrieveTapeArchive {
    NSString *key = @"testRetrieveTapeArchive";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] retrieveTapeArchive:[AWSStoragegatewayRetrieveTapeArchiveInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testRetrieveTapeArchiveCompletionHandler {
    NSString *key = @"testRetrieveTapeArchive";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] retrieveTapeArchive:[AWSStoragegatewayRetrieveTapeArchiveInput new] completionHandler:^(AWSStoragegatewayRetrieveTapeArchiveOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testRetrieveTapeRecoveryPoint {
    NSString *key = @"testRetrieveTapeRecoveryPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] retrieveTapeRecoveryPoint:[AWSStoragegatewayRetrieveTapeRecoveryPointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testRetrieveTapeRecoveryPointCompletionHandler {
    NSString *key = @"testRetrieveTapeRecoveryPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] retrieveTapeRecoveryPoint:[AWSStoragegatewayRetrieveTapeRecoveryPointInput new] completionHandler:^(AWSStoragegatewayRetrieveTapeRecoveryPointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testSetLocalConsolePassword {
    NSString *key = @"testSetLocalConsolePassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] setLocalConsolePassword:[AWSStoragegatewaySetLocalConsolePasswordInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testSetLocalConsolePasswordCompletionHandler {
    NSString *key = @"testSetLocalConsolePassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] setLocalConsolePassword:[AWSStoragegatewaySetLocalConsolePasswordInput new] completionHandler:^(AWSStoragegatewaySetLocalConsolePasswordOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testSetSMBGuestPassword {
    NSString *key = @"testSetSMBGuestPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] setSMBGuestPassword:[AWSStoragegatewaySetSMBGuestPasswordInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testSetSMBGuestPasswordCompletionHandler {
    NSString *key = @"testSetSMBGuestPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] setSMBGuestPassword:[AWSStoragegatewaySetSMBGuestPasswordInput new] completionHandler:^(AWSStoragegatewaySetSMBGuestPasswordOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testShutdownGateway {
    NSString *key = @"testShutdownGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] shutdownGateway:[AWSStoragegatewayShutdownGatewayInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testShutdownGatewayCompletionHandler {
    NSString *key = @"testShutdownGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] shutdownGateway:[AWSStoragegatewayShutdownGatewayInput new] completionHandler:^(AWSStoragegatewayShutdownGatewayOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testStartAvailabilityMonitorTest {
    NSString *key = @"testStartAvailabilityMonitorTest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] startAvailabilityMonitorTest:[AWSStoragegatewayStartAvailabilityMonitorTestInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testStartAvailabilityMonitorTestCompletionHandler {
    NSString *key = @"testStartAvailabilityMonitorTest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] startAvailabilityMonitorTest:[AWSStoragegatewayStartAvailabilityMonitorTestInput new] completionHandler:^(AWSStoragegatewayStartAvailabilityMonitorTestOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testStartGateway {
    NSString *key = @"testStartGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] startGateway:[AWSStoragegatewayStartGatewayInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testStartGatewayCompletionHandler {
    NSString *key = @"testStartGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] startGateway:[AWSStoragegatewayStartGatewayInput new] completionHandler:^(AWSStoragegatewayStartGatewayOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateAutomaticTapeCreationPolicy {
    NSString *key = @"testUpdateAutomaticTapeCreationPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] updateAutomaticTapeCreationPolicy:[AWSStoragegatewayUpdateAutomaticTapeCreationPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateAutomaticTapeCreationPolicyCompletionHandler {
    NSString *key = @"testUpdateAutomaticTapeCreationPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] updateAutomaticTapeCreationPolicy:[AWSStoragegatewayUpdateAutomaticTapeCreationPolicyInput new] completionHandler:^(AWSStoragegatewayUpdateAutomaticTapeCreationPolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateBandwidthRateLimit {
    NSString *key = @"testUpdateBandwidthRateLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] updateBandwidthRateLimit:[AWSStoragegatewayUpdateBandwidthRateLimitInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateBandwidthRateLimitCompletionHandler {
    NSString *key = @"testUpdateBandwidthRateLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] updateBandwidthRateLimit:[AWSStoragegatewayUpdateBandwidthRateLimitInput new] completionHandler:^(AWSStoragegatewayUpdateBandwidthRateLimitOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateChapCredentials {
    NSString *key = @"testUpdateChapCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] updateChapCredentials:[AWSStoragegatewayUpdateChapCredentialsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateChapCredentialsCompletionHandler {
    NSString *key = @"testUpdateChapCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] updateChapCredentials:[AWSStoragegatewayUpdateChapCredentialsInput new] completionHandler:^(AWSStoragegatewayUpdateChapCredentialsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateGatewayInformation {
    NSString *key = @"testUpdateGatewayInformation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] updateGatewayInformation:[AWSStoragegatewayUpdateGatewayInformationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateGatewayInformationCompletionHandler {
    NSString *key = @"testUpdateGatewayInformation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] updateGatewayInformation:[AWSStoragegatewayUpdateGatewayInformationInput new] completionHandler:^(AWSStoragegatewayUpdateGatewayInformationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateGatewaySoftwareNow {
    NSString *key = @"testUpdateGatewaySoftwareNow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] updateGatewaySoftwareNow:[AWSStoragegatewayUpdateGatewaySoftwareNowInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateGatewaySoftwareNowCompletionHandler {
    NSString *key = @"testUpdateGatewaySoftwareNow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] updateGatewaySoftwareNow:[AWSStoragegatewayUpdateGatewaySoftwareNowInput new] completionHandler:^(AWSStoragegatewayUpdateGatewaySoftwareNowOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateMaintenanceStartTime {
    NSString *key = @"testUpdateMaintenanceStartTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] updateMaintenanceStartTime:[AWSStoragegatewayUpdateMaintenanceStartTimeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateMaintenanceStartTimeCompletionHandler {
    NSString *key = @"testUpdateMaintenanceStartTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] updateMaintenanceStartTime:[AWSStoragegatewayUpdateMaintenanceStartTimeInput new] completionHandler:^(AWSStoragegatewayUpdateMaintenanceStartTimeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateNFSFileShare {
    NSString *key = @"testUpdateNFSFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] updateNFSFileShare:[AWSStoragegatewayUpdateNFSFileShareInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateNFSFileShareCompletionHandler {
    NSString *key = @"testUpdateNFSFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] updateNFSFileShare:[AWSStoragegatewayUpdateNFSFileShareInput new] completionHandler:^(AWSStoragegatewayUpdateNFSFileShareOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateSMBFileShare {
    NSString *key = @"testUpdateSMBFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] updateSMBFileShare:[AWSStoragegatewayUpdateSMBFileShareInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateSMBFileShareCompletionHandler {
    NSString *key = @"testUpdateSMBFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] updateSMBFileShare:[AWSStoragegatewayUpdateSMBFileShareInput new] completionHandler:^(AWSStoragegatewayUpdateSMBFileShareOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateSMBSecurityStrategy {
    NSString *key = @"testUpdateSMBSecurityStrategy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] updateSMBSecurityStrategy:[AWSStoragegatewayUpdateSMBSecurityStrategyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateSMBSecurityStrategyCompletionHandler {
    NSString *key = @"testUpdateSMBSecurityStrategy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] updateSMBSecurityStrategy:[AWSStoragegatewayUpdateSMBSecurityStrategyInput new] completionHandler:^(AWSStoragegatewayUpdateSMBSecurityStrategyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateSnapshotSchedule {
    NSString *key = @"testUpdateSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] updateSnapshotSchedule:[AWSStoragegatewayUpdateSnapshotScheduleInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateSnapshotScheduleCompletionHandler {
    NSString *key = @"testUpdateSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] updateSnapshotSchedule:[AWSStoragegatewayUpdateSnapshotScheduleInput new] completionHandler:^(AWSStoragegatewayUpdateSnapshotScheduleOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateVTLDeviceType {
    NSString *key = @"testUpdateVTLDeviceType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSStoragegateway StoragegatewayForKey:key] updateVTLDeviceType:[AWSStoragegatewayUpdateVTLDeviceTypeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

- (void)testUpdateVTLDeviceTypeCompletionHandler {
    NSString *key = @"testUpdateVTLDeviceType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSStoragegateway registerStoragegatewayWithConfiguration:configuration forKey:key];

    AWSStoragegateway *awsClient = [AWSStoragegateway StoragegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSStoragegateway StoragegatewayForKey:key] updateVTLDeviceType:[AWSStoragegatewayUpdateVTLDeviceTypeInput new] completionHandler:^(AWSStoragegatewayUpdateVTLDeviceTypeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSStoragegateway removeStoragegatewayForKey:key];
}

@end
