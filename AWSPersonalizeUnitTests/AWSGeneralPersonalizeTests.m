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
#import "AWSPersonalizeService.h"

static id mockNetworking = nil;

@interface AWSGeneralPersonalizeTests : XCTestCase

@end

@implementation AWSGeneralPersonalizeTests

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
    NSString *key = @"testPersonalizeConstructors";
    XCTAssertNotNil([AWSPersonalize defaultPersonalize]);
    XCTAssertEqual([[AWSPersonalize defaultPersonalize] class], [AWSPersonalize class]);
    XCTAssertNil([AWSPersonalize PersonalizeForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSPersonalize PersonalizeForKey:key]);
    XCTAssertEqual([[AWSPersonalize PersonalizeForKey:key] class], [AWSPersonalize class]);
    XCTAssertEqual([AWSPersonalize PersonalizeForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSPersonalize removePersonalizeForKey:key];
    XCTAssertNil([AWSPersonalize PersonalizeForKey:key]);

}

- (void)testCreateBatchInferenceJob {
    NSString *key = @"testCreateBatchInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] createBatchInferenceJob:[AWSPersonalizeCreateBatchInferenceJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateBatchInferenceJobCompletionHandler {
    NSString *key = @"testCreateBatchInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] createBatchInferenceJob:[AWSPersonalizeCreateBatchInferenceJobRequest new] completionHandler:^(AWSPersonalizeCreateBatchInferenceJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateCampaign {
    NSString *key = @"testCreateCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] createCampaign:[AWSPersonalizeCreateCampaignRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateCampaignCompletionHandler {
    NSString *key = @"testCreateCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] createCampaign:[AWSPersonalizeCreateCampaignRequest new] completionHandler:^(AWSPersonalizeCreateCampaignResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateDataset {
    NSString *key = @"testCreateDataset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] createDataset:[AWSPersonalizeCreateDatasetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateDatasetCompletionHandler {
    NSString *key = @"testCreateDataset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] createDataset:[AWSPersonalizeCreateDatasetRequest new] completionHandler:^(AWSPersonalizeCreateDatasetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateDatasetGroup {
    NSString *key = @"testCreateDatasetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] createDatasetGroup:[AWSPersonalizeCreateDatasetGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateDatasetGroupCompletionHandler {
    NSString *key = @"testCreateDatasetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] createDatasetGroup:[AWSPersonalizeCreateDatasetGroupRequest new] completionHandler:^(AWSPersonalizeCreateDatasetGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateDatasetImportJob {
    NSString *key = @"testCreateDatasetImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] createDatasetImportJob:[AWSPersonalizeCreateDatasetImportJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateDatasetImportJobCompletionHandler {
    NSString *key = @"testCreateDatasetImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] createDatasetImportJob:[AWSPersonalizeCreateDatasetImportJobRequest new] completionHandler:^(AWSPersonalizeCreateDatasetImportJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateEventTracker {
    NSString *key = @"testCreateEventTracker";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] createEventTracker:[AWSPersonalizeCreateEventTrackerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateEventTrackerCompletionHandler {
    NSString *key = @"testCreateEventTracker";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] createEventTracker:[AWSPersonalizeCreateEventTrackerRequest new] completionHandler:^(AWSPersonalizeCreateEventTrackerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateFilter {
    NSString *key = @"testCreateFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] createFilter:[AWSPersonalizeCreateFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateFilterCompletionHandler {
    NSString *key = @"testCreateFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] createFilter:[AWSPersonalizeCreateFilterRequest new] completionHandler:^(AWSPersonalizeCreateFilterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateSchema {
    NSString *key = @"testCreateSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] createSchema:[AWSPersonalizeCreateSchemaRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateSchemaCompletionHandler {
    NSString *key = @"testCreateSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] createSchema:[AWSPersonalizeCreateSchemaRequest new] completionHandler:^(AWSPersonalizeCreateSchemaResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateSolution {
    NSString *key = @"testCreateSolution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] createSolution:[AWSPersonalizeCreateSolutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateSolutionCompletionHandler {
    NSString *key = @"testCreateSolution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] createSolution:[AWSPersonalizeCreateSolutionRequest new] completionHandler:^(AWSPersonalizeCreateSolutionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateSolutionVersion {
    NSString *key = @"testCreateSolutionVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] createSolutionVersion:[AWSPersonalizeCreateSolutionVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testCreateSolutionVersionCompletionHandler {
    NSString *key = @"testCreateSolutionVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] createSolutionVersion:[AWSPersonalizeCreateSolutionVersionRequest new] completionHandler:^(AWSPersonalizeCreateSolutionVersionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDeleteCampaign {
    NSString *key = @"testDeleteCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] deleteCampaign:[AWSPersonalizeDeleteCampaignRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDeleteCampaignCompletionHandler {
    NSString *key = @"testDeleteCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] deleteCampaign:[AWSPersonalizeDeleteCampaignRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDeleteDataset {
    NSString *key = @"testDeleteDataset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] deleteDataset:[AWSPersonalizeDeleteDatasetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDeleteDatasetCompletionHandler {
    NSString *key = @"testDeleteDataset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] deleteDataset:[AWSPersonalizeDeleteDatasetRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDeleteDatasetGroup {
    NSString *key = @"testDeleteDatasetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] deleteDatasetGroup:[AWSPersonalizeDeleteDatasetGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDeleteDatasetGroupCompletionHandler {
    NSString *key = @"testDeleteDatasetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] deleteDatasetGroup:[AWSPersonalizeDeleteDatasetGroupRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDeleteEventTracker {
    NSString *key = @"testDeleteEventTracker";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] deleteEventTracker:[AWSPersonalizeDeleteEventTrackerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDeleteEventTrackerCompletionHandler {
    NSString *key = @"testDeleteEventTracker";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] deleteEventTracker:[AWSPersonalizeDeleteEventTrackerRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDeleteFilter {
    NSString *key = @"testDeleteFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] deleteFilter:[AWSPersonalizeDeleteFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDeleteFilterCompletionHandler {
    NSString *key = @"testDeleteFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] deleteFilter:[AWSPersonalizeDeleteFilterRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDeleteSchema {
    NSString *key = @"testDeleteSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] deleteSchema:[AWSPersonalizeDeleteSchemaRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDeleteSchemaCompletionHandler {
    NSString *key = @"testDeleteSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] deleteSchema:[AWSPersonalizeDeleteSchemaRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDeleteSolution {
    NSString *key = @"testDeleteSolution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] deleteSolution:[AWSPersonalizeDeleteSolutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDeleteSolutionCompletionHandler {
    NSString *key = @"testDeleteSolution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] deleteSolution:[AWSPersonalizeDeleteSolutionRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeAlgorithm {
    NSString *key = @"testDescribeAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] describeAlgorithm:[AWSPersonalizeDescribeAlgorithmRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeAlgorithmCompletionHandler {
    NSString *key = @"testDescribeAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] describeAlgorithm:[AWSPersonalizeDescribeAlgorithmRequest new] completionHandler:^(AWSPersonalizeDescribeAlgorithmResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeBatchInferenceJob {
    NSString *key = @"testDescribeBatchInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] describeBatchInferenceJob:[AWSPersonalizeDescribeBatchInferenceJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeBatchInferenceJobCompletionHandler {
    NSString *key = @"testDescribeBatchInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] describeBatchInferenceJob:[AWSPersonalizeDescribeBatchInferenceJobRequest new] completionHandler:^(AWSPersonalizeDescribeBatchInferenceJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeCampaign {
    NSString *key = @"testDescribeCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] describeCampaign:[AWSPersonalizeDescribeCampaignRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeCampaignCompletionHandler {
    NSString *key = @"testDescribeCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] describeCampaign:[AWSPersonalizeDescribeCampaignRequest new] completionHandler:^(AWSPersonalizeDescribeCampaignResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeDataset {
    NSString *key = @"testDescribeDataset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] describeDataset:[AWSPersonalizeDescribeDatasetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeDatasetCompletionHandler {
    NSString *key = @"testDescribeDataset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] describeDataset:[AWSPersonalizeDescribeDatasetRequest new] completionHandler:^(AWSPersonalizeDescribeDatasetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeDatasetGroup {
    NSString *key = @"testDescribeDatasetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] describeDatasetGroup:[AWSPersonalizeDescribeDatasetGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeDatasetGroupCompletionHandler {
    NSString *key = @"testDescribeDatasetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] describeDatasetGroup:[AWSPersonalizeDescribeDatasetGroupRequest new] completionHandler:^(AWSPersonalizeDescribeDatasetGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeDatasetImportJob {
    NSString *key = @"testDescribeDatasetImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] describeDatasetImportJob:[AWSPersonalizeDescribeDatasetImportJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeDatasetImportJobCompletionHandler {
    NSString *key = @"testDescribeDatasetImportJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] describeDatasetImportJob:[AWSPersonalizeDescribeDatasetImportJobRequest new] completionHandler:^(AWSPersonalizeDescribeDatasetImportJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeEventTracker {
    NSString *key = @"testDescribeEventTracker";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] describeEventTracker:[AWSPersonalizeDescribeEventTrackerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeEventTrackerCompletionHandler {
    NSString *key = @"testDescribeEventTracker";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] describeEventTracker:[AWSPersonalizeDescribeEventTrackerRequest new] completionHandler:^(AWSPersonalizeDescribeEventTrackerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeFeatureTransformation {
    NSString *key = @"testDescribeFeatureTransformation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] describeFeatureTransformation:[AWSPersonalizeDescribeFeatureTransformationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeFeatureTransformationCompletionHandler {
    NSString *key = @"testDescribeFeatureTransformation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] describeFeatureTransformation:[AWSPersonalizeDescribeFeatureTransformationRequest new] completionHandler:^(AWSPersonalizeDescribeFeatureTransformationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeFilter {
    NSString *key = @"testDescribeFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] describeFilter:[AWSPersonalizeDescribeFilterRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeFilterCompletionHandler {
    NSString *key = @"testDescribeFilter";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] describeFilter:[AWSPersonalizeDescribeFilterRequest new] completionHandler:^(AWSPersonalizeDescribeFilterResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeRecipe {
    NSString *key = @"testDescribeRecipe";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] describeRecipe:[AWSPersonalizeDescribeRecipeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeRecipeCompletionHandler {
    NSString *key = @"testDescribeRecipe";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] describeRecipe:[AWSPersonalizeDescribeRecipeRequest new] completionHandler:^(AWSPersonalizeDescribeRecipeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeSchema {
    NSString *key = @"testDescribeSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] describeSchema:[AWSPersonalizeDescribeSchemaRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeSchemaCompletionHandler {
    NSString *key = @"testDescribeSchema";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] describeSchema:[AWSPersonalizeDescribeSchemaRequest new] completionHandler:^(AWSPersonalizeDescribeSchemaResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeSolution {
    NSString *key = @"testDescribeSolution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] describeSolution:[AWSPersonalizeDescribeSolutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeSolutionCompletionHandler {
    NSString *key = @"testDescribeSolution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] describeSolution:[AWSPersonalizeDescribeSolutionRequest new] completionHandler:^(AWSPersonalizeDescribeSolutionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeSolutionVersion {
    NSString *key = @"testDescribeSolutionVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] describeSolutionVersion:[AWSPersonalizeDescribeSolutionVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testDescribeSolutionVersionCompletionHandler {
    NSString *key = @"testDescribeSolutionVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] describeSolutionVersion:[AWSPersonalizeDescribeSolutionVersionRequest new] completionHandler:^(AWSPersonalizeDescribeSolutionVersionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testGetSolutionMetrics {
    NSString *key = @"testGetSolutionMetrics";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] getSolutionMetrics:[AWSPersonalizeGetSolutionMetricsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testGetSolutionMetricsCompletionHandler {
    NSString *key = @"testGetSolutionMetrics";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] getSolutionMetrics:[AWSPersonalizeGetSolutionMetricsRequest new] completionHandler:^(AWSPersonalizeGetSolutionMetricsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListBatchInferenceJobs {
    NSString *key = @"testListBatchInferenceJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] listBatchInferenceJobs:[AWSPersonalizeListBatchInferenceJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListBatchInferenceJobsCompletionHandler {
    NSString *key = @"testListBatchInferenceJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] listBatchInferenceJobs:[AWSPersonalizeListBatchInferenceJobsRequest new] completionHandler:^(AWSPersonalizeListBatchInferenceJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListCampaigns {
    NSString *key = @"testListCampaigns";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] listCampaigns:[AWSPersonalizeListCampaignsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListCampaignsCompletionHandler {
    NSString *key = @"testListCampaigns";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] listCampaigns:[AWSPersonalizeListCampaignsRequest new] completionHandler:^(AWSPersonalizeListCampaignsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListDatasetGroups {
    NSString *key = @"testListDatasetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] listDatasetGroups:[AWSPersonalizeListDatasetGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListDatasetGroupsCompletionHandler {
    NSString *key = @"testListDatasetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] listDatasetGroups:[AWSPersonalizeListDatasetGroupsRequest new] completionHandler:^(AWSPersonalizeListDatasetGroupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListDatasetImportJobs {
    NSString *key = @"testListDatasetImportJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] listDatasetImportJobs:[AWSPersonalizeListDatasetImportJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListDatasetImportJobsCompletionHandler {
    NSString *key = @"testListDatasetImportJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] listDatasetImportJobs:[AWSPersonalizeListDatasetImportJobsRequest new] completionHandler:^(AWSPersonalizeListDatasetImportJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListDatasets {
    NSString *key = @"testListDatasets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] listDatasets:[AWSPersonalizeListDatasetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListDatasetsCompletionHandler {
    NSString *key = @"testListDatasets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] listDatasets:[AWSPersonalizeListDatasetsRequest new] completionHandler:^(AWSPersonalizeListDatasetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListEventTrackers {
    NSString *key = @"testListEventTrackers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] listEventTrackers:[AWSPersonalizeListEventTrackersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListEventTrackersCompletionHandler {
    NSString *key = @"testListEventTrackers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] listEventTrackers:[AWSPersonalizeListEventTrackersRequest new] completionHandler:^(AWSPersonalizeListEventTrackersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListFilters {
    NSString *key = @"testListFilters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] listFilters:[AWSPersonalizeListFiltersRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListFiltersCompletionHandler {
    NSString *key = @"testListFilters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] listFilters:[AWSPersonalizeListFiltersRequest new] completionHandler:^(AWSPersonalizeListFiltersResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListRecipes {
    NSString *key = @"testListRecipes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] listRecipes:[AWSPersonalizeListRecipesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListRecipesCompletionHandler {
    NSString *key = @"testListRecipes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] listRecipes:[AWSPersonalizeListRecipesRequest new] completionHandler:^(AWSPersonalizeListRecipesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListSchemas {
    NSString *key = @"testListSchemas";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] listSchemas:[AWSPersonalizeListSchemasRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListSchemasCompletionHandler {
    NSString *key = @"testListSchemas";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] listSchemas:[AWSPersonalizeListSchemasRequest new] completionHandler:^(AWSPersonalizeListSchemasResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListSolutionVersions {
    NSString *key = @"testListSolutionVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] listSolutionVersions:[AWSPersonalizeListSolutionVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListSolutionVersionsCompletionHandler {
    NSString *key = @"testListSolutionVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] listSolutionVersions:[AWSPersonalizeListSolutionVersionsRequest new] completionHandler:^(AWSPersonalizeListSolutionVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListSolutions {
    NSString *key = @"testListSolutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] listSolutions:[AWSPersonalizeListSolutionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testListSolutionsCompletionHandler {
    NSString *key = @"testListSolutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] listSolutions:[AWSPersonalizeListSolutionsRequest new] completionHandler:^(AWSPersonalizeListSolutionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testUpdateCampaign {
    NSString *key = @"testUpdateCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSPersonalize PersonalizeForKey:key] updateCampaign:[AWSPersonalizeUpdateCampaignRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

- (void)testUpdateCampaignCompletionHandler {
    NSString *key = @"testUpdateCampaign";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSPersonalize registerPersonalizeWithConfiguration:configuration forKey:key];

    AWSPersonalize *awsClient = [AWSPersonalize PersonalizeForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSPersonalize PersonalizeForKey:key] updateCampaign:[AWSPersonalizeUpdateCampaignRequest new] completionHandler:^(AWSPersonalizeUpdateCampaignResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSPersonalize removePersonalizeForKey:key];
}

@end
