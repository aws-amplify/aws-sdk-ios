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
#import "AWSPersonalizeruntimeService.h"

static id mockNetworking = nil;

@interface AWSGeneralPersonalizeruntimeTests : XCTestCase

@end

@implementation AWSGeneralPersonalizeruntimeTests

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
    NSString *key = @"testPersonalizeruntimeConstructors";
    XCTAssertNotNil([AWSPersonalizeruntime defaultPersonalizeruntime]);
    XCTAssertEqual([[AWSPersonalizeruntime defaultPersonalizeruntime] class], [AWSPersonalizeruntime class]);
    XCTAssertNil([AWSPersonalizeruntime PersonalizeruntimeForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSPersonalizeruntime registerPersonalizeruntimeWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSPersonalizeruntime PersonalizeruntimeForKey:key]);
    XCTAssertEqual([[AWSPersonalizeruntime PersonalizeruntimeForKey:key] class], [AWSPersonalizeruntime class]);
    XCTAssertEqual([AWSPersonalizeruntime PersonalizeruntimeForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSPersonalizeruntime removePersonalizeruntimeForKey:key];
    XCTAssertNil([AWSPersonalizeruntime PersonalizeruntimeForKey:key]);

}

- (void)testGetPersonalizedRanking {
    NSString *key = @"testGetPersonalizedRanking";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalizeruntime registerPersonalizeruntimeWithConfiguration:configuration forKey:key];

    AWSPersonalizeruntime *awsClient = [AWSPersonalizeruntime PersonalizeruntimeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalizeruntime PersonalizeruntimeForKey:key] getPersonalizedRanking:[AWSPersonalizeruntimeGetPersonalizedRankingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalizeruntime removePersonalizeruntimeForKey:key];
}

- (void)testGetPersonalizedRankingCompletionHandler {
    NSString *key = @"testGetPersonalizedRanking";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalizeruntime registerPersonalizeruntimeWithConfiguration:configuration forKey:key];

    AWSPersonalizeruntime *awsClient = [AWSPersonalizeruntime PersonalizeruntimeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalizeruntime PersonalizeruntimeForKey:key] getPersonalizedRanking:[AWSPersonalizeruntimeGetPersonalizedRankingRequest new] completionHandler:^(AWSPersonalizeruntimeGetPersonalizedRankingResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalizeruntime removePersonalizeruntimeForKey:key];
}

- (void)testGetRecommendations {
    NSString *key = @"testGetRecommendations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalizeruntime registerPersonalizeruntimeWithConfiguration:configuration forKey:key];

    AWSPersonalizeruntime *awsClient = [AWSPersonalizeruntime PersonalizeruntimeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalizeruntime PersonalizeruntimeForKey:key] getRecommendations:[AWSPersonalizeruntimeGetRecommendationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalizeruntime removePersonalizeruntimeForKey:key];
}

- (void)testGetRecommendationsCompletionHandler {
    NSString *key = @"testGetRecommendations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalizeruntime registerPersonalizeruntimeWithConfiguration:configuration forKey:key];

    AWSPersonalizeruntime *awsClient = [AWSPersonalizeruntime PersonalizeruntimeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalizeruntime PersonalizeruntimeForKey:key] getRecommendations:[AWSPersonalizeruntimeGetRecommendationsRequest new] completionHandler:^(AWSPersonalizeruntimeGetRecommendationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalizeruntime removePersonalizeruntimeForKey:key];
}

@end
