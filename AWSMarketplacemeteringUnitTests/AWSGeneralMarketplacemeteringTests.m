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
#import "AWSMarketplacemeteringService.h"

static id mockNetworking = nil;

@interface AWSGeneralMarketplacemeteringTests : XCTestCase

@end

@implementation AWSGeneralMarketplacemeteringTests

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
    NSString *key = @"testMarketplacemeteringConstructors";
    XCTAssertNotNil([AWSMarketplacemetering defaultMarketplacemetering]);
    XCTAssertEqual([[AWSMarketplacemetering defaultMarketplacemetering] class], [AWSMarketplacemetering class]);
    XCTAssertNil([AWSMarketplacemetering MarketplacemeteringForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSMarketplacemetering registerMarketplacemeteringWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSMarketplacemetering MarketplacemeteringForKey:key]);
    XCTAssertEqual([[AWSMarketplacemetering MarketplacemeteringForKey:key] class], [AWSMarketplacemetering class]);
    XCTAssertEqual([AWSMarketplacemetering MarketplacemeteringForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSMarketplacemetering removeMarketplacemeteringForKey:key];
    XCTAssertNil([AWSMarketplacemetering MarketplacemeteringForKey:key]);

}

- (void)testBatchMeterUsage {
    NSString *key = @"testBatchMeterUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacemetering registerMarketplacemeteringWithConfiguration:configuration forKey:key];

    AWSMarketplacemetering *awsClient = [AWSMarketplacemetering MarketplacemeteringForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMarketplacemetering MarketplacemeteringForKey:key] batchMeterUsage:[AWSMarketplacemeteringBatchMeterUsageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacemetering removeMarketplacemeteringForKey:key];
}

- (void)testBatchMeterUsageCompletionHandler {
    NSString *key = @"testBatchMeterUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacemetering registerMarketplacemeteringWithConfiguration:configuration forKey:key];

    AWSMarketplacemetering *awsClient = [AWSMarketplacemetering MarketplacemeteringForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMarketplacemetering MarketplacemeteringForKey:key] batchMeterUsage:[AWSMarketplacemeteringBatchMeterUsageRequest new] completionHandler:^(AWSMarketplacemeteringBatchMeterUsageResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacemetering removeMarketplacemeteringForKey:key];
}

- (void)testMeterUsage {
    NSString *key = @"testMeterUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacemetering registerMarketplacemeteringWithConfiguration:configuration forKey:key];

    AWSMarketplacemetering *awsClient = [AWSMarketplacemetering MarketplacemeteringForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMarketplacemetering MarketplacemeteringForKey:key] meterUsage:[AWSMarketplacemeteringMeterUsageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacemetering removeMarketplacemeteringForKey:key];
}

- (void)testMeterUsageCompletionHandler {
    NSString *key = @"testMeterUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacemetering registerMarketplacemeteringWithConfiguration:configuration forKey:key];

    AWSMarketplacemetering *awsClient = [AWSMarketplacemetering MarketplacemeteringForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMarketplacemetering MarketplacemeteringForKey:key] meterUsage:[AWSMarketplacemeteringMeterUsageRequest new] completionHandler:^(AWSMarketplacemeteringMeterUsageResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacemetering removeMarketplacemeteringForKey:key];
}

- (void)testRegisterUsage {
    NSString *key = @"testRegisterUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacemetering registerMarketplacemeteringWithConfiguration:configuration forKey:key];

    AWSMarketplacemetering *awsClient = [AWSMarketplacemetering MarketplacemeteringForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMarketplacemetering MarketplacemeteringForKey:key] registerUsage:[AWSMarketplacemeteringRegisterUsageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacemetering removeMarketplacemeteringForKey:key];
}

- (void)testRegisterUsageCompletionHandler {
    NSString *key = @"testRegisterUsage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacemetering registerMarketplacemeteringWithConfiguration:configuration forKey:key];

    AWSMarketplacemetering *awsClient = [AWSMarketplacemetering MarketplacemeteringForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMarketplacemetering MarketplacemeteringForKey:key] registerUsage:[AWSMarketplacemeteringRegisterUsageRequest new] completionHandler:^(AWSMarketplacemeteringRegisterUsageResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacemetering removeMarketplacemeteringForKey:key];
}

- (void)testResolveCustomer {
    NSString *key = @"testResolveCustomer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacemetering registerMarketplacemeteringWithConfiguration:configuration forKey:key];

    AWSMarketplacemetering *awsClient = [AWSMarketplacemetering MarketplacemeteringForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMarketplacemetering MarketplacemeteringForKey:key] resolveCustomer:[AWSMarketplacemeteringResolveCustomerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacemetering removeMarketplacemeteringForKey:key];
}

- (void)testResolveCustomerCompletionHandler {
    NSString *key = @"testResolveCustomer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMarketplacemetering registerMarketplacemeteringWithConfiguration:configuration forKey:key];

    AWSMarketplacemetering *awsClient = [AWSMarketplacemetering MarketplacemeteringForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMarketplacemetering MarketplacemeteringForKey:key] resolveCustomer:[AWSMarketplacemeteringResolveCustomerRequest new] completionHandler:^(AWSMarketplacemeteringResolveCustomerResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMarketplacemetering removeMarketplacemeteringForKey:key];
}

@end
