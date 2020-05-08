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
#import "AWSGuardDutyService.h"

static id mockNetworking = nil;

@interface AWSGeneralGuardDutyTests : XCTestCase

@end

@implementation AWSGeneralGuardDutyTests

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
    NSString *key = @"testGuardDutyConstructors";
    XCTAssertNotNil([AWSGuardDuty defaultGuardDuty]);
    XCTAssertEqual([[AWSGuardDuty defaultGuardDuty] class], [AWSGuardDuty class]);
    XCTAssertNil([AWSGuardDuty GuardDutyForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSGuardDuty GuardDutyForKey:key]);
    XCTAssertEqual([[AWSGuardDuty GuardDutyForKey:key] class], [AWSGuardDuty class]);
    XCTAssertEqual([AWSGuardDuty GuardDutyForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSGuardDuty removeGuardDutyForKey:key];
    XCTAssertNil([AWSGuardDuty GuardDutyForKey:key]);

}

- (void)testAcceptInvitation {
    NSString *key = @"testAcceptInvitation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] acceptInvitation:[AWSGuardDutyAcceptInvitationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testAcceptInvitationCompletionHandler {
    NSString *key = @"testAcceptInvitation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] acceptInvitation:[AWSGuardDutyAcceptInvitationRequest new] completionHandler:^(AWSGuardDutyAcceptInvitationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testArchiveFindings {
    NSString *key = @"testArchiveFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] archiveFindings:[AWSGuardDutyArchiveFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testArchiveFindingsCompletionHandler {
    NSString *key = @"testArchiveFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] archiveFindings:[AWSGuardDutyArchiveFindingsRequest new] completionHandler:^(AWSGuardDutyArchiveFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testCreateDetector {
    NSString *key = @"testCreateDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] createDetector:[AWSGuardDutyCreateDetectorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testCreateDetectorCompletionHandler {
    NSString *key = @"testCreateDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] createDetector:[AWSGuardDutyCreateDetectorRequest new] completionHandler:^(AWSGuardDutyCreateDetectorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testCreateFilter {
    NSString *key = @"testCreateFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] createFilter:[AWSGuardDutyCreateFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testCreateFilterCompletionHandler {
    NSString *key = @"testCreateFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] createFilter:[AWSGuardDutyCreateFilterRequest new] completionHandler:^(AWSGuardDutyCreateFilterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testCreateIPSet {
    NSString *key = @"testCreateIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] createIPSet:[AWSGuardDutyCreateIPSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testCreateIPSetCompletionHandler {
    NSString *key = @"testCreateIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] createIPSet:[AWSGuardDutyCreateIPSetRequest new] completionHandler:^(AWSGuardDutyCreateIPSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testCreateMembers {
    NSString *key = @"testCreateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] createMembers:[AWSGuardDutyCreateMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testCreateMembersCompletionHandler {
    NSString *key = @"testCreateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] createMembers:[AWSGuardDutyCreateMembersRequest new] completionHandler:^(AWSGuardDutyCreateMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testCreatePublishingDestination {
    NSString *key = @"testCreatePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] createPublishingDestination:[AWSGuardDutyCreatePublishingDestinationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testCreatePublishingDestinationCompletionHandler {
    NSString *key = @"testCreatePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] createPublishingDestination:[AWSGuardDutyCreatePublishingDestinationRequest new] completionHandler:^(AWSGuardDutyCreatePublishingDestinationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testCreateSampleFindings {
    NSString *key = @"testCreateSampleFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] createSampleFindings:[AWSGuardDutyCreateSampleFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testCreateSampleFindingsCompletionHandler {
    NSString *key = @"testCreateSampleFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] createSampleFindings:[AWSGuardDutyCreateSampleFindingsRequest new] completionHandler:^(AWSGuardDutyCreateSampleFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testCreateThreatIntelSet {
    NSString *key = @"testCreateThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] createThreatIntelSet:[AWSGuardDutyCreateThreatIntelSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testCreateThreatIntelSetCompletionHandler {
    NSString *key = @"testCreateThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] createThreatIntelSet:[AWSGuardDutyCreateThreatIntelSetRequest new] completionHandler:^(AWSGuardDutyCreateThreatIntelSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeclineInvitations {
    NSString *key = @"testDeclineInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] declineInvitations:[AWSGuardDutyDeclineInvitationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeclineInvitationsCompletionHandler {
    NSString *key = @"testDeclineInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] declineInvitations:[AWSGuardDutyDeclineInvitationsRequest new] completionHandler:^(AWSGuardDutyDeclineInvitationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeleteDetector {
    NSString *key = @"testDeleteDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] deleteDetector:[AWSGuardDutyDeleteDetectorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeleteDetectorCompletionHandler {
    NSString *key = @"testDeleteDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] deleteDetector:[AWSGuardDutyDeleteDetectorRequest new] completionHandler:^(AWSGuardDutyDeleteDetectorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeleteFilter {
    NSString *key = @"testDeleteFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] deleteFilter:[AWSGuardDutyDeleteFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeleteFilterCompletionHandler {
    NSString *key = @"testDeleteFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] deleteFilter:[AWSGuardDutyDeleteFilterRequest new] completionHandler:^(AWSGuardDutyDeleteFilterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeleteIPSet {
    NSString *key = @"testDeleteIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] deleteIPSet:[AWSGuardDutyDeleteIPSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeleteIPSetCompletionHandler {
    NSString *key = @"testDeleteIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] deleteIPSet:[AWSGuardDutyDeleteIPSetRequest new] completionHandler:^(AWSGuardDutyDeleteIPSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeleteInvitations {
    NSString *key = @"testDeleteInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] deleteInvitations:[AWSGuardDutyDeleteInvitationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeleteInvitationsCompletionHandler {
    NSString *key = @"testDeleteInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] deleteInvitations:[AWSGuardDutyDeleteInvitationsRequest new] completionHandler:^(AWSGuardDutyDeleteInvitationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeleteMembers {
    NSString *key = @"testDeleteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] deleteMembers:[AWSGuardDutyDeleteMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeleteMembersCompletionHandler {
    NSString *key = @"testDeleteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] deleteMembers:[AWSGuardDutyDeleteMembersRequest new] completionHandler:^(AWSGuardDutyDeleteMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeletePublishingDestination {
    NSString *key = @"testDeletePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] deletePublishingDestination:[AWSGuardDutyDeletePublishingDestinationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeletePublishingDestinationCompletionHandler {
    NSString *key = @"testDeletePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] deletePublishingDestination:[AWSGuardDutyDeletePublishingDestinationRequest new] completionHandler:^(AWSGuardDutyDeletePublishingDestinationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeleteThreatIntelSet {
    NSString *key = @"testDeleteThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] deleteThreatIntelSet:[AWSGuardDutyDeleteThreatIntelSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDeleteThreatIntelSetCompletionHandler {
    NSString *key = @"testDeleteThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] deleteThreatIntelSet:[AWSGuardDutyDeleteThreatIntelSetRequest new] completionHandler:^(AWSGuardDutyDeleteThreatIntelSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDescribeOrganizationConfiguration {
    NSString *key = @"testDescribeOrganizationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] describeOrganizationConfiguration:[AWSGuardDutyDescribeOrganizationConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDescribeOrganizationConfigurationCompletionHandler {
    NSString *key = @"testDescribeOrganizationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] describeOrganizationConfiguration:[AWSGuardDutyDescribeOrganizationConfigurationRequest new] completionHandler:^(AWSGuardDutyDescribeOrganizationConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDescribePublishingDestination {
    NSString *key = @"testDescribePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] describePublishingDestination:[AWSGuardDutyDescribePublishingDestinationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDescribePublishingDestinationCompletionHandler {
    NSString *key = @"testDescribePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] describePublishingDestination:[AWSGuardDutyDescribePublishingDestinationRequest new] completionHandler:^(AWSGuardDutyDescribePublishingDestinationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDisableOrganizationAdminAccount {
    NSString *key = @"testDisableOrganizationAdminAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] disableOrganizationAdminAccount:[AWSGuardDutyDisableOrganizationAdminAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDisableOrganizationAdminAccountCompletionHandler {
    NSString *key = @"testDisableOrganizationAdminAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] disableOrganizationAdminAccount:[AWSGuardDutyDisableOrganizationAdminAccountRequest new] completionHandler:^(AWSGuardDutyDisableOrganizationAdminAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDisassociateFromMasterAccount {
    NSString *key = @"testDisassociateFromMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] disassociateFromMasterAccount:[AWSGuardDutyDisassociateFromMasterAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDisassociateFromMasterAccountCompletionHandler {
    NSString *key = @"testDisassociateFromMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] disassociateFromMasterAccount:[AWSGuardDutyDisassociateFromMasterAccountRequest new] completionHandler:^(AWSGuardDutyDisassociateFromMasterAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDisassociateMembers {
    NSString *key = @"testDisassociateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] disassociateMembers:[AWSGuardDutyDisassociateMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testDisassociateMembersCompletionHandler {
    NSString *key = @"testDisassociateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] disassociateMembers:[AWSGuardDutyDisassociateMembersRequest new] completionHandler:^(AWSGuardDutyDisassociateMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testEnableOrganizationAdminAccount {
    NSString *key = @"testEnableOrganizationAdminAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] enableOrganizationAdminAccount:[AWSGuardDutyEnableOrganizationAdminAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testEnableOrganizationAdminAccountCompletionHandler {
    NSString *key = @"testEnableOrganizationAdminAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] enableOrganizationAdminAccount:[AWSGuardDutyEnableOrganizationAdminAccountRequest new] completionHandler:^(AWSGuardDutyEnableOrganizationAdminAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetDetector {
    NSString *key = @"testGetDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] getDetector:[AWSGuardDutyGetDetectorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetDetectorCompletionHandler {
    NSString *key = @"testGetDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] getDetector:[AWSGuardDutyGetDetectorRequest new] completionHandler:^(AWSGuardDutyGetDetectorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetFilter {
    NSString *key = @"testGetFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] getFilter:[AWSGuardDutyGetFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetFilterCompletionHandler {
    NSString *key = @"testGetFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] getFilter:[AWSGuardDutyGetFilterRequest new] completionHandler:^(AWSGuardDutyGetFilterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetFindings {
    NSString *key = @"testGetFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] getFindings:[AWSGuardDutyGetFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetFindingsCompletionHandler {
    NSString *key = @"testGetFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] getFindings:[AWSGuardDutyGetFindingsRequest new] completionHandler:^(AWSGuardDutyGetFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetFindingsStatistics {
    NSString *key = @"testGetFindingsStatistics";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] getFindingsStatistics:[AWSGuardDutyGetFindingsStatisticsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetFindingsStatisticsCompletionHandler {
    NSString *key = @"testGetFindingsStatistics";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] getFindingsStatistics:[AWSGuardDutyGetFindingsStatisticsRequest new] completionHandler:^(AWSGuardDutyGetFindingsStatisticsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetIPSet {
    NSString *key = @"testGetIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] getIPSet:[AWSGuardDutyGetIPSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetIPSetCompletionHandler {
    NSString *key = @"testGetIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] getIPSet:[AWSGuardDutyGetIPSetRequest new] completionHandler:^(AWSGuardDutyGetIPSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetInvitationsCount {
    NSString *key = @"testGetInvitationsCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] getInvitationsCount:[AWSGuardDutyGetInvitationsCountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetInvitationsCountCompletionHandler {
    NSString *key = @"testGetInvitationsCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] getInvitationsCount:[AWSGuardDutyGetInvitationsCountRequest new] completionHandler:^(AWSGuardDutyGetInvitationsCountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetMasterAccount {
    NSString *key = @"testGetMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] getMasterAccount:[AWSGuardDutyGetMasterAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetMasterAccountCompletionHandler {
    NSString *key = @"testGetMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] getMasterAccount:[AWSGuardDutyGetMasterAccountRequest new] completionHandler:^(AWSGuardDutyGetMasterAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetMembers {
    NSString *key = @"testGetMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] getMembers:[AWSGuardDutyGetMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetMembersCompletionHandler {
    NSString *key = @"testGetMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] getMembers:[AWSGuardDutyGetMembersRequest new] completionHandler:^(AWSGuardDutyGetMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetThreatIntelSet {
    NSString *key = @"testGetThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] getThreatIntelSet:[AWSGuardDutyGetThreatIntelSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testGetThreatIntelSetCompletionHandler {
    NSString *key = @"testGetThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] getThreatIntelSet:[AWSGuardDutyGetThreatIntelSetRequest new] completionHandler:^(AWSGuardDutyGetThreatIntelSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testInviteMembers {
    NSString *key = @"testInviteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] inviteMembers:[AWSGuardDutyInviteMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testInviteMembersCompletionHandler {
    NSString *key = @"testInviteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] inviteMembers:[AWSGuardDutyInviteMembersRequest new] completionHandler:^(AWSGuardDutyInviteMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListDetectors {
    NSString *key = @"testListDetectors";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] listDetectors:[AWSGuardDutyListDetectorsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListDetectorsCompletionHandler {
    NSString *key = @"testListDetectors";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] listDetectors:[AWSGuardDutyListDetectorsRequest new] completionHandler:^(AWSGuardDutyListDetectorsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListFilters {
    NSString *key = @"testListFilters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] listFilters:[AWSGuardDutyListFiltersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListFiltersCompletionHandler {
    NSString *key = @"testListFilters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] listFilters:[AWSGuardDutyListFiltersRequest new] completionHandler:^(AWSGuardDutyListFiltersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListFindings {
    NSString *key = @"testListFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] listFindings:[AWSGuardDutyListFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListFindingsCompletionHandler {
    NSString *key = @"testListFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] listFindings:[AWSGuardDutyListFindingsRequest new] completionHandler:^(AWSGuardDutyListFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListIPSets {
    NSString *key = @"testListIPSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] listIPSets:[AWSGuardDutyListIPSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListIPSetsCompletionHandler {
    NSString *key = @"testListIPSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] listIPSets:[AWSGuardDutyListIPSetsRequest new] completionHandler:^(AWSGuardDutyListIPSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListInvitations {
    NSString *key = @"testListInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] listInvitations:[AWSGuardDutyListInvitationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListInvitationsCompletionHandler {
    NSString *key = @"testListInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] listInvitations:[AWSGuardDutyListInvitationsRequest new] completionHandler:^(AWSGuardDutyListInvitationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListMembers {
    NSString *key = @"testListMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] listMembers:[AWSGuardDutyListMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListMembersCompletionHandler {
    NSString *key = @"testListMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] listMembers:[AWSGuardDutyListMembersRequest new] completionHandler:^(AWSGuardDutyListMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListOrganizationAdminAccounts {
    NSString *key = @"testListOrganizationAdminAccounts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] listOrganizationAdminAccounts:[AWSGuardDutyListOrganizationAdminAccountsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListOrganizationAdminAccountsCompletionHandler {
    NSString *key = @"testListOrganizationAdminAccounts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] listOrganizationAdminAccounts:[AWSGuardDutyListOrganizationAdminAccountsRequest new] completionHandler:^(AWSGuardDutyListOrganizationAdminAccountsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListPublishingDestinations {
    NSString *key = @"testListPublishingDestinations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] listPublishingDestinations:[AWSGuardDutyListPublishingDestinationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListPublishingDestinationsCompletionHandler {
    NSString *key = @"testListPublishingDestinations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] listPublishingDestinations:[AWSGuardDutyListPublishingDestinationsRequest new] completionHandler:^(AWSGuardDutyListPublishingDestinationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] listTagsForResource:[AWSGuardDutyListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] listTagsForResource:[AWSGuardDutyListTagsForResourceRequest new] completionHandler:^(AWSGuardDutyListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListThreatIntelSets {
    NSString *key = @"testListThreatIntelSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] listThreatIntelSets:[AWSGuardDutyListThreatIntelSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testListThreatIntelSetsCompletionHandler {
    NSString *key = @"testListThreatIntelSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] listThreatIntelSets:[AWSGuardDutyListThreatIntelSetsRequest new] completionHandler:^(AWSGuardDutyListThreatIntelSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testStartMonitoringMembers {
    NSString *key = @"testStartMonitoringMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] startMonitoringMembers:[AWSGuardDutyStartMonitoringMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testStartMonitoringMembersCompletionHandler {
    NSString *key = @"testStartMonitoringMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] startMonitoringMembers:[AWSGuardDutyStartMonitoringMembersRequest new] completionHandler:^(AWSGuardDutyStartMonitoringMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testStopMonitoringMembers {
    NSString *key = @"testStopMonitoringMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] stopMonitoringMembers:[AWSGuardDutyStopMonitoringMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testStopMonitoringMembersCompletionHandler {
    NSString *key = @"testStopMonitoringMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] stopMonitoringMembers:[AWSGuardDutyStopMonitoringMembersRequest new] completionHandler:^(AWSGuardDutyStopMonitoringMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] tagResource:[AWSGuardDutyTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] tagResource:[AWSGuardDutyTagResourceRequest new] completionHandler:^(AWSGuardDutyTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUnarchiveFindings {
    NSString *key = @"testUnarchiveFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] unarchiveFindings:[AWSGuardDutyUnarchiveFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUnarchiveFindingsCompletionHandler {
    NSString *key = @"testUnarchiveFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] unarchiveFindings:[AWSGuardDutyUnarchiveFindingsRequest new] completionHandler:^(AWSGuardDutyUnarchiveFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] untagResource:[AWSGuardDutyUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] untagResource:[AWSGuardDutyUntagResourceRequest new] completionHandler:^(AWSGuardDutyUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUpdateDetector {
    NSString *key = @"testUpdateDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] updateDetector:[AWSGuardDutyUpdateDetectorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUpdateDetectorCompletionHandler {
    NSString *key = @"testUpdateDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] updateDetector:[AWSGuardDutyUpdateDetectorRequest new] completionHandler:^(AWSGuardDutyUpdateDetectorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUpdateFilter {
    NSString *key = @"testUpdateFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] updateFilter:[AWSGuardDutyUpdateFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUpdateFilterCompletionHandler {
    NSString *key = @"testUpdateFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] updateFilter:[AWSGuardDutyUpdateFilterRequest new] completionHandler:^(AWSGuardDutyUpdateFilterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUpdateFindingsFeedback {
    NSString *key = @"testUpdateFindingsFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] updateFindingsFeedback:[AWSGuardDutyUpdateFindingsFeedbackRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUpdateFindingsFeedbackCompletionHandler {
    NSString *key = @"testUpdateFindingsFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] updateFindingsFeedback:[AWSGuardDutyUpdateFindingsFeedbackRequest new] completionHandler:^(AWSGuardDutyUpdateFindingsFeedbackResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUpdateIPSet {
    NSString *key = @"testUpdateIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] updateIPSet:[AWSGuardDutyUpdateIPSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUpdateIPSetCompletionHandler {
    NSString *key = @"testUpdateIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] updateIPSet:[AWSGuardDutyUpdateIPSetRequest new] completionHandler:^(AWSGuardDutyUpdateIPSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUpdateOrganizationConfiguration {
    NSString *key = @"testUpdateOrganizationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] updateOrganizationConfiguration:[AWSGuardDutyUpdateOrganizationConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUpdateOrganizationConfigurationCompletionHandler {
    NSString *key = @"testUpdateOrganizationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] updateOrganizationConfiguration:[AWSGuardDutyUpdateOrganizationConfigurationRequest new] completionHandler:^(AWSGuardDutyUpdateOrganizationConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUpdatePublishingDestination {
    NSString *key = @"testUpdatePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] updatePublishingDestination:[AWSGuardDutyUpdatePublishingDestinationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUpdatePublishingDestinationCompletionHandler {
    NSString *key = @"testUpdatePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] updatePublishingDestination:[AWSGuardDutyUpdatePublishingDestinationRequest new] completionHandler:^(AWSGuardDutyUpdatePublishingDestinationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUpdateThreatIntelSet {
    NSString *key = @"testUpdateThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardDuty GuardDutyForKey:key] updateThreatIntelSet:[AWSGuardDutyUpdateThreatIntelSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

- (void)testUpdateThreatIntelSetCompletionHandler {
    NSString *key = @"testUpdateThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardDuty registerGuardDutyWithConfiguration:configuration forKey:key];

    AWSGuardDuty *awsClient = [AWSGuardDuty GuardDutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardDuty GuardDutyForKey:key] updateThreatIntelSet:[AWSGuardDutyUpdateThreatIntelSetRequest new] completionHandler:^(AWSGuardDutyUpdateThreatIntelSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardDuty removeGuardDutyForKey:key];
}

@end
