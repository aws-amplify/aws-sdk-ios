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
#import "AWSstoragegatewayService.h"

static id mockNetworking = nil;

@interface AWSGeneralstoragegatewayTests : XCTestCase

@end

@implementation AWSGeneralstoragegatewayTests

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
    NSString *key = @"teststoragegatewayConstructors";
    XCTAssertNotNil([AWSstoragegateway defaultstoragegateway]);
    XCTAssertEqual([[AWSstoragegateway defaultstoragegateway] class], [AWSstoragegateway class]);
    XCTAssertNil([AWSstoragegateway storagegatewayForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSstoragegateway storagegatewayForKey:key]);
    XCTAssertEqual([[AWSstoragegateway storagegatewayForKey:key] class], [AWSstoragegateway class]);
    XCTAssertEqual([AWSstoragegateway storagegatewayForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSstoragegateway removestoragegatewayForKey:key];
    XCTAssertNil([AWSstoragegateway storagegatewayForKey:key]);

}

- (void)testActivateGateway {
    NSString *key = @"testActivateGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] activateGateway:[AWSstoragegatewayActivateGatewayInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testActivateGatewayCompletionHandler {
    NSString *key = @"testActivateGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] activateGateway:[AWSstoragegatewayActivateGatewayInput new] completionHandler:^(AWSstoragegatewayActivateGatewayOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testAddCache {
    NSString *key = @"testAddCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] addCache:[AWSstoragegatewayAddCacheInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testAddCacheCompletionHandler {
    NSString *key = @"testAddCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] addCache:[AWSstoragegatewayAddCacheInput new] completionHandler:^(AWSstoragegatewayAddCacheOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testAddTagsToResource {
    NSString *key = @"testAddTagsToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] addTagsToResource:[AWSstoragegatewayAddTagsToResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testAddTagsToResourceCompletionHandler {
    NSString *key = @"testAddTagsToResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] addTagsToResource:[AWSstoragegatewayAddTagsToResourceInput new] completionHandler:^(AWSstoragegatewayAddTagsToResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testAddUploadBuffer {
    NSString *key = @"testAddUploadBuffer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] addUploadBuffer:[AWSstoragegatewayAddUploadBufferInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testAddUploadBufferCompletionHandler {
    NSString *key = @"testAddUploadBuffer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] addUploadBuffer:[AWSstoragegatewayAddUploadBufferInput new] completionHandler:^(AWSstoragegatewayAddUploadBufferOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testAddWorkingStorage {
    NSString *key = @"testAddWorkingStorage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] addWorkingStorage:[AWSstoragegatewayAddWorkingStorageInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testAddWorkingStorageCompletionHandler {
    NSString *key = @"testAddWorkingStorage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] addWorkingStorage:[AWSstoragegatewayAddWorkingStorageInput new] completionHandler:^(AWSstoragegatewayAddWorkingStorageOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testAssignTapePool {
    NSString *key = @"testAssignTapePool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] assignTapePool:[AWSstoragegatewayAssignTapePoolInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testAssignTapePoolCompletionHandler {
    NSString *key = @"testAssignTapePool";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] assignTapePool:[AWSstoragegatewayAssignTapePoolInput new] completionHandler:^(AWSstoragegatewayAssignTapePoolOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testAttachVolume {
    NSString *key = @"testAttachVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] attachVolume:[AWSstoragegatewayAttachVolumeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testAttachVolumeCompletionHandler {
    NSString *key = @"testAttachVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] attachVolume:[AWSstoragegatewayAttachVolumeInput new] completionHandler:^(AWSstoragegatewayAttachVolumeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCancelArchival {
    NSString *key = @"testCancelArchival";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] cancelArchival:[AWSstoragegatewayCancelArchivalInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCancelArchivalCompletionHandler {
    NSString *key = @"testCancelArchival";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] cancelArchival:[AWSstoragegatewayCancelArchivalInput new] completionHandler:^(AWSstoragegatewayCancelArchivalOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCancelRetrieval {
    NSString *key = @"testCancelRetrieval";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] cancelRetrieval:[AWSstoragegatewayCancelRetrievalInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCancelRetrievalCompletionHandler {
    NSString *key = @"testCancelRetrieval";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] cancelRetrieval:[AWSstoragegatewayCancelRetrievalInput new] completionHandler:^(AWSstoragegatewayCancelRetrievalOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateCachediSCSIVolume {
    NSString *key = @"testCreateCachediSCSIVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] createCachediSCSIVolume:[AWSstoragegatewayCreateCachediSCSIVolumeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateCachediSCSIVolumeCompletionHandler {
    NSString *key = @"testCreateCachediSCSIVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] createCachediSCSIVolume:[AWSstoragegatewayCreateCachediSCSIVolumeInput new] completionHandler:^(AWSstoragegatewayCreateCachediSCSIVolumeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateNFSFileShare {
    NSString *key = @"testCreateNFSFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] createNFSFileShare:[AWSstoragegatewayCreateNFSFileShareInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateNFSFileShareCompletionHandler {
    NSString *key = @"testCreateNFSFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] createNFSFileShare:[AWSstoragegatewayCreateNFSFileShareInput new] completionHandler:^(AWSstoragegatewayCreateNFSFileShareOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateSMBFileShare {
    NSString *key = @"testCreateSMBFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] createSMBFileShare:[AWSstoragegatewayCreateSMBFileShareInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateSMBFileShareCompletionHandler {
    NSString *key = @"testCreateSMBFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] createSMBFileShare:[AWSstoragegatewayCreateSMBFileShareInput new] completionHandler:^(AWSstoragegatewayCreateSMBFileShareOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateSnapshot {
    NSString *key = @"testCreateSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] createSnapshot:[AWSstoragegatewayCreateSnapshotInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateSnapshotCompletionHandler {
    NSString *key = @"testCreateSnapshot";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] createSnapshot:[AWSstoragegatewayCreateSnapshotInput new] completionHandler:^(AWSstoragegatewayCreateSnapshotOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateSnapshotFromVolumeRecoveryPoint {
    NSString *key = @"testCreateSnapshotFromVolumeRecoveryPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] createSnapshotFromVolumeRecoveryPoint:[AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateSnapshotFromVolumeRecoveryPointCompletionHandler {
    NSString *key = @"testCreateSnapshotFromVolumeRecoveryPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] createSnapshotFromVolumeRecoveryPoint:[AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointInput new] completionHandler:^(AWSstoragegatewayCreateSnapshotFromVolumeRecoveryPointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateStorediSCSIVolume {
    NSString *key = @"testCreateStorediSCSIVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] createStorediSCSIVolume:[AWSstoragegatewayCreateStorediSCSIVolumeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateStorediSCSIVolumeCompletionHandler {
    NSString *key = @"testCreateStorediSCSIVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] createStorediSCSIVolume:[AWSstoragegatewayCreateStorediSCSIVolumeInput new] completionHandler:^(AWSstoragegatewayCreateStorediSCSIVolumeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateTapeWithBarcode {
    NSString *key = @"testCreateTapeWithBarcode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] createTapeWithBarcode:[AWSstoragegatewayCreateTapeWithBarcodeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateTapeWithBarcodeCompletionHandler {
    NSString *key = @"testCreateTapeWithBarcode";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] createTapeWithBarcode:[AWSstoragegatewayCreateTapeWithBarcodeInput new] completionHandler:^(AWSstoragegatewayCreateTapeWithBarcodeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateTapes {
    NSString *key = @"testCreateTapes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] createTapes:[AWSstoragegatewayCreateTapesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testCreateTapesCompletionHandler {
    NSString *key = @"testCreateTapes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] createTapes:[AWSstoragegatewayCreateTapesInput new] completionHandler:^(AWSstoragegatewayCreateTapesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteAutomaticTapeCreationPolicy {
    NSString *key = @"testDeleteAutomaticTapeCreationPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] deleteAutomaticTapeCreationPolicy:[AWSstoragegatewayDeleteAutomaticTapeCreationPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteAutomaticTapeCreationPolicyCompletionHandler {
    NSString *key = @"testDeleteAutomaticTapeCreationPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] deleteAutomaticTapeCreationPolicy:[AWSstoragegatewayDeleteAutomaticTapeCreationPolicyInput new] completionHandler:^(AWSstoragegatewayDeleteAutomaticTapeCreationPolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteBandwidthRateLimit {
    NSString *key = @"testDeleteBandwidthRateLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] deleteBandwidthRateLimit:[AWSstoragegatewayDeleteBandwidthRateLimitInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteBandwidthRateLimitCompletionHandler {
    NSString *key = @"testDeleteBandwidthRateLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] deleteBandwidthRateLimit:[AWSstoragegatewayDeleteBandwidthRateLimitInput new] completionHandler:^(AWSstoragegatewayDeleteBandwidthRateLimitOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteChapCredentials {
    NSString *key = @"testDeleteChapCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] deleteChapCredentials:[AWSstoragegatewayDeleteChapCredentialsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteChapCredentialsCompletionHandler {
    NSString *key = @"testDeleteChapCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] deleteChapCredentials:[AWSstoragegatewayDeleteChapCredentialsInput new] completionHandler:^(AWSstoragegatewayDeleteChapCredentialsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteFileShare {
    NSString *key = @"testDeleteFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] deleteFileShare:[AWSstoragegatewayDeleteFileShareInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteFileShareCompletionHandler {
    NSString *key = @"testDeleteFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] deleteFileShare:[AWSstoragegatewayDeleteFileShareInput new] completionHandler:^(AWSstoragegatewayDeleteFileShareOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteGateway {
    NSString *key = @"testDeleteGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] deleteGateway:[AWSstoragegatewayDeleteGatewayInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteGatewayCompletionHandler {
    NSString *key = @"testDeleteGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] deleteGateway:[AWSstoragegatewayDeleteGatewayInput new] completionHandler:^(AWSstoragegatewayDeleteGatewayOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteSnapshotSchedule {
    NSString *key = @"testDeleteSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] deleteSnapshotSchedule:[AWSstoragegatewayDeleteSnapshotScheduleInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteSnapshotScheduleCompletionHandler {
    NSString *key = @"testDeleteSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] deleteSnapshotSchedule:[AWSstoragegatewayDeleteSnapshotScheduleInput new] completionHandler:^(AWSstoragegatewayDeleteSnapshotScheduleOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteTape {
    NSString *key = @"testDeleteTape";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] deleteTape:[AWSstoragegatewayDeleteTapeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteTapeCompletionHandler {
    NSString *key = @"testDeleteTape";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] deleteTape:[AWSstoragegatewayDeleteTapeInput new] completionHandler:^(AWSstoragegatewayDeleteTapeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteTapeArchive {
    NSString *key = @"testDeleteTapeArchive";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] deleteTapeArchive:[AWSstoragegatewayDeleteTapeArchiveInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteTapeArchiveCompletionHandler {
    NSString *key = @"testDeleteTapeArchive";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] deleteTapeArchive:[AWSstoragegatewayDeleteTapeArchiveInput new] completionHandler:^(AWSstoragegatewayDeleteTapeArchiveOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteVolume {
    NSString *key = @"testDeleteVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] deleteVolume:[AWSstoragegatewayDeleteVolumeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDeleteVolumeCompletionHandler {
    NSString *key = @"testDeleteVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] deleteVolume:[AWSstoragegatewayDeleteVolumeInput new] completionHandler:^(AWSstoragegatewayDeleteVolumeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeAvailabilityMonitorTest {
    NSString *key = @"testDescribeAvailabilityMonitorTest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeAvailabilityMonitorTest:[AWSstoragegatewayDescribeAvailabilityMonitorTestInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeAvailabilityMonitorTestCompletionHandler {
    NSString *key = @"testDescribeAvailabilityMonitorTest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeAvailabilityMonitorTest:[AWSstoragegatewayDescribeAvailabilityMonitorTestInput new] completionHandler:^(AWSstoragegatewayDescribeAvailabilityMonitorTestOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeBandwidthRateLimit {
    NSString *key = @"testDescribeBandwidthRateLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeBandwidthRateLimit:[AWSstoragegatewayDescribeBandwidthRateLimitInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeBandwidthRateLimitCompletionHandler {
    NSString *key = @"testDescribeBandwidthRateLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeBandwidthRateLimit:[AWSstoragegatewayDescribeBandwidthRateLimitInput new] completionHandler:^(AWSstoragegatewayDescribeBandwidthRateLimitOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeCache {
    NSString *key = @"testDescribeCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeCache:[AWSstoragegatewayDescribeCacheInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeCacheCompletionHandler {
    NSString *key = @"testDescribeCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeCache:[AWSstoragegatewayDescribeCacheInput new] completionHandler:^(AWSstoragegatewayDescribeCacheOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeCachediSCSIVolumes {
    NSString *key = @"testDescribeCachediSCSIVolumes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeCachediSCSIVolumes:[AWSstoragegatewayDescribeCachediSCSIVolumesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeCachediSCSIVolumesCompletionHandler {
    NSString *key = @"testDescribeCachediSCSIVolumes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeCachediSCSIVolumes:[AWSstoragegatewayDescribeCachediSCSIVolumesInput new] completionHandler:^(AWSstoragegatewayDescribeCachediSCSIVolumesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeChapCredentials {
    NSString *key = @"testDescribeChapCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeChapCredentials:[AWSstoragegatewayDescribeChapCredentialsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeChapCredentialsCompletionHandler {
    NSString *key = @"testDescribeChapCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeChapCredentials:[AWSstoragegatewayDescribeChapCredentialsInput new] completionHandler:^(AWSstoragegatewayDescribeChapCredentialsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeGatewayInformation {
    NSString *key = @"testDescribeGatewayInformation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeGatewayInformation:[AWSstoragegatewayDescribeGatewayInformationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeGatewayInformationCompletionHandler {
    NSString *key = @"testDescribeGatewayInformation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeGatewayInformation:[AWSstoragegatewayDescribeGatewayInformationInput new] completionHandler:^(AWSstoragegatewayDescribeGatewayInformationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeMaintenanceStartTime {
    NSString *key = @"testDescribeMaintenanceStartTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeMaintenanceStartTime:[AWSstoragegatewayDescribeMaintenanceStartTimeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeMaintenanceStartTimeCompletionHandler {
    NSString *key = @"testDescribeMaintenanceStartTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeMaintenanceStartTime:[AWSstoragegatewayDescribeMaintenanceStartTimeInput new] completionHandler:^(AWSstoragegatewayDescribeMaintenanceStartTimeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeNFSFileShares {
    NSString *key = @"testDescribeNFSFileShares";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeNFSFileShares:[AWSstoragegatewayDescribeNFSFileSharesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeNFSFileSharesCompletionHandler {
    NSString *key = @"testDescribeNFSFileShares";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeNFSFileShares:[AWSstoragegatewayDescribeNFSFileSharesInput new] completionHandler:^(AWSstoragegatewayDescribeNFSFileSharesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeSMBFileShares {
    NSString *key = @"testDescribeSMBFileShares";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeSMBFileShares:[AWSstoragegatewayDescribeSMBFileSharesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeSMBFileSharesCompletionHandler {
    NSString *key = @"testDescribeSMBFileShares";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeSMBFileShares:[AWSstoragegatewayDescribeSMBFileSharesInput new] completionHandler:^(AWSstoragegatewayDescribeSMBFileSharesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeSMBSettings {
    NSString *key = @"testDescribeSMBSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeSMBSettings:[AWSstoragegatewayDescribeSMBSettingsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeSMBSettingsCompletionHandler {
    NSString *key = @"testDescribeSMBSettings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeSMBSettings:[AWSstoragegatewayDescribeSMBSettingsInput new] completionHandler:^(AWSstoragegatewayDescribeSMBSettingsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeSnapshotSchedule {
    NSString *key = @"testDescribeSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeSnapshotSchedule:[AWSstoragegatewayDescribeSnapshotScheduleInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeSnapshotScheduleCompletionHandler {
    NSString *key = @"testDescribeSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeSnapshotSchedule:[AWSstoragegatewayDescribeSnapshotScheduleInput new] completionHandler:^(AWSstoragegatewayDescribeSnapshotScheduleOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeStorediSCSIVolumes {
    NSString *key = @"testDescribeStorediSCSIVolumes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeStorediSCSIVolumes:[AWSstoragegatewayDescribeStorediSCSIVolumesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeStorediSCSIVolumesCompletionHandler {
    NSString *key = @"testDescribeStorediSCSIVolumes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeStorediSCSIVolumes:[AWSstoragegatewayDescribeStorediSCSIVolumesInput new] completionHandler:^(AWSstoragegatewayDescribeStorediSCSIVolumesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeTapeArchives {
    NSString *key = @"testDescribeTapeArchives";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeTapeArchives:[AWSstoragegatewayDescribeTapeArchivesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeTapeArchivesCompletionHandler {
    NSString *key = @"testDescribeTapeArchives";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeTapeArchives:[AWSstoragegatewayDescribeTapeArchivesInput new] completionHandler:^(AWSstoragegatewayDescribeTapeArchivesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeTapeRecoveryPoints {
    NSString *key = @"testDescribeTapeRecoveryPoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeTapeRecoveryPoints:[AWSstoragegatewayDescribeTapeRecoveryPointsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeTapeRecoveryPointsCompletionHandler {
    NSString *key = @"testDescribeTapeRecoveryPoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeTapeRecoveryPoints:[AWSstoragegatewayDescribeTapeRecoveryPointsInput new] completionHandler:^(AWSstoragegatewayDescribeTapeRecoveryPointsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeTapes {
    NSString *key = @"testDescribeTapes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeTapes:[AWSstoragegatewayDescribeTapesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeTapesCompletionHandler {
    NSString *key = @"testDescribeTapes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeTapes:[AWSstoragegatewayDescribeTapesInput new] completionHandler:^(AWSstoragegatewayDescribeTapesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeUploadBuffer {
    NSString *key = @"testDescribeUploadBuffer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeUploadBuffer:[AWSstoragegatewayDescribeUploadBufferInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeUploadBufferCompletionHandler {
    NSString *key = @"testDescribeUploadBuffer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeUploadBuffer:[AWSstoragegatewayDescribeUploadBufferInput new] completionHandler:^(AWSstoragegatewayDescribeUploadBufferOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeVTLDevices {
    NSString *key = @"testDescribeVTLDevices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeVTLDevices:[AWSstoragegatewayDescribeVTLDevicesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeVTLDevicesCompletionHandler {
    NSString *key = @"testDescribeVTLDevices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeVTLDevices:[AWSstoragegatewayDescribeVTLDevicesInput new] completionHandler:^(AWSstoragegatewayDescribeVTLDevicesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeWorkingStorage {
    NSString *key = @"testDescribeWorkingStorage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] describeWorkingStorage:[AWSstoragegatewayDescribeWorkingStorageInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDescribeWorkingStorageCompletionHandler {
    NSString *key = @"testDescribeWorkingStorage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] describeWorkingStorage:[AWSstoragegatewayDescribeWorkingStorageInput new] completionHandler:^(AWSstoragegatewayDescribeWorkingStorageOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDetachVolume {
    NSString *key = @"testDetachVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] detachVolume:[AWSstoragegatewayDetachVolumeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDetachVolumeCompletionHandler {
    NSString *key = @"testDetachVolume";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] detachVolume:[AWSstoragegatewayDetachVolumeInput new] completionHandler:^(AWSstoragegatewayDetachVolumeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDisableGateway {
    NSString *key = @"testDisableGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] disableGateway:[AWSstoragegatewayDisableGatewayInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testDisableGatewayCompletionHandler {
    NSString *key = @"testDisableGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] disableGateway:[AWSstoragegatewayDisableGatewayInput new] completionHandler:^(AWSstoragegatewayDisableGatewayOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testJoinDomain {
    NSString *key = @"testJoinDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] joinDomain:[AWSstoragegatewayJoinDomainInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testJoinDomainCompletionHandler {
    NSString *key = @"testJoinDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] joinDomain:[AWSstoragegatewayJoinDomainInput new] completionHandler:^(AWSstoragegatewayJoinDomainOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListAutomaticTapeCreationPolicies {
    NSString *key = @"testListAutomaticTapeCreationPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] listAutomaticTapeCreationPolicies:[AWSstoragegatewayListAutomaticTapeCreationPoliciesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListAutomaticTapeCreationPoliciesCompletionHandler {
    NSString *key = @"testListAutomaticTapeCreationPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] listAutomaticTapeCreationPolicies:[AWSstoragegatewayListAutomaticTapeCreationPoliciesInput new] completionHandler:^(AWSstoragegatewayListAutomaticTapeCreationPoliciesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListFileShares {
    NSString *key = @"testListFileShares";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] listFileShares:[AWSstoragegatewayListFileSharesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListFileSharesCompletionHandler {
    NSString *key = @"testListFileShares";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] listFileShares:[AWSstoragegatewayListFileSharesInput new] completionHandler:^(AWSstoragegatewayListFileSharesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListGateways {
    NSString *key = @"testListGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] listGateways:[AWSstoragegatewayListGatewaysInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListGatewaysCompletionHandler {
    NSString *key = @"testListGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] listGateways:[AWSstoragegatewayListGatewaysInput new] completionHandler:^(AWSstoragegatewayListGatewaysOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListLocalDisks {
    NSString *key = @"testListLocalDisks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] listLocalDisks:[AWSstoragegatewayListLocalDisksInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListLocalDisksCompletionHandler {
    NSString *key = @"testListLocalDisks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] listLocalDisks:[AWSstoragegatewayListLocalDisksInput new] completionHandler:^(AWSstoragegatewayListLocalDisksOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] listTagsForResource:[AWSstoragegatewayListTagsForResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] listTagsForResource:[AWSstoragegatewayListTagsForResourceInput new] completionHandler:^(AWSstoragegatewayListTagsForResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListTapes {
    NSString *key = @"testListTapes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] listTapes:[AWSstoragegatewayListTapesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListTapesCompletionHandler {
    NSString *key = @"testListTapes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] listTapes:[AWSstoragegatewayListTapesInput new] completionHandler:^(AWSstoragegatewayListTapesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListVolumeInitiators {
    NSString *key = @"testListVolumeInitiators";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] listVolumeInitiators:[AWSstoragegatewayListVolumeInitiatorsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListVolumeInitiatorsCompletionHandler {
    NSString *key = @"testListVolumeInitiators";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] listVolumeInitiators:[AWSstoragegatewayListVolumeInitiatorsInput new] completionHandler:^(AWSstoragegatewayListVolumeInitiatorsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListVolumeRecoveryPoints {
    NSString *key = @"testListVolumeRecoveryPoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] listVolumeRecoveryPoints:[AWSstoragegatewayListVolumeRecoveryPointsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListVolumeRecoveryPointsCompletionHandler {
    NSString *key = @"testListVolumeRecoveryPoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] listVolumeRecoveryPoints:[AWSstoragegatewayListVolumeRecoveryPointsInput new] completionHandler:^(AWSstoragegatewayListVolumeRecoveryPointsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListVolumes {
    NSString *key = @"testListVolumes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] listVolumes:[AWSstoragegatewayListVolumesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testListVolumesCompletionHandler {
    NSString *key = @"testListVolumes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] listVolumes:[AWSstoragegatewayListVolumesInput new] completionHandler:^(AWSstoragegatewayListVolumesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testNotifyWhenUploaded {
    NSString *key = @"testNotifyWhenUploaded";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] notifyWhenUploaded:[AWSstoragegatewayNotifyWhenUploadedInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testNotifyWhenUploadedCompletionHandler {
    NSString *key = @"testNotifyWhenUploaded";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] notifyWhenUploaded:[AWSstoragegatewayNotifyWhenUploadedInput new] completionHandler:^(AWSstoragegatewayNotifyWhenUploadedOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testRefreshCache {
    NSString *key = @"testRefreshCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] refreshCache:[AWSstoragegatewayRefreshCacheInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testRefreshCacheCompletionHandler {
    NSString *key = @"testRefreshCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] refreshCache:[AWSstoragegatewayRefreshCacheInput new] completionHandler:^(AWSstoragegatewayRefreshCacheOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testRemoveTagsFromResource {
    NSString *key = @"testRemoveTagsFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] removeTagsFromResource:[AWSstoragegatewayRemoveTagsFromResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testRemoveTagsFromResourceCompletionHandler {
    NSString *key = @"testRemoveTagsFromResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] removeTagsFromResource:[AWSstoragegatewayRemoveTagsFromResourceInput new] completionHandler:^(AWSstoragegatewayRemoveTagsFromResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testResetCache {
    NSString *key = @"testResetCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] resetCache:[AWSstoragegatewayResetCacheInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testResetCacheCompletionHandler {
    NSString *key = @"testResetCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] resetCache:[AWSstoragegatewayResetCacheInput new] completionHandler:^(AWSstoragegatewayResetCacheOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testRetrieveTapeArchive {
    NSString *key = @"testRetrieveTapeArchive";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] retrieveTapeArchive:[AWSstoragegatewayRetrieveTapeArchiveInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testRetrieveTapeArchiveCompletionHandler {
    NSString *key = @"testRetrieveTapeArchive";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] retrieveTapeArchive:[AWSstoragegatewayRetrieveTapeArchiveInput new] completionHandler:^(AWSstoragegatewayRetrieveTapeArchiveOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testRetrieveTapeRecoveryPoint {
    NSString *key = @"testRetrieveTapeRecoveryPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] retrieveTapeRecoveryPoint:[AWSstoragegatewayRetrieveTapeRecoveryPointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testRetrieveTapeRecoveryPointCompletionHandler {
    NSString *key = @"testRetrieveTapeRecoveryPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] retrieveTapeRecoveryPoint:[AWSstoragegatewayRetrieveTapeRecoveryPointInput new] completionHandler:^(AWSstoragegatewayRetrieveTapeRecoveryPointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testSetLocalConsolePassword {
    NSString *key = @"testSetLocalConsolePassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] setLocalConsolePassword:[AWSstoragegatewaySetLocalConsolePasswordInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testSetLocalConsolePasswordCompletionHandler {
    NSString *key = @"testSetLocalConsolePassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] setLocalConsolePassword:[AWSstoragegatewaySetLocalConsolePasswordInput new] completionHandler:^(AWSstoragegatewaySetLocalConsolePasswordOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testSetSMBGuestPassword {
    NSString *key = @"testSetSMBGuestPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] setSMBGuestPassword:[AWSstoragegatewaySetSMBGuestPasswordInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testSetSMBGuestPasswordCompletionHandler {
    NSString *key = @"testSetSMBGuestPassword";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] setSMBGuestPassword:[AWSstoragegatewaySetSMBGuestPasswordInput new] completionHandler:^(AWSstoragegatewaySetSMBGuestPasswordOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testShutdownGateway {
    NSString *key = @"testShutdownGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] shutdownGateway:[AWSstoragegatewayShutdownGatewayInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testShutdownGatewayCompletionHandler {
    NSString *key = @"testShutdownGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] shutdownGateway:[AWSstoragegatewayShutdownGatewayInput new] completionHandler:^(AWSstoragegatewayShutdownGatewayOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testStartAvailabilityMonitorTest {
    NSString *key = @"testStartAvailabilityMonitorTest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] startAvailabilityMonitorTest:[AWSstoragegatewayStartAvailabilityMonitorTestInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testStartAvailabilityMonitorTestCompletionHandler {
    NSString *key = @"testStartAvailabilityMonitorTest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] startAvailabilityMonitorTest:[AWSstoragegatewayStartAvailabilityMonitorTestInput new] completionHandler:^(AWSstoragegatewayStartAvailabilityMonitorTestOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testStartGateway {
    NSString *key = @"testStartGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] startGateway:[AWSstoragegatewayStartGatewayInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testStartGatewayCompletionHandler {
    NSString *key = @"testStartGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] startGateway:[AWSstoragegatewayStartGatewayInput new] completionHandler:^(AWSstoragegatewayStartGatewayOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateAutomaticTapeCreationPolicy {
    NSString *key = @"testUpdateAutomaticTapeCreationPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] updateAutomaticTapeCreationPolicy:[AWSstoragegatewayUpdateAutomaticTapeCreationPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateAutomaticTapeCreationPolicyCompletionHandler {
    NSString *key = @"testUpdateAutomaticTapeCreationPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] updateAutomaticTapeCreationPolicy:[AWSstoragegatewayUpdateAutomaticTapeCreationPolicyInput new] completionHandler:^(AWSstoragegatewayUpdateAutomaticTapeCreationPolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateBandwidthRateLimit {
    NSString *key = @"testUpdateBandwidthRateLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] updateBandwidthRateLimit:[AWSstoragegatewayUpdateBandwidthRateLimitInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateBandwidthRateLimitCompletionHandler {
    NSString *key = @"testUpdateBandwidthRateLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] updateBandwidthRateLimit:[AWSstoragegatewayUpdateBandwidthRateLimitInput new] completionHandler:^(AWSstoragegatewayUpdateBandwidthRateLimitOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateChapCredentials {
    NSString *key = @"testUpdateChapCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] updateChapCredentials:[AWSstoragegatewayUpdateChapCredentialsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateChapCredentialsCompletionHandler {
    NSString *key = @"testUpdateChapCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] updateChapCredentials:[AWSstoragegatewayUpdateChapCredentialsInput new] completionHandler:^(AWSstoragegatewayUpdateChapCredentialsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateGatewayInformation {
    NSString *key = @"testUpdateGatewayInformation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] updateGatewayInformation:[AWSstoragegatewayUpdateGatewayInformationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateGatewayInformationCompletionHandler {
    NSString *key = @"testUpdateGatewayInformation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] updateGatewayInformation:[AWSstoragegatewayUpdateGatewayInformationInput new] completionHandler:^(AWSstoragegatewayUpdateGatewayInformationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateGatewaySoftwareNow {
    NSString *key = @"testUpdateGatewaySoftwareNow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] updateGatewaySoftwareNow:[AWSstoragegatewayUpdateGatewaySoftwareNowInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateGatewaySoftwareNowCompletionHandler {
    NSString *key = @"testUpdateGatewaySoftwareNow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] updateGatewaySoftwareNow:[AWSstoragegatewayUpdateGatewaySoftwareNowInput new] completionHandler:^(AWSstoragegatewayUpdateGatewaySoftwareNowOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateMaintenanceStartTime {
    NSString *key = @"testUpdateMaintenanceStartTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] updateMaintenanceStartTime:[AWSstoragegatewayUpdateMaintenanceStartTimeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateMaintenanceStartTimeCompletionHandler {
    NSString *key = @"testUpdateMaintenanceStartTime";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] updateMaintenanceStartTime:[AWSstoragegatewayUpdateMaintenanceStartTimeInput new] completionHandler:^(AWSstoragegatewayUpdateMaintenanceStartTimeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateNFSFileShare {
    NSString *key = @"testUpdateNFSFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] updateNFSFileShare:[AWSstoragegatewayUpdateNFSFileShareInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateNFSFileShareCompletionHandler {
    NSString *key = @"testUpdateNFSFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] updateNFSFileShare:[AWSstoragegatewayUpdateNFSFileShareInput new] completionHandler:^(AWSstoragegatewayUpdateNFSFileShareOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateSMBFileShare {
    NSString *key = @"testUpdateSMBFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] updateSMBFileShare:[AWSstoragegatewayUpdateSMBFileShareInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateSMBFileShareCompletionHandler {
    NSString *key = @"testUpdateSMBFileShare";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] updateSMBFileShare:[AWSstoragegatewayUpdateSMBFileShareInput new] completionHandler:^(AWSstoragegatewayUpdateSMBFileShareOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateSMBSecurityStrategy {
    NSString *key = @"testUpdateSMBSecurityStrategy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] updateSMBSecurityStrategy:[AWSstoragegatewayUpdateSMBSecurityStrategyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateSMBSecurityStrategyCompletionHandler {
    NSString *key = @"testUpdateSMBSecurityStrategy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] updateSMBSecurityStrategy:[AWSstoragegatewayUpdateSMBSecurityStrategyInput new] completionHandler:^(AWSstoragegatewayUpdateSMBSecurityStrategyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateSnapshotSchedule {
    NSString *key = @"testUpdateSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] updateSnapshotSchedule:[AWSstoragegatewayUpdateSnapshotScheduleInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateSnapshotScheduleCompletionHandler {
    NSString *key = @"testUpdateSnapshotSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] updateSnapshotSchedule:[AWSstoragegatewayUpdateSnapshotScheduleInput new] completionHandler:^(AWSstoragegatewayUpdateSnapshotScheduleOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateVTLDeviceType {
    NSString *key = @"testUpdateVTLDeviceType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSstoragegateway storagegatewayForKey:key] updateVTLDeviceType:[AWSstoragegatewayUpdateVTLDeviceTypeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

- (void)testUpdateVTLDeviceTypeCompletionHandler {
    NSString *key = @"testUpdateVTLDeviceType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSstoragegateway registerstoragegatewayWithConfiguration:configuration forKey:key];

    AWSstoragegateway *awsClient = [AWSstoragegateway storagegatewayForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSstoragegateway storagegatewayForKey:key] updateVTLDeviceType:[AWSstoragegatewayUpdateVTLDeviceTypeInput new] completionHandler:^(AWSstoragegatewayUpdateVTLDeviceTypeOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSstoragegateway removestoragegatewayForKey:key];
}

@end
