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
#import "AWSCodedeployService.h"

static id mockNetworking = nil;

@interface AWSGeneralCodedeployTests : XCTestCase

@end

@implementation AWSGeneralCodedeployTests

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
    NSString *key = @"testCodedeployConstructors";
    XCTAssertNotNil([AWSCodedeploy defaultCodedeploy]);
    XCTAssertEqual([[AWSCodedeploy defaultCodedeploy] class], [AWSCodedeploy class]);
    XCTAssertNil([AWSCodedeploy CodedeployForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSCodedeploy CodedeployForKey:key]);
    XCTAssertEqual([[AWSCodedeploy CodedeployForKey:key] class], [AWSCodedeploy class]);
    XCTAssertEqual([AWSCodedeploy CodedeployForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSCodedeploy removeCodedeployForKey:key];
    XCTAssertNil([AWSCodedeploy CodedeployForKey:key]);

}

- (void)testAddTagsToOnPremisesInstances {
    NSString *key = @"testAddTagsToOnPremisesInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] addTagsToOnPremisesInstances:[AWSCodedeployAddTagsToOnPremisesInstancesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testAddTagsToOnPremisesInstancesCompletionHandler {
    NSString *key = @"testAddTagsToOnPremisesInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] addTagsToOnPremisesInstances:[AWSCodedeployAddTagsToOnPremisesInstancesInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testBatchGetApplicationRevisions {
    NSString *key = @"testBatchGetApplicationRevisions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] batchGetApplicationRevisions:[AWSCodedeployBatchGetApplicationRevisionsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testBatchGetApplicationRevisionsCompletionHandler {
    NSString *key = @"testBatchGetApplicationRevisions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] batchGetApplicationRevisions:[AWSCodedeployBatchGetApplicationRevisionsInput new] completionHandler:^(AWSCodedeployBatchGetApplicationRevisionsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testBatchGetApplications {
    NSString *key = @"testBatchGetApplications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] batchGetApplications:[AWSCodedeployBatchGetApplicationsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testBatchGetApplicationsCompletionHandler {
    NSString *key = @"testBatchGetApplications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] batchGetApplications:[AWSCodedeployBatchGetApplicationsInput new] completionHandler:^(AWSCodedeployBatchGetApplicationsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testBatchGetDeploymentGroups {
    NSString *key = @"testBatchGetDeploymentGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] batchGetDeploymentGroups:[AWSCodedeployBatchGetDeploymentGroupsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testBatchGetDeploymentGroupsCompletionHandler {
    NSString *key = @"testBatchGetDeploymentGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] batchGetDeploymentGroups:[AWSCodedeployBatchGetDeploymentGroupsInput new] completionHandler:^(AWSCodedeployBatchGetDeploymentGroupsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testBatchGetDeploymentInstances {
    NSString *key = @"testBatchGetDeploymentInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] batchGetDeploymentInstances:[AWSCodedeployBatchGetDeploymentInstancesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testBatchGetDeploymentInstancesCompletionHandler {
    NSString *key = @"testBatchGetDeploymentInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] batchGetDeploymentInstances:[AWSCodedeployBatchGetDeploymentInstancesInput new] completionHandler:^(AWSCodedeployBatchGetDeploymentInstancesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testBatchGetDeploymentTargets {
    NSString *key = @"testBatchGetDeploymentTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] batchGetDeploymentTargets:[AWSCodedeployBatchGetDeploymentTargetsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testBatchGetDeploymentTargetsCompletionHandler {
    NSString *key = @"testBatchGetDeploymentTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] batchGetDeploymentTargets:[AWSCodedeployBatchGetDeploymentTargetsInput new] completionHandler:^(AWSCodedeployBatchGetDeploymentTargetsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testBatchGetDeployments {
    NSString *key = @"testBatchGetDeployments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] batchGetDeployments:[AWSCodedeployBatchGetDeploymentsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testBatchGetDeploymentsCompletionHandler {
    NSString *key = @"testBatchGetDeployments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] batchGetDeployments:[AWSCodedeployBatchGetDeploymentsInput new] completionHandler:^(AWSCodedeployBatchGetDeploymentsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testBatchGetOnPremisesInstances {
    NSString *key = @"testBatchGetOnPremisesInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] batchGetOnPremisesInstances:[AWSCodedeployBatchGetOnPremisesInstancesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testBatchGetOnPremisesInstancesCompletionHandler {
    NSString *key = @"testBatchGetOnPremisesInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] batchGetOnPremisesInstances:[AWSCodedeployBatchGetOnPremisesInstancesInput new] completionHandler:^(AWSCodedeployBatchGetOnPremisesInstancesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testContinueDeployment {
    NSString *key = @"testContinueDeployment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] continueDeployment:[AWSCodedeployContinueDeploymentInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testContinueDeploymentCompletionHandler {
    NSString *key = @"testContinueDeployment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] continueDeployment:[AWSCodedeployContinueDeploymentInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testCreateApplication {
    NSString *key = @"testCreateApplication";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] createApplication:[AWSCodedeployCreateApplicationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testCreateApplicationCompletionHandler {
    NSString *key = @"testCreateApplication";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] createApplication:[AWSCodedeployCreateApplicationInput new] completionHandler:^(AWSCodedeployCreateApplicationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testCreateDeployment {
    NSString *key = @"testCreateDeployment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] createDeployment:[AWSCodedeployCreateDeploymentInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testCreateDeploymentCompletionHandler {
    NSString *key = @"testCreateDeployment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] createDeployment:[AWSCodedeployCreateDeploymentInput new] completionHandler:^(AWSCodedeployCreateDeploymentOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testCreateDeploymentConfig {
    NSString *key = @"testCreateDeploymentConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] createDeploymentConfig:[AWSCodedeployCreateDeploymentConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testCreateDeploymentConfigCompletionHandler {
    NSString *key = @"testCreateDeploymentConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] createDeploymentConfig:[AWSCodedeployCreateDeploymentConfigInput new] completionHandler:^(AWSCodedeployCreateDeploymentConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testCreateDeploymentGroup {
    NSString *key = @"testCreateDeploymentGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] createDeploymentGroup:[AWSCodedeployCreateDeploymentGroupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testCreateDeploymentGroupCompletionHandler {
    NSString *key = @"testCreateDeploymentGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] createDeploymentGroup:[AWSCodedeployCreateDeploymentGroupInput new] completionHandler:^(AWSCodedeployCreateDeploymentGroupOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testDeleteApplication {
    NSString *key = @"testDeleteApplication";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] deleteApplication:[AWSCodedeployDeleteApplicationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testDeleteApplicationCompletionHandler {
    NSString *key = @"testDeleteApplication";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] deleteApplication:[AWSCodedeployDeleteApplicationInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testDeleteDeploymentConfig {
    NSString *key = @"testDeleteDeploymentConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] deleteDeploymentConfig:[AWSCodedeployDeleteDeploymentConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testDeleteDeploymentConfigCompletionHandler {
    NSString *key = @"testDeleteDeploymentConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] deleteDeploymentConfig:[AWSCodedeployDeleteDeploymentConfigInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testDeleteDeploymentGroup {
    NSString *key = @"testDeleteDeploymentGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] deleteDeploymentGroup:[AWSCodedeployDeleteDeploymentGroupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testDeleteDeploymentGroupCompletionHandler {
    NSString *key = @"testDeleteDeploymentGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] deleteDeploymentGroup:[AWSCodedeployDeleteDeploymentGroupInput new] completionHandler:^(AWSCodedeployDeleteDeploymentGroupOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testDeleteGitHubAccountToken {
    NSString *key = @"testDeleteGitHubAccountToken";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] deleteGitHubAccountToken:[AWSCodedeployDeleteGitHubAccountTokenInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testDeleteGitHubAccountTokenCompletionHandler {
    NSString *key = @"testDeleteGitHubAccountToken";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] deleteGitHubAccountToken:[AWSCodedeployDeleteGitHubAccountTokenInput new] completionHandler:^(AWSCodedeployDeleteGitHubAccountTokenOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testDeleteResourcesByExternalId {
    NSString *key = @"testDeleteResourcesByExternalId";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] deleteResourcesByExternalId:[AWSCodedeployDeleteResourcesByExternalIdInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testDeleteResourcesByExternalIdCompletionHandler {
    NSString *key = @"testDeleteResourcesByExternalId";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] deleteResourcesByExternalId:[AWSCodedeployDeleteResourcesByExternalIdInput new] completionHandler:^(AWSCodedeployDeleteResourcesByExternalIdOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testDeregisterOnPremisesInstance {
    NSString *key = @"testDeregisterOnPremisesInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] deregisterOnPremisesInstance:[AWSCodedeployDeregisterOnPremisesInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testDeregisterOnPremisesInstanceCompletionHandler {
    NSString *key = @"testDeregisterOnPremisesInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] deregisterOnPremisesInstance:[AWSCodedeployDeregisterOnPremisesInstanceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetApplication {
    NSString *key = @"testGetApplication";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] getApplication:[AWSCodedeployGetApplicationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetApplicationCompletionHandler {
    NSString *key = @"testGetApplication";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] getApplication:[AWSCodedeployGetApplicationInput new] completionHandler:^(AWSCodedeployGetApplicationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetApplicationRevision {
    NSString *key = @"testGetApplicationRevision";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] getApplicationRevision:[AWSCodedeployGetApplicationRevisionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetApplicationRevisionCompletionHandler {
    NSString *key = @"testGetApplicationRevision";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] getApplicationRevision:[AWSCodedeployGetApplicationRevisionInput new] completionHandler:^(AWSCodedeployGetApplicationRevisionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetDeployment {
    NSString *key = @"testGetDeployment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] getDeployment:[AWSCodedeployGetDeploymentInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetDeploymentCompletionHandler {
    NSString *key = @"testGetDeployment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] getDeployment:[AWSCodedeployGetDeploymentInput new] completionHandler:^(AWSCodedeployGetDeploymentOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetDeploymentConfig {
    NSString *key = @"testGetDeploymentConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] getDeploymentConfig:[AWSCodedeployGetDeploymentConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetDeploymentConfigCompletionHandler {
    NSString *key = @"testGetDeploymentConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] getDeploymentConfig:[AWSCodedeployGetDeploymentConfigInput new] completionHandler:^(AWSCodedeployGetDeploymentConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetDeploymentGroup {
    NSString *key = @"testGetDeploymentGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] getDeploymentGroup:[AWSCodedeployGetDeploymentGroupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetDeploymentGroupCompletionHandler {
    NSString *key = @"testGetDeploymentGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] getDeploymentGroup:[AWSCodedeployGetDeploymentGroupInput new] completionHandler:^(AWSCodedeployGetDeploymentGroupOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetDeploymentInstance {
    NSString *key = @"testGetDeploymentInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] getDeploymentInstance:[AWSCodedeployGetDeploymentInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetDeploymentInstanceCompletionHandler {
    NSString *key = @"testGetDeploymentInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] getDeploymentInstance:[AWSCodedeployGetDeploymentInstanceInput new] completionHandler:^(AWSCodedeployGetDeploymentInstanceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetDeploymentTarget {
    NSString *key = @"testGetDeploymentTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] getDeploymentTarget:[AWSCodedeployGetDeploymentTargetInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetDeploymentTargetCompletionHandler {
    NSString *key = @"testGetDeploymentTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] getDeploymentTarget:[AWSCodedeployGetDeploymentTargetInput new] completionHandler:^(AWSCodedeployGetDeploymentTargetOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetOnPremisesInstance {
    NSString *key = @"testGetOnPremisesInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] getOnPremisesInstance:[AWSCodedeployGetOnPremisesInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testGetOnPremisesInstanceCompletionHandler {
    NSString *key = @"testGetOnPremisesInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] getOnPremisesInstance:[AWSCodedeployGetOnPremisesInstanceInput new] completionHandler:^(AWSCodedeployGetOnPremisesInstanceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListApplicationRevisions {
    NSString *key = @"testListApplicationRevisions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] listApplicationRevisions:[AWSCodedeployListApplicationRevisionsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListApplicationRevisionsCompletionHandler {
    NSString *key = @"testListApplicationRevisions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] listApplicationRevisions:[AWSCodedeployListApplicationRevisionsInput new] completionHandler:^(AWSCodedeployListApplicationRevisionsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListApplications {
    NSString *key = @"testListApplications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] listApplications:[AWSCodedeployListApplicationsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListApplicationsCompletionHandler {
    NSString *key = @"testListApplications";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] listApplications:[AWSCodedeployListApplicationsInput new] completionHandler:^(AWSCodedeployListApplicationsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListDeploymentConfigs {
    NSString *key = @"testListDeploymentConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] listDeploymentConfigs:[AWSCodedeployListDeploymentConfigsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListDeploymentConfigsCompletionHandler {
    NSString *key = @"testListDeploymentConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] listDeploymentConfigs:[AWSCodedeployListDeploymentConfigsInput new] completionHandler:^(AWSCodedeployListDeploymentConfigsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListDeploymentGroups {
    NSString *key = @"testListDeploymentGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] listDeploymentGroups:[AWSCodedeployListDeploymentGroupsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListDeploymentGroupsCompletionHandler {
    NSString *key = @"testListDeploymentGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] listDeploymentGroups:[AWSCodedeployListDeploymentGroupsInput new] completionHandler:^(AWSCodedeployListDeploymentGroupsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListDeploymentInstances {
    NSString *key = @"testListDeploymentInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] listDeploymentInstances:[AWSCodedeployListDeploymentInstancesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListDeploymentInstancesCompletionHandler {
    NSString *key = @"testListDeploymentInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] listDeploymentInstances:[AWSCodedeployListDeploymentInstancesInput new] completionHandler:^(AWSCodedeployListDeploymentInstancesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListDeploymentTargets {
    NSString *key = @"testListDeploymentTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] listDeploymentTargets:[AWSCodedeployListDeploymentTargetsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListDeploymentTargetsCompletionHandler {
    NSString *key = @"testListDeploymentTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] listDeploymentTargets:[AWSCodedeployListDeploymentTargetsInput new] completionHandler:^(AWSCodedeployListDeploymentTargetsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListDeployments {
    NSString *key = @"testListDeployments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] listDeployments:[AWSCodedeployListDeploymentsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListDeploymentsCompletionHandler {
    NSString *key = @"testListDeployments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] listDeployments:[AWSCodedeployListDeploymentsInput new] completionHandler:^(AWSCodedeployListDeploymentsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListGitHubAccountTokenNames {
    NSString *key = @"testListGitHubAccountTokenNames";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] listGitHubAccountTokenNames:[AWSCodedeployListGitHubAccountTokenNamesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListGitHubAccountTokenNamesCompletionHandler {
    NSString *key = @"testListGitHubAccountTokenNames";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] listGitHubAccountTokenNames:[AWSCodedeployListGitHubAccountTokenNamesInput new] completionHandler:^(AWSCodedeployListGitHubAccountTokenNamesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListOnPremisesInstances {
    NSString *key = @"testListOnPremisesInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] listOnPremisesInstances:[AWSCodedeployListOnPremisesInstancesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListOnPremisesInstancesCompletionHandler {
    NSString *key = @"testListOnPremisesInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] listOnPremisesInstances:[AWSCodedeployListOnPremisesInstancesInput new] completionHandler:^(AWSCodedeployListOnPremisesInstancesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] listTagsForResource:[AWSCodedeployListTagsForResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] listTagsForResource:[AWSCodedeployListTagsForResourceInput new] completionHandler:^(AWSCodedeployListTagsForResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testPutLifecycleEventHookExecutionStatus {
    NSString *key = @"testPutLifecycleEventHookExecutionStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] putLifecycleEventHookExecutionStatus:[AWSCodedeployPutLifecycleEventHookExecutionStatusInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testPutLifecycleEventHookExecutionStatusCompletionHandler {
    NSString *key = @"testPutLifecycleEventHookExecutionStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] putLifecycleEventHookExecutionStatus:[AWSCodedeployPutLifecycleEventHookExecutionStatusInput new] completionHandler:^(AWSCodedeployPutLifecycleEventHookExecutionStatusOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testRegisterApplicationRevision {
    NSString *key = @"testRegisterApplicationRevision";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] registerApplicationRevision:[AWSCodedeployRegisterApplicationRevisionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testRegisterApplicationRevisionCompletionHandler {
    NSString *key = @"testRegisterApplicationRevision";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] registerApplicationRevision:[AWSCodedeployRegisterApplicationRevisionInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testRegisterOnPremisesInstance {
    NSString *key = @"testRegisterOnPremisesInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] registerOnPremisesInstance:[AWSCodedeployRegisterOnPremisesInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testRegisterOnPremisesInstanceCompletionHandler {
    NSString *key = @"testRegisterOnPremisesInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] registerOnPremisesInstance:[AWSCodedeployRegisterOnPremisesInstanceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testRemoveTagsFromOnPremisesInstances {
    NSString *key = @"testRemoveTagsFromOnPremisesInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] removeTagsFromOnPremisesInstances:[AWSCodedeployRemoveTagsFromOnPremisesInstancesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testRemoveTagsFromOnPremisesInstancesCompletionHandler {
    NSString *key = @"testRemoveTagsFromOnPremisesInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] removeTagsFromOnPremisesInstances:[AWSCodedeployRemoveTagsFromOnPremisesInstancesInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testSkipWaitTimeForInstanceTermination {
    NSString *key = @"testSkipWaitTimeForInstanceTermination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] skipWaitTimeForInstanceTermination:[AWSCodedeploySkipWaitTimeForInstanceTerminationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testSkipWaitTimeForInstanceTerminationCompletionHandler {
    NSString *key = @"testSkipWaitTimeForInstanceTermination";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] skipWaitTimeForInstanceTermination:[AWSCodedeploySkipWaitTimeForInstanceTerminationInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testStopDeployment {
    NSString *key = @"testStopDeployment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] stopDeployment:[AWSCodedeployStopDeploymentInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testStopDeploymentCompletionHandler {
    NSString *key = @"testStopDeployment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] stopDeployment:[AWSCodedeployStopDeploymentInput new] completionHandler:^(AWSCodedeployStopDeploymentOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] tagResource:[AWSCodedeployTagResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] tagResource:[AWSCodedeployTagResourceInput new] completionHandler:^(AWSCodedeployTagResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] untagResource:[AWSCodedeployUntagResourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] untagResource:[AWSCodedeployUntagResourceInput new] completionHandler:^(AWSCodedeployUntagResourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testUpdateApplication {
    NSString *key = @"testUpdateApplication";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] updateApplication:[AWSCodedeployUpdateApplicationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testUpdateApplicationCompletionHandler {
    NSString *key = @"testUpdateApplication";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] updateApplication:[AWSCodedeployUpdateApplicationInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testUpdateDeploymentGroup {
    NSString *key = @"testUpdateDeploymentGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSCodedeploy CodedeployForKey:key] updateDeploymentGroup:[AWSCodedeployUpdateDeploymentGroupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

- (void)testUpdateDeploymentGroupCompletionHandler {
    NSString *key = @"testUpdateDeploymentGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSCodedeploy registerCodedeployWithConfiguration:configuration forKey:key];

    AWSCodedeploy *awsClient = [AWSCodedeploy CodedeployForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSCodedeploy CodedeployForKey:key] updateDeploymentGroup:[AWSCodedeployUpdateDeploymentGroupInput new] completionHandler:^(AWSCodedeployUpdateDeploymentGroupOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSCodedeploy removeCodedeployForKey:key];
}

@end
