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
#import "AWSAWSComprehendMedicalService.h"

static id mockNetworking = nil;

@interface AWSGeneralAWSComprehendMedicalTests : XCTestCase

@end

@implementation AWSGeneralAWSComprehendMedicalTests

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
    NSString *key = @"testAWSComprehendMedicalConstructors";
    XCTAssertNotNil([AWSAWSComprehendMedical defaultAWSComprehendMedical]);
    XCTAssertEqual([[AWSAWSComprehendMedical defaultAWSComprehendMedical] class], [AWSAWSComprehendMedical class]);
    XCTAssertNil([AWSAWSComprehendMedical AWSComprehendMedicalForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSAWSComprehendMedical AWSComprehendMedicalForKey:key]);
    XCTAssertEqual([[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] class], [AWSAWSComprehendMedical class]);
    XCTAssertEqual([AWSAWSComprehendMedical AWSComprehendMedicalForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
    XCTAssertNil([AWSAWSComprehendMedical AWSComprehendMedicalForKey:key]);

}

- (void)testDescribeEntitiesDetectionV2Job {
    NSString *key = @"testDescribeEntitiesDetectionV2Job";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] describeEntitiesDetectionV2Job:[AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testDescribeEntitiesDetectionV2JobCompletionHandler {
    NSString *key = @"testDescribeEntitiesDetectionV2Job";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] describeEntitiesDetectionV2Job:[AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobRequest new] completionHandler:^(AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testDescribeICD10CMInferenceJob {
    NSString *key = @"testDescribeICD10CMInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] describeICD10CMInferenceJob:[AWSAWSComprehendMedicalDescribeICD10CMInferenceJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testDescribeICD10CMInferenceJobCompletionHandler {
    NSString *key = @"testDescribeICD10CMInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] describeICD10CMInferenceJob:[AWSAWSComprehendMedicalDescribeICD10CMInferenceJobRequest new] completionHandler:^(AWSAWSComprehendMedicalDescribeICD10CMInferenceJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testDescribePHIDetectionJob {
    NSString *key = @"testDescribePHIDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] describePHIDetectionJob:[AWSAWSComprehendMedicalDescribePHIDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testDescribePHIDetectionJobCompletionHandler {
    NSString *key = @"testDescribePHIDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] describePHIDetectionJob:[AWSAWSComprehendMedicalDescribePHIDetectionJobRequest new] completionHandler:^(AWSAWSComprehendMedicalDescribePHIDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testDescribeRxNormInferenceJob {
    NSString *key = @"testDescribeRxNormInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] describeRxNormInferenceJob:[AWSAWSComprehendMedicalDescribeRxNormInferenceJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testDescribeRxNormInferenceJobCompletionHandler {
    NSString *key = @"testDescribeRxNormInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] describeRxNormInferenceJob:[AWSAWSComprehendMedicalDescribeRxNormInferenceJobRequest new] completionHandler:^(AWSAWSComprehendMedicalDescribeRxNormInferenceJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testDetectEntities {
    NSString *key = @"testDetectEntities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] detectEntities:[AWSAWSComprehendMedicalDetectEntitiesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testDetectEntitiesCompletionHandler {
    NSString *key = @"testDetectEntities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] detectEntities:[AWSAWSComprehendMedicalDetectEntitiesRequest new] completionHandler:^(AWSAWSComprehendMedicalDetectEntitiesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testDetectEntitiesV2 {
    NSString *key = @"testDetectEntitiesV2";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] detectEntitiesV2:[AWSAWSComprehendMedicalDetectEntitiesV2Request new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testDetectEntitiesV2CompletionHandler {
    NSString *key = @"testDetectEntitiesV2";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] detectEntitiesV2:[AWSAWSComprehendMedicalDetectEntitiesV2Request new] completionHandler:^(AWSAWSComprehendMedicalDetectEntitiesV2Response* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testDetectPHI {
    NSString *key = @"testDetectPHI";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] detectPHI:[AWSAWSComprehendMedicalDetectPHIRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testDetectPHICompletionHandler {
    NSString *key = @"testDetectPHI";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] detectPHI:[AWSAWSComprehendMedicalDetectPHIRequest new] completionHandler:^(AWSAWSComprehendMedicalDetectPHIResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testInferICD10CM {
    NSString *key = @"testInferICD10CM";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] inferICD10CM:[AWSAWSComprehendMedicalInferICD10CMRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testInferICD10CMCompletionHandler {
    NSString *key = @"testInferICD10CM";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] inferICD10CM:[AWSAWSComprehendMedicalInferICD10CMRequest new] completionHandler:^(AWSAWSComprehendMedicalInferICD10CMResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testInferRxNorm {
    NSString *key = @"testInferRxNorm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] inferRxNorm:[AWSAWSComprehendMedicalInferRxNormRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testInferRxNormCompletionHandler {
    NSString *key = @"testInferRxNorm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] inferRxNorm:[AWSAWSComprehendMedicalInferRxNormRequest new] completionHandler:^(AWSAWSComprehendMedicalInferRxNormResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testListEntitiesDetectionV2Jobs {
    NSString *key = @"testListEntitiesDetectionV2Jobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] listEntitiesDetectionV2Jobs:[AWSAWSComprehendMedicalListEntitiesDetectionV2JobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testListEntitiesDetectionV2JobsCompletionHandler {
    NSString *key = @"testListEntitiesDetectionV2Jobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] listEntitiesDetectionV2Jobs:[AWSAWSComprehendMedicalListEntitiesDetectionV2JobsRequest new] completionHandler:^(AWSAWSComprehendMedicalListEntitiesDetectionV2JobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testListICD10CMInferenceJobs {
    NSString *key = @"testListICD10CMInferenceJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] listICD10CMInferenceJobs:[AWSAWSComprehendMedicalListICD10CMInferenceJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testListICD10CMInferenceJobsCompletionHandler {
    NSString *key = @"testListICD10CMInferenceJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] listICD10CMInferenceJobs:[AWSAWSComprehendMedicalListICD10CMInferenceJobsRequest new] completionHandler:^(AWSAWSComprehendMedicalListICD10CMInferenceJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testListPHIDetectionJobs {
    NSString *key = @"testListPHIDetectionJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] listPHIDetectionJobs:[AWSAWSComprehendMedicalListPHIDetectionJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testListPHIDetectionJobsCompletionHandler {
    NSString *key = @"testListPHIDetectionJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] listPHIDetectionJobs:[AWSAWSComprehendMedicalListPHIDetectionJobsRequest new] completionHandler:^(AWSAWSComprehendMedicalListPHIDetectionJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testListRxNormInferenceJobs {
    NSString *key = @"testListRxNormInferenceJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] listRxNormInferenceJobs:[AWSAWSComprehendMedicalListRxNormInferenceJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testListRxNormInferenceJobsCompletionHandler {
    NSString *key = @"testListRxNormInferenceJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] listRxNormInferenceJobs:[AWSAWSComprehendMedicalListRxNormInferenceJobsRequest new] completionHandler:^(AWSAWSComprehendMedicalListRxNormInferenceJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStartEntitiesDetectionV2Job {
    NSString *key = @"testStartEntitiesDetectionV2Job";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] startEntitiesDetectionV2Job:[AWSAWSComprehendMedicalStartEntitiesDetectionV2JobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStartEntitiesDetectionV2JobCompletionHandler {
    NSString *key = @"testStartEntitiesDetectionV2Job";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] startEntitiesDetectionV2Job:[AWSAWSComprehendMedicalStartEntitiesDetectionV2JobRequest new] completionHandler:^(AWSAWSComprehendMedicalStartEntitiesDetectionV2JobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStartICD10CMInferenceJob {
    NSString *key = @"testStartICD10CMInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] startICD10CMInferenceJob:[AWSAWSComprehendMedicalStartICD10CMInferenceJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStartICD10CMInferenceJobCompletionHandler {
    NSString *key = @"testStartICD10CMInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] startICD10CMInferenceJob:[AWSAWSComprehendMedicalStartICD10CMInferenceJobRequest new] completionHandler:^(AWSAWSComprehendMedicalStartICD10CMInferenceJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStartPHIDetectionJob {
    NSString *key = @"testStartPHIDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] startPHIDetectionJob:[AWSAWSComprehendMedicalStartPHIDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStartPHIDetectionJobCompletionHandler {
    NSString *key = @"testStartPHIDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] startPHIDetectionJob:[AWSAWSComprehendMedicalStartPHIDetectionJobRequest new] completionHandler:^(AWSAWSComprehendMedicalStartPHIDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStartRxNormInferenceJob {
    NSString *key = @"testStartRxNormInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] startRxNormInferenceJob:[AWSAWSComprehendMedicalStartRxNormInferenceJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStartRxNormInferenceJobCompletionHandler {
    NSString *key = @"testStartRxNormInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] startRxNormInferenceJob:[AWSAWSComprehendMedicalStartRxNormInferenceJobRequest new] completionHandler:^(AWSAWSComprehendMedicalStartRxNormInferenceJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStopEntitiesDetectionV2Job {
    NSString *key = @"testStopEntitiesDetectionV2Job";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] stopEntitiesDetectionV2Job:[AWSAWSComprehendMedicalStopEntitiesDetectionV2JobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStopEntitiesDetectionV2JobCompletionHandler {
    NSString *key = @"testStopEntitiesDetectionV2Job";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] stopEntitiesDetectionV2Job:[AWSAWSComprehendMedicalStopEntitiesDetectionV2JobRequest new] completionHandler:^(AWSAWSComprehendMedicalStopEntitiesDetectionV2JobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStopICD10CMInferenceJob {
    NSString *key = @"testStopICD10CMInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] stopICD10CMInferenceJob:[AWSAWSComprehendMedicalStopICD10CMInferenceJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStopICD10CMInferenceJobCompletionHandler {
    NSString *key = @"testStopICD10CMInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] stopICD10CMInferenceJob:[AWSAWSComprehendMedicalStopICD10CMInferenceJobRequest new] completionHandler:^(AWSAWSComprehendMedicalStopICD10CMInferenceJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStopPHIDetectionJob {
    NSString *key = @"testStopPHIDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] stopPHIDetectionJob:[AWSAWSComprehendMedicalStopPHIDetectionJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStopPHIDetectionJobCompletionHandler {
    NSString *key = @"testStopPHIDetectionJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] stopPHIDetectionJob:[AWSAWSComprehendMedicalStopPHIDetectionJobRequest new] completionHandler:^(AWSAWSComprehendMedicalStopPHIDetectionJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStopRxNormInferenceJob {
    NSString *key = @"testStopRxNormInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] stopRxNormInferenceJob:[AWSAWSComprehendMedicalStopRxNormInferenceJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

- (void)testStopRxNormInferenceJobCompletionHandler {
    NSString *key = @"testStopRxNormInferenceJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:configuration forKey:key];

    AWSAWSComprehendMedical *awsClient = [AWSAWSComprehendMedical AWSComprehendMedicalForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSComprehendMedical AWSComprehendMedicalForKey:key] stopRxNormInferenceJob:[AWSAWSComprehendMedicalStopRxNormInferenceJobRequest new] completionHandler:^(AWSAWSComprehendMedicalStopRxNormInferenceJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSComprehendMedical removeAWSComprehendMedicalForKey:key];
}

@end
