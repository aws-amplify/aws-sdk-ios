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
#import "AWSMachineLearningService.h"

static id mockNetworking = nil;

@interface AWSGeneralMachineLearningTests : XCTestCase

@end

@implementation AWSGeneralMachineLearningTests

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
    NSString *key = @"testMachineLearningConstructors";
    XCTAssertNotNil([AWSMachineLearning defaultMachineLearning]);
    XCTAssertEqual([[AWSMachineLearning defaultMachineLearning] class], [AWSMachineLearning class]);
    XCTAssertNil([AWSMachineLearning MachineLearningForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSMachineLearning MachineLearningForKey:key]);
    XCTAssertEqual([[AWSMachineLearning MachineLearningForKey:key] class], [AWSMachineLearning class]);
    XCTAssertEqual([AWSMachineLearning MachineLearningForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSMachineLearning removeMachineLearningForKey:key];
    XCTAssertNil([AWSMachineLearning MachineLearningForKey:key]);

}

- (void)testGetMLModel {
    NSString *key = @"testGetMLModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] getMLModel:[AWSMachineLearningGetMLModelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testGetMLModelCompletionHandler {
    NSString *key = @"testGetMLModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] getMLModel:[AWSMachineLearningGetMLModelInput new] completionHandler:^(AWSMachineLearningGetMLModelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testPredict {
    NSString *key = @"testPredict";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] predict:[AWSMachineLearningPredictInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testPredictCompletionHandler {
    NSString *key = @"testPredict";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] predict:[AWSMachineLearningPredictInput new] completionHandler:^(AWSMachineLearningPredictOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

@end
