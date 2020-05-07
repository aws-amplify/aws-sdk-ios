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
#import "AWSCodeBuildService.h"

static id mockNetworking = nil;

@interface AWSGeneralCodeBuildTests : XCTestCase

@end

@implementation AWSGeneralCodeBuildTests

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
    NSString *key = @"testCodeBuildConstructors";
    XCTAssertNotNil([AWSCodeBuild defaultCodeBuild]);
    XCTAssertEqual([[AWSCodeBuild defaultCodeBuild] class], [AWSCodeBuild class]);
    XCTAssertNil([AWSCodeBuild CodeBuildForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSCodeBuild CodeBuildForKey:key]);
    XCTAssertEqual([[AWSCodeBuild CodeBuildForKey:key] class], [AWSCodeBuild class]);
    XCTAssertEqual([AWSCodeBuild CodeBuildForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSCodeBuild removeCodeBuildForKey:key];
    XCTAssertNil([AWSCodeBuild CodeBuildForKey:key]);

}

- (void)testBatchDeleteBuilds {
    NSString *key = @"testBatchDeleteBuilds";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] batchDeleteBuilds:[AWSCodeBuildBatchDeleteBuildsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testBatchDeleteBuildsCompletionHandler {
    NSString *key = @"testBatchDeleteBuilds";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] batchDeleteBuilds:[AWSCodeBuildBatchDeleteBuildsInput new] completionHandler:^(AWSCodeBuildBatchDeleteBuildsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testBatchGetBuilds {
    NSString *key = @"testBatchGetBuilds";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] batchGetBuilds:[AWSCodeBuildBatchGetBuildsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testBatchGetBuildsCompletionHandler {
    NSString *key = @"testBatchGetBuilds";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] batchGetBuilds:[AWSCodeBuildBatchGetBuildsInput new] completionHandler:^(AWSCodeBuildBatchGetBuildsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testBatchGetProjects {
    NSString *key = @"testBatchGetProjects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] batchGetProjects:[AWSCodeBuildBatchGetProjectsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testBatchGetProjectsCompletionHandler {
    NSString *key = @"testBatchGetProjects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] batchGetProjects:[AWSCodeBuildBatchGetProjectsInput new] completionHandler:^(AWSCodeBuildBatchGetProjectsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testBatchGetReportGroups {
    NSString *key = @"testBatchGetReportGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] batchGetReportGroups:[AWSCodeBuildBatchGetReportGroupsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testBatchGetReportGroupsCompletionHandler {
    NSString *key = @"testBatchGetReportGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] batchGetReportGroups:[AWSCodeBuildBatchGetReportGroupsInput new] completionHandler:^(AWSCodeBuildBatchGetReportGroupsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testBatchGetReports {
    NSString *key = @"testBatchGetReports";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] batchGetReports:[AWSCodeBuildBatchGetReportsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testBatchGetReportsCompletionHandler {
    NSString *key = @"testBatchGetReports";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] batchGetReports:[AWSCodeBuildBatchGetReportsInput new] completionHandler:^(AWSCodeBuildBatchGetReportsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testCreateProject {
    NSString *key = @"testCreateProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] createProject:[AWSCodeBuildCreateProjectInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testCreateProjectCompletionHandler {
    NSString *key = @"testCreateProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] createProject:[AWSCodeBuildCreateProjectInput new] completionHandler:^(AWSCodeBuildCreateProjectOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testCreateReportGroup {
    NSString *key = @"testCreateReportGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] createReportGroup:[AWSCodeBuildCreateReportGroupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testCreateReportGroupCompletionHandler {
    NSString *key = @"testCreateReportGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] createReportGroup:[AWSCodeBuildCreateReportGroupInput new] completionHandler:^(AWSCodeBuildCreateReportGroupOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testCreateWebhook {
    NSString *key = @"testCreateWebhook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] createWebhook:[AWSCodeBuildCreateWebhookInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testCreateWebhookCompletionHandler {
    NSString *key = @"testCreateWebhook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] createWebhook:[AWSCodeBuildCreateWebhookInput new] completionHandler:^(AWSCodeBuildCreateWebhookOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testDeleteProject {
    NSString *key = @"testDeleteProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] deleteProject:[AWSCodeBuildDeleteProjectInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testDeleteProjectCompletionHandler {
    NSString *key = @"testDeleteProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] deleteProject:[AWSCodeBuildDeleteProjectInput new] completionHandler:^(AWSCodeBuildDeleteProjectOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testDeleteReport {
    NSString *key = @"testDeleteReport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] deleteReport:[AWSCodeBuildDeleteReportInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testDeleteReportCompletionHandler {
    NSString *key = @"testDeleteReport";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] deleteReport:[AWSCodeBuildDeleteReportInput new] completionHandler:^(AWSCodeBuildDeleteReportOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testDeleteReportGroup {
    NSString *key = @"testDeleteReportGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] deleteReportGroup:[AWSCodeBuildDeleteReportGroupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testDeleteReportGroupCompletionHandler {
    NSString *key = @"testDeleteReportGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] deleteReportGroup:[AWSCodeBuildDeleteReportGroupInput new] completionHandler:^(AWSCodeBuildDeleteReportGroupOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testDeleteResourcePolicy {
    NSString *key = @"testDeleteResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] deleteResourcePolicy:[AWSCodeBuildDeleteResourcePolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testDeleteResourcePolicyCompletionHandler {
    NSString *key = @"testDeleteResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] deleteResourcePolicy:[AWSCodeBuildDeleteResourcePolicyInput new] completionHandler:^(AWSCodeBuildDeleteResourcePolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testDeleteSourceCredentials {
    NSString *key = @"testDeleteSourceCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] deleteSourceCredentials:[AWSCodeBuildDeleteSourceCredentialsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testDeleteSourceCredentialsCompletionHandler {
    NSString *key = @"testDeleteSourceCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] deleteSourceCredentials:[AWSCodeBuildDeleteSourceCredentialsInput new] completionHandler:^(AWSCodeBuildDeleteSourceCredentialsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testDeleteWebhook {
    NSString *key = @"testDeleteWebhook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] deleteWebhook:[AWSCodeBuildDeleteWebhookInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testDeleteWebhookCompletionHandler {
    NSString *key = @"testDeleteWebhook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] deleteWebhook:[AWSCodeBuildDeleteWebhookInput new] completionHandler:^(AWSCodeBuildDeleteWebhookOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testDescribeTestCases {
    NSString *key = @"testDescribeTestCases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] describeTestCases:[AWSCodeBuildDescribeTestCasesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testDescribeTestCasesCompletionHandler {
    NSString *key = @"testDescribeTestCases";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] describeTestCases:[AWSCodeBuildDescribeTestCasesInput new] completionHandler:^(AWSCodeBuildDescribeTestCasesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testGetResourcePolicy {
    NSString *key = @"testGetResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] getResourcePolicy:[AWSCodeBuildGetResourcePolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testGetResourcePolicyCompletionHandler {
    NSString *key = @"testGetResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] getResourcePolicy:[AWSCodeBuildGetResourcePolicyInput new] completionHandler:^(AWSCodeBuildGetResourcePolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testImportSourceCredentials {
    NSString *key = @"testImportSourceCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] importSourceCredentials:[AWSCodeBuildImportSourceCredentialsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testImportSourceCredentialsCompletionHandler {
    NSString *key = @"testImportSourceCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] importSourceCredentials:[AWSCodeBuildImportSourceCredentialsInput new] completionHandler:^(AWSCodeBuildImportSourceCredentialsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testInvalidateProjectCache {
    NSString *key = @"testInvalidateProjectCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] invalidateProjectCache:[AWSCodeBuildInvalidateProjectCacheInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testInvalidateProjectCacheCompletionHandler {
    NSString *key = @"testInvalidateProjectCache";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] invalidateProjectCache:[AWSCodeBuildInvalidateProjectCacheInput new] completionHandler:^(AWSCodeBuildInvalidateProjectCacheOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListBuilds {
    NSString *key = @"testListBuilds";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] listBuilds:[AWSCodeBuildListBuildsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListBuildsCompletionHandler {
    NSString *key = @"testListBuilds";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] listBuilds:[AWSCodeBuildListBuildsInput new] completionHandler:^(AWSCodeBuildListBuildsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListBuildsForProject {
    NSString *key = @"testListBuildsForProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] listBuildsForProject:[AWSCodeBuildListBuildsForProjectInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListBuildsForProjectCompletionHandler {
    NSString *key = @"testListBuildsForProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] listBuildsForProject:[AWSCodeBuildListBuildsForProjectInput new] completionHandler:^(AWSCodeBuildListBuildsForProjectOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListCuratedEnvironmentImages {
    NSString *key = @"testListCuratedEnvironmentImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] listCuratedEnvironmentImages:[AWSCodeBuildListCuratedEnvironmentImagesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListCuratedEnvironmentImagesCompletionHandler {
    NSString *key = @"testListCuratedEnvironmentImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] listCuratedEnvironmentImages:[AWSCodeBuildListCuratedEnvironmentImagesInput new] completionHandler:^(AWSCodeBuildListCuratedEnvironmentImagesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListProjects {
    NSString *key = @"testListProjects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] listProjects:[AWSCodeBuildListProjectsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListProjectsCompletionHandler {
    NSString *key = @"testListProjects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] listProjects:[AWSCodeBuildListProjectsInput new] completionHandler:^(AWSCodeBuildListProjectsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListReportGroups {
    NSString *key = @"testListReportGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] listReportGroups:[AWSCodeBuildListReportGroupsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListReportGroupsCompletionHandler {
    NSString *key = @"testListReportGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] listReportGroups:[AWSCodeBuildListReportGroupsInput new] completionHandler:^(AWSCodeBuildListReportGroupsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListReports {
    NSString *key = @"testListReports";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] listReports:[AWSCodeBuildListReportsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListReportsCompletionHandler {
    NSString *key = @"testListReports";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] listReports:[AWSCodeBuildListReportsInput new] completionHandler:^(AWSCodeBuildListReportsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListReportsForReportGroup {
    NSString *key = @"testListReportsForReportGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] listReportsForReportGroup:[AWSCodeBuildListReportsForReportGroupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListReportsForReportGroupCompletionHandler {
    NSString *key = @"testListReportsForReportGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] listReportsForReportGroup:[AWSCodeBuildListReportsForReportGroupInput new] completionHandler:^(AWSCodeBuildListReportsForReportGroupOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListSharedProjects {
    NSString *key = @"testListSharedProjects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] listSharedProjects:[AWSCodeBuildListSharedProjectsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListSharedProjectsCompletionHandler {
    NSString *key = @"testListSharedProjects";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] listSharedProjects:[AWSCodeBuildListSharedProjectsInput new] completionHandler:^(AWSCodeBuildListSharedProjectsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListSharedReportGroups {
    NSString *key = @"testListSharedReportGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] listSharedReportGroups:[AWSCodeBuildListSharedReportGroupsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListSharedReportGroupsCompletionHandler {
    NSString *key = @"testListSharedReportGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] listSharedReportGroups:[AWSCodeBuildListSharedReportGroupsInput new] completionHandler:^(AWSCodeBuildListSharedReportGroupsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListSourceCredentials {
    NSString *key = @"testListSourceCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] listSourceCredentials:[AWSCodeBuildListSourceCredentialsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testListSourceCredentialsCompletionHandler {
    NSString *key = @"testListSourceCredentials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] listSourceCredentials:[AWSCodeBuildListSourceCredentialsInput new] completionHandler:^(AWSCodeBuildListSourceCredentialsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testPutResourcePolicy {
    NSString *key = @"testPutResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] putResourcePolicy:[AWSCodeBuildPutResourcePolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testPutResourcePolicyCompletionHandler {
    NSString *key = @"testPutResourcePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] putResourcePolicy:[AWSCodeBuildPutResourcePolicyInput new] completionHandler:^(AWSCodeBuildPutResourcePolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testStartBuild {
    NSString *key = @"testStartBuild";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] startBuild:[AWSCodeBuildStartBuildInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testStartBuildCompletionHandler {
    NSString *key = @"testStartBuild";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] startBuild:[AWSCodeBuildStartBuildInput new] completionHandler:^(AWSCodeBuildStartBuildOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testStopBuild {
    NSString *key = @"testStopBuild";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] stopBuild:[AWSCodeBuildStopBuildInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testStopBuildCompletionHandler {
    NSString *key = @"testStopBuild";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] stopBuild:[AWSCodeBuildStopBuildInput new] completionHandler:^(AWSCodeBuildStopBuildOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testUpdateProject {
    NSString *key = @"testUpdateProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] updateProject:[AWSCodeBuildUpdateProjectInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testUpdateProjectCompletionHandler {
    NSString *key = @"testUpdateProject";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] updateProject:[AWSCodeBuildUpdateProjectInput new] completionHandler:^(AWSCodeBuildUpdateProjectOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testUpdateReportGroup {
    NSString *key = @"testUpdateReportGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] updateReportGroup:[AWSCodeBuildUpdateReportGroupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testUpdateReportGroupCompletionHandler {
    NSString *key = @"testUpdateReportGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] updateReportGroup:[AWSCodeBuildUpdateReportGroupInput new] completionHandler:^(AWSCodeBuildUpdateReportGroupOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testUpdateWebhook {
    NSString *key = @"testUpdateWebhook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodeBuild CodeBuildForKey:key] updateWebhook:[AWSCodeBuildUpdateWebhookInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

- (void)testUpdateWebhookCompletionHandler {
    NSString *key = @"testUpdateWebhook";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodeBuild registerCodeBuildWithConfiguration:configuration forKey:key];

    AWSCodeBuild *awsClient = [AWSCodeBuild CodeBuildForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodeBuild CodeBuildForKey:key] updateWebhook:[AWSCodeBuildUpdateWebhookInput new] completionHandler:^(AWSCodeBuildUpdateWebhookOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodeBuild removeCodeBuildForKey:key];
}

@end
