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
#import "AWSHealthService.h"

static id mockNetworking = nil;

@interface AWSGeneralHealthTests : XCTestCase

@end

@implementation AWSGeneralHealthTests

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
    NSString *key = @"testHealthConstructors";
    XCTAssertNotNil([AWSHealth defaultHealth]);
    XCTAssertEqual([[AWSHealth defaultHealth] class], [AWSHealth class]);
    XCTAssertNil([AWSHealth HealthForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSHealth HealthForKey:key]);
    XCTAssertEqual([[AWSHealth HealthForKey:key] class], [AWSHealth class]);
    XCTAssertEqual([AWSHealth HealthForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSHealth removeHealthForKey:key];
    XCTAssertNil([AWSHealth HealthForKey:key]);

}

- (void)testDescribeAffectedAccountsForOrganization {
    NSString *key = @"testDescribeAffectedAccountsForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSHealth HealthForKey:key] describeAffectedAccountsForOrganization:[AWSHealthDescribeAffectedAccountsForOrganizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeAffectedAccountsForOrganizationCompletionHandler {
    NSString *key = @"testDescribeAffectedAccountsForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSHealth HealthForKey:key] describeAffectedAccountsForOrganization:[AWSHealthDescribeAffectedAccountsForOrganizationRequest new] completionHandler:^(AWSHealthDescribeAffectedAccountsForOrganizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeAffectedEntities {
    NSString *key = @"testDescribeAffectedEntities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSHealth HealthForKey:key] describeAffectedEntities:[AWSHealthDescribeAffectedEntitiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeAffectedEntitiesCompletionHandler {
    NSString *key = @"testDescribeAffectedEntities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSHealth HealthForKey:key] describeAffectedEntities:[AWSHealthDescribeAffectedEntitiesRequest new] completionHandler:^(AWSHealthDescribeAffectedEntitiesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeAffectedEntitiesForOrganization {
    NSString *key = @"testDescribeAffectedEntitiesForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSHealth HealthForKey:key] describeAffectedEntitiesForOrganization:[AWSHealthDescribeAffectedEntitiesForOrganizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeAffectedEntitiesForOrganizationCompletionHandler {
    NSString *key = @"testDescribeAffectedEntitiesForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSHealth HealthForKey:key] describeAffectedEntitiesForOrganization:[AWSHealthDescribeAffectedEntitiesForOrganizationRequest new] completionHandler:^(AWSHealthDescribeAffectedEntitiesForOrganizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeEntityAggregates {
    NSString *key = @"testDescribeEntityAggregates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSHealth HealthForKey:key] describeEntityAggregates:[AWSHealthDescribeEntityAggregatesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeEntityAggregatesCompletionHandler {
    NSString *key = @"testDescribeEntityAggregates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSHealth HealthForKey:key] describeEntityAggregates:[AWSHealthDescribeEntityAggregatesRequest new] completionHandler:^(AWSHealthDescribeEntityAggregatesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeEventAggregates {
    NSString *key = @"testDescribeEventAggregates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSHealth HealthForKey:key] describeEventAggregates:[AWSHealthDescribeEventAggregatesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeEventAggregatesCompletionHandler {
    NSString *key = @"testDescribeEventAggregates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSHealth HealthForKey:key] describeEventAggregates:[AWSHealthDescribeEventAggregatesRequest new] completionHandler:^(AWSHealthDescribeEventAggregatesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeEventDetails {
    NSString *key = @"testDescribeEventDetails";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSHealth HealthForKey:key] describeEventDetails:[AWSHealthDescribeEventDetailsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeEventDetailsCompletionHandler {
    NSString *key = @"testDescribeEventDetails";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSHealth HealthForKey:key] describeEventDetails:[AWSHealthDescribeEventDetailsRequest new] completionHandler:^(AWSHealthDescribeEventDetailsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeEventDetailsForOrganization {
    NSString *key = @"testDescribeEventDetailsForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSHealth HealthForKey:key] describeEventDetailsForOrganization:[AWSHealthDescribeEventDetailsForOrganizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeEventDetailsForOrganizationCompletionHandler {
    NSString *key = @"testDescribeEventDetailsForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSHealth HealthForKey:key] describeEventDetailsForOrganization:[AWSHealthDescribeEventDetailsForOrganizationRequest new] completionHandler:^(AWSHealthDescribeEventDetailsForOrganizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeEventTypes {
    NSString *key = @"testDescribeEventTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSHealth HealthForKey:key] describeEventTypes:[AWSHealthDescribeEventTypesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeEventTypesCompletionHandler {
    NSString *key = @"testDescribeEventTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSHealth HealthForKey:key] describeEventTypes:[AWSHealthDescribeEventTypesRequest new] completionHandler:^(AWSHealthDescribeEventTypesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeEvents {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSHealth HealthForKey:key] describeEvents:[AWSHealthDescribeEventsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeEventsCompletionHandler {
    NSString *key = @"testDescribeEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSHealth HealthForKey:key] describeEvents:[AWSHealthDescribeEventsRequest new] completionHandler:^(AWSHealthDescribeEventsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeEventsForOrganization {
    NSString *key = @"testDescribeEventsForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSHealth HealthForKey:key] describeEventsForOrganization:[AWSHealthDescribeEventsForOrganizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeEventsForOrganizationCompletionHandler {
    NSString *key = @"testDescribeEventsForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSHealth HealthForKey:key] describeEventsForOrganization:[AWSHealthDescribeEventsForOrganizationRequest new] completionHandler:^(AWSHealthDescribeEventsForOrganizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeHealthServiceStatusForOrganization {
    NSString *key = @"testDescribeHealthServiceStatusForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSHealth HealthForKey:key] describeHealthServiceStatusForOrganization:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDescribeHealthServiceStatusForOrganizationCompletionHandler {
    NSString *key = @"testDescribeHealthServiceStatusForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSHealth HealthForKey:key] describeHealthServiceStatusForOrganization:[AWSRequest new] completionHandler:^(AWSHealthDescribeHealthServiceStatusForOrganizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDisableHealthServiceAccessForOrganization {
    NSString *key = @"testDisableHealthServiceAccessForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSHealth HealthForKey:key] disableHealthServiceAccessForOrganization:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testDisableHealthServiceAccessForOrganizationCompletionHandler {
    NSString *key = @"testDisableHealthServiceAccessForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSHealth HealthForKey:key] disableHealthServiceAccessForOrganization:[AWSRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testEnableHealthServiceAccessForOrganization {
    NSString *key = @"testEnableHealthServiceAccessForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSHealth HealthForKey:key] enableHealthServiceAccessForOrganization:[AWSRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

- (void)testEnableHealthServiceAccessForOrganizationCompletionHandler {
    NSString *key = @"testEnableHealthServiceAccessForOrganization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSHealth registerHealthWithConfiguration:configuration forKey:key];

    AWSHealth *awsClient = [AWSHealth HealthForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSHealth HealthForKey:key] enableHealthServiceAccessForOrganization:[AWSRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSHealth removeHealthForKey:key];
}

@end
