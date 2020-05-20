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
#import "AWSSecurityhubService.h"

static id mockNetworking = nil;

@interface AWSGeneralSecurityhubTests : XCTestCase

@end

@implementation AWSGeneralSecurityhubTests

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
    NSString *key = @"testSecurityhubConstructors";
    XCTAssertNotNil([AWSSecurityhub defaultSecurityhub]);
    XCTAssertEqual([[AWSSecurityhub defaultSecurityhub] class], [AWSSecurityhub class]);
    XCTAssertNil([AWSSecurityhub SecurityhubForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSSecurityhub SecurityhubForKey:key]);
    XCTAssertEqual([[AWSSecurityhub SecurityhubForKey:key] class], [AWSSecurityhub class]);
    XCTAssertEqual([AWSSecurityhub SecurityhubForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSSecurityhub removeSecurityhubForKey:key];
    XCTAssertNil([AWSSecurityhub SecurityhubForKey:key]);

}

- (void)testAcceptInvitation {
    NSString *key = @"testAcceptInvitation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] acceptInvitation:[AWSSecurityhubAcceptInvitationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testAcceptInvitationCompletionHandler {
    NSString *key = @"testAcceptInvitation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] acceptInvitation:[AWSSecurityhubAcceptInvitationRequest new] completionHandler:^(AWSSecurityhubAcceptInvitationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testBatchDisableStandards {
    NSString *key = @"testBatchDisableStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] batchDisableStandards:[AWSSecurityhubBatchDisableStandardsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testBatchDisableStandardsCompletionHandler {
    NSString *key = @"testBatchDisableStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] batchDisableStandards:[AWSSecurityhubBatchDisableStandardsRequest new] completionHandler:^(AWSSecurityhubBatchDisableStandardsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testBatchEnableStandards {
    NSString *key = @"testBatchEnableStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] batchEnableStandards:[AWSSecurityhubBatchEnableStandardsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testBatchEnableStandardsCompletionHandler {
    NSString *key = @"testBatchEnableStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] batchEnableStandards:[AWSSecurityhubBatchEnableStandardsRequest new] completionHandler:^(AWSSecurityhubBatchEnableStandardsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testBatchImportFindings {
    NSString *key = @"testBatchImportFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] batchImportFindings:[AWSSecurityhubBatchImportFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testBatchImportFindingsCompletionHandler {
    NSString *key = @"testBatchImportFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] batchImportFindings:[AWSSecurityhubBatchImportFindingsRequest new] completionHandler:^(AWSSecurityhubBatchImportFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testBatchUpdateFindings {
    NSString *key = @"testBatchUpdateFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] batchUpdateFindings:[AWSSecurityhubBatchUpdateFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testBatchUpdateFindingsCompletionHandler {
    NSString *key = @"testBatchUpdateFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] batchUpdateFindings:[AWSSecurityhubBatchUpdateFindingsRequest new] completionHandler:^(AWSSecurityhubBatchUpdateFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testCreateActionTarget {
    NSString *key = @"testCreateActionTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] createActionTarget:[AWSSecurityhubCreateActionTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testCreateActionTargetCompletionHandler {
    NSString *key = @"testCreateActionTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] createActionTarget:[AWSSecurityhubCreateActionTargetRequest new] completionHandler:^(AWSSecurityhubCreateActionTargetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testCreateInsight {
    NSString *key = @"testCreateInsight";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] createInsight:[AWSSecurityhubCreateInsightRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testCreateInsightCompletionHandler {
    NSString *key = @"testCreateInsight";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] createInsight:[AWSSecurityhubCreateInsightRequest new] completionHandler:^(AWSSecurityhubCreateInsightResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testCreateMembers {
    NSString *key = @"testCreateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] createMembers:[AWSSecurityhubCreateMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testCreateMembersCompletionHandler {
    NSString *key = @"testCreateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] createMembers:[AWSSecurityhubCreateMembersRequest new] completionHandler:^(AWSSecurityhubCreateMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDeclineInvitations {
    NSString *key = @"testDeclineInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] declineInvitations:[AWSSecurityhubDeclineInvitationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDeclineInvitationsCompletionHandler {
    NSString *key = @"testDeclineInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] declineInvitations:[AWSSecurityhubDeclineInvitationsRequest new] completionHandler:^(AWSSecurityhubDeclineInvitationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDeleteActionTarget {
    NSString *key = @"testDeleteActionTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] deleteActionTarget:[AWSSecurityhubDeleteActionTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDeleteActionTargetCompletionHandler {
    NSString *key = @"testDeleteActionTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] deleteActionTarget:[AWSSecurityhubDeleteActionTargetRequest new] completionHandler:^(AWSSecurityhubDeleteActionTargetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDeleteInsight {
    NSString *key = @"testDeleteInsight";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] deleteInsight:[AWSSecurityhubDeleteInsightRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDeleteInsightCompletionHandler {
    NSString *key = @"testDeleteInsight";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] deleteInsight:[AWSSecurityhubDeleteInsightRequest new] completionHandler:^(AWSSecurityhubDeleteInsightResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDeleteInvitations {
    NSString *key = @"testDeleteInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] deleteInvitations:[AWSSecurityhubDeleteInvitationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDeleteInvitationsCompletionHandler {
    NSString *key = @"testDeleteInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] deleteInvitations:[AWSSecurityhubDeleteInvitationsRequest new] completionHandler:^(AWSSecurityhubDeleteInvitationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDeleteMembers {
    NSString *key = @"testDeleteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] deleteMembers:[AWSSecurityhubDeleteMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDeleteMembersCompletionHandler {
    NSString *key = @"testDeleteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] deleteMembers:[AWSSecurityhubDeleteMembersRequest new] completionHandler:^(AWSSecurityhubDeleteMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDescribeActionTargets {
    NSString *key = @"testDescribeActionTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] describeActionTargets:[AWSSecurityhubDescribeActionTargetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDescribeActionTargetsCompletionHandler {
    NSString *key = @"testDescribeActionTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] describeActionTargets:[AWSSecurityhubDescribeActionTargetsRequest new] completionHandler:^(AWSSecurityhubDescribeActionTargetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDescribeHub {
    NSString *key = @"testDescribeHub";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] describeHub:[AWSSecurityhubDescribeHubRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDescribeHubCompletionHandler {
    NSString *key = @"testDescribeHub";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] describeHub:[AWSSecurityhubDescribeHubRequest new] completionHandler:^(AWSSecurityhubDescribeHubResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDescribeProducts {
    NSString *key = @"testDescribeProducts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] describeProducts:[AWSSecurityhubDescribeProductsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDescribeProductsCompletionHandler {
    NSString *key = @"testDescribeProducts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] describeProducts:[AWSSecurityhubDescribeProductsRequest new] completionHandler:^(AWSSecurityhubDescribeProductsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDescribeStandards {
    NSString *key = @"testDescribeStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] describeStandards:[AWSSecurityhubDescribeStandardsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDescribeStandardsCompletionHandler {
    NSString *key = @"testDescribeStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] describeStandards:[AWSSecurityhubDescribeStandardsRequest new] completionHandler:^(AWSSecurityhubDescribeStandardsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDescribeStandardsControls {
    NSString *key = @"testDescribeStandardsControls";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] describeStandardsControls:[AWSSecurityhubDescribeStandardsControlsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDescribeStandardsControlsCompletionHandler {
    NSString *key = @"testDescribeStandardsControls";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] describeStandardsControls:[AWSSecurityhubDescribeStandardsControlsRequest new] completionHandler:^(AWSSecurityhubDescribeStandardsControlsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDisableImportFindingsForProduct {
    NSString *key = @"testDisableImportFindingsForProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] disableImportFindingsForProduct:[AWSSecurityhubDisableImportFindingsForProductRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDisableImportFindingsForProductCompletionHandler {
    NSString *key = @"testDisableImportFindingsForProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] disableImportFindingsForProduct:[AWSSecurityhubDisableImportFindingsForProductRequest new] completionHandler:^(AWSSecurityhubDisableImportFindingsForProductResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDisableSecurityHub {
    NSString *key = @"testDisableSecurityHub";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] disableSecurityHub:[AWSSecurityhubDisableSecurityHubRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDisableSecurityHubCompletionHandler {
    NSString *key = @"testDisableSecurityHub";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] disableSecurityHub:[AWSSecurityhubDisableSecurityHubRequest new] completionHandler:^(AWSSecurityhubDisableSecurityHubResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDisassociateFromMasterAccount {
    NSString *key = @"testDisassociateFromMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] disassociateFromMasterAccount:[AWSSecurityhubDisassociateFromMasterAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDisassociateFromMasterAccountCompletionHandler {
    NSString *key = @"testDisassociateFromMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] disassociateFromMasterAccount:[AWSSecurityhubDisassociateFromMasterAccountRequest new] completionHandler:^(AWSSecurityhubDisassociateFromMasterAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDisassociateMembers {
    NSString *key = @"testDisassociateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] disassociateMembers:[AWSSecurityhubDisassociateMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testDisassociateMembersCompletionHandler {
    NSString *key = @"testDisassociateMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] disassociateMembers:[AWSSecurityhubDisassociateMembersRequest new] completionHandler:^(AWSSecurityhubDisassociateMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testEnableImportFindingsForProduct {
    NSString *key = @"testEnableImportFindingsForProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] enableImportFindingsForProduct:[AWSSecurityhubEnableImportFindingsForProductRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testEnableImportFindingsForProductCompletionHandler {
    NSString *key = @"testEnableImportFindingsForProduct";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] enableImportFindingsForProduct:[AWSSecurityhubEnableImportFindingsForProductRequest new] completionHandler:^(AWSSecurityhubEnableImportFindingsForProductResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testEnableSecurityHub {
    NSString *key = @"testEnableSecurityHub";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] enableSecurityHub:[AWSSecurityhubEnableSecurityHubRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testEnableSecurityHubCompletionHandler {
    NSString *key = @"testEnableSecurityHub";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] enableSecurityHub:[AWSSecurityhubEnableSecurityHubRequest new] completionHandler:^(AWSSecurityhubEnableSecurityHubResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testGetEnabledStandards {
    NSString *key = @"testGetEnabledStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] getEnabledStandards:[AWSSecurityhubGetEnabledStandardsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testGetEnabledStandardsCompletionHandler {
    NSString *key = @"testGetEnabledStandards";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] getEnabledStandards:[AWSSecurityhubGetEnabledStandardsRequest new] completionHandler:^(AWSSecurityhubGetEnabledStandardsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testGetFindings {
    NSString *key = @"testGetFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] getFindings:[AWSSecurityhubGetFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testGetFindingsCompletionHandler {
    NSString *key = @"testGetFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] getFindings:[AWSSecurityhubGetFindingsRequest new] completionHandler:^(AWSSecurityhubGetFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testGetInsightResults {
    NSString *key = @"testGetInsightResults";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] getInsightResults:[AWSSecurityhubGetInsightResultsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testGetInsightResultsCompletionHandler {
    NSString *key = @"testGetInsightResults";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] getInsightResults:[AWSSecurityhubGetInsightResultsRequest new] completionHandler:^(AWSSecurityhubGetInsightResultsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testGetInsights {
    NSString *key = @"testGetInsights";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] getInsights:[AWSSecurityhubGetInsightsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testGetInsightsCompletionHandler {
    NSString *key = @"testGetInsights";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] getInsights:[AWSSecurityhubGetInsightsRequest new] completionHandler:^(AWSSecurityhubGetInsightsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testGetInvitationsCount {
    NSString *key = @"testGetInvitationsCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] getInvitationsCount:[AWSSecurityhubGetInvitationsCountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testGetInvitationsCountCompletionHandler {
    NSString *key = @"testGetInvitationsCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] getInvitationsCount:[AWSSecurityhubGetInvitationsCountRequest new] completionHandler:^(AWSSecurityhubGetInvitationsCountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testGetMasterAccount {
    NSString *key = @"testGetMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] getMasterAccount:[AWSSecurityhubGetMasterAccountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testGetMasterAccountCompletionHandler {
    NSString *key = @"testGetMasterAccount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] getMasterAccount:[AWSSecurityhubGetMasterAccountRequest new] completionHandler:^(AWSSecurityhubGetMasterAccountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testGetMembers {
    NSString *key = @"testGetMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] getMembers:[AWSSecurityhubGetMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testGetMembersCompletionHandler {
    NSString *key = @"testGetMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] getMembers:[AWSSecurityhubGetMembersRequest new] completionHandler:^(AWSSecurityhubGetMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testInviteMembers {
    NSString *key = @"testInviteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] inviteMembers:[AWSSecurityhubInviteMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testInviteMembersCompletionHandler {
    NSString *key = @"testInviteMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] inviteMembers:[AWSSecurityhubInviteMembersRequest new] completionHandler:^(AWSSecurityhubInviteMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testListEnabledProductsForImport {
    NSString *key = @"testListEnabledProductsForImport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] listEnabledProductsForImport:[AWSSecurityhubListEnabledProductsForImportRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testListEnabledProductsForImportCompletionHandler {
    NSString *key = @"testListEnabledProductsForImport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] listEnabledProductsForImport:[AWSSecurityhubListEnabledProductsForImportRequest new] completionHandler:^(AWSSecurityhubListEnabledProductsForImportResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testListInvitations {
    NSString *key = @"testListInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] listInvitations:[AWSSecurityhubListInvitationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testListInvitationsCompletionHandler {
    NSString *key = @"testListInvitations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] listInvitations:[AWSSecurityhubListInvitationsRequest new] completionHandler:^(AWSSecurityhubListInvitationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testListMembers {
    NSString *key = @"testListMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] listMembers:[AWSSecurityhubListMembersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testListMembersCompletionHandler {
    NSString *key = @"testListMembers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] listMembers:[AWSSecurityhubListMembersRequest new] completionHandler:^(AWSSecurityhubListMembersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] listTagsForResource:[AWSSecurityhubListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] listTagsForResource:[AWSSecurityhubListTagsForResourceRequest new] completionHandler:^(AWSSecurityhubListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] tagResource:[AWSSecurityhubTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] tagResource:[AWSSecurityhubTagResourceRequest new] completionHandler:^(AWSSecurityhubTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] untagResource:[AWSSecurityhubUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] untagResource:[AWSSecurityhubUntagResourceRequest new] completionHandler:^(AWSSecurityhubUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testUpdateActionTarget {
    NSString *key = @"testUpdateActionTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] updateActionTarget:[AWSSecurityhubUpdateActionTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testUpdateActionTargetCompletionHandler {
    NSString *key = @"testUpdateActionTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] updateActionTarget:[AWSSecurityhubUpdateActionTargetRequest new] completionHandler:^(AWSSecurityhubUpdateActionTargetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testUpdateFindings {
    NSString *key = @"testUpdateFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] updateFindings:[AWSSecurityhubUpdateFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testUpdateFindingsCompletionHandler {
    NSString *key = @"testUpdateFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] updateFindings:[AWSSecurityhubUpdateFindingsRequest new] completionHandler:^(AWSSecurityhubUpdateFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testUpdateInsight {
    NSString *key = @"testUpdateInsight";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] updateInsight:[AWSSecurityhubUpdateInsightRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testUpdateInsightCompletionHandler {
    NSString *key = @"testUpdateInsight";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] updateInsight:[AWSSecurityhubUpdateInsightRequest new] completionHandler:^(AWSSecurityhubUpdateInsightResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testUpdateStandardsControl {
    NSString *key = @"testUpdateStandardsControl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSecurityhub SecurityhubForKey:key] updateStandardsControl:[AWSSecurityhubUpdateStandardsControlRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

- (void)testUpdateStandardsControlCompletionHandler {
    NSString *key = @"testUpdateStandardsControl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSecurityhub registerSecurityhubWithConfiguration:configuration forKey:key];

    AWSSecurityhub *awsClient = [AWSSecurityhub SecurityhubForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSecurityhub SecurityhubForKey:key] updateStandardsControl:[AWSSecurityhubUpdateStandardsControlRequest new] completionHandler:^(AWSSecurityhubUpdateStandardsControlResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSecurityhub removeSecurityhubForKey:key];
}

@end
