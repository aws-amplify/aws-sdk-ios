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
#import "AWSKinesisVideoSignalingService.h"

static id mockNetworking = nil;

@interface AWSGeneralKinesisVideoSignalingTests : XCTestCase

@end

@implementation AWSGeneralKinesisVideoSignalingTests

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
    NSString *key = @"testKinesisVideoSignalingConstructors";
    XCTAssertNotNil([AWSKinesisVideoSignaling defaultKinesisVideoSignaling]);
    XCTAssertEqual([[AWSKinesisVideoSignaling defaultKinesisVideoSignaling] class], [AWSKinesisVideoSignaling class]);
    XCTAssertNil([AWSKinesisVideoSignaling KinesisVideoSignalingForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSKinesisVideoSignaling registerKinesisVideoSignalingWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSKinesisVideoSignaling KinesisVideoSignalingForKey:key]);
    XCTAssertEqual([[AWSKinesisVideoSignaling KinesisVideoSignalingForKey:key] class], [AWSKinesisVideoSignaling class]);
    XCTAssertEqual([AWSKinesisVideoSignaling KinesisVideoSignalingForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSKinesisVideoSignaling removeKinesisVideoSignalingForKey:key];
    XCTAssertNil([AWSKinesisVideoSignaling KinesisVideoSignalingForKey:key]);

}

- (void)testGetIceServerConfig {
    NSString *key = @"testGetIceServerConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideoSignaling registerKinesisVideoSignalingWithConfiguration:configuration forKey:key];

    AWSKinesisVideoSignaling *awsClient = [AWSKinesisVideoSignaling KinesisVideoSignalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideoSignaling KinesisVideoSignalingForKey:key] getIceServerConfig:[AWSKinesisVideoSignalingGetIceServerConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideoSignaling removeKinesisVideoSignalingForKey:key];
}

- (void)testGetIceServerConfigCompletionHandler {
    NSString *key = @"testGetIceServerConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideoSignaling registerKinesisVideoSignalingWithConfiguration:configuration forKey:key];

    AWSKinesisVideoSignaling *awsClient = [AWSKinesisVideoSignaling KinesisVideoSignalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideoSignaling KinesisVideoSignalingForKey:key] getIceServerConfig:[AWSKinesisVideoSignalingGetIceServerConfigRequest new] completionHandler:^(AWSKinesisVideoSignalingGetIceServerConfigResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideoSignaling removeKinesisVideoSignalingForKey:key];
}

- (void)testSendAlexaOfferToMaster {
    NSString *key = @"testSendAlexaOfferToMaster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideoSignaling registerKinesisVideoSignalingWithConfiguration:configuration forKey:key];

    AWSKinesisVideoSignaling *awsClient = [AWSKinesisVideoSignaling KinesisVideoSignalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSKinesisVideoSignaling KinesisVideoSignalingForKey:key] sendAlexaOfferToMaster:[AWSKinesisVideoSignalingSendAlexaOfferToMasterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideoSignaling removeKinesisVideoSignalingForKey:key];
}

- (void)testSendAlexaOfferToMasterCompletionHandler {
    NSString *key = @"testSendAlexaOfferToMaster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSKinesisVideoSignaling registerKinesisVideoSignalingWithConfiguration:configuration forKey:key];

    AWSKinesisVideoSignaling *awsClient = [AWSKinesisVideoSignaling KinesisVideoSignalingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSKinesisVideoSignaling KinesisVideoSignalingForKey:key] sendAlexaOfferToMaster:[AWSKinesisVideoSignalingSendAlexaOfferToMasterRequest new] completionHandler:^(AWSKinesisVideoSignalingSendAlexaOfferToMasterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSKinesisVideoSignaling removeKinesisVideoSignalingForKey:key];
}

@end
