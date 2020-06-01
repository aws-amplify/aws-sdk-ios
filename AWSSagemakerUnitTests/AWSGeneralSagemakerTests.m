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
#import "AWSSagemakerService.h"

static id mockNetworking = nil;

@interface AWSGeneralSagemakerTests : XCTestCase

@end

@implementation AWSGeneralSagemakerTests

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
    NSString *key = @"testSagemakerConstructors";
    XCTAssertNotNil([AWSSagemaker defaultSagemaker]);
    XCTAssertEqual([[AWSSagemaker defaultSagemaker] class], [AWSSagemaker class]);
    XCTAssertNil([AWSSagemaker SagemakerForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSSagemaker SagemakerForKey:key]);
    XCTAssertEqual([[AWSSagemaker SagemakerForKey:key] class], [AWSSagemaker class]);
    XCTAssertEqual([AWSSagemaker SagemakerForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSSagemaker removeSagemakerForKey:key];
    XCTAssertNil([AWSSagemaker SagemakerForKey:key]);

}

- (void)testAddTags {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] addTags:[AWSSagemakerAddTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testAddTagsCompletionHandler {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] addTags:[AWSSagemakerAddTagsInput new] completionHandler:^(AWSSagemakerAddTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testAssociateTrialComponent {
    NSString *key = @"testAssociateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] associateTrialComponent:[AWSSagemakerAssociateTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testAssociateTrialComponentCompletionHandler {
    NSString *key = @"testAssociateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] associateTrialComponent:[AWSSagemakerAssociateTrialComponentRequest new] completionHandler:^(AWSSagemakerAssociateTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateAlgorithm {
    NSString *key = @"testCreateAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createAlgorithm:[AWSSagemakerCreateAlgorithmInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateAlgorithmCompletionHandler {
    NSString *key = @"testCreateAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createAlgorithm:[AWSSagemakerCreateAlgorithmInput new] completionHandler:^(AWSSagemakerCreateAlgorithmOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateApp {
    NSString *key = @"testCreateApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createApp:[AWSSagemakerCreateAppRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateAppCompletionHandler {
    NSString *key = @"testCreateApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createApp:[AWSSagemakerCreateAppRequest new] completionHandler:^(AWSSagemakerCreateAppResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateAutoMLJob {
    NSString *key = @"testCreateAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createAutoMLJob:[AWSSagemakerCreateAutoMLJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateAutoMLJobCompletionHandler {
    NSString *key = @"testCreateAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createAutoMLJob:[AWSSagemakerCreateAutoMLJobRequest new] completionHandler:^(AWSSagemakerCreateAutoMLJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateCodeRepository {
    NSString *key = @"testCreateCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createCodeRepository:[AWSSagemakerCreateCodeRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateCodeRepositoryCompletionHandler {
    NSString *key = @"testCreateCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createCodeRepository:[AWSSagemakerCreateCodeRepositoryInput new] completionHandler:^(AWSSagemakerCreateCodeRepositoryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateCompilationJob {
    NSString *key = @"testCreateCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createCompilationJob:[AWSSagemakerCreateCompilationJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateCompilationJobCompletionHandler {
    NSString *key = @"testCreateCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createCompilationJob:[AWSSagemakerCreateCompilationJobRequest new] completionHandler:^(AWSSagemakerCreateCompilationJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateDomain {
    NSString *key = @"testCreateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createDomain:[AWSSagemakerCreateDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateDomainCompletionHandler {
    NSString *key = @"testCreateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createDomain:[AWSSagemakerCreateDomainRequest new] completionHandler:^(AWSSagemakerCreateDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateEndpoint {
    NSString *key = @"testCreateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createEndpoint:[AWSSagemakerCreateEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateEndpointCompletionHandler {
    NSString *key = @"testCreateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createEndpoint:[AWSSagemakerCreateEndpointInput new] completionHandler:^(AWSSagemakerCreateEndpointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateEndpointConfig {
    NSString *key = @"testCreateEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createEndpointConfig:[AWSSagemakerCreateEndpointConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateEndpointConfigCompletionHandler {
    NSString *key = @"testCreateEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createEndpointConfig:[AWSSagemakerCreateEndpointConfigInput new] completionHandler:^(AWSSagemakerCreateEndpointConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateExperiment {
    NSString *key = @"testCreateExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createExperiment:[AWSSagemakerCreateExperimentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateExperimentCompletionHandler {
    NSString *key = @"testCreateExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createExperiment:[AWSSagemakerCreateExperimentRequest new] completionHandler:^(AWSSagemakerCreateExperimentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateFlowDefinition {
    NSString *key = @"testCreateFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createFlowDefinition:[AWSSagemakerCreateFlowDefinitionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateFlowDefinitionCompletionHandler {
    NSString *key = @"testCreateFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createFlowDefinition:[AWSSagemakerCreateFlowDefinitionRequest new] completionHandler:^(AWSSagemakerCreateFlowDefinitionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateHumanTaskUi {
    NSString *key = @"testCreateHumanTaskUi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createHumanTaskUi:[AWSSagemakerCreateHumanTaskUiRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateHumanTaskUiCompletionHandler {
    NSString *key = @"testCreateHumanTaskUi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createHumanTaskUi:[AWSSagemakerCreateHumanTaskUiRequest new] completionHandler:^(AWSSagemakerCreateHumanTaskUiResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateHyperParameterTuningJob {
    NSString *key = @"testCreateHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createHyperParameterTuningJob:[AWSSagemakerCreateHyperParameterTuningJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateHyperParameterTuningJobCompletionHandler {
    NSString *key = @"testCreateHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createHyperParameterTuningJob:[AWSSagemakerCreateHyperParameterTuningJobRequest new] completionHandler:^(AWSSagemakerCreateHyperParameterTuningJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateLabelingJob {
    NSString *key = @"testCreateLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createLabelingJob:[AWSSagemakerCreateLabelingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateLabelingJobCompletionHandler {
    NSString *key = @"testCreateLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createLabelingJob:[AWSSagemakerCreateLabelingJobRequest new] completionHandler:^(AWSSagemakerCreateLabelingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateModel {
    NSString *key = @"testCreateModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createModel:[AWSSagemakerCreateModelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateModelCompletionHandler {
    NSString *key = @"testCreateModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createModel:[AWSSagemakerCreateModelInput new] completionHandler:^(AWSSagemakerCreateModelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateModelPackage {
    NSString *key = @"testCreateModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createModelPackage:[AWSSagemakerCreateModelPackageInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateModelPackageCompletionHandler {
    NSString *key = @"testCreateModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createModelPackage:[AWSSagemakerCreateModelPackageInput new] completionHandler:^(AWSSagemakerCreateModelPackageOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateMonitoringSchedule {
    NSString *key = @"testCreateMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createMonitoringSchedule:[AWSSagemakerCreateMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateMonitoringScheduleCompletionHandler {
    NSString *key = @"testCreateMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createMonitoringSchedule:[AWSSagemakerCreateMonitoringScheduleRequest new] completionHandler:^(AWSSagemakerCreateMonitoringScheduleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateNotebookInstance {
    NSString *key = @"testCreateNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createNotebookInstance:[AWSSagemakerCreateNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateNotebookInstanceCompletionHandler {
    NSString *key = @"testCreateNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createNotebookInstance:[AWSSagemakerCreateNotebookInstanceInput new] completionHandler:^(AWSSagemakerCreateNotebookInstanceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateNotebookInstanceLifecycleConfig {
    NSString *key = @"testCreateNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createNotebookInstanceLifecycleConfig:[AWSSagemakerCreateNotebookInstanceLifecycleConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateNotebookInstanceLifecycleConfigCompletionHandler {
    NSString *key = @"testCreateNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createNotebookInstanceLifecycleConfig:[AWSSagemakerCreateNotebookInstanceLifecycleConfigInput new] completionHandler:^(AWSSagemakerCreateNotebookInstanceLifecycleConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreatePresignedDomainUrl {
    NSString *key = @"testCreatePresignedDomainUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createPresignedDomainUrl:[AWSSagemakerCreatePresignedDomainUrlRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreatePresignedDomainUrlCompletionHandler {
    NSString *key = @"testCreatePresignedDomainUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createPresignedDomainUrl:[AWSSagemakerCreatePresignedDomainUrlRequest new] completionHandler:^(AWSSagemakerCreatePresignedDomainUrlResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreatePresignedNotebookInstanceUrl {
    NSString *key = @"testCreatePresignedNotebookInstanceUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createPresignedNotebookInstanceUrl:[AWSSagemakerCreatePresignedNotebookInstanceUrlInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreatePresignedNotebookInstanceUrlCompletionHandler {
    NSString *key = @"testCreatePresignedNotebookInstanceUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createPresignedNotebookInstanceUrl:[AWSSagemakerCreatePresignedNotebookInstanceUrlInput new] completionHandler:^(AWSSagemakerCreatePresignedNotebookInstanceUrlOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateProcessingJob {
    NSString *key = @"testCreateProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createProcessingJob:[AWSSagemakerCreateProcessingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateProcessingJobCompletionHandler {
    NSString *key = @"testCreateProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createProcessingJob:[AWSSagemakerCreateProcessingJobRequest new] completionHandler:^(AWSSagemakerCreateProcessingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateTrainingJob {
    NSString *key = @"testCreateTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createTrainingJob:[AWSSagemakerCreateTrainingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateTrainingJobCompletionHandler {
    NSString *key = @"testCreateTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createTrainingJob:[AWSSagemakerCreateTrainingJobRequest new] completionHandler:^(AWSSagemakerCreateTrainingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateTransformJob {
    NSString *key = @"testCreateTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createTransformJob:[AWSSagemakerCreateTransformJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateTransformJobCompletionHandler {
    NSString *key = @"testCreateTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createTransformJob:[AWSSagemakerCreateTransformJobRequest new] completionHandler:^(AWSSagemakerCreateTransformJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateTrial {
    NSString *key = @"testCreateTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createTrial:[AWSSagemakerCreateTrialRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateTrialCompletionHandler {
    NSString *key = @"testCreateTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createTrial:[AWSSagemakerCreateTrialRequest new] completionHandler:^(AWSSagemakerCreateTrialResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateTrialComponent {
    NSString *key = @"testCreateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createTrialComponent:[AWSSagemakerCreateTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateTrialComponentCompletionHandler {
    NSString *key = @"testCreateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createTrialComponent:[AWSSagemakerCreateTrialComponentRequest new] completionHandler:^(AWSSagemakerCreateTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateUserProfile {
    NSString *key = @"testCreateUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createUserProfile:[AWSSagemakerCreateUserProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateUserProfileCompletionHandler {
    NSString *key = @"testCreateUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createUserProfile:[AWSSagemakerCreateUserProfileRequest new] completionHandler:^(AWSSagemakerCreateUserProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateWorkteam {
    NSString *key = @"testCreateWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] createWorkteam:[AWSSagemakerCreateWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testCreateWorkteamCompletionHandler {
    NSString *key = @"testCreateWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] createWorkteam:[AWSSagemakerCreateWorkteamRequest new] completionHandler:^(AWSSagemakerCreateWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteAlgorithm {
    NSString *key = @"testDeleteAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteAlgorithm:[AWSSagemakerDeleteAlgorithmInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteAlgorithmCompletionHandler {
    NSString *key = @"testDeleteAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteAlgorithm:[AWSSagemakerDeleteAlgorithmInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteApp {
    NSString *key = @"testDeleteApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteApp:[AWSSagemakerDeleteAppRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteAppCompletionHandler {
    NSString *key = @"testDeleteApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteApp:[AWSSagemakerDeleteAppRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteCodeRepository {
    NSString *key = @"testDeleteCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteCodeRepository:[AWSSagemakerDeleteCodeRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteCodeRepositoryCompletionHandler {
    NSString *key = @"testDeleteCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteCodeRepository:[AWSSagemakerDeleteCodeRepositoryInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteDomain {
    NSString *key = @"testDeleteDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteDomain:[AWSSagemakerDeleteDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteDomainCompletionHandler {
    NSString *key = @"testDeleteDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteDomain:[AWSSagemakerDeleteDomainRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteEndpoint {
    NSString *key = @"testDeleteEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteEndpoint:[AWSSagemakerDeleteEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteEndpointCompletionHandler {
    NSString *key = @"testDeleteEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteEndpoint:[AWSSagemakerDeleteEndpointInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteEndpointConfig {
    NSString *key = @"testDeleteEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteEndpointConfig:[AWSSagemakerDeleteEndpointConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteEndpointConfigCompletionHandler {
    NSString *key = @"testDeleteEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteEndpointConfig:[AWSSagemakerDeleteEndpointConfigInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteExperiment {
    NSString *key = @"testDeleteExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteExperiment:[AWSSagemakerDeleteExperimentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteExperimentCompletionHandler {
    NSString *key = @"testDeleteExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteExperiment:[AWSSagemakerDeleteExperimentRequest new] completionHandler:^(AWSSagemakerDeleteExperimentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteFlowDefinition {
    NSString *key = @"testDeleteFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteFlowDefinition:[AWSSagemakerDeleteFlowDefinitionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteFlowDefinitionCompletionHandler {
    NSString *key = @"testDeleteFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteFlowDefinition:[AWSSagemakerDeleteFlowDefinitionRequest new] completionHandler:^(AWSSagemakerDeleteFlowDefinitionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteModel {
    NSString *key = @"testDeleteModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteModel:[AWSSagemakerDeleteModelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteModelCompletionHandler {
    NSString *key = @"testDeleteModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteModel:[AWSSagemakerDeleteModelInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteModelPackage {
    NSString *key = @"testDeleteModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteModelPackage:[AWSSagemakerDeleteModelPackageInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteModelPackageCompletionHandler {
    NSString *key = @"testDeleteModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteModelPackage:[AWSSagemakerDeleteModelPackageInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteMonitoringSchedule {
    NSString *key = @"testDeleteMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteMonitoringSchedule:[AWSSagemakerDeleteMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteMonitoringScheduleCompletionHandler {
    NSString *key = @"testDeleteMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteMonitoringSchedule:[AWSSagemakerDeleteMonitoringScheduleRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteNotebookInstance {
    NSString *key = @"testDeleteNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteNotebookInstance:[AWSSagemakerDeleteNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteNotebookInstanceCompletionHandler {
    NSString *key = @"testDeleteNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteNotebookInstance:[AWSSagemakerDeleteNotebookInstanceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteNotebookInstanceLifecycleConfig {
    NSString *key = @"testDeleteNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteNotebookInstanceLifecycleConfig:[AWSSagemakerDeleteNotebookInstanceLifecycleConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteNotebookInstanceLifecycleConfigCompletionHandler {
    NSString *key = @"testDeleteNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteNotebookInstanceLifecycleConfig:[AWSSagemakerDeleteNotebookInstanceLifecycleConfigInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteTags {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteTags:[AWSSagemakerDeleteTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteTagsCompletionHandler {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteTags:[AWSSagemakerDeleteTagsInput new] completionHandler:^(AWSSagemakerDeleteTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteTrial {
    NSString *key = @"testDeleteTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteTrial:[AWSSagemakerDeleteTrialRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteTrialCompletionHandler {
    NSString *key = @"testDeleteTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteTrial:[AWSSagemakerDeleteTrialRequest new] completionHandler:^(AWSSagemakerDeleteTrialResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteTrialComponent {
    NSString *key = @"testDeleteTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteTrialComponent:[AWSSagemakerDeleteTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteTrialComponentCompletionHandler {
    NSString *key = @"testDeleteTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteTrialComponent:[AWSSagemakerDeleteTrialComponentRequest new] completionHandler:^(AWSSagemakerDeleteTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteUserProfile {
    NSString *key = @"testDeleteUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteUserProfile:[AWSSagemakerDeleteUserProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteUserProfileCompletionHandler {
    NSString *key = @"testDeleteUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteUserProfile:[AWSSagemakerDeleteUserProfileRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteWorkteam {
    NSString *key = @"testDeleteWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] deleteWorkteam:[AWSSagemakerDeleteWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDeleteWorkteamCompletionHandler {
    NSString *key = @"testDeleteWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] deleteWorkteam:[AWSSagemakerDeleteWorkteamRequest new] completionHandler:^(AWSSagemakerDeleteWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeAlgorithm {
    NSString *key = @"testDescribeAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeAlgorithm:[AWSSagemakerDescribeAlgorithmInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeAlgorithmCompletionHandler {
    NSString *key = @"testDescribeAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeAlgorithm:[AWSSagemakerDescribeAlgorithmInput new] completionHandler:^(AWSSagemakerDescribeAlgorithmOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeApp {
    NSString *key = @"testDescribeApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeApp:[AWSSagemakerDescribeAppRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeAppCompletionHandler {
    NSString *key = @"testDescribeApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeApp:[AWSSagemakerDescribeAppRequest new] completionHandler:^(AWSSagemakerDescribeAppResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeAutoMLJob {
    NSString *key = @"testDescribeAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeAutoMLJob:[AWSSagemakerDescribeAutoMLJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeAutoMLJobCompletionHandler {
    NSString *key = @"testDescribeAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeAutoMLJob:[AWSSagemakerDescribeAutoMLJobRequest new] completionHandler:^(AWSSagemakerDescribeAutoMLJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeCodeRepository {
    NSString *key = @"testDescribeCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeCodeRepository:[AWSSagemakerDescribeCodeRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeCodeRepositoryCompletionHandler {
    NSString *key = @"testDescribeCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeCodeRepository:[AWSSagemakerDescribeCodeRepositoryInput new] completionHandler:^(AWSSagemakerDescribeCodeRepositoryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeCompilationJob {
    NSString *key = @"testDescribeCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeCompilationJob:[AWSSagemakerDescribeCompilationJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeCompilationJobCompletionHandler {
    NSString *key = @"testDescribeCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeCompilationJob:[AWSSagemakerDescribeCompilationJobRequest new] completionHandler:^(AWSSagemakerDescribeCompilationJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeDomain {
    NSString *key = @"testDescribeDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeDomain:[AWSSagemakerDescribeDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeDomainCompletionHandler {
    NSString *key = @"testDescribeDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeDomain:[AWSSagemakerDescribeDomainRequest new] completionHandler:^(AWSSagemakerDescribeDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeEndpoint {
    NSString *key = @"testDescribeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeEndpoint:[AWSSagemakerDescribeEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeEndpointCompletionHandler {
    NSString *key = @"testDescribeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeEndpoint:[AWSSagemakerDescribeEndpointInput new] completionHandler:^(AWSSagemakerDescribeEndpointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeEndpointConfig {
    NSString *key = @"testDescribeEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeEndpointConfig:[AWSSagemakerDescribeEndpointConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeEndpointConfigCompletionHandler {
    NSString *key = @"testDescribeEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeEndpointConfig:[AWSSagemakerDescribeEndpointConfigInput new] completionHandler:^(AWSSagemakerDescribeEndpointConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeExperiment {
    NSString *key = @"testDescribeExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeExperiment:[AWSSagemakerDescribeExperimentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeExperimentCompletionHandler {
    NSString *key = @"testDescribeExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeExperiment:[AWSSagemakerDescribeExperimentRequest new] completionHandler:^(AWSSagemakerDescribeExperimentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeFlowDefinition {
    NSString *key = @"testDescribeFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeFlowDefinition:[AWSSagemakerDescribeFlowDefinitionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeFlowDefinitionCompletionHandler {
    NSString *key = @"testDescribeFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeFlowDefinition:[AWSSagemakerDescribeFlowDefinitionRequest new] completionHandler:^(AWSSagemakerDescribeFlowDefinitionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeHumanTaskUi {
    NSString *key = @"testDescribeHumanTaskUi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeHumanTaskUi:[AWSSagemakerDescribeHumanTaskUiRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeHumanTaskUiCompletionHandler {
    NSString *key = @"testDescribeHumanTaskUi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeHumanTaskUi:[AWSSagemakerDescribeHumanTaskUiRequest new] completionHandler:^(AWSSagemakerDescribeHumanTaskUiResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeHyperParameterTuningJob {
    NSString *key = @"testDescribeHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeHyperParameterTuningJob:[AWSSagemakerDescribeHyperParameterTuningJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeHyperParameterTuningJobCompletionHandler {
    NSString *key = @"testDescribeHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeHyperParameterTuningJob:[AWSSagemakerDescribeHyperParameterTuningJobRequest new] completionHandler:^(AWSSagemakerDescribeHyperParameterTuningJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeLabelingJob {
    NSString *key = @"testDescribeLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeLabelingJob:[AWSSagemakerDescribeLabelingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeLabelingJobCompletionHandler {
    NSString *key = @"testDescribeLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeLabelingJob:[AWSSagemakerDescribeLabelingJobRequest new] completionHandler:^(AWSSagemakerDescribeLabelingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeModel {
    NSString *key = @"testDescribeModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeModel:[AWSSagemakerDescribeModelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeModelCompletionHandler {
    NSString *key = @"testDescribeModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeModel:[AWSSagemakerDescribeModelInput new] completionHandler:^(AWSSagemakerDescribeModelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeModelPackage {
    NSString *key = @"testDescribeModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeModelPackage:[AWSSagemakerDescribeModelPackageInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeModelPackageCompletionHandler {
    NSString *key = @"testDescribeModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeModelPackage:[AWSSagemakerDescribeModelPackageInput new] completionHandler:^(AWSSagemakerDescribeModelPackageOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeMonitoringSchedule {
    NSString *key = @"testDescribeMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeMonitoringSchedule:[AWSSagemakerDescribeMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeMonitoringScheduleCompletionHandler {
    NSString *key = @"testDescribeMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeMonitoringSchedule:[AWSSagemakerDescribeMonitoringScheduleRequest new] completionHandler:^(AWSSagemakerDescribeMonitoringScheduleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeNotebookInstance {
    NSString *key = @"testDescribeNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeNotebookInstance:[AWSSagemakerDescribeNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeNotebookInstanceCompletionHandler {
    NSString *key = @"testDescribeNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeNotebookInstance:[AWSSagemakerDescribeNotebookInstanceInput new] completionHandler:^(AWSSagemakerDescribeNotebookInstanceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeNotebookInstanceLifecycleConfig {
    NSString *key = @"testDescribeNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeNotebookInstanceLifecycleConfig:[AWSSagemakerDescribeNotebookInstanceLifecycleConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeNotebookInstanceLifecycleConfigCompletionHandler {
    NSString *key = @"testDescribeNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeNotebookInstanceLifecycleConfig:[AWSSagemakerDescribeNotebookInstanceLifecycleConfigInput new] completionHandler:^(AWSSagemakerDescribeNotebookInstanceLifecycleConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeProcessingJob {
    NSString *key = @"testDescribeProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeProcessingJob:[AWSSagemakerDescribeProcessingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeProcessingJobCompletionHandler {
    NSString *key = @"testDescribeProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeProcessingJob:[AWSSagemakerDescribeProcessingJobRequest new] completionHandler:^(AWSSagemakerDescribeProcessingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeSubscribedWorkteam {
    NSString *key = @"testDescribeSubscribedWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeSubscribedWorkteam:[AWSSagemakerDescribeSubscribedWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeSubscribedWorkteamCompletionHandler {
    NSString *key = @"testDescribeSubscribedWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeSubscribedWorkteam:[AWSSagemakerDescribeSubscribedWorkteamRequest new] completionHandler:^(AWSSagemakerDescribeSubscribedWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeTrainingJob {
    NSString *key = @"testDescribeTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeTrainingJob:[AWSSagemakerDescribeTrainingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeTrainingJobCompletionHandler {
    NSString *key = @"testDescribeTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeTrainingJob:[AWSSagemakerDescribeTrainingJobRequest new] completionHandler:^(AWSSagemakerDescribeTrainingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeTransformJob {
    NSString *key = @"testDescribeTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeTransformJob:[AWSSagemakerDescribeTransformJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeTransformJobCompletionHandler {
    NSString *key = @"testDescribeTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeTransformJob:[AWSSagemakerDescribeTransformJobRequest new] completionHandler:^(AWSSagemakerDescribeTransformJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeTrial {
    NSString *key = @"testDescribeTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeTrial:[AWSSagemakerDescribeTrialRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeTrialCompletionHandler {
    NSString *key = @"testDescribeTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeTrial:[AWSSagemakerDescribeTrialRequest new] completionHandler:^(AWSSagemakerDescribeTrialResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeTrialComponent {
    NSString *key = @"testDescribeTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeTrialComponent:[AWSSagemakerDescribeTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeTrialComponentCompletionHandler {
    NSString *key = @"testDescribeTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeTrialComponent:[AWSSagemakerDescribeTrialComponentRequest new] completionHandler:^(AWSSagemakerDescribeTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeUserProfile {
    NSString *key = @"testDescribeUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeUserProfile:[AWSSagemakerDescribeUserProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeUserProfileCompletionHandler {
    NSString *key = @"testDescribeUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeUserProfile:[AWSSagemakerDescribeUserProfileRequest new] completionHandler:^(AWSSagemakerDescribeUserProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeWorkforce {
    NSString *key = @"testDescribeWorkforce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeWorkforce:[AWSSagemakerDescribeWorkforceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeWorkforceCompletionHandler {
    NSString *key = @"testDescribeWorkforce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeWorkforce:[AWSSagemakerDescribeWorkforceRequest new] completionHandler:^(AWSSagemakerDescribeWorkforceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeWorkteam {
    NSString *key = @"testDescribeWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] describeWorkteam:[AWSSagemakerDescribeWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDescribeWorkteamCompletionHandler {
    NSString *key = @"testDescribeWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] describeWorkteam:[AWSSagemakerDescribeWorkteamRequest new] completionHandler:^(AWSSagemakerDescribeWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDisassociateTrialComponent {
    NSString *key = @"testDisassociateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] disassociateTrialComponent:[AWSSagemakerDisassociateTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testDisassociateTrialComponentCompletionHandler {
    NSString *key = @"testDisassociateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] disassociateTrialComponent:[AWSSagemakerDisassociateTrialComponentRequest new] completionHandler:^(AWSSagemakerDisassociateTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testGetSearchSuggestions {
    NSString *key = @"testGetSearchSuggestions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] getSearchSuggestions:[AWSSagemakerGetSearchSuggestionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testGetSearchSuggestionsCompletionHandler {
    NSString *key = @"testGetSearchSuggestions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] getSearchSuggestions:[AWSSagemakerGetSearchSuggestionsRequest new] completionHandler:^(AWSSagemakerGetSearchSuggestionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListAlgorithms {
    NSString *key = @"testListAlgorithms";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listAlgorithms:[AWSSagemakerListAlgorithmsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListAlgorithmsCompletionHandler {
    NSString *key = @"testListAlgorithms";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listAlgorithms:[AWSSagemakerListAlgorithmsInput new] completionHandler:^(AWSSagemakerListAlgorithmsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListApps {
    NSString *key = @"testListApps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listApps:[AWSSagemakerListAppsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListAppsCompletionHandler {
    NSString *key = @"testListApps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listApps:[AWSSagemakerListAppsRequest new] completionHandler:^(AWSSagemakerListAppsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListAutoMLJobs {
    NSString *key = @"testListAutoMLJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listAutoMLJobs:[AWSSagemakerListAutoMLJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListAutoMLJobsCompletionHandler {
    NSString *key = @"testListAutoMLJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listAutoMLJobs:[AWSSagemakerListAutoMLJobsRequest new] completionHandler:^(AWSSagemakerListAutoMLJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListCandidatesForAutoMLJob {
    NSString *key = @"testListCandidatesForAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listCandidatesForAutoMLJob:[AWSSagemakerListCandidatesForAutoMLJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListCandidatesForAutoMLJobCompletionHandler {
    NSString *key = @"testListCandidatesForAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listCandidatesForAutoMLJob:[AWSSagemakerListCandidatesForAutoMLJobRequest new] completionHandler:^(AWSSagemakerListCandidatesForAutoMLJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListCodeRepositories {
    NSString *key = @"testListCodeRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listCodeRepositories:[AWSSagemakerListCodeRepositoriesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListCodeRepositoriesCompletionHandler {
    NSString *key = @"testListCodeRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listCodeRepositories:[AWSSagemakerListCodeRepositoriesInput new] completionHandler:^(AWSSagemakerListCodeRepositoriesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListCompilationJobs {
    NSString *key = @"testListCompilationJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listCompilationJobs:[AWSSagemakerListCompilationJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListCompilationJobsCompletionHandler {
    NSString *key = @"testListCompilationJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listCompilationJobs:[AWSSagemakerListCompilationJobsRequest new] completionHandler:^(AWSSagemakerListCompilationJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListDomains {
    NSString *key = @"testListDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listDomains:[AWSSagemakerListDomainsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListDomainsCompletionHandler {
    NSString *key = @"testListDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listDomains:[AWSSagemakerListDomainsRequest new] completionHandler:^(AWSSagemakerListDomainsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListEndpointConfigs {
    NSString *key = @"testListEndpointConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listEndpointConfigs:[AWSSagemakerListEndpointConfigsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListEndpointConfigsCompletionHandler {
    NSString *key = @"testListEndpointConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listEndpointConfigs:[AWSSagemakerListEndpointConfigsInput new] completionHandler:^(AWSSagemakerListEndpointConfigsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListEndpoints {
    NSString *key = @"testListEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listEndpoints:[AWSSagemakerListEndpointsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListEndpointsCompletionHandler {
    NSString *key = @"testListEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listEndpoints:[AWSSagemakerListEndpointsInput new] completionHandler:^(AWSSagemakerListEndpointsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListExperiments {
    NSString *key = @"testListExperiments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listExperiments:[AWSSagemakerListExperimentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListExperimentsCompletionHandler {
    NSString *key = @"testListExperiments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listExperiments:[AWSSagemakerListExperimentsRequest new] completionHandler:^(AWSSagemakerListExperimentsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListFlowDefinitions {
    NSString *key = @"testListFlowDefinitions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listFlowDefinitions:[AWSSagemakerListFlowDefinitionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListFlowDefinitionsCompletionHandler {
    NSString *key = @"testListFlowDefinitions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listFlowDefinitions:[AWSSagemakerListFlowDefinitionsRequest new] completionHandler:^(AWSSagemakerListFlowDefinitionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListHumanTaskUis {
    NSString *key = @"testListHumanTaskUis";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listHumanTaskUis:[AWSSagemakerListHumanTaskUisRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListHumanTaskUisCompletionHandler {
    NSString *key = @"testListHumanTaskUis";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listHumanTaskUis:[AWSSagemakerListHumanTaskUisRequest new] completionHandler:^(AWSSagemakerListHumanTaskUisResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListHyperParameterTuningJobs {
    NSString *key = @"testListHyperParameterTuningJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listHyperParameterTuningJobs:[AWSSagemakerListHyperParameterTuningJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListHyperParameterTuningJobsCompletionHandler {
    NSString *key = @"testListHyperParameterTuningJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listHyperParameterTuningJobs:[AWSSagemakerListHyperParameterTuningJobsRequest new] completionHandler:^(AWSSagemakerListHyperParameterTuningJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListLabelingJobs {
    NSString *key = @"testListLabelingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listLabelingJobs:[AWSSagemakerListLabelingJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListLabelingJobsCompletionHandler {
    NSString *key = @"testListLabelingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listLabelingJobs:[AWSSagemakerListLabelingJobsRequest new] completionHandler:^(AWSSagemakerListLabelingJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListLabelingJobsForWorkteam {
    NSString *key = @"testListLabelingJobsForWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listLabelingJobsForWorkteam:[AWSSagemakerListLabelingJobsForWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListLabelingJobsForWorkteamCompletionHandler {
    NSString *key = @"testListLabelingJobsForWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listLabelingJobsForWorkteam:[AWSSagemakerListLabelingJobsForWorkteamRequest new] completionHandler:^(AWSSagemakerListLabelingJobsForWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListModelPackages {
    NSString *key = @"testListModelPackages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listModelPackages:[AWSSagemakerListModelPackagesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListModelPackagesCompletionHandler {
    NSString *key = @"testListModelPackages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listModelPackages:[AWSSagemakerListModelPackagesInput new] completionHandler:^(AWSSagemakerListModelPackagesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListModels {
    NSString *key = @"testListModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listModels:[AWSSagemakerListModelsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListModelsCompletionHandler {
    NSString *key = @"testListModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listModels:[AWSSagemakerListModelsInput new] completionHandler:^(AWSSagemakerListModelsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListMonitoringExecutions {
    NSString *key = @"testListMonitoringExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listMonitoringExecutions:[AWSSagemakerListMonitoringExecutionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListMonitoringExecutionsCompletionHandler {
    NSString *key = @"testListMonitoringExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listMonitoringExecutions:[AWSSagemakerListMonitoringExecutionsRequest new] completionHandler:^(AWSSagemakerListMonitoringExecutionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListMonitoringSchedules {
    NSString *key = @"testListMonitoringSchedules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listMonitoringSchedules:[AWSSagemakerListMonitoringSchedulesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListMonitoringSchedulesCompletionHandler {
    NSString *key = @"testListMonitoringSchedules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listMonitoringSchedules:[AWSSagemakerListMonitoringSchedulesRequest new] completionHandler:^(AWSSagemakerListMonitoringSchedulesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListNotebookInstanceLifecycleConfigs {
    NSString *key = @"testListNotebookInstanceLifecycleConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listNotebookInstanceLifecycleConfigs:[AWSSagemakerListNotebookInstanceLifecycleConfigsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListNotebookInstanceLifecycleConfigsCompletionHandler {
    NSString *key = @"testListNotebookInstanceLifecycleConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listNotebookInstanceLifecycleConfigs:[AWSSagemakerListNotebookInstanceLifecycleConfigsInput new] completionHandler:^(AWSSagemakerListNotebookInstanceLifecycleConfigsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListNotebookInstances {
    NSString *key = @"testListNotebookInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listNotebookInstances:[AWSSagemakerListNotebookInstancesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListNotebookInstancesCompletionHandler {
    NSString *key = @"testListNotebookInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listNotebookInstances:[AWSSagemakerListNotebookInstancesInput new] completionHandler:^(AWSSagemakerListNotebookInstancesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListProcessingJobs {
    NSString *key = @"testListProcessingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listProcessingJobs:[AWSSagemakerListProcessingJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListProcessingJobsCompletionHandler {
    NSString *key = @"testListProcessingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listProcessingJobs:[AWSSagemakerListProcessingJobsRequest new] completionHandler:^(AWSSagemakerListProcessingJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListSubscribedWorkteams {
    NSString *key = @"testListSubscribedWorkteams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listSubscribedWorkteams:[AWSSagemakerListSubscribedWorkteamsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListSubscribedWorkteamsCompletionHandler {
    NSString *key = @"testListSubscribedWorkteams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listSubscribedWorkteams:[AWSSagemakerListSubscribedWorkteamsRequest new] completionHandler:^(AWSSagemakerListSubscribedWorkteamsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListTags {
    NSString *key = @"testListTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listTags:[AWSSagemakerListTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListTagsCompletionHandler {
    NSString *key = @"testListTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listTags:[AWSSagemakerListTagsInput new] completionHandler:^(AWSSagemakerListTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListTrainingJobs {
    NSString *key = @"testListTrainingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listTrainingJobs:[AWSSagemakerListTrainingJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListTrainingJobsCompletionHandler {
    NSString *key = @"testListTrainingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listTrainingJobs:[AWSSagemakerListTrainingJobsRequest new] completionHandler:^(AWSSagemakerListTrainingJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListTrainingJobsForHyperParameterTuningJob {
    NSString *key = @"testListTrainingJobsForHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listTrainingJobsForHyperParameterTuningJob:[AWSSagemakerListTrainingJobsForHyperParameterTuningJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListTrainingJobsForHyperParameterTuningJobCompletionHandler {
    NSString *key = @"testListTrainingJobsForHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listTrainingJobsForHyperParameterTuningJob:[AWSSagemakerListTrainingJobsForHyperParameterTuningJobRequest new] completionHandler:^(AWSSagemakerListTrainingJobsForHyperParameterTuningJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListTransformJobs {
    NSString *key = @"testListTransformJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listTransformJobs:[AWSSagemakerListTransformJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListTransformJobsCompletionHandler {
    NSString *key = @"testListTransformJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listTransformJobs:[AWSSagemakerListTransformJobsRequest new] completionHandler:^(AWSSagemakerListTransformJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListTrialComponents {
    NSString *key = @"testListTrialComponents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listTrialComponents:[AWSSagemakerListTrialComponentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListTrialComponentsCompletionHandler {
    NSString *key = @"testListTrialComponents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listTrialComponents:[AWSSagemakerListTrialComponentsRequest new] completionHandler:^(AWSSagemakerListTrialComponentsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListTrials {
    NSString *key = @"testListTrials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listTrials:[AWSSagemakerListTrialsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListTrialsCompletionHandler {
    NSString *key = @"testListTrials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listTrials:[AWSSagemakerListTrialsRequest new] completionHandler:^(AWSSagemakerListTrialsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListUserProfiles {
    NSString *key = @"testListUserProfiles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listUserProfiles:[AWSSagemakerListUserProfilesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListUserProfilesCompletionHandler {
    NSString *key = @"testListUserProfiles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listUserProfiles:[AWSSagemakerListUserProfilesRequest new] completionHandler:^(AWSSagemakerListUserProfilesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListWorkteams {
    NSString *key = @"testListWorkteams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] listWorkteams:[AWSSagemakerListWorkteamsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testListWorkteamsCompletionHandler {
    NSString *key = @"testListWorkteams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] listWorkteams:[AWSSagemakerListWorkteamsRequest new] completionHandler:^(AWSSagemakerListWorkteamsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testRenderUiTemplate {
    NSString *key = @"testRenderUiTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] renderUiTemplate:[AWSSagemakerRenderUiTemplateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testRenderUiTemplateCompletionHandler {
    NSString *key = @"testRenderUiTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] renderUiTemplate:[AWSSagemakerRenderUiTemplateRequest new] completionHandler:^(AWSSagemakerRenderUiTemplateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testSearch {
    NSString *key = @"testSearch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] search:[AWSSagemakerSearchRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testSearchCompletionHandler {
    NSString *key = @"testSearch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] search:[AWSSagemakerSearchRequest new] completionHandler:^(AWSSagemakerSearchResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStartMonitoringSchedule {
    NSString *key = @"testStartMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] startMonitoringSchedule:[AWSSagemakerStartMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStartMonitoringScheduleCompletionHandler {
    NSString *key = @"testStartMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] startMonitoringSchedule:[AWSSagemakerStartMonitoringScheduleRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStartNotebookInstance {
    NSString *key = @"testStartNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] startNotebookInstance:[AWSSagemakerStartNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStartNotebookInstanceCompletionHandler {
    NSString *key = @"testStartNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] startNotebookInstance:[AWSSagemakerStartNotebookInstanceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopAutoMLJob {
    NSString *key = @"testStopAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] stopAutoMLJob:[AWSSagemakerStopAutoMLJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopAutoMLJobCompletionHandler {
    NSString *key = @"testStopAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] stopAutoMLJob:[AWSSagemakerStopAutoMLJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopCompilationJob {
    NSString *key = @"testStopCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] stopCompilationJob:[AWSSagemakerStopCompilationJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopCompilationJobCompletionHandler {
    NSString *key = @"testStopCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] stopCompilationJob:[AWSSagemakerStopCompilationJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopHyperParameterTuningJob {
    NSString *key = @"testStopHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] stopHyperParameterTuningJob:[AWSSagemakerStopHyperParameterTuningJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopHyperParameterTuningJobCompletionHandler {
    NSString *key = @"testStopHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] stopHyperParameterTuningJob:[AWSSagemakerStopHyperParameterTuningJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopLabelingJob {
    NSString *key = @"testStopLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] stopLabelingJob:[AWSSagemakerStopLabelingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopLabelingJobCompletionHandler {
    NSString *key = @"testStopLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] stopLabelingJob:[AWSSagemakerStopLabelingJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopMonitoringSchedule {
    NSString *key = @"testStopMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] stopMonitoringSchedule:[AWSSagemakerStopMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopMonitoringScheduleCompletionHandler {
    NSString *key = @"testStopMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] stopMonitoringSchedule:[AWSSagemakerStopMonitoringScheduleRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopNotebookInstance {
    NSString *key = @"testStopNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] stopNotebookInstance:[AWSSagemakerStopNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopNotebookInstanceCompletionHandler {
    NSString *key = @"testStopNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] stopNotebookInstance:[AWSSagemakerStopNotebookInstanceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopProcessingJob {
    NSString *key = @"testStopProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] stopProcessingJob:[AWSSagemakerStopProcessingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopProcessingJobCompletionHandler {
    NSString *key = @"testStopProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] stopProcessingJob:[AWSSagemakerStopProcessingJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopTrainingJob {
    NSString *key = @"testStopTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] stopTrainingJob:[AWSSagemakerStopTrainingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopTrainingJobCompletionHandler {
    NSString *key = @"testStopTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] stopTrainingJob:[AWSSagemakerStopTrainingJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopTransformJob {
    NSString *key = @"testStopTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] stopTransformJob:[AWSSagemakerStopTransformJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testStopTransformJobCompletionHandler {
    NSString *key = @"testStopTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] stopTransformJob:[AWSSagemakerStopTransformJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateCodeRepository {
    NSString *key = @"testUpdateCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] updateCodeRepository:[AWSSagemakerUpdateCodeRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateCodeRepositoryCompletionHandler {
    NSString *key = @"testUpdateCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] updateCodeRepository:[AWSSagemakerUpdateCodeRepositoryInput new] completionHandler:^(AWSSagemakerUpdateCodeRepositoryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateDomain {
    NSString *key = @"testUpdateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] updateDomain:[AWSSagemakerUpdateDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateDomainCompletionHandler {
    NSString *key = @"testUpdateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] updateDomain:[AWSSagemakerUpdateDomainRequest new] completionHandler:^(AWSSagemakerUpdateDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateEndpoint {
    NSString *key = @"testUpdateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] updateEndpoint:[AWSSagemakerUpdateEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateEndpointCompletionHandler {
    NSString *key = @"testUpdateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] updateEndpoint:[AWSSagemakerUpdateEndpointInput new] completionHandler:^(AWSSagemakerUpdateEndpointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateEndpointWeightsAndCapacities {
    NSString *key = @"testUpdateEndpointWeightsAndCapacities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] updateEndpointWeightsAndCapacities:[AWSSagemakerUpdateEndpointWeightsAndCapacitiesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateEndpointWeightsAndCapacitiesCompletionHandler {
    NSString *key = @"testUpdateEndpointWeightsAndCapacities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] updateEndpointWeightsAndCapacities:[AWSSagemakerUpdateEndpointWeightsAndCapacitiesInput new] completionHandler:^(AWSSagemakerUpdateEndpointWeightsAndCapacitiesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateExperiment {
    NSString *key = @"testUpdateExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] updateExperiment:[AWSSagemakerUpdateExperimentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateExperimentCompletionHandler {
    NSString *key = @"testUpdateExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] updateExperiment:[AWSSagemakerUpdateExperimentRequest new] completionHandler:^(AWSSagemakerUpdateExperimentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateMonitoringSchedule {
    NSString *key = @"testUpdateMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] updateMonitoringSchedule:[AWSSagemakerUpdateMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateMonitoringScheduleCompletionHandler {
    NSString *key = @"testUpdateMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] updateMonitoringSchedule:[AWSSagemakerUpdateMonitoringScheduleRequest new] completionHandler:^(AWSSagemakerUpdateMonitoringScheduleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateNotebookInstance {
    NSString *key = @"testUpdateNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] updateNotebookInstance:[AWSSagemakerUpdateNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateNotebookInstanceCompletionHandler {
    NSString *key = @"testUpdateNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] updateNotebookInstance:[AWSSagemakerUpdateNotebookInstanceInput new] completionHandler:^(AWSSagemakerUpdateNotebookInstanceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateNotebookInstanceLifecycleConfig {
    NSString *key = @"testUpdateNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] updateNotebookInstanceLifecycleConfig:[AWSSagemakerUpdateNotebookInstanceLifecycleConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateNotebookInstanceLifecycleConfigCompletionHandler {
    NSString *key = @"testUpdateNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] updateNotebookInstanceLifecycleConfig:[AWSSagemakerUpdateNotebookInstanceLifecycleConfigInput new] completionHandler:^(AWSSagemakerUpdateNotebookInstanceLifecycleConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateTrial {
    NSString *key = @"testUpdateTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] updateTrial:[AWSSagemakerUpdateTrialRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateTrialCompletionHandler {
    NSString *key = @"testUpdateTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] updateTrial:[AWSSagemakerUpdateTrialRequest new] completionHandler:^(AWSSagemakerUpdateTrialResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateTrialComponent {
    NSString *key = @"testUpdateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] updateTrialComponent:[AWSSagemakerUpdateTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateTrialComponentCompletionHandler {
    NSString *key = @"testUpdateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] updateTrialComponent:[AWSSagemakerUpdateTrialComponentRequest new] completionHandler:^(AWSSagemakerUpdateTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateUserProfile {
    NSString *key = @"testUpdateUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] updateUserProfile:[AWSSagemakerUpdateUserProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateUserProfileCompletionHandler {
    NSString *key = @"testUpdateUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] updateUserProfile:[AWSSagemakerUpdateUserProfileRequest new] completionHandler:^(AWSSagemakerUpdateUserProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateWorkforce {
    NSString *key = @"testUpdateWorkforce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] updateWorkforce:[AWSSagemakerUpdateWorkforceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateWorkforceCompletionHandler {
    NSString *key = @"testUpdateWorkforce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] updateWorkforce:[AWSSagemakerUpdateWorkforceRequest new] completionHandler:^(AWSSagemakerUpdateWorkforceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateWorkteam {
    NSString *key = @"testUpdateWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSagemaker SagemakerForKey:key] updateWorkteam:[AWSSagemakerUpdateWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

- (void)testUpdateWorkteamCompletionHandler {
    NSString *key = @"testUpdateWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSagemaker registerSagemakerWithConfiguration:configuration forKey:key];

    AWSSagemaker *awsClient = [AWSSagemaker SagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSagemaker SagemakerForKey:key] updateWorkteam:[AWSSagemakerUpdateWorkteamRequest new] completionHandler:^(AWSSagemakerUpdateWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSagemaker removeSagemakerForKey:key];
}

@end
