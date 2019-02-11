//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSMachineLearningService.h"

static id mockNetworking = nil;

@interface AWSGeneralMachineLearningTests : XCTestCase

@end

@implementation AWSGeneralMachineLearningTests

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
    NSString *key = @"testMachineLearningConstructors";
    XCTAssertNotNil([AWSMachineLearning defaultMachineLearning]);
    XCTAssertEqual([[AWSMachineLearning defaultMachineLearning] class], [AWSMachineLearning class]);
    XCTAssertNil([AWSMachineLearning MachineLearningForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSMachineLearning MachineLearningForKey:key]);
    XCTAssertEqual([[AWSMachineLearning MachineLearningForKey:key] class], [AWSMachineLearning class]);
    XCTAssertEqual([AWSMachineLearning MachineLearningForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSMachineLearning removeMachineLearningForKey:key];
    XCTAssertNil([AWSMachineLearning MachineLearningForKey:key]);

}

- (void)testAddTags {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] addTags:[AWSMachineLearningAddTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testAddTagsCompletionHandler {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] addTags:[AWSMachineLearningAddTagsInput new] completionHandler:^(AWSMachineLearningAddTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testCreateBatchPrediction {
    NSString *key = @"testCreateBatchPrediction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] createBatchPrediction:[AWSMachineLearningCreateBatchPredictionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testCreateBatchPredictionCompletionHandler {
    NSString *key = @"testCreateBatchPrediction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] createBatchPrediction:[AWSMachineLearningCreateBatchPredictionInput new] completionHandler:^(AWSMachineLearningCreateBatchPredictionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testCreateDataSourceFromRDS {
    NSString *key = @"testCreateDataSourceFromRDS";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] createDataSourceFromRDS:[AWSMachineLearningCreateDataSourceFromRDSInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testCreateDataSourceFromRDSCompletionHandler {
    NSString *key = @"testCreateDataSourceFromRDS";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] createDataSourceFromRDS:[AWSMachineLearningCreateDataSourceFromRDSInput new] completionHandler:^(AWSMachineLearningCreateDataSourceFromRDSOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testCreateDataSourceFromRedshift {
    NSString *key = @"testCreateDataSourceFromRedshift";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] createDataSourceFromRedshift:[AWSMachineLearningCreateDataSourceFromRedshiftInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testCreateDataSourceFromRedshiftCompletionHandler {
    NSString *key = @"testCreateDataSourceFromRedshift";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] createDataSourceFromRedshift:[AWSMachineLearningCreateDataSourceFromRedshiftInput new] completionHandler:^(AWSMachineLearningCreateDataSourceFromRedshiftOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testCreateDataSourceFromS3 {
    NSString *key = @"testCreateDataSourceFromS3";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] createDataSourceFromS3:[AWSMachineLearningCreateDataSourceFromS3Input new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testCreateDataSourceFromS3CompletionHandler {
    NSString *key = @"testCreateDataSourceFromS3";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] createDataSourceFromS3:[AWSMachineLearningCreateDataSourceFromS3Input new] completionHandler:^(AWSMachineLearningCreateDataSourceFromS3Output* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testCreateEvaluation {
    NSString *key = @"testCreateEvaluation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] createEvaluation:[AWSMachineLearningCreateEvaluationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testCreateEvaluationCompletionHandler {
    NSString *key = @"testCreateEvaluation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] createEvaluation:[AWSMachineLearningCreateEvaluationInput new] completionHandler:^(AWSMachineLearningCreateEvaluationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testCreateMLModel {
    NSString *key = @"testCreateMLModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] createMLModel:[AWSMachineLearningCreateMLModelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testCreateMLModelCompletionHandler {
    NSString *key = @"testCreateMLModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] createMLModel:[AWSMachineLearningCreateMLModelInput new] completionHandler:^(AWSMachineLearningCreateMLModelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testCreateRealtimeEndpoint {
    NSString *key = @"testCreateRealtimeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] createRealtimeEndpoint:[AWSMachineLearningCreateRealtimeEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testCreateRealtimeEndpointCompletionHandler {
    NSString *key = @"testCreateRealtimeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] createRealtimeEndpoint:[AWSMachineLearningCreateRealtimeEndpointInput new] completionHandler:^(AWSMachineLearningCreateRealtimeEndpointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDeleteBatchPrediction {
    NSString *key = @"testDeleteBatchPrediction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] deleteBatchPrediction:[AWSMachineLearningDeleteBatchPredictionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDeleteBatchPredictionCompletionHandler {
    NSString *key = @"testDeleteBatchPrediction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] deleteBatchPrediction:[AWSMachineLearningDeleteBatchPredictionInput new] completionHandler:^(AWSMachineLearningDeleteBatchPredictionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDeleteDataSource {
    NSString *key = @"testDeleteDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] deleteDataSource:[AWSMachineLearningDeleteDataSourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDeleteDataSourceCompletionHandler {
    NSString *key = @"testDeleteDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] deleteDataSource:[AWSMachineLearningDeleteDataSourceInput new] completionHandler:^(AWSMachineLearningDeleteDataSourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDeleteEvaluation {
    NSString *key = @"testDeleteEvaluation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] deleteEvaluation:[AWSMachineLearningDeleteEvaluationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDeleteEvaluationCompletionHandler {
    NSString *key = @"testDeleteEvaluation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] deleteEvaluation:[AWSMachineLearningDeleteEvaluationInput new] completionHandler:^(AWSMachineLearningDeleteEvaluationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDeleteMLModel {
    NSString *key = @"testDeleteMLModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] deleteMLModel:[AWSMachineLearningDeleteMLModelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDeleteMLModelCompletionHandler {
    NSString *key = @"testDeleteMLModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] deleteMLModel:[AWSMachineLearningDeleteMLModelInput new] completionHandler:^(AWSMachineLearningDeleteMLModelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDeleteRealtimeEndpoint {
    NSString *key = @"testDeleteRealtimeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] deleteRealtimeEndpoint:[AWSMachineLearningDeleteRealtimeEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDeleteRealtimeEndpointCompletionHandler {
    NSString *key = @"testDeleteRealtimeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] deleteRealtimeEndpoint:[AWSMachineLearningDeleteRealtimeEndpointInput new] completionHandler:^(AWSMachineLearningDeleteRealtimeEndpointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDeleteTags {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] deleteTags:[AWSMachineLearningDeleteTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDeleteTagsCompletionHandler {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] deleteTags:[AWSMachineLearningDeleteTagsInput new] completionHandler:^(AWSMachineLearningDeleteTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDescribeBatchPredictions {
    NSString *key = @"testDescribeBatchPredictions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] describeBatchPredictions:[AWSMachineLearningDescribeBatchPredictionsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDescribeBatchPredictionsCompletionHandler {
    NSString *key = @"testDescribeBatchPredictions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] describeBatchPredictions:[AWSMachineLearningDescribeBatchPredictionsInput new] completionHandler:^(AWSMachineLearningDescribeBatchPredictionsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDescribeDataSources {
    NSString *key = @"testDescribeDataSources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] describeDataSources:[AWSMachineLearningDescribeDataSourcesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDescribeDataSourcesCompletionHandler {
    NSString *key = @"testDescribeDataSources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] describeDataSources:[AWSMachineLearningDescribeDataSourcesInput new] completionHandler:^(AWSMachineLearningDescribeDataSourcesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDescribeEvaluations {
    NSString *key = @"testDescribeEvaluations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] describeEvaluations:[AWSMachineLearningDescribeEvaluationsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDescribeEvaluationsCompletionHandler {
    NSString *key = @"testDescribeEvaluations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] describeEvaluations:[AWSMachineLearningDescribeEvaluationsInput new] completionHandler:^(AWSMachineLearningDescribeEvaluationsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDescribeMLModels {
    NSString *key = @"testDescribeMLModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] describeMLModels:[AWSMachineLearningDescribeMLModelsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDescribeMLModelsCompletionHandler {
    NSString *key = @"testDescribeMLModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] describeMLModels:[AWSMachineLearningDescribeMLModelsInput new] completionHandler:^(AWSMachineLearningDescribeMLModelsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDescribeTags {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] describeTags:[AWSMachineLearningDescribeTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testDescribeTagsCompletionHandler {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] describeTags:[AWSMachineLearningDescribeTagsInput new] completionHandler:^(AWSMachineLearningDescribeTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testGetBatchPrediction {
    NSString *key = @"testGetBatchPrediction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] getBatchPrediction:[AWSMachineLearningGetBatchPredictionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testGetBatchPredictionCompletionHandler {
    NSString *key = @"testGetBatchPrediction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] getBatchPrediction:[AWSMachineLearningGetBatchPredictionInput new] completionHandler:^(AWSMachineLearningGetBatchPredictionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testGetDataSource {
    NSString *key = @"testGetDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] getDataSource:[AWSMachineLearningGetDataSourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testGetDataSourceCompletionHandler {
    NSString *key = @"testGetDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] getDataSource:[AWSMachineLearningGetDataSourceInput new] completionHandler:^(AWSMachineLearningGetDataSourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testGetEvaluation {
    NSString *key = @"testGetEvaluation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] getEvaluation:[AWSMachineLearningGetEvaluationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testGetEvaluationCompletionHandler {
    NSString *key = @"testGetEvaluation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] getEvaluation:[AWSMachineLearningGetEvaluationInput new] completionHandler:^(AWSMachineLearningGetEvaluationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testGetMLModel {
    NSString *key = @"testGetMLModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] getMLModel:[AWSMachineLearningGetMLModelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testGetMLModelCompletionHandler {
    NSString *key = @"testGetMLModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] getMLModel:[AWSMachineLearningGetMLModelInput new] completionHandler:^(AWSMachineLearningGetMLModelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testPredict {
    NSString *key = @"testPredict";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] predict:[AWSMachineLearningPredictInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testPredictCompletionHandler {
    NSString *key = @"testPredict";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] predict:[AWSMachineLearningPredictInput new] completionHandler:^(AWSMachineLearningPredictOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testUpdateBatchPrediction {
    NSString *key = @"testUpdateBatchPrediction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] updateBatchPrediction:[AWSMachineLearningUpdateBatchPredictionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testUpdateBatchPredictionCompletionHandler {
    NSString *key = @"testUpdateBatchPrediction";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] updateBatchPrediction:[AWSMachineLearningUpdateBatchPredictionInput new] completionHandler:^(AWSMachineLearningUpdateBatchPredictionOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testUpdateDataSource {
    NSString *key = @"testUpdateDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] updateDataSource:[AWSMachineLearningUpdateDataSourceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testUpdateDataSourceCompletionHandler {
    NSString *key = @"testUpdateDataSource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] updateDataSource:[AWSMachineLearningUpdateDataSourceInput new] completionHandler:^(AWSMachineLearningUpdateDataSourceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testUpdateEvaluation {
    NSString *key = @"testUpdateEvaluation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] updateEvaluation:[AWSMachineLearningUpdateEvaluationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testUpdateEvaluationCompletionHandler {
    NSString *key = @"testUpdateEvaluation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] updateEvaluation:[AWSMachineLearningUpdateEvaluationInput new] completionHandler:^(AWSMachineLearningUpdateEvaluationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testUpdateMLModel {
    NSString *key = @"testUpdateMLModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMachineLearning MachineLearningForKey:key] updateMLModel:[AWSMachineLearningUpdateMLModelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

- (void)testUpdateMLModelCompletionHandler {
    NSString *key = @"testUpdateMLModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMachineLearning registerMachineLearningWithConfiguration:configuration forKey:key];

    AWSMachineLearning *awsClient = [AWSMachineLearning MachineLearningForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMachineLearning MachineLearningForKey:key] updateMLModel:[AWSMachineLearningUpdateMLModelInput new] completionHandler:^(AWSMachineLearningUpdateMLModelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMachineLearning removeMachineLearningForKey:key];
}

@end
