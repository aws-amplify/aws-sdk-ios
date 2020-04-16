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
#import "AWSsecurityhubService.h"

static id mockNetworking = nil;

@interface AWSGeneralsecurityhubTests : XCTestCase

@end

@implementation AWSGeneralsecurityhubTests

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
    NSString *key = @"testsecurityhubConstructors";
    XCTAssertNotNil([AWSsecurityhub defaultsecurityhub]);
    XCTAssertEqual([[AWSsecurityhub defaultsecurityhub] class], [AWSsecurityhub class]);
    XCTAssertNil([AWSsecurityhub securityhubForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSsecurityhub securityhubForKey:key]);
    XCTAssertEqual([[AWSsecurityhub securityhubForKey:key] class], [AWSsecurityhub class]);
    XCTAssertEqual([AWSsecurityhub securityhubForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSsecurityhub removesecurityhubForKey:key];
    XCTAssertNil([AWSsecurityhub securityhubForKey:key]);

}

- (void)testAcceptInvitation {
    NSString *key = @"testAcceptInvitation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] acceptInvitation:[AWSsecurityhubAcceptInvitationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testAcceptInvitationCompletionHandler {
    NSString *key = @"testAcceptInvitation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] acceptInvitation:[AWSsecurityhubAcceptInvitationRequest new] completionHandler:^(AWSsecurityhubAcceptInvitationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testBatchDisableStandards {
    NSString *key = @"testBatchDisableStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] batchDisableStandards:[AWSsecurityhubBatchDisableStandardsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testBatchDisableStandardsCompletionHandler {
    NSString *key = @"testBatchDisableStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] batchDisableStandards:[AWSsecurityhubBatchDisableStandardsRequest new] completionHandler:^(AWSsecurityhubBatchDisableStandardsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testBatchEnableStandards {
    NSString *key = @"testBatchEnableStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] batchEnableStandards:[AWSsecurityhubBatchEnableStandardsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testBatchEnableStandardsCompletionHandler {
    NSString *key = @"testBatchEnableStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] batchEnableStandards:[AWSsecurityhubBatchEnableStandardsRequest new] completionHandler:^(AWSsecurityhubBatchEnableStandardsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testBatchImportFindings {
    NSString *key = @"testBatchImportFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] batchImportFindings:[AWSsecurityhubBatchImportFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testBatchImportFindingsCompletionHandler {
    NSString *key = @"testBatchImportFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] batchImportFindings:[AWSsecurityhubBatchImportFindingsRequest new] completionHandler:^(AWSsecurityhubBatchImportFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testBatchUpdateFindings {
    NSString *key = @"testBatchUpdateFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] batchUpdateFindings:[AWSsecurityhubBatchUpdateFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testBatchUpdateFindingsCompletionHandler {
    NSString *key = @"testBatchUpdateFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] batchUpdateFindings:[AWSsecurityhubBatchUpdateFindingsRequest new] completionHandler:^(AWSsecurityhubBatchUpdateFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testCreateActionTarget {
    NSString *key = @"testCreateActionTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] createActionTarget:[AWSsecurityhubCreateActionTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testCreateActionTargetCompletionHandler {
    NSString *key = @"testCreateActionTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] createActionTarget:[AWSsecurityhubCreateActionTargetRequest new] completionHandler:^(AWSsecurityhubCreateActionTargetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testCreateInsight {
    NSString *key = @"testCreateInsight";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] createInsight:[AWSsecurityhubCreateInsightRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testCreateInsightCompletionHandler {
    NSString *key = @"testCreateInsight";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] createInsight:[AWSsecurityhubCreateInsightRequest new] completionHandler:^(AWSsecurityhubCreateInsightResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testCreateMembers {
    NSString *key = @"testCreateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] createMembers:[AWSsecurityhubCreateMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testCreateMembersCompletionHandler {
    NSString *key = @"testCreateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] createMembers:[AWSsecurityhubCreateMembersRequest new] completionHandler:^(AWSsecurityhubCreateMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDeclineInvitations {
    NSString *key = @"testDeclineInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] declineInvitations:[AWSsecurityhubDeclineInvitationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDeclineInvitationsCompletionHandler {
    NSString *key = @"testDeclineInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] declineInvitations:[AWSsecurityhubDeclineInvitationsRequest new] completionHandler:^(AWSsecurityhubDeclineInvitationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDeleteActionTarget {
    NSString *key = @"testDeleteActionTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] deleteActionTarget:[AWSsecurityhubDeleteActionTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDeleteActionTargetCompletionHandler {
    NSString *key = @"testDeleteActionTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] deleteActionTarget:[AWSsecurityhubDeleteActionTargetRequest new] completionHandler:^(AWSsecurityhubDeleteActionTargetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDeleteInsight {
    NSString *key = @"testDeleteInsight";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] deleteInsight:[AWSsecurityhubDeleteInsightRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDeleteInsightCompletionHandler {
    NSString *key = @"testDeleteInsight";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] deleteInsight:[AWSsecurityhubDeleteInsightRequest new] completionHandler:^(AWSsecurityhubDeleteInsightResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDeleteInvitations {
    NSString *key = @"testDeleteInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] deleteInvitations:[AWSsecurityhubDeleteInvitationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDeleteInvitationsCompletionHandler {
    NSString *key = @"testDeleteInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] deleteInvitations:[AWSsecurityhubDeleteInvitationsRequest new] completionHandler:^(AWSsecurityhubDeleteInvitationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDeleteMembers {
    NSString *key = @"testDeleteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] deleteMembers:[AWSsecurityhubDeleteMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDeleteMembersCompletionHandler {
    NSString *key = @"testDeleteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] deleteMembers:[AWSsecurityhubDeleteMembersRequest new] completionHandler:^(AWSsecurityhubDeleteMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDescribeActionTargets {
    NSString *key = @"testDescribeActionTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] describeActionTargets:[AWSsecurityhubDescribeActionTargetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDescribeActionTargetsCompletionHandler {
    NSString *key = @"testDescribeActionTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] describeActionTargets:[AWSsecurityhubDescribeActionTargetsRequest new] completionHandler:^(AWSsecurityhubDescribeActionTargetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDescribeHub {
    NSString *key = @"testDescribeHub";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] describeHub:[AWSsecurityhubDescribeHubRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDescribeHubCompletionHandler {
    NSString *key = @"testDescribeHub";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] describeHub:[AWSsecurityhubDescribeHubRequest new] completionHandler:^(AWSsecurityhubDescribeHubResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDescribeProducts {
    NSString *key = @"testDescribeProducts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] describeProducts:[AWSsecurityhubDescribeProductsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDescribeProductsCompletionHandler {
    NSString *key = @"testDescribeProducts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] describeProducts:[AWSsecurityhubDescribeProductsRequest new] completionHandler:^(AWSsecurityhubDescribeProductsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDescribeStandards {
    NSString *key = @"testDescribeStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] describeStandards:[AWSsecurityhubDescribeStandardsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDescribeStandardsCompletionHandler {
    NSString *key = @"testDescribeStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] describeStandards:[AWSsecurityhubDescribeStandardsRequest new] completionHandler:^(AWSsecurityhubDescribeStandardsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDescribeStandardsControls {
    NSString *key = @"testDescribeStandardsControls";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] describeStandardsControls:[AWSsecurityhubDescribeStandardsControlsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDescribeStandardsControlsCompletionHandler {
    NSString *key = @"testDescribeStandardsControls";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] describeStandardsControls:[AWSsecurityhubDescribeStandardsControlsRequest new] completionHandler:^(AWSsecurityhubDescribeStandardsControlsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDisableImportFindingsForProduct {
    NSString *key = @"testDisableImportFindingsForProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] disableImportFindingsForProduct:[AWSsecurityhubDisableImportFindingsForProductRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDisableImportFindingsForProductCompletionHandler {
    NSString *key = @"testDisableImportFindingsForProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] disableImportFindingsForProduct:[AWSsecurityhubDisableImportFindingsForProductRequest new] completionHandler:^(AWSsecurityhubDisableImportFindingsForProductResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDisableSecurityHub {
    NSString *key = @"testDisableSecurityHub";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] disableSecurityHub:[AWSsecurityhubDisableSecurityHubRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDisableSecurityHubCompletionHandler {
    NSString *key = @"testDisableSecurityHub";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] disableSecurityHub:[AWSsecurityhubDisableSecurityHubRequest new] completionHandler:^(AWSsecurityhubDisableSecurityHubResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDisassociateFromMasterAccount {
    NSString *key = @"testDisassociateFromMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] disassociateFromMasterAccount:[AWSsecurityhubDisassociateFromMasterAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDisassociateFromMasterAccountCompletionHandler {
    NSString *key = @"testDisassociateFromMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] disassociateFromMasterAccount:[AWSsecurityhubDisassociateFromMasterAccountRequest new] completionHandler:^(AWSsecurityhubDisassociateFromMasterAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDisassociateMembers {
    NSString *key = @"testDisassociateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] disassociateMembers:[AWSsecurityhubDisassociateMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testDisassociateMembersCompletionHandler {
    NSString *key = @"testDisassociateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] disassociateMembers:[AWSsecurityhubDisassociateMembersRequest new] completionHandler:^(AWSsecurityhubDisassociateMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testEnableImportFindingsForProduct {
    NSString *key = @"testEnableImportFindingsForProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] enableImportFindingsForProduct:[AWSsecurityhubEnableImportFindingsForProductRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testEnableImportFindingsForProductCompletionHandler {
    NSString *key = @"testEnableImportFindingsForProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] enableImportFindingsForProduct:[AWSsecurityhubEnableImportFindingsForProductRequest new] completionHandler:^(AWSsecurityhubEnableImportFindingsForProductResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testEnableSecurityHub {
    NSString *key = @"testEnableSecurityHub";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] enableSecurityHub:[AWSsecurityhubEnableSecurityHubRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testEnableSecurityHubCompletionHandler {
    NSString *key = @"testEnableSecurityHub";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] enableSecurityHub:[AWSsecurityhubEnableSecurityHubRequest new] completionHandler:^(AWSsecurityhubEnableSecurityHubResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testGetEnabledStandards {
    NSString *key = @"testGetEnabledStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] getEnabledStandards:[AWSsecurityhubGetEnabledStandardsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testGetEnabledStandardsCompletionHandler {
    NSString *key = @"testGetEnabledStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] getEnabledStandards:[AWSsecurityhubGetEnabledStandardsRequest new] completionHandler:^(AWSsecurityhubGetEnabledStandardsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testGetFindings {
    NSString *key = @"testGetFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] getFindings:[AWSsecurityhubGetFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testGetFindingsCompletionHandler {
    NSString *key = @"testGetFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] getFindings:[AWSsecurityhubGetFindingsRequest new] completionHandler:^(AWSsecurityhubGetFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testGetInsightResults {
    NSString *key = @"testGetInsightResults";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] getInsightResults:[AWSsecurityhubGetInsightResultsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testGetInsightResultsCompletionHandler {
    NSString *key = @"testGetInsightResults";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] getInsightResults:[AWSsecurityhubGetInsightResultsRequest new] completionHandler:^(AWSsecurityhubGetInsightResultsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testGetInsights {
    NSString *key = @"testGetInsights";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] getInsights:[AWSsecurityhubGetInsightsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testGetInsightsCompletionHandler {
    NSString *key = @"testGetInsights";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] getInsights:[AWSsecurityhubGetInsightsRequest new] completionHandler:^(AWSsecurityhubGetInsightsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testGetInvitationsCount {
    NSString *key = @"testGetInvitationsCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] getInvitationsCount:[AWSsecurityhubGetInvitationsCountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testGetInvitationsCountCompletionHandler {
    NSString *key = @"testGetInvitationsCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] getInvitationsCount:[AWSsecurityhubGetInvitationsCountRequest new] completionHandler:^(AWSsecurityhubGetInvitationsCountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testGetMasterAccount {
    NSString *key = @"testGetMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] getMasterAccount:[AWSsecurityhubGetMasterAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testGetMasterAccountCompletionHandler {
    NSString *key = @"testGetMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] getMasterAccount:[AWSsecurityhubGetMasterAccountRequest new] completionHandler:^(AWSsecurityhubGetMasterAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testGetMembers {
    NSString *key = @"testGetMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] getMembers:[AWSsecurityhubGetMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testGetMembersCompletionHandler {
    NSString *key = @"testGetMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] getMembers:[AWSsecurityhubGetMembersRequest new] completionHandler:^(AWSsecurityhubGetMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testInviteMembers {
    NSString *key = @"testInviteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] inviteMembers:[AWSsecurityhubInviteMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testInviteMembersCompletionHandler {
    NSString *key = @"testInviteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] inviteMembers:[AWSsecurityhubInviteMembersRequest new] completionHandler:^(AWSsecurityhubInviteMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testListEnabledProductsForImport {
    NSString *key = @"testListEnabledProductsForImport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] listEnabledProductsForImport:[AWSsecurityhubListEnabledProductsForImportRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testListEnabledProductsForImportCompletionHandler {
    NSString *key = @"testListEnabledProductsForImport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] listEnabledProductsForImport:[AWSsecurityhubListEnabledProductsForImportRequest new] completionHandler:^(AWSsecurityhubListEnabledProductsForImportResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testListInvitations {
    NSString *key = @"testListInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] listInvitations:[AWSsecurityhubListInvitationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testListInvitationsCompletionHandler {
    NSString *key = @"testListInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] listInvitations:[AWSsecurityhubListInvitationsRequest new] completionHandler:^(AWSsecurityhubListInvitationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testListMembers {
    NSString *key = @"testListMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] listMembers:[AWSsecurityhubListMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testListMembersCompletionHandler {
    NSString *key = @"testListMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] listMembers:[AWSsecurityhubListMembersRequest new] completionHandler:^(AWSsecurityhubListMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] listTagsForResource:[AWSsecurityhubListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] listTagsForResource:[AWSsecurityhubListTagsForResourceRequest new] completionHandler:^(AWSsecurityhubListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] tagResource:[AWSsecurityhubTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] tagResource:[AWSsecurityhubTagResourceRequest new] completionHandler:^(AWSsecurityhubTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] untagResource:[AWSsecurityhubUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] untagResource:[AWSsecurityhubUntagResourceRequest new] completionHandler:^(AWSsecurityhubUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testUpdateActionTarget {
    NSString *key = @"testUpdateActionTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] updateActionTarget:[AWSsecurityhubUpdateActionTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testUpdateActionTargetCompletionHandler {
    NSString *key = @"testUpdateActionTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] updateActionTarget:[AWSsecurityhubUpdateActionTargetRequest new] completionHandler:^(AWSsecurityhubUpdateActionTargetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testUpdateFindings {
    NSString *key = @"testUpdateFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] updateFindings:[AWSsecurityhubUpdateFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testUpdateFindingsCompletionHandler {
    NSString *key = @"testUpdateFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] updateFindings:[AWSsecurityhubUpdateFindingsRequest new] completionHandler:^(AWSsecurityhubUpdateFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testUpdateInsight {
    NSString *key = @"testUpdateInsight";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] updateInsight:[AWSsecurityhubUpdateInsightRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testUpdateInsightCompletionHandler {
    NSString *key = @"testUpdateInsight";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] updateInsight:[AWSsecurityhubUpdateInsightRequest new] completionHandler:^(AWSsecurityhubUpdateInsightResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testUpdateStandardsControl {
    NSString *key = @"testUpdateStandardsControl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSsecurityhub securityhubForKey:key] updateStandardsControl:[AWSsecurityhubUpdateStandardsControlRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

- (void)testUpdateStandardsControlCompletionHandler {
    NSString *key = @"testUpdateStandardsControl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSsecurityhub registersecurityhubWithConfiguration:configuration forKey:key];

    AWSsecurityhub *awsClient = [AWSsecurityhub securityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSsecurityhub securityhubForKey:key] updateStandardsControl:[AWSsecurityhubUpdateStandardsControlRequest new] completionHandler:^(AWSsecurityhubUpdateStandardsControlResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSsecurityhub removesecurityhubForKey:key];
}

@end
