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
#import "AWSGuarddutyService.h"

static id mockNetworking = nil;

@interface AWSGeneralGuarddutyTests : XCTestCase

@end

@implementation AWSGeneralGuarddutyTests

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
    NSString *key = @"testGuarddutyConstructors";
    XCTAssertNotNil([AWSGuardduty defaultGuardduty]);
    XCTAssertEqual([[AWSGuardduty defaultGuardduty] class], [AWSGuardduty class]);
    XCTAssertNil([AWSGuardduty GuarddutyForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSGuardduty GuarddutyForKey:key]);
    XCTAssertEqual([[AWSGuardduty GuarddutyForKey:key] class], [AWSGuardduty class]);
    XCTAssertEqual([AWSGuardduty GuarddutyForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSGuardduty removeGuarddutyForKey:key];
    XCTAssertNil([AWSGuardduty GuarddutyForKey:key]);

}

- (void)testAcceptInvitation {
    NSString *key = @"testAcceptInvitation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] acceptInvitation:[AWSGuarddutyAcceptInvitationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testAcceptInvitationCompletionHandler {
    NSString *key = @"testAcceptInvitation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] acceptInvitation:[AWSGuarddutyAcceptInvitationRequest new] completionHandler:^(AWSGuarddutyAcceptInvitationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testArchiveFindings {
    NSString *key = @"testArchiveFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] archiveFindings:[AWSGuarddutyArchiveFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testArchiveFindingsCompletionHandler {
    NSString *key = @"testArchiveFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] archiveFindings:[AWSGuarddutyArchiveFindingsRequest new] completionHandler:^(AWSGuarddutyArchiveFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testCreateDetector {
    NSString *key = @"testCreateDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] createDetector:[AWSGuarddutyCreateDetectorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testCreateDetectorCompletionHandler {
    NSString *key = @"testCreateDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] createDetector:[AWSGuarddutyCreateDetectorRequest new] completionHandler:^(AWSGuarddutyCreateDetectorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testCreateFilter {
    NSString *key = @"testCreateFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] createFilter:[AWSGuarddutyCreateFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testCreateFilterCompletionHandler {
    NSString *key = @"testCreateFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] createFilter:[AWSGuarddutyCreateFilterRequest new] completionHandler:^(AWSGuarddutyCreateFilterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testCreateIPSet {
    NSString *key = @"testCreateIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] createIPSet:[AWSGuarddutyCreateIPSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testCreateIPSetCompletionHandler {
    NSString *key = @"testCreateIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] createIPSet:[AWSGuarddutyCreateIPSetRequest new] completionHandler:^(AWSGuarddutyCreateIPSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testCreateMembers {
    NSString *key = @"testCreateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] createMembers:[AWSGuarddutyCreateMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testCreateMembersCompletionHandler {
    NSString *key = @"testCreateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] createMembers:[AWSGuarddutyCreateMembersRequest new] completionHandler:^(AWSGuarddutyCreateMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testCreatePublishingDestination {
    NSString *key = @"testCreatePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] createPublishingDestination:[AWSGuarddutyCreatePublishingDestinationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testCreatePublishingDestinationCompletionHandler {
    NSString *key = @"testCreatePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] createPublishingDestination:[AWSGuarddutyCreatePublishingDestinationRequest new] completionHandler:^(AWSGuarddutyCreatePublishingDestinationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testCreateSampleFindings {
    NSString *key = @"testCreateSampleFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] createSampleFindings:[AWSGuarddutyCreateSampleFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testCreateSampleFindingsCompletionHandler {
    NSString *key = @"testCreateSampleFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] createSampleFindings:[AWSGuarddutyCreateSampleFindingsRequest new] completionHandler:^(AWSGuarddutyCreateSampleFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testCreateThreatIntelSet {
    NSString *key = @"testCreateThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] createThreatIntelSet:[AWSGuarddutyCreateThreatIntelSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testCreateThreatIntelSetCompletionHandler {
    NSString *key = @"testCreateThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] createThreatIntelSet:[AWSGuarddutyCreateThreatIntelSetRequest new] completionHandler:^(AWSGuarddutyCreateThreatIntelSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeclineInvitations {
    NSString *key = @"testDeclineInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] declineInvitations:[AWSGuarddutyDeclineInvitationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeclineInvitationsCompletionHandler {
    NSString *key = @"testDeclineInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] declineInvitations:[AWSGuarddutyDeclineInvitationsRequest new] completionHandler:^(AWSGuarddutyDeclineInvitationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeleteDetector {
    NSString *key = @"testDeleteDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] deleteDetector:[AWSGuarddutyDeleteDetectorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeleteDetectorCompletionHandler {
    NSString *key = @"testDeleteDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] deleteDetector:[AWSGuarddutyDeleteDetectorRequest new] completionHandler:^(AWSGuarddutyDeleteDetectorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeleteFilter {
    NSString *key = @"testDeleteFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] deleteFilter:[AWSGuarddutyDeleteFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeleteFilterCompletionHandler {
    NSString *key = @"testDeleteFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] deleteFilter:[AWSGuarddutyDeleteFilterRequest new] completionHandler:^(AWSGuarddutyDeleteFilterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeleteIPSet {
    NSString *key = @"testDeleteIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] deleteIPSet:[AWSGuarddutyDeleteIPSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeleteIPSetCompletionHandler {
    NSString *key = @"testDeleteIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] deleteIPSet:[AWSGuarddutyDeleteIPSetRequest new] completionHandler:^(AWSGuarddutyDeleteIPSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeleteInvitations {
    NSString *key = @"testDeleteInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] deleteInvitations:[AWSGuarddutyDeleteInvitationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeleteInvitationsCompletionHandler {
    NSString *key = @"testDeleteInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] deleteInvitations:[AWSGuarddutyDeleteInvitationsRequest new] completionHandler:^(AWSGuarddutyDeleteInvitationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeleteMembers {
    NSString *key = @"testDeleteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] deleteMembers:[AWSGuarddutyDeleteMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeleteMembersCompletionHandler {
    NSString *key = @"testDeleteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] deleteMembers:[AWSGuarddutyDeleteMembersRequest new] completionHandler:^(AWSGuarddutyDeleteMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeletePublishingDestination {
    NSString *key = @"testDeletePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] deletePublishingDestination:[AWSGuarddutyDeletePublishingDestinationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeletePublishingDestinationCompletionHandler {
    NSString *key = @"testDeletePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] deletePublishingDestination:[AWSGuarddutyDeletePublishingDestinationRequest new] completionHandler:^(AWSGuarddutyDeletePublishingDestinationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeleteThreatIntelSet {
    NSString *key = @"testDeleteThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] deleteThreatIntelSet:[AWSGuarddutyDeleteThreatIntelSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDeleteThreatIntelSetCompletionHandler {
    NSString *key = @"testDeleteThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] deleteThreatIntelSet:[AWSGuarddutyDeleteThreatIntelSetRequest new] completionHandler:^(AWSGuarddutyDeleteThreatIntelSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDescribeOrganizationConfiguration {
    NSString *key = @"testDescribeOrganizationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] describeOrganizationConfiguration:[AWSGuarddutyDescribeOrganizationConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDescribeOrganizationConfigurationCompletionHandler {
    NSString *key = @"testDescribeOrganizationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] describeOrganizationConfiguration:[AWSGuarddutyDescribeOrganizationConfigurationRequest new] completionHandler:^(AWSGuarddutyDescribeOrganizationConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDescribePublishingDestination {
    NSString *key = @"testDescribePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] describePublishingDestination:[AWSGuarddutyDescribePublishingDestinationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDescribePublishingDestinationCompletionHandler {
    NSString *key = @"testDescribePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] describePublishingDestination:[AWSGuarddutyDescribePublishingDestinationRequest new] completionHandler:^(AWSGuarddutyDescribePublishingDestinationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDisableOrganizationAdminAccount {
    NSString *key = @"testDisableOrganizationAdminAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] disableOrganizationAdminAccount:[AWSGuarddutyDisableOrganizationAdminAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDisableOrganizationAdminAccountCompletionHandler {
    NSString *key = @"testDisableOrganizationAdminAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] disableOrganizationAdminAccount:[AWSGuarddutyDisableOrganizationAdminAccountRequest new] completionHandler:^(AWSGuarddutyDisableOrganizationAdminAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDisassociateFromMasterAccount {
    NSString *key = @"testDisassociateFromMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] disassociateFromMasterAccount:[AWSGuarddutyDisassociateFromMasterAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDisassociateFromMasterAccountCompletionHandler {
    NSString *key = @"testDisassociateFromMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] disassociateFromMasterAccount:[AWSGuarddutyDisassociateFromMasterAccountRequest new] completionHandler:^(AWSGuarddutyDisassociateFromMasterAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDisassociateMembers {
    NSString *key = @"testDisassociateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] disassociateMembers:[AWSGuarddutyDisassociateMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testDisassociateMembersCompletionHandler {
    NSString *key = @"testDisassociateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] disassociateMembers:[AWSGuarddutyDisassociateMembersRequest new] completionHandler:^(AWSGuarddutyDisassociateMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testEnableOrganizationAdminAccount {
    NSString *key = @"testEnableOrganizationAdminAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] enableOrganizationAdminAccount:[AWSGuarddutyEnableOrganizationAdminAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testEnableOrganizationAdminAccountCompletionHandler {
    NSString *key = @"testEnableOrganizationAdminAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] enableOrganizationAdminAccount:[AWSGuarddutyEnableOrganizationAdminAccountRequest new] completionHandler:^(AWSGuarddutyEnableOrganizationAdminAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetDetector {
    NSString *key = @"testGetDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] getDetector:[AWSGuarddutyGetDetectorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetDetectorCompletionHandler {
    NSString *key = @"testGetDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] getDetector:[AWSGuarddutyGetDetectorRequest new] completionHandler:^(AWSGuarddutyGetDetectorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetFilter {
    NSString *key = @"testGetFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] getFilter:[AWSGuarddutyGetFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetFilterCompletionHandler {
    NSString *key = @"testGetFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] getFilter:[AWSGuarddutyGetFilterRequest new] completionHandler:^(AWSGuarddutyGetFilterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetFindings {
    NSString *key = @"testGetFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] getFindings:[AWSGuarddutyGetFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetFindingsCompletionHandler {
    NSString *key = @"testGetFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] getFindings:[AWSGuarddutyGetFindingsRequest new] completionHandler:^(AWSGuarddutyGetFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetFindingsStatistics {
    NSString *key = @"testGetFindingsStatistics";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] getFindingsStatistics:[AWSGuarddutyGetFindingsStatisticsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetFindingsStatisticsCompletionHandler {
    NSString *key = @"testGetFindingsStatistics";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] getFindingsStatistics:[AWSGuarddutyGetFindingsStatisticsRequest new] completionHandler:^(AWSGuarddutyGetFindingsStatisticsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetIPSet {
    NSString *key = @"testGetIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] getIPSet:[AWSGuarddutyGetIPSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetIPSetCompletionHandler {
    NSString *key = @"testGetIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] getIPSet:[AWSGuarddutyGetIPSetRequest new] completionHandler:^(AWSGuarddutyGetIPSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetInvitationsCount {
    NSString *key = @"testGetInvitationsCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] getInvitationsCount:[AWSGuarddutyGetInvitationsCountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetInvitationsCountCompletionHandler {
    NSString *key = @"testGetInvitationsCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] getInvitationsCount:[AWSGuarddutyGetInvitationsCountRequest new] completionHandler:^(AWSGuarddutyGetInvitationsCountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetMasterAccount {
    NSString *key = @"testGetMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] getMasterAccount:[AWSGuarddutyGetMasterAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetMasterAccountCompletionHandler {
    NSString *key = @"testGetMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] getMasterAccount:[AWSGuarddutyGetMasterAccountRequest new] completionHandler:^(AWSGuarddutyGetMasterAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetMembers {
    NSString *key = @"testGetMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] getMembers:[AWSGuarddutyGetMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetMembersCompletionHandler {
    NSString *key = @"testGetMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] getMembers:[AWSGuarddutyGetMembersRequest new] completionHandler:^(AWSGuarddutyGetMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetThreatIntelSet {
    NSString *key = @"testGetThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] getThreatIntelSet:[AWSGuarddutyGetThreatIntelSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testGetThreatIntelSetCompletionHandler {
    NSString *key = @"testGetThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] getThreatIntelSet:[AWSGuarddutyGetThreatIntelSetRequest new] completionHandler:^(AWSGuarddutyGetThreatIntelSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testInviteMembers {
    NSString *key = @"testInviteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] inviteMembers:[AWSGuarddutyInviteMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testInviteMembersCompletionHandler {
    NSString *key = @"testInviteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] inviteMembers:[AWSGuarddutyInviteMembersRequest new] completionHandler:^(AWSGuarddutyInviteMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListDetectors {
    NSString *key = @"testListDetectors";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] listDetectors:[AWSGuarddutyListDetectorsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListDetectorsCompletionHandler {
    NSString *key = @"testListDetectors";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] listDetectors:[AWSGuarddutyListDetectorsRequest new] completionHandler:^(AWSGuarddutyListDetectorsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListFilters {
    NSString *key = @"testListFilters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] listFilters:[AWSGuarddutyListFiltersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListFiltersCompletionHandler {
    NSString *key = @"testListFilters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] listFilters:[AWSGuarddutyListFiltersRequest new] completionHandler:^(AWSGuarddutyListFiltersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListFindings {
    NSString *key = @"testListFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] listFindings:[AWSGuarddutyListFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListFindingsCompletionHandler {
    NSString *key = @"testListFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] listFindings:[AWSGuarddutyListFindingsRequest new] completionHandler:^(AWSGuarddutyListFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListIPSets {
    NSString *key = @"testListIPSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] listIPSets:[AWSGuarddutyListIPSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListIPSetsCompletionHandler {
    NSString *key = @"testListIPSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] listIPSets:[AWSGuarddutyListIPSetsRequest new] completionHandler:^(AWSGuarddutyListIPSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListInvitations {
    NSString *key = @"testListInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] listInvitations:[AWSGuarddutyListInvitationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListInvitationsCompletionHandler {
    NSString *key = @"testListInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] listInvitations:[AWSGuarddutyListInvitationsRequest new] completionHandler:^(AWSGuarddutyListInvitationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListMembers {
    NSString *key = @"testListMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] listMembers:[AWSGuarddutyListMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListMembersCompletionHandler {
    NSString *key = @"testListMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] listMembers:[AWSGuarddutyListMembersRequest new] completionHandler:^(AWSGuarddutyListMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListOrganizationAdminAccounts {
    NSString *key = @"testListOrganizationAdminAccounts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] listOrganizationAdminAccounts:[AWSGuarddutyListOrganizationAdminAccountsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListOrganizationAdminAccountsCompletionHandler {
    NSString *key = @"testListOrganizationAdminAccounts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] listOrganizationAdminAccounts:[AWSGuarddutyListOrganizationAdminAccountsRequest new] completionHandler:^(AWSGuarddutyListOrganizationAdminAccountsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListPublishingDestinations {
    NSString *key = @"testListPublishingDestinations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] listPublishingDestinations:[AWSGuarddutyListPublishingDestinationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListPublishingDestinationsCompletionHandler {
    NSString *key = @"testListPublishingDestinations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] listPublishingDestinations:[AWSGuarddutyListPublishingDestinationsRequest new] completionHandler:^(AWSGuarddutyListPublishingDestinationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] listTagsForResource:[AWSGuarddutyListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] listTagsForResource:[AWSGuarddutyListTagsForResourceRequest new] completionHandler:^(AWSGuarddutyListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListThreatIntelSets {
    NSString *key = @"testListThreatIntelSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] listThreatIntelSets:[AWSGuarddutyListThreatIntelSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testListThreatIntelSetsCompletionHandler {
    NSString *key = @"testListThreatIntelSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] listThreatIntelSets:[AWSGuarddutyListThreatIntelSetsRequest new] completionHandler:^(AWSGuarddutyListThreatIntelSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testStartMonitoringMembers {
    NSString *key = @"testStartMonitoringMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] startMonitoringMembers:[AWSGuarddutyStartMonitoringMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testStartMonitoringMembersCompletionHandler {
    NSString *key = @"testStartMonitoringMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] startMonitoringMembers:[AWSGuarddutyStartMonitoringMembersRequest new] completionHandler:^(AWSGuarddutyStartMonitoringMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testStopMonitoringMembers {
    NSString *key = @"testStopMonitoringMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] stopMonitoringMembers:[AWSGuarddutyStopMonitoringMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testStopMonitoringMembersCompletionHandler {
    NSString *key = @"testStopMonitoringMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] stopMonitoringMembers:[AWSGuarddutyStopMonitoringMembersRequest new] completionHandler:^(AWSGuarddutyStopMonitoringMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] tagResource:[AWSGuarddutyTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] tagResource:[AWSGuarddutyTagResourceRequest new] completionHandler:^(AWSGuarddutyTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUnarchiveFindings {
    NSString *key = @"testUnarchiveFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] unarchiveFindings:[AWSGuarddutyUnarchiveFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUnarchiveFindingsCompletionHandler {
    NSString *key = @"testUnarchiveFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] unarchiveFindings:[AWSGuarddutyUnarchiveFindingsRequest new] completionHandler:^(AWSGuarddutyUnarchiveFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] untagResource:[AWSGuarddutyUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] untagResource:[AWSGuarddutyUntagResourceRequest new] completionHandler:^(AWSGuarddutyUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUpdateDetector {
    NSString *key = @"testUpdateDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] updateDetector:[AWSGuarddutyUpdateDetectorRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUpdateDetectorCompletionHandler {
    NSString *key = @"testUpdateDetector";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] updateDetector:[AWSGuarddutyUpdateDetectorRequest new] completionHandler:^(AWSGuarddutyUpdateDetectorResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUpdateFilter {
    NSString *key = @"testUpdateFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] updateFilter:[AWSGuarddutyUpdateFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUpdateFilterCompletionHandler {
    NSString *key = @"testUpdateFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] updateFilter:[AWSGuarddutyUpdateFilterRequest new] completionHandler:^(AWSGuarddutyUpdateFilterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUpdateFindingsFeedback {
    NSString *key = @"testUpdateFindingsFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] updateFindingsFeedback:[AWSGuarddutyUpdateFindingsFeedbackRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUpdateFindingsFeedbackCompletionHandler {
    NSString *key = @"testUpdateFindingsFeedback";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] updateFindingsFeedback:[AWSGuarddutyUpdateFindingsFeedbackRequest new] completionHandler:^(AWSGuarddutyUpdateFindingsFeedbackResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUpdateIPSet {
    NSString *key = @"testUpdateIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] updateIPSet:[AWSGuarddutyUpdateIPSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUpdateIPSetCompletionHandler {
    NSString *key = @"testUpdateIPSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] updateIPSet:[AWSGuarddutyUpdateIPSetRequest new] completionHandler:^(AWSGuarddutyUpdateIPSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUpdateOrganizationConfiguration {
    NSString *key = @"testUpdateOrganizationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] updateOrganizationConfiguration:[AWSGuarddutyUpdateOrganizationConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUpdateOrganizationConfigurationCompletionHandler {
    NSString *key = @"testUpdateOrganizationConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] updateOrganizationConfiguration:[AWSGuarddutyUpdateOrganizationConfigurationRequest new] completionHandler:^(AWSGuarddutyUpdateOrganizationConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUpdatePublishingDestination {
    NSString *key = @"testUpdatePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] updatePublishingDestination:[AWSGuarddutyUpdatePublishingDestinationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUpdatePublishingDestinationCompletionHandler {
    NSString *key = @"testUpdatePublishingDestination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] updatePublishingDestination:[AWSGuarddutyUpdatePublishingDestinationRequest new] completionHandler:^(AWSGuarddutyUpdatePublishingDestinationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUpdateThreatIntelSet {
    NSString *key = @"testUpdateThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSGuardduty GuarddutyForKey:key] updateThreatIntelSet:[AWSGuarddutyUpdateThreatIntelSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

- (void)testUpdateThreatIntelSetCompletionHandler {
    NSString *key = @"testUpdateThreatIntelSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSGuardduty registerGuarddutyWithConfiguration:configuration forKey:key];

    AWSGuardduty *awsClient = [AWSGuardduty GuarddutyForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSGuardduty GuarddutyForKey:key] updateThreatIntelSet:[AWSGuarddutyUpdateThreatIntelSetRequest new] completionHandler:^(AWSGuarddutyUpdateThreatIntelSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSGuardduty removeGuarddutyForKey:key];
}

@end
