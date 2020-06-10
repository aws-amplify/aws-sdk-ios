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
#import "AWSComputeoptimizerService.h"

static id mockNetworking = nil;

@interface AWSGeneralComputeoptimizerTests : XCTestCase

@end

@implementation AWSGeneralComputeoptimizerTests

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
    NSString *key = @"testComputeoptimizerConstructors";
    XCTAssertNotNil([AWSComputeoptimizer defaultComputeoptimizer]);
    XCTAssertEqual([[AWSComputeoptimizer defaultComputeoptimizer] class], [AWSComputeoptimizer class]);
    XCTAssertNil([AWSComputeoptimizer ComputeoptimizerForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSComputeoptimizer ComputeoptimizerForKey:key]);
    XCTAssertEqual([[AWSComputeoptimizer ComputeoptimizerForKey:key] class], [AWSComputeoptimizer class]);
    XCTAssertEqual([AWSComputeoptimizer ComputeoptimizerForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
    XCTAssertNil([AWSComputeoptimizer ComputeoptimizerForKey:key]);

}

- (void)testDescribeRecommendationExportJobs {
    NSString *key = @"testDescribeRecommendationExportJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComputeoptimizer ComputeoptimizerForKey:key] describeRecommendationExportJobs:[AWSComputeoptimizerDescribeRecommendationExportJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testDescribeRecommendationExportJobsCompletionHandler {
    NSString *key = @"testDescribeRecommendationExportJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComputeoptimizer ComputeoptimizerForKey:key] describeRecommendationExportJobs:[AWSComputeoptimizerDescribeRecommendationExportJobsRequest new] completionHandler:^(AWSComputeoptimizerDescribeRecommendationExportJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testExportAutoScalingGroupRecommendations {
    NSString *key = @"testExportAutoScalingGroupRecommendations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComputeoptimizer ComputeoptimizerForKey:key] exportAutoScalingGroupRecommendations:[AWSComputeoptimizerExportAutoScalingGroupRecommendationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testExportAutoScalingGroupRecommendationsCompletionHandler {
    NSString *key = @"testExportAutoScalingGroupRecommendations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComputeoptimizer ComputeoptimizerForKey:key] exportAutoScalingGroupRecommendations:[AWSComputeoptimizerExportAutoScalingGroupRecommendationsRequest new] completionHandler:^(AWSComputeoptimizerExportAutoScalingGroupRecommendationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testExportEC2InstanceRecommendations {
    NSString *key = @"testExportEC2InstanceRecommendations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComputeoptimizer ComputeoptimizerForKey:key] exportEC2InstanceRecommendations:[AWSComputeoptimizerExportEC2InstanceRecommendationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testExportEC2InstanceRecommendationsCompletionHandler {
    NSString *key = @"testExportEC2InstanceRecommendations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComputeoptimizer ComputeoptimizerForKey:key] exportEC2InstanceRecommendations:[AWSComputeoptimizerExportEC2InstanceRecommendationsRequest new] completionHandler:^(AWSComputeoptimizerExportEC2InstanceRecommendationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testGetAutoScalingGroupRecommendations {
    NSString *key = @"testGetAutoScalingGroupRecommendations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComputeoptimizer ComputeoptimizerForKey:key] getAutoScalingGroupRecommendations:[AWSComputeoptimizerGetAutoScalingGroupRecommendationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testGetAutoScalingGroupRecommendationsCompletionHandler {
    NSString *key = @"testGetAutoScalingGroupRecommendations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComputeoptimizer ComputeoptimizerForKey:key] getAutoScalingGroupRecommendations:[AWSComputeoptimizerGetAutoScalingGroupRecommendationsRequest new] completionHandler:^(AWSComputeoptimizerGetAutoScalingGroupRecommendationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testGetEC2InstanceRecommendations {
    NSString *key = @"testGetEC2InstanceRecommendations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComputeoptimizer ComputeoptimizerForKey:key] getEC2InstanceRecommendations:[AWSComputeoptimizerGetEC2InstanceRecommendationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testGetEC2InstanceRecommendationsCompletionHandler {
    NSString *key = @"testGetEC2InstanceRecommendations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComputeoptimizer ComputeoptimizerForKey:key] getEC2InstanceRecommendations:[AWSComputeoptimizerGetEC2InstanceRecommendationsRequest new] completionHandler:^(AWSComputeoptimizerGetEC2InstanceRecommendationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testGetEC2RecommendationProjectedMetrics {
    NSString *key = @"testGetEC2RecommendationProjectedMetrics";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComputeoptimizer ComputeoptimizerForKey:key] getEC2RecommendationProjectedMetrics:[AWSComputeoptimizerGetEC2RecommendationProjectedMetricsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testGetEC2RecommendationProjectedMetricsCompletionHandler {
    NSString *key = @"testGetEC2RecommendationProjectedMetrics";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComputeoptimizer ComputeoptimizerForKey:key] getEC2RecommendationProjectedMetrics:[AWSComputeoptimizerGetEC2RecommendationProjectedMetricsRequest new] completionHandler:^(AWSComputeoptimizerGetEC2RecommendationProjectedMetricsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testGetEnrollmentStatus {
    NSString *key = @"testGetEnrollmentStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComputeoptimizer ComputeoptimizerForKey:key] getEnrollmentStatus:[AWSComputeoptimizerGetEnrollmentStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testGetEnrollmentStatusCompletionHandler {
    NSString *key = @"testGetEnrollmentStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComputeoptimizer ComputeoptimizerForKey:key] getEnrollmentStatus:[AWSComputeoptimizerGetEnrollmentStatusRequest new] completionHandler:^(AWSComputeoptimizerGetEnrollmentStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testGetRecommendationSummaries {
    NSString *key = @"testGetRecommendationSummaries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComputeoptimizer ComputeoptimizerForKey:key] getRecommendationSummaries:[AWSComputeoptimizerGetRecommendationSummariesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testGetRecommendationSummariesCompletionHandler {
    NSString *key = @"testGetRecommendationSummaries";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComputeoptimizer ComputeoptimizerForKey:key] getRecommendationSummaries:[AWSComputeoptimizerGetRecommendationSummariesRequest new] completionHandler:^(AWSComputeoptimizerGetRecommendationSummariesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testUpdateEnrollmentStatus {
    NSString *key = @"testUpdateEnrollmentStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSComputeoptimizer ComputeoptimizerForKey:key] updateEnrollmentStatus:[AWSComputeoptimizerUpdateEnrollmentStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

- (void)testUpdateEnrollmentStatusCompletionHandler {
    NSString *key = @"testUpdateEnrollmentStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:configuration forKey:key];

    AWSComputeoptimizer *awsClient = [AWSComputeoptimizer ComputeoptimizerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSComputeoptimizer ComputeoptimizerForKey:key] updateEnrollmentStatus:[AWSComputeoptimizerUpdateEnrollmentStatusRequest new] completionHandler:^(AWSComputeoptimizerUpdateEnrollmentStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSComputeoptimizer removeComputeoptimizerForKey:key];
}

@end
