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
#import "AWSCodecommitService.h"

static id mockNetworking = nil;

@interface AWSGeneralCodecommitTests : XCTestCase

@end

@implementation AWSGeneralCodecommitTests

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
    NSString *key = @"testCodecommitConstructors";
    XCTAssertNotNil([AWSCodecommit defaultCodecommit]);
    XCTAssertEqual([[AWSCodecommit defaultCodecommit] class], [AWSCodecommit class]);
    XCTAssertNil([AWSCodecommit CodecommitForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSCodecommit CodecommitForKey:key]);
    XCTAssertEqual([[AWSCodecommit CodecommitForKey:key] class], [AWSCodecommit class]);
    XCTAssertEqual([AWSCodecommit CodecommitForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSCodecommit removeCodecommitForKey:key];
    XCTAssertNil([AWSCodecommit CodecommitForKey:key]);

}

- (void)testAssociateApprovalRuleTemplateWithRepository {
    NSString *key = @"testAssociateApprovalRuleTemplateWithRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] associateApprovalRuleTemplateWithRepository:[AWSCodecommitAssociateApprovalRuleTemplateWithRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testAssociateApprovalRuleTemplateWithRepositoryCompletionHandler {
    NSString *key = @"testAssociateApprovalRuleTemplateWithRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] associateApprovalRuleTemplateWithRepository:[AWSCodecommitAssociateApprovalRuleTemplateWithRepositoryInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testBatchAssociateApprovalRuleTemplateWithRepositories {
    NSString *key = @"testBatchAssociateApprovalRuleTemplateWithRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] batchAssociateApprovalRuleTemplateWithRepositories:[AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testBatchAssociateApprovalRuleTemplateWithRepositoriesCompletionHandler {
    NSString *key = @"testBatchAssociateApprovalRuleTemplateWithRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] batchAssociateApprovalRuleTemplateWithRepositories:[AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesInput new] completionHandler:^(AWSCodecommitBatchAssociateApprovalRuleTemplateWithRepositoriesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testBatchDescribeMergeConflicts {
    NSString *key = @"testBatchDescribeMergeConflicts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] batchDescribeMergeConflicts:[AWSCodecommitBatchDescribeMergeConflictsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testBatchDescribeMergeConflictsCompletionHandler {
    NSString *key = @"testBatchDescribeMergeConflicts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] batchDescribeMergeConflicts:[AWSCodecommitBatchDescribeMergeConflictsInput new] completionHandler:^(AWSCodecommitBatchDescribeMergeConflictsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testBatchDisassociateApprovalRuleTemplateFromRepositories {
    NSString *key = @"testBatchDisassociateApprovalRuleTemplateFromRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] batchDisassociateApprovalRuleTemplateFromRepositories:[AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testBatchDisassociateApprovalRuleTemplateFromRepositoriesCompletionHandler {
    NSString *key = @"testBatchDisassociateApprovalRuleTemplateFromRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] batchDisassociateApprovalRuleTemplateFromRepositories:[AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesInput new] completionHandler:^(AWSCodecommitBatchDisassociateApprovalRuleTemplateFromRepositoriesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testBatchGetCommits {
    NSString *key = @"testBatchGetCommits";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] batchGetCommits:[AWSCodecommitBatchGetCommitsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testBatchGetCommitsCompletionHandler {
    NSString *key = @"testBatchGetCommits";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] batchGetCommits:[AWSCodecommitBatchGetCommitsInput new] completionHandler:^(AWSCodecommitBatchGetCommitsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testBatchGetRepositories {
    NSString *key = @"testBatchGetRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] batchGetRepositories:[AWSCodecommitBatchGetRepositoriesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testBatchGetRepositoriesCompletionHandler {
    NSString *key = @"testBatchGetRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] batchGetRepositories:[AWSCodecommitBatchGetRepositoriesInput new] completionHandler:^(AWSCodecommitBatchGetRepositoriesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testCreateApprovalRuleTemplate {
    NSString *key = @"testCreateApprovalRuleTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] createApprovalRuleTemplate:[AWSCodecommitCreateApprovalRuleTemplateInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testCreateApprovalRuleTemplateCompletionHandler {
    NSString *key = @"testCreateApprovalRuleTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] createApprovalRuleTemplate:[AWSCodecommitCreateApprovalRuleTemplateInput new] completionHandler:^(AWSCodecommitCreateApprovalRuleTemplateOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testCreateBranch {
    NSString *key = @"testCreateBranch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] createBranch:[AWSCodecommitCreateBranchInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testCreateBranchCompletionHandler {
    NSString *key = @"testCreateBranch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] createBranch:[AWSCodecommitCreateBranchInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testCreateCommit {
    NSString *key = @"testCreateCommit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] createCommit:[AWSCodecommitCreateCommitInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testCreateCommitCompletionHandler {
    NSString *key = @"testCreateCommit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] createCommit:[AWSCodecommitCreateCommitInput new] completionHandler:^(AWSCodecommitCreateCommitOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testCreatePullRequest {
    NSString *key = @"testCreatePullRequest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] createPullRequest:[AWSCodecommitCreatePullRequestInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testCreatePullRequestCompletionHandler {
    NSString *key = @"testCreatePullRequest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] createPullRequest:[AWSCodecommitCreatePullRequestInput new] completionHandler:^(AWSCodecommitCreatePullRequestOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testCreatePullRequestApprovalRule {
    NSString *key = @"testCreatePullRequestApprovalRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] createPullRequestApprovalRule:[AWSCodecommitCreatePullRequestApprovalRuleInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testCreatePullRequestApprovalRuleCompletionHandler {
    NSString *key = @"testCreatePullRequestApprovalRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] createPullRequestApprovalRule:[AWSCodecommitCreatePullRequestApprovalRuleInput new] completionHandler:^(AWSCodecommitCreatePullRequestApprovalRuleOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testCreateRepository {
    NSString *key = @"testCreateRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] createRepository:[AWSCodecommitCreateRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testCreateRepositoryCompletionHandler {
    NSString *key = @"testCreateRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] createRepository:[AWSCodecommitCreateRepositoryInput new] completionHandler:^(AWSCodecommitCreateRepositoryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testCreateUnreferencedMergeCommit {
    NSString *key = @"testCreateUnreferencedMergeCommit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] createUnreferencedMergeCommit:[AWSCodecommitCreateUnreferencedMergeCommitInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testCreateUnreferencedMergeCommitCompletionHandler {
    NSString *key = @"testCreateUnreferencedMergeCommit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] createUnreferencedMergeCommit:[AWSCodecommitCreateUnreferencedMergeCommitInput new] completionHandler:^(AWSCodecommitCreateUnreferencedMergeCommitOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDeleteApprovalRuleTemplate {
    NSString *key = @"testDeleteApprovalRuleTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] deleteApprovalRuleTemplate:[AWSCodecommitDeleteApprovalRuleTemplateInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDeleteApprovalRuleTemplateCompletionHandler {
    NSString *key = @"testDeleteApprovalRuleTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] deleteApprovalRuleTemplate:[AWSCodecommitDeleteApprovalRuleTemplateInput new] completionHandler:^(AWSCodecommitDeleteApprovalRuleTemplateOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDeleteBranch {
    NSString *key = @"testDeleteBranch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] deleteBranch:[AWSCodecommitDeleteBranchInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDeleteBranchCompletionHandler {
    NSString *key = @"testDeleteBranch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] deleteBranch:[AWSCodecommitDeleteBranchInput new] completionHandler:^(AWSCodecommitDeleteBranchOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDeleteCommentContent {
    NSString *key = @"testDeleteCommentContent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] deleteCommentContent:[AWSCodecommitDeleteCommentContentInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDeleteCommentContentCompletionHandler {
    NSString *key = @"testDeleteCommentContent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] deleteCommentContent:[AWSCodecommitDeleteCommentContentInput new] completionHandler:^(AWSCodecommitDeleteCommentContentOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDeleteFile {
    NSString *key = @"testDeleteFile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] deleteFile:[AWSCodecommitDeleteFileInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDeleteFileCompletionHandler {
    NSString *key = @"testDeleteFile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] deleteFile:[AWSCodecommitDeleteFileInput new] completionHandler:^(AWSCodecommitDeleteFileOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDeletePullRequestApprovalRule {
    NSString *key = @"testDeletePullRequestApprovalRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] deletePullRequestApprovalRule:[AWSCodecommitDeletePullRequestApprovalRuleInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDeletePullRequestApprovalRuleCompletionHandler {
    NSString *key = @"testDeletePullRequestApprovalRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] deletePullRequestApprovalRule:[AWSCodecommitDeletePullRequestApprovalRuleInput new] completionHandler:^(AWSCodecommitDeletePullRequestApprovalRuleOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDeleteRepository {
    NSString *key = @"testDeleteRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] deleteRepository:[AWSCodecommitDeleteRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDeleteRepositoryCompletionHandler {
    NSString *key = @"testDeleteRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] deleteRepository:[AWSCodecommitDeleteRepositoryInput new] completionHandler:^(AWSCodecommitDeleteRepositoryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDescribeMergeConflicts {
    NSString *key = @"testDescribeMergeConflicts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] describeMergeConflicts:[AWSCodecommitDescribeMergeConflictsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDescribeMergeConflictsCompletionHandler {
    NSString *key = @"testDescribeMergeConflicts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] describeMergeConflicts:[AWSCodecommitDescribeMergeConflictsInput new] completionHandler:^(AWSCodecommitDescribeMergeConflictsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDescribePullRequestEvents {
    NSString *key = @"testDescribePullRequestEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] describePullRequestEvents:[AWSCodecommitDescribePullRequestEventsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDescribePullRequestEventsCompletionHandler {
    NSString *key = @"testDescribePullRequestEvents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] describePullRequestEvents:[AWSCodecommitDescribePullRequestEventsInput new] completionHandler:^(AWSCodecommitDescribePullRequestEventsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDisassociateApprovalRuleTemplateFromRepository {
    NSString *key = @"testDisassociateApprovalRuleTemplateFromRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] disassociateApprovalRuleTemplateFromRepository:[AWSCodecommitDisassociateApprovalRuleTemplateFromRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testDisassociateApprovalRuleTemplateFromRepositoryCompletionHandler {
    NSString *key = @"testDisassociateApprovalRuleTemplateFromRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] disassociateApprovalRuleTemplateFromRepository:[AWSCodecommitDisassociateApprovalRuleTemplateFromRepositoryInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testEvaluatePullRequestApprovalRules {
    NSString *key = @"testEvaluatePullRequestApprovalRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] evaluatePullRequestApprovalRules:[AWSCodecommitEvaluatePullRequestApprovalRulesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testEvaluatePullRequestApprovalRulesCompletionHandler {
    NSString *key = @"testEvaluatePullRequestApprovalRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] evaluatePullRequestApprovalRules:[AWSCodecommitEvaluatePullRequestApprovalRulesInput new] completionHandler:^(AWSCodecommitEvaluatePullRequestApprovalRulesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetApprovalRuleTemplate {
    NSString *key = @"testGetApprovalRuleTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getApprovalRuleTemplate:[AWSCodecommitGetApprovalRuleTemplateInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetApprovalRuleTemplateCompletionHandler {
    NSString *key = @"testGetApprovalRuleTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getApprovalRuleTemplate:[AWSCodecommitGetApprovalRuleTemplateInput new] completionHandler:^(AWSCodecommitGetApprovalRuleTemplateOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetBlob {
    NSString *key = @"testGetBlob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getBlob:[AWSCodecommitGetBlobInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetBlobCompletionHandler {
    NSString *key = @"testGetBlob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getBlob:[AWSCodecommitGetBlobInput new] completionHandler:^(AWSCodecommitGetBlobOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetBranch {
    NSString *key = @"testGetBranch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getBranch:[AWSCodecommitGetBranchInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetBranchCompletionHandler {
    NSString *key = @"testGetBranch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getBranch:[AWSCodecommitGetBranchInput new] completionHandler:^(AWSCodecommitGetBranchOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetComment {
    NSString *key = @"testGetComment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getComment:[AWSCodecommitGetCommentInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetCommentCompletionHandler {
    NSString *key = @"testGetComment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getComment:[AWSCodecommitGetCommentInput new] completionHandler:^(AWSCodecommitGetCommentOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetCommentReactions {
    NSString *key = @"testGetCommentReactions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getCommentReactions:[AWSCodecommitGetCommentReactionsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetCommentReactionsCompletionHandler {
    NSString *key = @"testGetCommentReactions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getCommentReactions:[AWSCodecommitGetCommentReactionsInput new] completionHandler:^(AWSCodecommitGetCommentReactionsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetCommentsForComparedCommit {
    NSString *key = @"testGetCommentsForComparedCommit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getCommentsForComparedCommit:[AWSCodecommitGetCommentsForComparedCommitInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetCommentsForComparedCommitCompletionHandler {
    NSString *key = @"testGetCommentsForComparedCommit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getCommentsForComparedCommit:[AWSCodecommitGetCommentsForComparedCommitInput new] completionHandler:^(AWSCodecommitGetCommentsForComparedCommitOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetCommentsForPullRequest {
    NSString *key = @"testGetCommentsForPullRequest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getCommentsForPullRequest:[AWSCodecommitGetCommentsForPullRequestInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetCommentsForPullRequestCompletionHandler {
    NSString *key = @"testGetCommentsForPullRequest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getCommentsForPullRequest:[AWSCodecommitGetCommentsForPullRequestInput new] completionHandler:^(AWSCodecommitGetCommentsForPullRequestOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetCommit {
    NSString *key = @"testGetCommit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getCommit:[AWSCodecommitGetCommitInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetCommitCompletionHandler {
    NSString *key = @"testGetCommit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getCommit:[AWSCodecommitGetCommitInput new] completionHandler:^(AWSCodecommitGetCommitOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetDifferences {
    NSString *key = @"testGetDifferences";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getDifferences:[AWSCodecommitGetDifferencesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetDifferencesCompletionHandler {
    NSString *key = @"testGetDifferences";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getDifferences:[AWSCodecommitGetDifferencesInput new] completionHandler:^(AWSCodecommitGetDifferencesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetFile {
    NSString *key = @"testGetFile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getFile:[AWSCodecommitGetFileInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetFileCompletionHandler {
    NSString *key = @"testGetFile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getFile:[AWSCodecommitGetFileInput new] completionHandler:^(AWSCodecommitGetFileOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetFolder {
    NSString *key = @"testGetFolder";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getFolder:[AWSCodecommitGetFolderInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetFolderCompletionHandler {
    NSString *key = @"testGetFolder";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getFolder:[AWSCodecommitGetFolderInput new] completionHandler:^(AWSCodecommitGetFolderOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetMergeCommit {
    NSString *key = @"testGetMergeCommit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getMergeCommit:[AWSCodecommitGetMergeCommitInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetMergeCommitCompletionHandler {
    NSString *key = @"testGetMergeCommit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getMergeCommit:[AWSCodecommitGetMergeCommitInput new] completionHandler:^(AWSCodecommitGetMergeCommitOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetMergeConflicts {
    NSString *key = @"testGetMergeConflicts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getMergeConflicts:[AWSCodecommitGetMergeConflictsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetMergeConflictsCompletionHandler {
    NSString *key = @"testGetMergeConflicts";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getMergeConflicts:[AWSCodecommitGetMergeConflictsInput new] completionHandler:^(AWSCodecommitGetMergeConflictsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetMergeOptions {
    NSString *key = @"testGetMergeOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getMergeOptions:[AWSCodecommitGetMergeOptionsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetMergeOptionsCompletionHandler {
    NSString *key = @"testGetMergeOptions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getMergeOptions:[AWSCodecommitGetMergeOptionsInput new] completionHandler:^(AWSCodecommitGetMergeOptionsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetPullRequest {
    NSString *key = @"testGetPullRequest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getPullRequest:[AWSCodecommitGetPullRequestInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetPullRequestCompletionHandler {
    NSString *key = @"testGetPullRequest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getPullRequest:[AWSCodecommitGetPullRequestInput new] completionHandler:^(AWSCodecommitGetPullRequestOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetPullRequestApprovalStates {
    NSString *key = @"testGetPullRequestApprovalStates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getPullRequestApprovalStates:[AWSCodecommitGetPullRequestApprovalStatesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetPullRequestApprovalStatesCompletionHandler {
    NSString *key = @"testGetPullRequestApprovalStates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getPullRequestApprovalStates:[AWSCodecommitGetPullRequestApprovalStatesInput new] completionHandler:^(AWSCodecommitGetPullRequestApprovalStatesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetPullRequestOverrideState {
    NSString *key = @"testGetPullRequestOverrideState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getPullRequestOverrideState:[AWSCodecommitGetPullRequestOverrideStateInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetPullRequestOverrideStateCompletionHandler {
    NSString *key = @"testGetPullRequestOverrideState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getPullRequestOverrideState:[AWSCodecommitGetPullRequestOverrideStateInput new] completionHandler:^(AWSCodecommitGetPullRequestOverrideStateOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetRepository {
    NSString *key = @"testGetRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getRepository:[AWSCodecommitGetRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetRepositoryCompletionHandler {
    NSString *key = @"testGetRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getRepository:[AWSCodecommitGetRepositoryInput new] completionHandler:^(AWSCodecommitGetRepositoryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetRepositoryTriggers {
    NSString *key = @"testGetRepositoryTriggers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] getRepositoryTriggers:[AWSCodecommitGetRepositoryTriggersInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testGetRepositoryTriggersCompletionHandler {
    NSString *key = @"testGetRepositoryTriggers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] getRepositoryTriggers:[AWSCodecommitGetRepositoryTriggersInput new] completionHandler:^(AWSCodecommitGetRepositoryTriggersOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testListApprovalRuleTemplates {
    NSString *key = @"testListApprovalRuleTemplates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] listApprovalRuleTemplates:[AWSCodecommitListApprovalRuleTemplatesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testListApprovalRuleTemplatesCompletionHandler {
    NSString *key = @"testListApprovalRuleTemplates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] listApprovalRuleTemplates:[AWSCodecommitListApprovalRuleTemplatesInput new] completionHandler:^(AWSCodecommitListApprovalRuleTemplatesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testListAssociatedApprovalRuleTemplatesForRepository {
    NSString *key = @"testListAssociatedApprovalRuleTemplatesForRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] listAssociatedApprovalRuleTemplatesForRepository:[AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testListAssociatedApprovalRuleTemplatesForRepositoryCompletionHandler {
    NSString *key = @"testListAssociatedApprovalRuleTemplatesForRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] listAssociatedApprovalRuleTemplatesForRepository:[AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryInput new] completionHandler:^(AWSCodecommitListAssociatedApprovalRuleTemplatesForRepositoryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testListBranches {
    NSString *key = @"testListBranches";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] listBranches:[AWSCodecommitListBranchesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testListBranchesCompletionHandler {
    NSString *key = @"testListBranches";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] listBranches:[AWSCodecommitListBranchesInput new] completionHandler:^(AWSCodecommitListBranchesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testListPullRequests {
    NSString *key = @"testListPullRequests";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] listPullRequests:[AWSCodecommitListPullRequestsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testListPullRequestsCompletionHandler {
    NSString *key = @"testListPullRequests";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] listPullRequests:[AWSCodecommitListPullRequestsInput new] completionHandler:^(AWSCodecommitListPullRequestsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testListRepositories {
    NSString *key = @"testListRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] listRepositories:[AWSCodecommitListRepositoriesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testListRepositoriesCompletionHandler {
    NSString *key = @"testListRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] listRepositories:[AWSCodecommitListRepositoriesInput new] completionHandler:^(AWSCodecommitListRepositoriesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testListRepositoriesForApprovalRuleTemplate {
    NSString *key = @"testListRepositoriesForApprovalRuleTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] listRepositoriesForApprovalRuleTemplate:[AWSCodecommitListRepositoriesForApprovalRuleTemplateInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testListRepositoriesForApprovalRuleTemplateCompletionHandler {
    NSString *key = @"testListRepositoriesForApprovalRuleTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] listRepositoriesForApprovalRuleTemplate:[AWSCodecommitListRepositoriesForApprovalRuleTemplateInput new] completionHandler:^(AWSCodecommitListRepositoriesForApprovalRuleTemplateOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] listTagsForResource:[AWSCodecommitListTagsForResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] listTagsForResource:[AWSCodecommitListTagsForResourceInput new] completionHandler:^(AWSCodecommitListTagsForResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testMergeBranchesByFastForward {
    NSString *key = @"testMergeBranchesByFastForward";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] mergeBranchesByFastForward:[AWSCodecommitMergeBranchesByFastForwardInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testMergeBranchesByFastForwardCompletionHandler {
    NSString *key = @"testMergeBranchesByFastForward";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] mergeBranchesByFastForward:[AWSCodecommitMergeBranchesByFastForwardInput new] completionHandler:^(AWSCodecommitMergeBranchesByFastForwardOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testMergeBranchesBySquash {
    NSString *key = @"testMergeBranchesBySquash";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] mergeBranchesBySquash:[AWSCodecommitMergeBranchesBySquashInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testMergeBranchesBySquashCompletionHandler {
    NSString *key = @"testMergeBranchesBySquash";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] mergeBranchesBySquash:[AWSCodecommitMergeBranchesBySquashInput new] completionHandler:^(AWSCodecommitMergeBranchesBySquashOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testMergeBranchesByThreeWay {
    NSString *key = @"testMergeBranchesByThreeWay";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] mergeBranchesByThreeWay:[AWSCodecommitMergeBranchesByThreeWayInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testMergeBranchesByThreeWayCompletionHandler {
    NSString *key = @"testMergeBranchesByThreeWay";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] mergeBranchesByThreeWay:[AWSCodecommitMergeBranchesByThreeWayInput new] completionHandler:^(AWSCodecommitMergeBranchesByThreeWayOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testMergePullRequestByFastForward {
    NSString *key = @"testMergePullRequestByFastForward";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] mergePullRequestByFastForward:[AWSCodecommitMergePullRequestByFastForwardInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testMergePullRequestByFastForwardCompletionHandler {
    NSString *key = @"testMergePullRequestByFastForward";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] mergePullRequestByFastForward:[AWSCodecommitMergePullRequestByFastForwardInput new] completionHandler:^(AWSCodecommitMergePullRequestByFastForwardOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testMergePullRequestBySquash {
    NSString *key = @"testMergePullRequestBySquash";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] mergePullRequestBySquash:[AWSCodecommitMergePullRequestBySquashInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testMergePullRequestBySquashCompletionHandler {
    NSString *key = @"testMergePullRequestBySquash";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] mergePullRequestBySquash:[AWSCodecommitMergePullRequestBySquashInput new] completionHandler:^(AWSCodecommitMergePullRequestBySquashOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testMergePullRequestByThreeWay {
    NSString *key = @"testMergePullRequestByThreeWay";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] mergePullRequestByThreeWay:[AWSCodecommitMergePullRequestByThreeWayInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testMergePullRequestByThreeWayCompletionHandler {
    NSString *key = @"testMergePullRequestByThreeWay";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] mergePullRequestByThreeWay:[AWSCodecommitMergePullRequestByThreeWayInput new] completionHandler:^(AWSCodecommitMergePullRequestByThreeWayOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testOverridePullRequestApprovalRules {
    NSString *key = @"testOverridePullRequestApprovalRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] overridePullRequestApprovalRules:[AWSCodecommitOverridePullRequestApprovalRulesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testOverridePullRequestApprovalRulesCompletionHandler {
    NSString *key = @"testOverridePullRequestApprovalRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] overridePullRequestApprovalRules:[AWSCodecommitOverridePullRequestApprovalRulesInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testPostCommentForComparedCommit {
    NSString *key = @"testPostCommentForComparedCommit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] postCommentForComparedCommit:[AWSCodecommitPostCommentForComparedCommitInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testPostCommentForComparedCommitCompletionHandler {
    NSString *key = @"testPostCommentForComparedCommit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] postCommentForComparedCommit:[AWSCodecommitPostCommentForComparedCommitInput new] completionHandler:^(AWSCodecommitPostCommentForComparedCommitOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testPostCommentForPullRequest {
    NSString *key = @"testPostCommentForPullRequest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] postCommentForPullRequest:[AWSCodecommitPostCommentForPullRequestInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testPostCommentForPullRequestCompletionHandler {
    NSString *key = @"testPostCommentForPullRequest";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] postCommentForPullRequest:[AWSCodecommitPostCommentForPullRequestInput new] completionHandler:^(AWSCodecommitPostCommentForPullRequestOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testPostCommentReply {
    NSString *key = @"testPostCommentReply";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] postCommentReply:[AWSCodecommitPostCommentReplyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testPostCommentReplyCompletionHandler {
    NSString *key = @"testPostCommentReply";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] postCommentReply:[AWSCodecommitPostCommentReplyInput new] completionHandler:^(AWSCodecommitPostCommentReplyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testPutCommentReaction {
    NSString *key = @"testPutCommentReaction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] putCommentReaction:[AWSCodecommitPutCommentReactionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testPutCommentReactionCompletionHandler {
    NSString *key = @"testPutCommentReaction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] putCommentReaction:[AWSCodecommitPutCommentReactionInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testPutFile {
    NSString *key = @"testPutFile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] putFile:[AWSCodecommitPutFileInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testPutFileCompletionHandler {
    NSString *key = @"testPutFile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] putFile:[AWSCodecommitPutFileInput new] completionHandler:^(AWSCodecommitPutFileOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testPutRepositoryTriggers {
    NSString *key = @"testPutRepositoryTriggers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] putRepositoryTriggers:[AWSCodecommitPutRepositoryTriggersInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testPutRepositoryTriggersCompletionHandler {
    NSString *key = @"testPutRepositoryTriggers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] putRepositoryTriggers:[AWSCodecommitPutRepositoryTriggersInput new] completionHandler:^(AWSCodecommitPutRepositoryTriggersOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] tagResource:[AWSCodecommitTagResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] tagResource:[AWSCodecommitTagResourceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testTestRepositoryTriggers {
    NSString *key = @"testTestRepositoryTriggers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] testRepositoryTriggers:[AWSCodecommitTestRepositoryTriggersInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testTestRepositoryTriggersCompletionHandler {
    NSString *key = @"testTestRepositoryTriggers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] testRepositoryTriggers:[AWSCodecommitTestRepositoryTriggersInput new] completionHandler:^(AWSCodecommitTestRepositoryTriggersOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] untagResource:[AWSCodecommitUntagResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] untagResource:[AWSCodecommitUntagResourceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdateApprovalRuleTemplateContent {
    NSString *key = @"testUpdateApprovalRuleTemplateContent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] updateApprovalRuleTemplateContent:[AWSCodecommitUpdateApprovalRuleTemplateContentInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdateApprovalRuleTemplateContentCompletionHandler {
    NSString *key = @"testUpdateApprovalRuleTemplateContent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] updateApprovalRuleTemplateContent:[AWSCodecommitUpdateApprovalRuleTemplateContentInput new] completionHandler:^(AWSCodecommitUpdateApprovalRuleTemplateContentOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdateApprovalRuleTemplateDescription {
    NSString *key = @"testUpdateApprovalRuleTemplateDescription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] updateApprovalRuleTemplateDescription:[AWSCodecommitUpdateApprovalRuleTemplateDescriptionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdateApprovalRuleTemplateDescriptionCompletionHandler {
    NSString *key = @"testUpdateApprovalRuleTemplateDescription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] updateApprovalRuleTemplateDescription:[AWSCodecommitUpdateApprovalRuleTemplateDescriptionInput new] completionHandler:^(AWSCodecommitUpdateApprovalRuleTemplateDescriptionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdateApprovalRuleTemplateName {
    NSString *key = @"testUpdateApprovalRuleTemplateName";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] updateApprovalRuleTemplateName:[AWSCodecommitUpdateApprovalRuleTemplateNameInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdateApprovalRuleTemplateNameCompletionHandler {
    NSString *key = @"testUpdateApprovalRuleTemplateName";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] updateApprovalRuleTemplateName:[AWSCodecommitUpdateApprovalRuleTemplateNameInput new] completionHandler:^(AWSCodecommitUpdateApprovalRuleTemplateNameOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdateComment {
    NSString *key = @"testUpdateComment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] updateComment:[AWSCodecommitUpdateCommentInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdateCommentCompletionHandler {
    NSString *key = @"testUpdateComment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] updateComment:[AWSCodecommitUpdateCommentInput new] completionHandler:^(AWSCodecommitUpdateCommentOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdateDefaultBranch {
    NSString *key = @"testUpdateDefaultBranch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] updateDefaultBranch:[AWSCodecommitUpdateDefaultBranchInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdateDefaultBranchCompletionHandler {
    NSString *key = @"testUpdateDefaultBranch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] updateDefaultBranch:[AWSCodecommitUpdateDefaultBranchInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdatePullRequestApprovalRuleContent {
    NSString *key = @"testUpdatePullRequestApprovalRuleContent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] updatePullRequestApprovalRuleContent:[AWSCodecommitUpdatePullRequestApprovalRuleContentInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdatePullRequestApprovalRuleContentCompletionHandler {
    NSString *key = @"testUpdatePullRequestApprovalRuleContent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] updatePullRequestApprovalRuleContent:[AWSCodecommitUpdatePullRequestApprovalRuleContentInput new] completionHandler:^(AWSCodecommitUpdatePullRequestApprovalRuleContentOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdatePullRequestApprovalState {
    NSString *key = @"testUpdatePullRequestApprovalState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] updatePullRequestApprovalState:[AWSCodecommitUpdatePullRequestApprovalStateInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdatePullRequestApprovalStateCompletionHandler {
    NSString *key = @"testUpdatePullRequestApprovalState";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] updatePullRequestApprovalState:[AWSCodecommitUpdatePullRequestApprovalStateInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdatePullRequestDescription {
    NSString *key = @"testUpdatePullRequestDescription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] updatePullRequestDescription:[AWSCodecommitUpdatePullRequestDescriptionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdatePullRequestDescriptionCompletionHandler {
    NSString *key = @"testUpdatePullRequestDescription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] updatePullRequestDescription:[AWSCodecommitUpdatePullRequestDescriptionInput new] completionHandler:^(AWSCodecommitUpdatePullRequestDescriptionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdatePullRequestStatus {
    NSString *key = @"testUpdatePullRequestStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] updatePullRequestStatus:[AWSCodecommitUpdatePullRequestStatusInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdatePullRequestStatusCompletionHandler {
    NSString *key = @"testUpdatePullRequestStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] updatePullRequestStatus:[AWSCodecommitUpdatePullRequestStatusInput new] completionHandler:^(AWSCodecommitUpdatePullRequestStatusOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdatePullRequestTitle {
    NSString *key = @"testUpdatePullRequestTitle";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] updatePullRequestTitle:[AWSCodecommitUpdatePullRequestTitleInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdatePullRequestTitleCompletionHandler {
    NSString *key = @"testUpdatePullRequestTitle";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] updatePullRequestTitle:[AWSCodecommitUpdatePullRequestTitleInput new] completionHandler:^(AWSCodecommitUpdatePullRequestTitleOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdateRepositoryDescription {
    NSString *key = @"testUpdateRepositoryDescription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] updateRepositoryDescription:[AWSCodecommitUpdateRepositoryDescriptionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdateRepositoryDescriptionCompletionHandler {
    NSString *key = @"testUpdateRepositoryDescription";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] updateRepositoryDescription:[AWSCodecommitUpdateRepositoryDescriptionInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdateRepositoryName {
    NSString *key = @"testUpdateRepositoryName";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodecommit CodecommitForKey:key] updateRepositoryName:[AWSCodecommitUpdateRepositoryNameInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

- (void)testUpdateRepositoryNameCompletionHandler {
    NSString *key = @"testUpdateRepositoryName";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodecommit registerCodecommitWithConfiguration:configuration forKey:key];

    AWSCodecommit *awsClient = [AWSCodecommit CodecommitForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodecommit CodecommitForKey:key] updateRepositoryName:[AWSCodecommitUpdateRepositoryNameInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodecommit removeCodecommitForKey:key];
}

@end
