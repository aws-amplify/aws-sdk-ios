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
#import "AWSAlexaforbusinessService.h"

static id mockNetworking = nil;

@interface AWSGeneralAlexaforbusinessTests : XCTestCase

@end

@implementation AWSGeneralAlexaforbusinessTests

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
    NSString *key = @"testAlexaforbusinessConstructors";
    XCTAssertNotNil([AWSAlexaforbusiness defaultAlexaforbusiness]);
    XCTAssertEqual([[AWSAlexaforbusiness defaultAlexaforbusiness] class], [AWSAlexaforbusiness class]);
    XCTAssertNil([AWSAlexaforbusiness AlexaforbusinessForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSAlexaforbusiness AlexaforbusinessForKey:key]);
    XCTAssertEqual([[AWSAlexaforbusiness AlexaforbusinessForKey:key] class], [AWSAlexaforbusiness class]);
    XCTAssertEqual([AWSAlexaforbusiness AlexaforbusinessForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
    XCTAssertNil([AWSAlexaforbusiness AlexaforbusinessForKey:key]);

}

- (void)testApproveSkill {
    NSString *key = @"testApproveSkill";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] approveSkill:[AWSAlexaforbusinessApproveSkillRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testApproveSkillCompletionHandler {
    NSString *key = @"testApproveSkill";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] approveSkill:[AWSAlexaforbusinessApproveSkillRequest new] completionHandler:^(AWSAlexaforbusinessApproveSkillResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testAssociateContactWithAddressBook {
    NSString *key = @"testAssociateContactWithAddressBook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] associateContactWithAddressBook:[AWSAlexaforbusinessAssociateContactWithAddressBookRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testAssociateContactWithAddressBookCompletionHandler {
    NSString *key = @"testAssociateContactWithAddressBook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] associateContactWithAddressBook:[AWSAlexaforbusinessAssociateContactWithAddressBookRequest new] completionHandler:^(AWSAlexaforbusinessAssociateContactWithAddressBookResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testAssociateDeviceWithNetworkProfile {
    NSString *key = @"testAssociateDeviceWithNetworkProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] associateDeviceWithNetworkProfile:[AWSAlexaforbusinessAssociateDeviceWithNetworkProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testAssociateDeviceWithNetworkProfileCompletionHandler {
    NSString *key = @"testAssociateDeviceWithNetworkProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] associateDeviceWithNetworkProfile:[AWSAlexaforbusinessAssociateDeviceWithNetworkProfileRequest new] completionHandler:^(AWSAlexaforbusinessAssociateDeviceWithNetworkProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testAssociateDeviceWithRoom {
    NSString *key = @"testAssociateDeviceWithRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] associateDeviceWithRoom:[AWSAlexaforbusinessAssociateDeviceWithRoomRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testAssociateDeviceWithRoomCompletionHandler {
    NSString *key = @"testAssociateDeviceWithRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] associateDeviceWithRoom:[AWSAlexaforbusinessAssociateDeviceWithRoomRequest new] completionHandler:^(AWSAlexaforbusinessAssociateDeviceWithRoomResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testAssociateSkillGroupWithRoom {
    NSString *key = @"testAssociateSkillGroupWithRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] associateSkillGroupWithRoom:[AWSAlexaforbusinessAssociateSkillGroupWithRoomRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testAssociateSkillGroupWithRoomCompletionHandler {
    NSString *key = @"testAssociateSkillGroupWithRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] associateSkillGroupWithRoom:[AWSAlexaforbusinessAssociateSkillGroupWithRoomRequest new] completionHandler:^(AWSAlexaforbusinessAssociateSkillGroupWithRoomResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testAssociateSkillWithSkillGroup {
    NSString *key = @"testAssociateSkillWithSkillGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] associateSkillWithSkillGroup:[AWSAlexaforbusinessAssociateSkillWithSkillGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testAssociateSkillWithSkillGroupCompletionHandler {
    NSString *key = @"testAssociateSkillWithSkillGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] associateSkillWithSkillGroup:[AWSAlexaforbusinessAssociateSkillWithSkillGroupRequest new] completionHandler:^(AWSAlexaforbusinessAssociateSkillWithSkillGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testAssociateSkillWithUsers {
    NSString *key = @"testAssociateSkillWithUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] associateSkillWithUsers:[AWSAlexaforbusinessAssociateSkillWithUsersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testAssociateSkillWithUsersCompletionHandler {
    NSString *key = @"testAssociateSkillWithUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] associateSkillWithUsers:[AWSAlexaforbusinessAssociateSkillWithUsersRequest new] completionHandler:^(AWSAlexaforbusinessAssociateSkillWithUsersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateAddressBook {
    NSString *key = @"testCreateAddressBook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createAddressBook:[AWSAlexaforbusinessCreateAddressBookRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateAddressBookCompletionHandler {
    NSString *key = @"testCreateAddressBook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createAddressBook:[AWSAlexaforbusinessCreateAddressBookRequest new] completionHandler:^(AWSAlexaforbusinessCreateAddressBookResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateBusinessReportSchedule {
    NSString *key = @"testCreateBusinessReportSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createBusinessReportSchedule:[AWSAlexaforbusinessCreateBusinessReportScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateBusinessReportScheduleCompletionHandler {
    NSString *key = @"testCreateBusinessReportSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createBusinessReportSchedule:[AWSAlexaforbusinessCreateBusinessReportScheduleRequest new] completionHandler:^(AWSAlexaforbusinessCreateBusinessReportScheduleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateConferenceProvider {
    NSString *key = @"testCreateConferenceProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createConferenceProvider:[AWSAlexaforbusinessCreateConferenceProviderRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateConferenceProviderCompletionHandler {
    NSString *key = @"testCreateConferenceProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createConferenceProvider:[AWSAlexaforbusinessCreateConferenceProviderRequest new] completionHandler:^(AWSAlexaforbusinessCreateConferenceProviderResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateContact {
    NSString *key = @"testCreateContact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createContact:[AWSAlexaforbusinessCreateContactRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateContactCompletionHandler {
    NSString *key = @"testCreateContact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createContact:[AWSAlexaforbusinessCreateContactRequest new] completionHandler:^(AWSAlexaforbusinessCreateContactResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateGatewayGroup {
    NSString *key = @"testCreateGatewayGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createGatewayGroup:[AWSAlexaforbusinessCreateGatewayGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateGatewayGroupCompletionHandler {
    NSString *key = @"testCreateGatewayGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createGatewayGroup:[AWSAlexaforbusinessCreateGatewayGroupRequest new] completionHandler:^(AWSAlexaforbusinessCreateGatewayGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateNetworkProfile {
    NSString *key = @"testCreateNetworkProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createNetworkProfile:[AWSAlexaforbusinessCreateNetworkProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateNetworkProfileCompletionHandler {
    NSString *key = @"testCreateNetworkProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createNetworkProfile:[AWSAlexaforbusinessCreateNetworkProfileRequest new] completionHandler:^(AWSAlexaforbusinessCreateNetworkProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateProfile {
    NSString *key = @"testCreateProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createProfile:[AWSAlexaforbusinessCreateProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateProfileCompletionHandler {
    NSString *key = @"testCreateProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createProfile:[AWSAlexaforbusinessCreateProfileRequest new] completionHandler:^(AWSAlexaforbusinessCreateProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateRoom {
    NSString *key = @"testCreateRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createRoom:[AWSAlexaforbusinessCreateRoomRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateRoomCompletionHandler {
    NSString *key = @"testCreateRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createRoom:[AWSAlexaforbusinessCreateRoomRequest new] completionHandler:^(AWSAlexaforbusinessCreateRoomResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateSkillGroup {
    NSString *key = @"testCreateSkillGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createSkillGroup:[AWSAlexaforbusinessCreateSkillGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateSkillGroupCompletionHandler {
    NSString *key = @"testCreateSkillGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createSkillGroup:[AWSAlexaforbusinessCreateSkillGroupRequest new] completionHandler:^(AWSAlexaforbusinessCreateSkillGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateUser {
    NSString *key = @"testCreateUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createUser:[AWSAlexaforbusinessCreateUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testCreateUserCompletionHandler {
    NSString *key = @"testCreateUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] createUser:[AWSAlexaforbusinessCreateUserRequest new] completionHandler:^(AWSAlexaforbusinessCreateUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteAddressBook {
    NSString *key = @"testDeleteAddressBook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteAddressBook:[AWSAlexaforbusinessDeleteAddressBookRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteAddressBookCompletionHandler {
    NSString *key = @"testDeleteAddressBook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteAddressBook:[AWSAlexaforbusinessDeleteAddressBookRequest new] completionHandler:^(AWSAlexaforbusinessDeleteAddressBookResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteBusinessReportSchedule {
    NSString *key = @"testDeleteBusinessReportSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteBusinessReportSchedule:[AWSAlexaforbusinessDeleteBusinessReportScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteBusinessReportScheduleCompletionHandler {
    NSString *key = @"testDeleteBusinessReportSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteBusinessReportSchedule:[AWSAlexaforbusinessDeleteBusinessReportScheduleRequest new] completionHandler:^(AWSAlexaforbusinessDeleteBusinessReportScheduleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteConferenceProvider {
    NSString *key = @"testDeleteConferenceProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteConferenceProvider:[AWSAlexaforbusinessDeleteConferenceProviderRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteConferenceProviderCompletionHandler {
    NSString *key = @"testDeleteConferenceProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteConferenceProvider:[AWSAlexaforbusinessDeleteConferenceProviderRequest new] completionHandler:^(AWSAlexaforbusinessDeleteConferenceProviderResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteContact {
    NSString *key = @"testDeleteContact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteContact:[AWSAlexaforbusinessDeleteContactRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteContactCompletionHandler {
    NSString *key = @"testDeleteContact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteContact:[AWSAlexaforbusinessDeleteContactRequest new] completionHandler:^(AWSAlexaforbusinessDeleteContactResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteDevice {
    NSString *key = @"testDeleteDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteDevice:[AWSAlexaforbusinessDeleteDeviceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteDeviceCompletionHandler {
    NSString *key = @"testDeleteDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteDevice:[AWSAlexaforbusinessDeleteDeviceRequest new] completionHandler:^(AWSAlexaforbusinessDeleteDeviceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteDeviceUsageData {
    NSString *key = @"testDeleteDeviceUsageData";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteDeviceUsageData:[AWSAlexaforbusinessDeleteDeviceUsageDataRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteDeviceUsageDataCompletionHandler {
    NSString *key = @"testDeleteDeviceUsageData";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteDeviceUsageData:[AWSAlexaforbusinessDeleteDeviceUsageDataRequest new] completionHandler:^(AWSAlexaforbusinessDeleteDeviceUsageDataResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteGatewayGroup {
    NSString *key = @"testDeleteGatewayGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteGatewayGroup:[AWSAlexaforbusinessDeleteGatewayGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteGatewayGroupCompletionHandler {
    NSString *key = @"testDeleteGatewayGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteGatewayGroup:[AWSAlexaforbusinessDeleteGatewayGroupRequest new] completionHandler:^(AWSAlexaforbusinessDeleteGatewayGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteNetworkProfile {
    NSString *key = @"testDeleteNetworkProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteNetworkProfile:[AWSAlexaforbusinessDeleteNetworkProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteNetworkProfileCompletionHandler {
    NSString *key = @"testDeleteNetworkProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteNetworkProfile:[AWSAlexaforbusinessDeleteNetworkProfileRequest new] completionHandler:^(AWSAlexaforbusinessDeleteNetworkProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteProfile {
    NSString *key = @"testDeleteProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteProfile:[AWSAlexaforbusinessDeleteProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteProfileCompletionHandler {
    NSString *key = @"testDeleteProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteProfile:[AWSAlexaforbusinessDeleteProfileRequest new] completionHandler:^(AWSAlexaforbusinessDeleteProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteRoom {
    NSString *key = @"testDeleteRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteRoom:[AWSAlexaforbusinessDeleteRoomRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteRoomCompletionHandler {
    NSString *key = @"testDeleteRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteRoom:[AWSAlexaforbusinessDeleteRoomRequest new] completionHandler:^(AWSAlexaforbusinessDeleteRoomResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteRoomSkillParameter {
    NSString *key = @"testDeleteRoomSkillParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteRoomSkillParameter:[AWSAlexaforbusinessDeleteRoomSkillParameterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteRoomSkillParameterCompletionHandler {
    NSString *key = @"testDeleteRoomSkillParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteRoomSkillParameter:[AWSAlexaforbusinessDeleteRoomSkillParameterRequest new] completionHandler:^(AWSAlexaforbusinessDeleteRoomSkillParameterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteSkillAuthorization {
    NSString *key = @"testDeleteSkillAuthorization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteSkillAuthorization:[AWSAlexaforbusinessDeleteSkillAuthorizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteSkillAuthorizationCompletionHandler {
    NSString *key = @"testDeleteSkillAuthorization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteSkillAuthorization:[AWSAlexaforbusinessDeleteSkillAuthorizationRequest new] completionHandler:^(AWSAlexaforbusinessDeleteSkillAuthorizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteSkillGroup {
    NSString *key = @"testDeleteSkillGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteSkillGroup:[AWSAlexaforbusinessDeleteSkillGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteSkillGroupCompletionHandler {
    NSString *key = @"testDeleteSkillGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteSkillGroup:[AWSAlexaforbusinessDeleteSkillGroupRequest new] completionHandler:^(AWSAlexaforbusinessDeleteSkillGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteUser {
    NSString *key = @"testDeleteUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteUser:[AWSAlexaforbusinessDeleteUserRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDeleteUserCompletionHandler {
    NSString *key = @"testDeleteUser";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] deleteUser:[AWSAlexaforbusinessDeleteUserRequest new] completionHandler:^(AWSAlexaforbusinessDeleteUserResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDisassociateContactFromAddressBook {
    NSString *key = @"testDisassociateContactFromAddressBook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] disassociateContactFromAddressBook:[AWSAlexaforbusinessDisassociateContactFromAddressBookRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDisassociateContactFromAddressBookCompletionHandler {
    NSString *key = @"testDisassociateContactFromAddressBook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] disassociateContactFromAddressBook:[AWSAlexaforbusinessDisassociateContactFromAddressBookRequest new] completionHandler:^(AWSAlexaforbusinessDisassociateContactFromAddressBookResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDisassociateDeviceFromRoom {
    NSString *key = @"testDisassociateDeviceFromRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] disassociateDeviceFromRoom:[AWSAlexaforbusinessDisassociateDeviceFromRoomRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDisassociateDeviceFromRoomCompletionHandler {
    NSString *key = @"testDisassociateDeviceFromRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] disassociateDeviceFromRoom:[AWSAlexaforbusinessDisassociateDeviceFromRoomRequest new] completionHandler:^(AWSAlexaforbusinessDisassociateDeviceFromRoomResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDisassociateSkillFromSkillGroup {
    NSString *key = @"testDisassociateSkillFromSkillGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] disassociateSkillFromSkillGroup:[AWSAlexaforbusinessDisassociateSkillFromSkillGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDisassociateSkillFromSkillGroupCompletionHandler {
    NSString *key = @"testDisassociateSkillFromSkillGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] disassociateSkillFromSkillGroup:[AWSAlexaforbusinessDisassociateSkillFromSkillGroupRequest new] completionHandler:^(AWSAlexaforbusinessDisassociateSkillFromSkillGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDisassociateSkillFromUsers {
    NSString *key = @"testDisassociateSkillFromUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] disassociateSkillFromUsers:[AWSAlexaforbusinessDisassociateSkillFromUsersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDisassociateSkillFromUsersCompletionHandler {
    NSString *key = @"testDisassociateSkillFromUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] disassociateSkillFromUsers:[AWSAlexaforbusinessDisassociateSkillFromUsersRequest new] completionHandler:^(AWSAlexaforbusinessDisassociateSkillFromUsersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDisassociateSkillGroupFromRoom {
    NSString *key = @"testDisassociateSkillGroupFromRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] disassociateSkillGroupFromRoom:[AWSAlexaforbusinessDisassociateSkillGroupFromRoomRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testDisassociateSkillGroupFromRoomCompletionHandler {
    NSString *key = @"testDisassociateSkillGroupFromRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] disassociateSkillGroupFromRoom:[AWSAlexaforbusinessDisassociateSkillGroupFromRoomRequest new] completionHandler:^(AWSAlexaforbusinessDisassociateSkillGroupFromRoomResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testForgetSmartHomeAppliances {
    NSString *key = @"testForgetSmartHomeAppliances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] forgetSmartHomeAppliances:[AWSAlexaforbusinessForgetSmartHomeAppliancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testForgetSmartHomeAppliancesCompletionHandler {
    NSString *key = @"testForgetSmartHomeAppliances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] forgetSmartHomeAppliances:[AWSAlexaforbusinessForgetSmartHomeAppliancesRequest new] completionHandler:^(AWSAlexaforbusinessForgetSmartHomeAppliancesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetAddressBook {
    NSString *key = @"testGetAddressBook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getAddressBook:[AWSAlexaforbusinessGetAddressBookRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetAddressBookCompletionHandler {
    NSString *key = @"testGetAddressBook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getAddressBook:[AWSAlexaforbusinessGetAddressBookRequest new] completionHandler:^(AWSAlexaforbusinessGetAddressBookResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetConferencePreference {
    NSString *key = @"testGetConferencePreference";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getConferencePreference:[AWSAlexaforbusinessGetConferencePreferenceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetConferencePreferenceCompletionHandler {
    NSString *key = @"testGetConferencePreference";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getConferencePreference:[AWSAlexaforbusinessGetConferencePreferenceRequest new] completionHandler:^(AWSAlexaforbusinessGetConferencePreferenceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetConferenceProvider {
    NSString *key = @"testGetConferenceProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getConferenceProvider:[AWSAlexaforbusinessGetConferenceProviderRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetConferenceProviderCompletionHandler {
    NSString *key = @"testGetConferenceProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getConferenceProvider:[AWSAlexaforbusinessGetConferenceProviderRequest new] completionHandler:^(AWSAlexaforbusinessGetConferenceProviderResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetContact {
    NSString *key = @"testGetContact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getContact:[AWSAlexaforbusinessGetContactRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetContactCompletionHandler {
    NSString *key = @"testGetContact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getContact:[AWSAlexaforbusinessGetContactRequest new] completionHandler:^(AWSAlexaforbusinessGetContactResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetDevice {
    NSString *key = @"testGetDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getDevice:[AWSAlexaforbusinessGetDeviceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetDeviceCompletionHandler {
    NSString *key = @"testGetDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getDevice:[AWSAlexaforbusinessGetDeviceRequest new] completionHandler:^(AWSAlexaforbusinessGetDeviceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetGateway {
    NSString *key = @"testGetGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getGateway:[AWSAlexaforbusinessGetGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetGatewayCompletionHandler {
    NSString *key = @"testGetGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getGateway:[AWSAlexaforbusinessGetGatewayRequest new] completionHandler:^(AWSAlexaforbusinessGetGatewayResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetGatewayGroup {
    NSString *key = @"testGetGatewayGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getGatewayGroup:[AWSAlexaforbusinessGetGatewayGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetGatewayGroupCompletionHandler {
    NSString *key = @"testGetGatewayGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getGatewayGroup:[AWSAlexaforbusinessGetGatewayGroupRequest new] completionHandler:^(AWSAlexaforbusinessGetGatewayGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetInvitationConfiguration {
    NSString *key = @"testGetInvitationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getInvitationConfiguration:[AWSAlexaforbusinessGetInvitationConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetInvitationConfigurationCompletionHandler {
    NSString *key = @"testGetInvitationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getInvitationConfiguration:[AWSAlexaforbusinessGetInvitationConfigurationRequest new] completionHandler:^(AWSAlexaforbusinessGetInvitationConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetNetworkProfile {
    NSString *key = @"testGetNetworkProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getNetworkProfile:[AWSAlexaforbusinessGetNetworkProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetNetworkProfileCompletionHandler {
    NSString *key = @"testGetNetworkProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getNetworkProfile:[AWSAlexaforbusinessGetNetworkProfileRequest new] completionHandler:^(AWSAlexaforbusinessGetNetworkProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetProfile {
    NSString *key = @"testGetProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getProfile:[AWSAlexaforbusinessGetProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetProfileCompletionHandler {
    NSString *key = @"testGetProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getProfile:[AWSAlexaforbusinessGetProfileRequest new] completionHandler:^(AWSAlexaforbusinessGetProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetRoom {
    NSString *key = @"testGetRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getRoom:[AWSAlexaforbusinessGetRoomRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetRoomCompletionHandler {
    NSString *key = @"testGetRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getRoom:[AWSAlexaforbusinessGetRoomRequest new] completionHandler:^(AWSAlexaforbusinessGetRoomResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetRoomSkillParameter {
    NSString *key = @"testGetRoomSkillParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getRoomSkillParameter:[AWSAlexaforbusinessGetRoomSkillParameterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetRoomSkillParameterCompletionHandler {
    NSString *key = @"testGetRoomSkillParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getRoomSkillParameter:[AWSAlexaforbusinessGetRoomSkillParameterRequest new] completionHandler:^(AWSAlexaforbusinessGetRoomSkillParameterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetSkillGroup {
    NSString *key = @"testGetSkillGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getSkillGroup:[AWSAlexaforbusinessGetSkillGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testGetSkillGroupCompletionHandler {
    NSString *key = @"testGetSkillGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] getSkillGroup:[AWSAlexaforbusinessGetSkillGroupRequest new] completionHandler:^(AWSAlexaforbusinessGetSkillGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListBusinessReportSchedules {
    NSString *key = @"testListBusinessReportSchedules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listBusinessReportSchedules:[AWSAlexaforbusinessListBusinessReportSchedulesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListBusinessReportSchedulesCompletionHandler {
    NSString *key = @"testListBusinessReportSchedules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listBusinessReportSchedules:[AWSAlexaforbusinessListBusinessReportSchedulesRequest new] completionHandler:^(AWSAlexaforbusinessListBusinessReportSchedulesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListConferenceProviders {
    NSString *key = @"testListConferenceProviders";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listConferenceProviders:[AWSAlexaforbusinessListConferenceProvidersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListConferenceProvidersCompletionHandler {
    NSString *key = @"testListConferenceProviders";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listConferenceProviders:[AWSAlexaforbusinessListConferenceProvidersRequest new] completionHandler:^(AWSAlexaforbusinessListConferenceProvidersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListDeviceEvents {
    NSString *key = @"testListDeviceEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listDeviceEvents:[AWSAlexaforbusinessListDeviceEventsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListDeviceEventsCompletionHandler {
    NSString *key = @"testListDeviceEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listDeviceEvents:[AWSAlexaforbusinessListDeviceEventsRequest new] completionHandler:^(AWSAlexaforbusinessListDeviceEventsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListGatewayGroups {
    NSString *key = @"testListGatewayGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listGatewayGroups:[AWSAlexaforbusinessListGatewayGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListGatewayGroupsCompletionHandler {
    NSString *key = @"testListGatewayGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listGatewayGroups:[AWSAlexaforbusinessListGatewayGroupsRequest new] completionHandler:^(AWSAlexaforbusinessListGatewayGroupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListGateways {
    NSString *key = @"testListGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listGateways:[AWSAlexaforbusinessListGatewaysRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListGatewaysCompletionHandler {
    NSString *key = @"testListGateways";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listGateways:[AWSAlexaforbusinessListGatewaysRequest new] completionHandler:^(AWSAlexaforbusinessListGatewaysResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListSkills {
    NSString *key = @"testListSkills";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listSkills:[AWSAlexaforbusinessListSkillsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListSkillsCompletionHandler {
    NSString *key = @"testListSkills";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listSkills:[AWSAlexaforbusinessListSkillsRequest new] completionHandler:^(AWSAlexaforbusinessListSkillsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListSkillsStoreCategories {
    NSString *key = @"testListSkillsStoreCategories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listSkillsStoreCategories:[AWSAlexaforbusinessListSkillsStoreCategoriesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListSkillsStoreCategoriesCompletionHandler {
    NSString *key = @"testListSkillsStoreCategories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listSkillsStoreCategories:[AWSAlexaforbusinessListSkillsStoreCategoriesRequest new] completionHandler:^(AWSAlexaforbusinessListSkillsStoreCategoriesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListSkillsStoreSkillsByCategory {
    NSString *key = @"testListSkillsStoreSkillsByCategory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listSkillsStoreSkillsByCategory:[AWSAlexaforbusinessListSkillsStoreSkillsByCategoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListSkillsStoreSkillsByCategoryCompletionHandler {
    NSString *key = @"testListSkillsStoreSkillsByCategory";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listSkillsStoreSkillsByCategory:[AWSAlexaforbusinessListSkillsStoreSkillsByCategoryRequest new] completionHandler:^(AWSAlexaforbusinessListSkillsStoreSkillsByCategoryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListSmartHomeAppliances {
    NSString *key = @"testListSmartHomeAppliances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listSmartHomeAppliances:[AWSAlexaforbusinessListSmartHomeAppliancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListSmartHomeAppliancesCompletionHandler {
    NSString *key = @"testListSmartHomeAppliances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listSmartHomeAppliances:[AWSAlexaforbusinessListSmartHomeAppliancesRequest new] completionHandler:^(AWSAlexaforbusinessListSmartHomeAppliancesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListTags {
    NSString *key = @"testListTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listTags:[AWSAlexaforbusinessListTagsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testListTagsCompletionHandler {
    NSString *key = @"testListTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] listTags:[AWSAlexaforbusinessListTagsRequest new] completionHandler:^(AWSAlexaforbusinessListTagsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testPutConferencePreference {
    NSString *key = @"testPutConferencePreference";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] putConferencePreference:[AWSAlexaforbusinessPutConferencePreferenceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testPutConferencePreferenceCompletionHandler {
    NSString *key = @"testPutConferencePreference";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] putConferencePreference:[AWSAlexaforbusinessPutConferencePreferenceRequest new] completionHandler:^(AWSAlexaforbusinessPutConferencePreferenceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testPutInvitationConfiguration {
    NSString *key = @"testPutInvitationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] putInvitationConfiguration:[AWSAlexaforbusinessPutInvitationConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testPutInvitationConfigurationCompletionHandler {
    NSString *key = @"testPutInvitationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] putInvitationConfiguration:[AWSAlexaforbusinessPutInvitationConfigurationRequest new] completionHandler:^(AWSAlexaforbusinessPutInvitationConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testPutRoomSkillParameter {
    NSString *key = @"testPutRoomSkillParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] putRoomSkillParameter:[AWSAlexaforbusinessPutRoomSkillParameterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testPutRoomSkillParameterCompletionHandler {
    NSString *key = @"testPutRoomSkillParameter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] putRoomSkillParameter:[AWSAlexaforbusinessPutRoomSkillParameterRequest new] completionHandler:^(AWSAlexaforbusinessPutRoomSkillParameterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testPutSkillAuthorization {
    NSString *key = @"testPutSkillAuthorization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] putSkillAuthorization:[AWSAlexaforbusinessPutSkillAuthorizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testPutSkillAuthorizationCompletionHandler {
    NSString *key = @"testPutSkillAuthorization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] putSkillAuthorization:[AWSAlexaforbusinessPutSkillAuthorizationRequest new] completionHandler:^(AWSAlexaforbusinessPutSkillAuthorizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testRegisterAVSDevice {
    NSString *key = @"testRegisterAVSDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] registerAVSDevice:[AWSAlexaforbusinessRegisterAVSDeviceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testRegisterAVSDeviceCompletionHandler {
    NSString *key = @"testRegisterAVSDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] registerAVSDevice:[AWSAlexaforbusinessRegisterAVSDeviceRequest new] completionHandler:^(AWSAlexaforbusinessRegisterAVSDeviceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testRejectSkill {
    NSString *key = @"testRejectSkill";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] rejectSkill:[AWSAlexaforbusinessRejectSkillRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testRejectSkillCompletionHandler {
    NSString *key = @"testRejectSkill";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] rejectSkill:[AWSAlexaforbusinessRejectSkillRequest new] completionHandler:^(AWSAlexaforbusinessRejectSkillResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testResolveRoom {
    NSString *key = @"testResolveRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] resolveRoom:[AWSAlexaforbusinessResolveRoomRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testResolveRoomCompletionHandler {
    NSString *key = @"testResolveRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] resolveRoom:[AWSAlexaforbusinessResolveRoomRequest new] completionHandler:^(AWSAlexaforbusinessResolveRoomResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testRevokeInvitation {
    NSString *key = @"testRevokeInvitation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] revokeInvitation:[AWSAlexaforbusinessRevokeInvitationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testRevokeInvitationCompletionHandler {
    NSString *key = @"testRevokeInvitation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] revokeInvitation:[AWSAlexaforbusinessRevokeInvitationRequest new] completionHandler:^(AWSAlexaforbusinessRevokeInvitationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchAddressBooks {
    NSString *key = @"testSearchAddressBooks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchAddressBooks:[AWSAlexaforbusinessSearchAddressBooksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchAddressBooksCompletionHandler {
    NSString *key = @"testSearchAddressBooks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchAddressBooks:[AWSAlexaforbusinessSearchAddressBooksRequest new] completionHandler:^(AWSAlexaforbusinessSearchAddressBooksResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchContacts {
    NSString *key = @"testSearchContacts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchContacts:[AWSAlexaforbusinessSearchContactsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchContactsCompletionHandler {
    NSString *key = @"testSearchContacts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchContacts:[AWSAlexaforbusinessSearchContactsRequest new] completionHandler:^(AWSAlexaforbusinessSearchContactsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchDevices {
    NSString *key = @"testSearchDevices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchDevices:[AWSAlexaforbusinessSearchDevicesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchDevicesCompletionHandler {
    NSString *key = @"testSearchDevices";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchDevices:[AWSAlexaforbusinessSearchDevicesRequest new] completionHandler:^(AWSAlexaforbusinessSearchDevicesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchNetworkProfiles {
    NSString *key = @"testSearchNetworkProfiles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchNetworkProfiles:[AWSAlexaforbusinessSearchNetworkProfilesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchNetworkProfilesCompletionHandler {
    NSString *key = @"testSearchNetworkProfiles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchNetworkProfiles:[AWSAlexaforbusinessSearchNetworkProfilesRequest new] completionHandler:^(AWSAlexaforbusinessSearchNetworkProfilesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchProfiles {
    NSString *key = @"testSearchProfiles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchProfiles:[AWSAlexaforbusinessSearchProfilesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchProfilesCompletionHandler {
    NSString *key = @"testSearchProfiles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchProfiles:[AWSAlexaforbusinessSearchProfilesRequest new] completionHandler:^(AWSAlexaforbusinessSearchProfilesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchRooms {
    NSString *key = @"testSearchRooms";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchRooms:[AWSAlexaforbusinessSearchRoomsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchRoomsCompletionHandler {
    NSString *key = @"testSearchRooms";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchRooms:[AWSAlexaforbusinessSearchRoomsRequest new] completionHandler:^(AWSAlexaforbusinessSearchRoomsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchSkillGroups {
    NSString *key = @"testSearchSkillGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchSkillGroups:[AWSAlexaforbusinessSearchSkillGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchSkillGroupsCompletionHandler {
    NSString *key = @"testSearchSkillGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchSkillGroups:[AWSAlexaforbusinessSearchSkillGroupsRequest new] completionHandler:^(AWSAlexaforbusinessSearchSkillGroupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchUsers {
    NSString *key = @"testSearchUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchUsers:[AWSAlexaforbusinessSearchUsersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSearchUsersCompletionHandler {
    NSString *key = @"testSearchUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] searchUsers:[AWSAlexaforbusinessSearchUsersRequest new] completionHandler:^(AWSAlexaforbusinessSearchUsersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSendAnnouncement {
    NSString *key = @"testSendAnnouncement";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] sendAnnouncement:[AWSAlexaforbusinessSendAnnouncementRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSendAnnouncementCompletionHandler {
    NSString *key = @"testSendAnnouncement";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] sendAnnouncement:[AWSAlexaforbusinessSendAnnouncementRequest new] completionHandler:^(AWSAlexaforbusinessSendAnnouncementResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSendInvitation {
    NSString *key = @"testSendInvitation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] sendInvitation:[AWSAlexaforbusinessSendInvitationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testSendInvitationCompletionHandler {
    NSString *key = @"testSendInvitation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] sendInvitation:[AWSAlexaforbusinessSendInvitationRequest new] completionHandler:^(AWSAlexaforbusinessSendInvitationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testStartDeviceSync {
    NSString *key = @"testStartDeviceSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] startDeviceSync:[AWSAlexaforbusinessStartDeviceSyncRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testStartDeviceSyncCompletionHandler {
    NSString *key = @"testStartDeviceSync";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] startDeviceSync:[AWSAlexaforbusinessStartDeviceSyncRequest new] completionHandler:^(AWSAlexaforbusinessStartDeviceSyncResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testStartSmartHomeApplianceDiscovery {
    NSString *key = @"testStartSmartHomeApplianceDiscovery";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] startSmartHomeApplianceDiscovery:[AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testStartSmartHomeApplianceDiscoveryCompletionHandler {
    NSString *key = @"testStartSmartHomeApplianceDiscovery";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] startSmartHomeApplianceDiscovery:[AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryRequest new] completionHandler:^(AWSAlexaforbusinessStartSmartHomeApplianceDiscoveryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] tagResource:[AWSAlexaforbusinessTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] tagResource:[AWSAlexaforbusinessTagResourceRequest new] completionHandler:^(AWSAlexaforbusinessTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] untagResource:[AWSAlexaforbusinessUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] untagResource:[AWSAlexaforbusinessUntagResourceRequest new] completionHandler:^(AWSAlexaforbusinessUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateAddressBook {
    NSString *key = @"testUpdateAddressBook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateAddressBook:[AWSAlexaforbusinessUpdateAddressBookRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateAddressBookCompletionHandler {
    NSString *key = @"testUpdateAddressBook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateAddressBook:[AWSAlexaforbusinessUpdateAddressBookRequest new] completionHandler:^(AWSAlexaforbusinessUpdateAddressBookResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateBusinessReportSchedule {
    NSString *key = @"testUpdateBusinessReportSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateBusinessReportSchedule:[AWSAlexaforbusinessUpdateBusinessReportScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateBusinessReportScheduleCompletionHandler {
    NSString *key = @"testUpdateBusinessReportSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateBusinessReportSchedule:[AWSAlexaforbusinessUpdateBusinessReportScheduleRequest new] completionHandler:^(AWSAlexaforbusinessUpdateBusinessReportScheduleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateConferenceProvider {
    NSString *key = @"testUpdateConferenceProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateConferenceProvider:[AWSAlexaforbusinessUpdateConferenceProviderRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateConferenceProviderCompletionHandler {
    NSString *key = @"testUpdateConferenceProvider";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateConferenceProvider:[AWSAlexaforbusinessUpdateConferenceProviderRequest new] completionHandler:^(AWSAlexaforbusinessUpdateConferenceProviderResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateContact {
    NSString *key = @"testUpdateContact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateContact:[AWSAlexaforbusinessUpdateContactRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateContactCompletionHandler {
    NSString *key = @"testUpdateContact";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateContact:[AWSAlexaforbusinessUpdateContactRequest new] completionHandler:^(AWSAlexaforbusinessUpdateContactResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateDevice {
    NSString *key = @"testUpdateDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateDevice:[AWSAlexaforbusinessUpdateDeviceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateDeviceCompletionHandler {
    NSString *key = @"testUpdateDevice";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateDevice:[AWSAlexaforbusinessUpdateDeviceRequest new] completionHandler:^(AWSAlexaforbusinessUpdateDeviceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateGateway {
    NSString *key = @"testUpdateGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateGateway:[AWSAlexaforbusinessUpdateGatewayRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateGatewayCompletionHandler {
    NSString *key = @"testUpdateGateway";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateGateway:[AWSAlexaforbusinessUpdateGatewayRequest new] completionHandler:^(AWSAlexaforbusinessUpdateGatewayResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateGatewayGroup {
    NSString *key = @"testUpdateGatewayGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateGatewayGroup:[AWSAlexaforbusinessUpdateGatewayGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateGatewayGroupCompletionHandler {
    NSString *key = @"testUpdateGatewayGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateGatewayGroup:[AWSAlexaforbusinessUpdateGatewayGroupRequest new] completionHandler:^(AWSAlexaforbusinessUpdateGatewayGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateNetworkProfile {
    NSString *key = @"testUpdateNetworkProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateNetworkProfile:[AWSAlexaforbusinessUpdateNetworkProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateNetworkProfileCompletionHandler {
    NSString *key = @"testUpdateNetworkProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateNetworkProfile:[AWSAlexaforbusinessUpdateNetworkProfileRequest new] completionHandler:^(AWSAlexaforbusinessUpdateNetworkProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateProfile {
    NSString *key = @"testUpdateProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateProfile:[AWSAlexaforbusinessUpdateProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateProfileCompletionHandler {
    NSString *key = @"testUpdateProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateProfile:[AWSAlexaforbusinessUpdateProfileRequest new] completionHandler:^(AWSAlexaforbusinessUpdateProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateRoom {
    NSString *key = @"testUpdateRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateRoom:[AWSAlexaforbusinessUpdateRoomRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateRoomCompletionHandler {
    NSString *key = @"testUpdateRoom";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateRoom:[AWSAlexaforbusinessUpdateRoomRequest new] completionHandler:^(AWSAlexaforbusinessUpdateRoomResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateSkillGroup {
    NSString *key = @"testUpdateSkillGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateSkillGroup:[AWSAlexaforbusinessUpdateSkillGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

- (void)testUpdateSkillGroupCompletionHandler {
    NSString *key = @"testUpdateSkillGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAlexaforbusiness registerAlexaforbusinessWithConfiguration:configuration forKey:key];

    AWSAlexaforbusiness *awsClient = [AWSAlexaforbusiness AlexaforbusinessForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAlexaforbusiness AlexaforbusinessForKey:key] updateSkillGroup:[AWSAlexaforbusinessUpdateSkillGroupRequest new] completionHandler:^(AWSAlexaforbusinessUpdateSkillGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAlexaforbusiness removeAlexaforbusinessForKey:key];
}

@end
