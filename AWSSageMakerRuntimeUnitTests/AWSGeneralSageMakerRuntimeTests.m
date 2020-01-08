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
#import "AWSSageMakerRuntimeService.h"

static id mockNetworking = nil;

@interface AWSGeneralSageMakerRuntimeTests : XCTestCase

@end

@implementation AWSGeneralSageMakerRuntimeTests

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
    NSString *key = @"testSageMakerRuntimeConstructors";
    XCTAssertNotNil([AWSSageMakerRuntime defaultSageMakerRuntime]);
    XCTAssertEqual([[AWSSageMakerRuntime defaultSageMakerRuntime] class], [AWSSageMakerRuntime class]);
    XCTAssertNil([AWSSageMakerRuntime SageMakerRuntimeForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSSageMakerRuntime registerSageMakerRuntimeWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSSageMakerRuntime SageMakerRuntimeForKey:key]);
    XCTAssertEqual([[AWSSageMakerRuntime SageMakerRuntimeForKey:key] class], [AWSSageMakerRuntime class]);
    XCTAssertEqual([AWSSageMakerRuntime SageMakerRuntimeForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSSageMakerRuntime removeSageMakerRuntimeForKey:key];
    XCTAssertNil([AWSSageMakerRuntime SageMakerRuntimeForKey:key]);

}

- (void)testInvokeEndpoint {
    NSString *key = @"testInvokeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerRuntime registerSageMakerRuntimeWithConfiguration:configuration forKey:key];

    AWSSageMakerRuntime *awsClient = [AWSSageMakerRuntime SageMakerRuntimeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerRuntime SageMakerRuntimeForKey:key] invokeEndpoint:[AWSSageMakerRuntimeInvokeEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerRuntime removeSageMakerRuntimeForKey:key];
}

- (void)testInvokeEndpointCompletionHandler {
    NSString *key = @"testInvokeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerRuntime registerSageMakerRuntimeWithConfiguration:configuration forKey:key];

    AWSSageMakerRuntime *awsClient = [AWSSageMakerRuntime SageMakerRuntimeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerRuntime SageMakerRuntimeForKey:key] invokeEndpoint:[AWSSageMakerRuntimeInvokeEndpointInput new] completionHandler:^(AWSSageMakerRuntimeInvokeEndpointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerRuntime removeSageMakerRuntimeForKey:key];
}

@end
