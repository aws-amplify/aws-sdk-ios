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
#import "AWSelasticmapreduceService.h"

static id mockNetworking = nil;

@interface AWSGeneralelasticmapreduceTests : XCTestCase

@end

@implementation AWSGeneralelasticmapreduceTests

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
    NSString *key = @"testelasticmapreduceConstructors";
    XCTAssertNotNil([AWSelasticmapreduce defaultelasticmapreduce]);
    XCTAssertEqual([[AWSelasticmapreduce defaultelasticmapreduce] class], [AWSelasticmapreduce class]);
    XCTAssertNil([AWSelasticmapreduce elasticmapreduceForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSelasticmapreduce elasticmapreduceForKey:key]);
    XCTAssertEqual([[AWSelasticmapreduce elasticmapreduceForKey:key] class], [AWSelasticmapreduce class]);
    XCTAssertEqual([AWSelasticmapreduce elasticmapreduceForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
    XCTAssertNil([AWSelasticmapreduce elasticmapreduceForKey:key]);

}

- (void)testAddInstanceFleet {
    NSString *key = @"testAddInstanceFleet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] addInstanceFleet:[AWSelasticmapreduceAddInstanceFleetInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testAddInstanceFleetCompletionHandler {
    NSString *key = @"testAddInstanceFleet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] addInstanceFleet:[AWSelasticmapreduceAddInstanceFleetInput new] completionHandler:^(AWSelasticmapreduceAddInstanceFleetOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testAddInstanceGroups {
    NSString *key = @"testAddInstanceGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] addInstanceGroups:[AWSelasticmapreduceAddInstanceGroupsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testAddInstanceGroupsCompletionHandler {
    NSString *key = @"testAddInstanceGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] addInstanceGroups:[AWSelasticmapreduceAddInstanceGroupsInput new] completionHandler:^(AWSelasticmapreduceAddInstanceGroupsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testAddJobFlowSteps {
    NSString *key = @"testAddJobFlowSteps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] addJobFlowSteps:[AWSelasticmapreduceAddJobFlowStepsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testAddJobFlowStepsCompletionHandler {
    NSString *key = @"testAddJobFlowSteps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] addJobFlowSteps:[AWSelasticmapreduceAddJobFlowStepsInput new] completionHandler:^(AWSelasticmapreduceAddJobFlowStepsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testAddTags {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] addTags:[AWSelasticmapreduceAddTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testAddTagsCompletionHandler {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] addTags:[AWSelasticmapreduceAddTagsInput new] completionHandler:^(AWSelasticmapreduceAddTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testCancelSteps {
    NSString *key = @"testCancelSteps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] cancelSteps:[AWSelasticmapreduceCancelStepsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testCancelStepsCompletionHandler {
    NSString *key = @"testCancelSteps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] cancelSteps:[AWSelasticmapreduceCancelStepsInput new] completionHandler:^(AWSelasticmapreduceCancelStepsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testCreateSecurityConfiguration {
    NSString *key = @"testCreateSecurityConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] createSecurityConfiguration:[AWSelasticmapreduceCreateSecurityConfigurationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testCreateSecurityConfigurationCompletionHandler {
    NSString *key = @"testCreateSecurityConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] createSecurityConfiguration:[AWSelasticmapreduceCreateSecurityConfigurationInput new] completionHandler:^(AWSelasticmapreduceCreateSecurityConfigurationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testDeleteSecurityConfiguration {
    NSString *key = @"testDeleteSecurityConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] deleteSecurityConfiguration:[AWSelasticmapreduceDeleteSecurityConfigurationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testDeleteSecurityConfigurationCompletionHandler {
    NSString *key = @"testDeleteSecurityConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] deleteSecurityConfiguration:[AWSelasticmapreduceDeleteSecurityConfigurationInput new] completionHandler:^(AWSelasticmapreduceDeleteSecurityConfigurationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testDescribeCluster {
    NSString *key = @"testDescribeCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] describeCluster:[AWSelasticmapreduceDescribeClusterInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testDescribeClusterCompletionHandler {
    NSString *key = @"testDescribeCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] describeCluster:[AWSelasticmapreduceDescribeClusterInput new] completionHandler:^(AWSelasticmapreduceDescribeClusterOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testDescribeJobFlows {
    NSString *key = @"testDescribeJobFlows";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] describeJobFlows:[AWSelasticmapreduceDescribeJobFlowsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testDescribeJobFlowsCompletionHandler {
    NSString *key = @"testDescribeJobFlows";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] describeJobFlows:[AWSelasticmapreduceDescribeJobFlowsInput new] completionHandler:^(AWSelasticmapreduceDescribeJobFlowsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testDescribeSecurityConfiguration {
    NSString *key = @"testDescribeSecurityConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] describeSecurityConfiguration:[AWSelasticmapreduceDescribeSecurityConfigurationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testDescribeSecurityConfigurationCompletionHandler {
    NSString *key = @"testDescribeSecurityConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] describeSecurityConfiguration:[AWSelasticmapreduceDescribeSecurityConfigurationInput new] completionHandler:^(AWSelasticmapreduceDescribeSecurityConfigurationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testDescribeStep {
    NSString *key = @"testDescribeStep";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] describeStep:[AWSelasticmapreduceDescribeStepInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testDescribeStepCompletionHandler {
    NSString *key = @"testDescribeStep";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] describeStep:[AWSelasticmapreduceDescribeStepInput new] completionHandler:^(AWSelasticmapreduceDescribeStepOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testGetBlockPublicAccessConfiguration {
    NSString *key = @"testGetBlockPublicAccessConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] getBlockPublicAccessConfiguration:[AWSelasticmapreduceGetBlockPublicAccessConfigurationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testGetBlockPublicAccessConfigurationCompletionHandler {
    NSString *key = @"testGetBlockPublicAccessConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] getBlockPublicAccessConfiguration:[AWSelasticmapreduceGetBlockPublicAccessConfigurationInput new] completionHandler:^(AWSelasticmapreduceGetBlockPublicAccessConfigurationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testGetManagedScalingPolicy {
    NSString *key = @"testGetManagedScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] getManagedScalingPolicy:[AWSelasticmapreduceGetManagedScalingPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testGetManagedScalingPolicyCompletionHandler {
    NSString *key = @"testGetManagedScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] getManagedScalingPolicy:[AWSelasticmapreduceGetManagedScalingPolicyInput new] completionHandler:^(AWSelasticmapreduceGetManagedScalingPolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testListBootstrapActions {
    NSString *key = @"testListBootstrapActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] listBootstrapActions:[AWSelasticmapreduceListBootstrapActionsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testListBootstrapActionsCompletionHandler {
    NSString *key = @"testListBootstrapActions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] listBootstrapActions:[AWSelasticmapreduceListBootstrapActionsInput new] completionHandler:^(AWSelasticmapreduceListBootstrapActionsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testListClusters {
    NSString *key = @"testListClusters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] listClusters:[AWSelasticmapreduceListClustersInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testListClustersCompletionHandler {
    NSString *key = @"testListClusters";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] listClusters:[AWSelasticmapreduceListClustersInput new] completionHandler:^(AWSelasticmapreduceListClustersOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testListInstanceFleets {
    NSString *key = @"testListInstanceFleets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] listInstanceFleets:[AWSelasticmapreduceListInstanceFleetsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testListInstanceFleetsCompletionHandler {
    NSString *key = @"testListInstanceFleets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] listInstanceFleets:[AWSelasticmapreduceListInstanceFleetsInput new] completionHandler:^(AWSelasticmapreduceListInstanceFleetsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testListInstanceGroups {
    NSString *key = @"testListInstanceGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] listInstanceGroups:[AWSelasticmapreduceListInstanceGroupsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testListInstanceGroupsCompletionHandler {
    NSString *key = @"testListInstanceGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] listInstanceGroups:[AWSelasticmapreduceListInstanceGroupsInput new] completionHandler:^(AWSelasticmapreduceListInstanceGroupsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testListInstances {
    NSString *key = @"testListInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] listInstances:[AWSelasticmapreduceListInstancesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testListInstancesCompletionHandler {
    NSString *key = @"testListInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] listInstances:[AWSelasticmapreduceListInstancesInput new] completionHandler:^(AWSelasticmapreduceListInstancesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testListSecurityConfigurations {
    NSString *key = @"testListSecurityConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] listSecurityConfigurations:[AWSelasticmapreduceListSecurityConfigurationsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testListSecurityConfigurationsCompletionHandler {
    NSString *key = @"testListSecurityConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] listSecurityConfigurations:[AWSelasticmapreduceListSecurityConfigurationsInput new] completionHandler:^(AWSelasticmapreduceListSecurityConfigurationsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testListSteps {
    NSString *key = @"testListSteps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] listSteps:[AWSelasticmapreduceListStepsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testListStepsCompletionHandler {
    NSString *key = @"testListSteps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] listSteps:[AWSelasticmapreduceListStepsInput new] completionHandler:^(AWSelasticmapreduceListStepsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testModifyCluster {
    NSString *key = @"testModifyCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] modifyCluster:[AWSelasticmapreduceModifyClusterInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testModifyClusterCompletionHandler {
    NSString *key = @"testModifyCluster";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] modifyCluster:[AWSelasticmapreduceModifyClusterInput new] completionHandler:^(AWSelasticmapreduceModifyClusterOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testModifyInstanceFleet {
    NSString *key = @"testModifyInstanceFleet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] modifyInstanceFleet:[AWSelasticmapreduceModifyInstanceFleetInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testModifyInstanceFleetCompletionHandler {
    NSString *key = @"testModifyInstanceFleet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] modifyInstanceFleet:[AWSelasticmapreduceModifyInstanceFleetInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testModifyInstanceGroups {
    NSString *key = @"testModifyInstanceGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] modifyInstanceGroups:[AWSelasticmapreduceModifyInstanceGroupsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testModifyInstanceGroupsCompletionHandler {
    NSString *key = @"testModifyInstanceGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] modifyInstanceGroups:[AWSelasticmapreduceModifyInstanceGroupsInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testPutAutoScalingPolicy {
    NSString *key = @"testPutAutoScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] putAutoScalingPolicy:[AWSelasticmapreducePutAutoScalingPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testPutAutoScalingPolicyCompletionHandler {
    NSString *key = @"testPutAutoScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] putAutoScalingPolicy:[AWSelasticmapreducePutAutoScalingPolicyInput new] completionHandler:^(AWSelasticmapreducePutAutoScalingPolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testPutBlockPublicAccessConfiguration {
    NSString *key = @"testPutBlockPublicAccessConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] putBlockPublicAccessConfiguration:[AWSelasticmapreducePutBlockPublicAccessConfigurationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testPutBlockPublicAccessConfigurationCompletionHandler {
    NSString *key = @"testPutBlockPublicAccessConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] putBlockPublicAccessConfiguration:[AWSelasticmapreducePutBlockPublicAccessConfigurationInput new] completionHandler:^(AWSelasticmapreducePutBlockPublicAccessConfigurationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testPutManagedScalingPolicy {
    NSString *key = @"testPutManagedScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] putManagedScalingPolicy:[AWSelasticmapreducePutManagedScalingPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testPutManagedScalingPolicyCompletionHandler {
    NSString *key = @"testPutManagedScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] putManagedScalingPolicy:[AWSelasticmapreducePutManagedScalingPolicyInput new] completionHandler:^(AWSelasticmapreducePutManagedScalingPolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testRemoveAutoScalingPolicy {
    NSString *key = @"testRemoveAutoScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] removeAutoScalingPolicy:[AWSelasticmapreduceRemoveAutoScalingPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testRemoveAutoScalingPolicyCompletionHandler {
    NSString *key = @"testRemoveAutoScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] removeAutoScalingPolicy:[AWSelasticmapreduceRemoveAutoScalingPolicyInput new] completionHandler:^(AWSelasticmapreduceRemoveAutoScalingPolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testRemoveManagedScalingPolicy {
    NSString *key = @"testRemoveManagedScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] removeManagedScalingPolicy:[AWSelasticmapreduceRemoveManagedScalingPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testRemoveManagedScalingPolicyCompletionHandler {
    NSString *key = @"testRemoveManagedScalingPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] removeManagedScalingPolicy:[AWSelasticmapreduceRemoveManagedScalingPolicyInput new] completionHandler:^(AWSelasticmapreduceRemoveManagedScalingPolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testRemoveTags {
    NSString *key = @"testRemoveTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] removeTags:[AWSelasticmapreduceRemoveTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testRemoveTagsCompletionHandler {
    NSString *key = @"testRemoveTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] removeTags:[AWSelasticmapreduceRemoveTagsInput new] completionHandler:^(AWSelasticmapreduceRemoveTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testRunJobFlow {
    NSString *key = @"testRunJobFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] runJobFlow:[AWSelasticmapreduceRunJobFlowInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testRunJobFlowCompletionHandler {
    NSString *key = @"testRunJobFlow";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] runJobFlow:[AWSelasticmapreduceRunJobFlowInput new] completionHandler:^(AWSelasticmapreduceRunJobFlowOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testSetTerminationProtection {
    NSString *key = @"testSetTerminationProtection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] setTerminationProtection:[AWSelasticmapreduceSetTerminationProtectionInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testSetTerminationProtectionCompletionHandler {
    NSString *key = @"testSetTerminationProtection";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] setTerminationProtection:[AWSelasticmapreduceSetTerminationProtectionInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testSetVisibleToAllUsers {
    NSString *key = @"testSetVisibleToAllUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] setVisibleToAllUsers:[AWSelasticmapreduceSetVisibleToAllUsersInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testSetVisibleToAllUsersCompletionHandler {
    NSString *key = @"testSetVisibleToAllUsers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] setVisibleToAllUsers:[AWSelasticmapreduceSetVisibleToAllUsersInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testTerminateJobFlows {
    NSString *key = @"testTerminateJobFlows";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticmapreduce elasticmapreduceForKey:key] terminateJobFlows:[AWSelasticmapreduceTerminateJobFlowsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

- (void)testTerminateJobFlowsCompletionHandler {
    NSString *key = @"testTerminateJobFlows";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticmapreduce registerelasticmapreduceWithConfiguration:configuration forKey:key];

    AWSelasticmapreduce *awsClient = [AWSelasticmapreduce elasticmapreduceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticmapreduce elasticmapreduceForKey:key] terminateJobFlows:[AWSelasticmapreduceTerminateJobFlowsInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticmapreduce removeelasticmapreduceForKey:key];
}

@end
