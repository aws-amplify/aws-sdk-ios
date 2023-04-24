//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSKinesisVideoWebRTCStorageService.h"

static id mockNetworking = nil;

@interface AWSGeneralKinesisVideoWebRTCStorageTests : XCTestCase

@end

@implementation AWSGeneralKinesisVideoWebRTCStorageTests

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
    NSString *key = @"testKinesisVideoWebRTCStorageConstructors";
    XCTAssertNotNil([AWSKinesisVideoWebRTCStorage defaultKinesisVideoWebRTCStorage]);
    XCTAssertEqual([[AWSKinesisVideoWebRTCStorage defaultKinesisVideoWebRTCStorage] class], [AWSKinesisVideoWebRTCStorage class]);
    XCTAssertNil([AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSKinesisVideoWebRTCStorage registerKinesisVideoWebRTCStorageWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:key]);
    XCTAssertEqual([[AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:key] class], [AWSKinesisVideoWebRTCStorage class]);
    XCTAssertEqual([AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSKinesisVideoWebRTCStorage removeKinesisVideoWebRTCStorageForKey:key];
    XCTAssertNil([AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:key]);

}

- (void)testJoinStorageSession {
    NSString *key = @"testJoinStorageSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideoWebRTCStorage registerKinesisVideoWebRTCStorageWithConfiguration:configuration forKey:key];

    AWSKinesisVideoWebRTCStorage *awsClient = [AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:key] joinStorageSession:[AWSKinesisVideoWebRTCStorageJoinStorageSessionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideoWebRTCStorage removeKinesisVideoWebRTCStorageForKey:key];
}

- (void)testJoinStorageSessionCompletionHandler {
    NSString *key = @"testJoinStorageSession";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideoWebRTCStorage registerKinesisVideoWebRTCStorageWithConfiguration:configuration forKey:key];

    AWSKinesisVideoWebRTCStorage *awsClient = [AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:key] joinStorageSession:[AWSKinesisVideoWebRTCStorageJoinStorageSessionInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideoWebRTCStorage removeKinesisVideoWebRTCStorageForKey:key];
}

- (void)testJoinStorageSessionAsViewer {
    NSString *key = @"testJoinStorageSessionAsViewer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideoWebRTCStorage registerKinesisVideoWebRTCStorageWithConfiguration:configuration forKey:key];

    AWSKinesisVideoWebRTCStorage *awsClient = [AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:key] joinStorageSessionAsViewer:[AWSKinesisVideoWebRTCStorageJoinStorageSessionAsViewerInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideoWebRTCStorage removeKinesisVideoWebRTCStorageForKey:key];
}

- (void)testJoinStorageSessionAsViewerCompletionHandler {
    NSString *key = @"testJoinStorageSessionAsViewer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideoWebRTCStorage registerKinesisVideoWebRTCStorageWithConfiguration:configuration forKey:key];

    AWSKinesisVideoWebRTCStorage *awsClient = [AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideoWebRTCStorage KinesisVideoWebRTCStorageForKey:key] joinStorageSessionAsViewer:[AWSKinesisVideoWebRTCStorageJoinStorageSessionAsViewerInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideoWebRTCStorage removeKinesisVideoWebRTCStorageForKey:key];
}

@end
