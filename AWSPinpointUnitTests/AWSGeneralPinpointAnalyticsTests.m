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
#import "AWSPinpointAnalyticsService.h"

static id mockNetworking = nil;

@interface AWSGeneralPinpointAnalyticsTests : XCTestCase

@end

@implementation AWSGeneralPinpointAnalyticsTests

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
    NSString *key = @"testPinpointAnalyticsConstructors";
    XCTAssertNotNil([AWSPinpointAnalytics defaultPinpointAnalytics]);
    XCTAssertEqual([[AWSPinpointAnalytics defaultPinpointAnalytics] class], [AWSPinpointAnalytics class]);
    XCTAssertNil([AWSPinpointAnalytics PinpointAnalyticsForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSPinpointAnalytics registerPinpointAnalyticsWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSPinpointAnalytics PinpointAnalyticsForKey:key]);
    XCTAssertEqual([[AWSPinpointAnalytics PinpointAnalyticsForKey:key] class], [AWSPinpointAnalytics class]);
    XCTAssertEqual([AWSPinpointAnalytics PinpointAnalyticsForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSPinpointAnalytics removePinpointAnalyticsForKey:key];
    XCTAssertNil([AWSPinpointAnalytics PinpointAnalyticsForKey:key]);

}

- (void)testPutEvents {
    NSString *key = @"testPutEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointAnalytics registerPinpointAnalyticsWithConfiguration:configuration forKey:key];

    AWSPinpointAnalytics *awsClient = [AWSPinpointAnalytics PinpointAnalyticsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPinpointAnalytics PinpointAnalyticsForKey:key] putEvents:[AWSPinpointAnalyticsPutEventsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointAnalytics removePinpointAnalyticsForKey:key];
}

- (void)testPutEventsCompletionHandler {
    NSString *key = @"testPutEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPinpointAnalytics registerPinpointAnalyticsWithConfiguration:configuration forKey:key];

    AWSPinpointAnalytics *awsClient = [AWSPinpointAnalytics PinpointAnalyticsForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPinpointAnalytics PinpointAnalyticsForKey:key] putEvents:[AWSPinpointAnalyticsPutEventsInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPinpointAnalytics removePinpointAnalyticsForKey:key];
}

@end
