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
#import "AWSa2i-runtime.sagemakerService.h"

static id mockNetworking = nil;

@interface AWSGenerala2i-runtime.sagemakerTests : XCTestCase

@end

@implementation AWSGenerala2i-runtime.sagemakerTests

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
    NSString *key = @"testa2i-runtime.sagemakerConstructors";
    XCTAssertNotNil([AWSa2i-runtime.sagemaker defaulta2i-runtime.sagemaker]);
    XCTAssertEqual([[AWSa2i-runtime.sagemaker defaulta2i-runtime.sagemaker] class], [AWSa2i-runtime.sagemaker class]);
    XCTAssertNil([AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSa2i-runtime.sagemaker registera2i-runtime.sagemakerWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key]);
    XCTAssertEqual([[AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key] class], [AWSa2i-runtime.sagemaker class]);
    XCTAssertEqual([AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSa2i-runtime.sagemaker removea2i-runtime.sagemakerForKey:key];
    XCTAssertNil([AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key]);

}

- (void)testDeleteHumanLoop {
    NSString *key = @"testDeleteHumanLoop";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSa2i-runtime.sagemaker registera2i-runtime.sagemakerWithConfiguration:configuration forKey:key];

    AWSa2i-runtime.sagemaker *awsClient = [AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key] deleteHumanLoop:[AWSa2i-runtime.sagemakerDeleteHumanLoopRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSa2i-runtime.sagemaker removea2i-runtime.sagemakerForKey:key];
}

- (void)testDeleteHumanLoopCompletionHandler {
    NSString *key = @"testDeleteHumanLoop";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSa2i-runtime.sagemaker registera2i-runtime.sagemakerWithConfiguration:configuration forKey:key];

    AWSa2i-runtime.sagemaker *awsClient = [AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key] deleteHumanLoop:[AWSa2i-runtime.sagemakerDeleteHumanLoopRequest new] completionHandler:^(AWSa2i-runtime.sagemakerDeleteHumanLoopResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSa2i-runtime.sagemaker removea2i-runtime.sagemakerForKey:key];
}

- (void)testDescribeHumanLoop {
    NSString *key = @"testDescribeHumanLoop";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSa2i-runtime.sagemaker registera2i-runtime.sagemakerWithConfiguration:configuration forKey:key];

    AWSa2i-runtime.sagemaker *awsClient = [AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key] describeHumanLoop:[AWSa2i-runtime.sagemakerDescribeHumanLoopRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSa2i-runtime.sagemaker removea2i-runtime.sagemakerForKey:key];
}

- (void)testDescribeHumanLoopCompletionHandler {
    NSString *key = @"testDescribeHumanLoop";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSa2i-runtime.sagemaker registera2i-runtime.sagemakerWithConfiguration:configuration forKey:key];

    AWSa2i-runtime.sagemaker *awsClient = [AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key] describeHumanLoop:[AWSa2i-runtime.sagemakerDescribeHumanLoopRequest new] completionHandler:^(AWSa2i-runtime.sagemakerDescribeHumanLoopResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSa2i-runtime.sagemaker removea2i-runtime.sagemakerForKey:key];
}

- (void)testListHumanLoops {
    NSString *key = @"testListHumanLoops";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSa2i-runtime.sagemaker registera2i-runtime.sagemakerWithConfiguration:configuration forKey:key];

    AWSa2i-runtime.sagemaker *awsClient = [AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key] listHumanLoops:[AWSa2i-runtime.sagemakerListHumanLoopsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSa2i-runtime.sagemaker removea2i-runtime.sagemakerForKey:key];
}

- (void)testListHumanLoopsCompletionHandler {
    NSString *key = @"testListHumanLoops";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSa2i-runtime.sagemaker registera2i-runtime.sagemakerWithConfiguration:configuration forKey:key];

    AWSa2i-runtime.sagemaker *awsClient = [AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key] listHumanLoops:[AWSa2i-runtime.sagemakerListHumanLoopsRequest new] completionHandler:^(AWSa2i-runtime.sagemakerListHumanLoopsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSa2i-runtime.sagemaker removea2i-runtime.sagemakerForKey:key];
}

- (void)testStartHumanLoop {
    NSString *key = @"testStartHumanLoop";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSa2i-runtime.sagemaker registera2i-runtime.sagemakerWithConfiguration:configuration forKey:key];

    AWSa2i-runtime.sagemaker *awsClient = [AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key] startHumanLoop:[AWSa2i-runtime.sagemakerStartHumanLoopRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSa2i-runtime.sagemaker removea2i-runtime.sagemakerForKey:key];
}

- (void)testStartHumanLoopCompletionHandler {
    NSString *key = @"testStartHumanLoop";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSa2i-runtime.sagemaker registera2i-runtime.sagemakerWithConfiguration:configuration forKey:key];

    AWSa2i-runtime.sagemaker *awsClient = [AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key] startHumanLoop:[AWSa2i-runtime.sagemakerStartHumanLoopRequest new] completionHandler:^(AWSa2i-runtime.sagemakerStartHumanLoopResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSa2i-runtime.sagemaker removea2i-runtime.sagemakerForKey:key];
}

- (void)testStopHumanLoop {
    NSString *key = @"testStopHumanLoop";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSa2i-runtime.sagemaker registera2i-runtime.sagemakerWithConfiguration:configuration forKey:key];

    AWSa2i-runtime.sagemaker *awsClient = [AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key] stopHumanLoop:[AWSa2i-runtime.sagemakerStopHumanLoopRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSa2i-runtime.sagemaker removea2i-runtime.sagemakerForKey:key];
}

- (void)testStopHumanLoopCompletionHandler {
    NSString *key = @"testStopHumanLoop";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSa2i-runtime.sagemaker registera2i-runtime.sagemakerWithConfiguration:configuration forKey:key];

    AWSa2i-runtime.sagemaker *awsClient = [AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSa2i-runtime.sagemaker a2i-runtime.sagemakerForKey:key] stopHumanLoop:[AWSa2i-runtime.sagemakerStopHumanLoopRequest new] completionHandler:^(AWSa2i-runtime.sagemakerStopHumanLoopResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSa2i-runtime.sagemaker removea2i-runtime.sagemakerForKey:key];
}

@end
