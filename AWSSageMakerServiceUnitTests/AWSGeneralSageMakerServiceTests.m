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
#import "AWSSageMakerServiceService.h"

static id mockNetworking = nil;

@interface AWSGeneralSageMakerServiceTests : XCTestCase

@end

@implementation AWSGeneralSageMakerServiceTests

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
    NSString *key = @"testSageMakerServiceConstructors";
    XCTAssertNotNil([AWSSageMakerService defaultSageMakerService]);
    XCTAssertEqual([[AWSSageMakerService defaultSageMakerService] class], [AWSSageMakerService class]);
    XCTAssertNil([AWSSageMakerService SageMakerServiceForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSSageMakerService SageMakerServiceForKey:key]);
    XCTAssertEqual([[AWSSageMakerService SageMakerServiceForKey:key] class], [AWSSageMakerService class]);
    XCTAssertEqual([AWSSageMakerService SageMakerServiceForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
    XCTAssertNil([AWSSageMakerService SageMakerServiceForKey:key]);

}

- (void)testAddTags {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] addTags:[AWSSageMakerServiceAddTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testAddTagsCompletionHandler {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] addTags:[AWSSageMakerServiceAddTagsInput new] completionHandler:^(AWSSageMakerServiceAddTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testAssociateTrialComponent {
    NSString *key = @"testAssociateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] associateTrialComponent:[AWSSageMakerServiceAssociateTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testAssociateTrialComponentCompletionHandler {
    NSString *key = @"testAssociateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] associateTrialComponent:[AWSSageMakerServiceAssociateTrialComponentRequest new] completionHandler:^(AWSSageMakerServiceAssociateTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateAlgorithm {
    NSString *key = @"testCreateAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createAlgorithm:[AWSSageMakerServiceCreateAlgorithmInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateAlgorithmCompletionHandler {
    NSString *key = @"testCreateAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createAlgorithm:[AWSSageMakerServiceCreateAlgorithmInput new] completionHandler:^(AWSSageMakerServiceCreateAlgorithmOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateApp {
    NSString *key = @"testCreateApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createApp:[AWSSageMakerServiceCreateAppRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateAppCompletionHandler {
    NSString *key = @"testCreateApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createApp:[AWSSageMakerServiceCreateAppRequest new] completionHandler:^(AWSSageMakerServiceCreateAppResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateAutoMLJob {
    NSString *key = @"testCreateAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createAutoMLJob:[AWSSageMakerServiceCreateAutoMLJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateAutoMLJobCompletionHandler {
    NSString *key = @"testCreateAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createAutoMLJob:[AWSSageMakerServiceCreateAutoMLJobRequest new] completionHandler:^(AWSSageMakerServiceCreateAutoMLJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateCodeRepository {
    NSString *key = @"testCreateCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createCodeRepository:[AWSSageMakerServiceCreateCodeRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateCodeRepositoryCompletionHandler {
    NSString *key = @"testCreateCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createCodeRepository:[AWSSageMakerServiceCreateCodeRepositoryInput new] completionHandler:^(AWSSageMakerServiceCreateCodeRepositoryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateCompilationJob {
    NSString *key = @"testCreateCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createCompilationJob:[AWSSageMakerServiceCreateCompilationJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateCompilationJobCompletionHandler {
    NSString *key = @"testCreateCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createCompilationJob:[AWSSageMakerServiceCreateCompilationJobRequest new] completionHandler:^(AWSSageMakerServiceCreateCompilationJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateDomain {
    NSString *key = @"testCreateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createDomain:[AWSSageMakerServiceCreateDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateDomainCompletionHandler {
    NSString *key = @"testCreateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createDomain:[AWSSageMakerServiceCreateDomainRequest new] completionHandler:^(AWSSageMakerServiceCreateDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateEndpoint {
    NSString *key = @"testCreateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createEndpoint:[AWSSageMakerServiceCreateEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateEndpointCompletionHandler {
    NSString *key = @"testCreateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createEndpoint:[AWSSageMakerServiceCreateEndpointInput new] completionHandler:^(AWSSageMakerServiceCreateEndpointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateEndpointConfig {
    NSString *key = @"testCreateEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createEndpointConfig:[AWSSageMakerServiceCreateEndpointConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateEndpointConfigCompletionHandler {
    NSString *key = @"testCreateEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createEndpointConfig:[AWSSageMakerServiceCreateEndpointConfigInput new] completionHandler:^(AWSSageMakerServiceCreateEndpointConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateExperiment {
    NSString *key = @"testCreateExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createExperiment:[AWSSageMakerServiceCreateExperimentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateExperimentCompletionHandler {
    NSString *key = @"testCreateExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createExperiment:[AWSSageMakerServiceCreateExperimentRequest new] completionHandler:^(AWSSageMakerServiceCreateExperimentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateFlowDefinition {
    NSString *key = @"testCreateFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createFlowDefinition:[AWSSageMakerServiceCreateFlowDefinitionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateFlowDefinitionCompletionHandler {
    NSString *key = @"testCreateFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createFlowDefinition:[AWSSageMakerServiceCreateFlowDefinitionRequest new] completionHandler:^(AWSSageMakerServiceCreateFlowDefinitionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateHumanTaskUi {
    NSString *key = @"testCreateHumanTaskUi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createHumanTaskUi:[AWSSageMakerServiceCreateHumanTaskUiRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateHumanTaskUiCompletionHandler {
    NSString *key = @"testCreateHumanTaskUi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createHumanTaskUi:[AWSSageMakerServiceCreateHumanTaskUiRequest new] completionHandler:^(AWSSageMakerServiceCreateHumanTaskUiResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateHyperParameterTuningJob {
    NSString *key = @"testCreateHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createHyperParameterTuningJob:[AWSSageMakerServiceCreateHyperParameterTuningJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateHyperParameterTuningJobCompletionHandler {
    NSString *key = @"testCreateHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createHyperParameterTuningJob:[AWSSageMakerServiceCreateHyperParameterTuningJobRequest new] completionHandler:^(AWSSageMakerServiceCreateHyperParameterTuningJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateLabelingJob {
    NSString *key = @"testCreateLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createLabelingJob:[AWSSageMakerServiceCreateLabelingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateLabelingJobCompletionHandler {
    NSString *key = @"testCreateLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createLabelingJob:[AWSSageMakerServiceCreateLabelingJobRequest new] completionHandler:^(AWSSageMakerServiceCreateLabelingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateModel {
    NSString *key = @"testCreateModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createModel:[AWSSageMakerServiceCreateModelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateModelCompletionHandler {
    NSString *key = @"testCreateModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createModel:[AWSSageMakerServiceCreateModelInput new] completionHandler:^(AWSSageMakerServiceCreateModelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateModelPackage {
    NSString *key = @"testCreateModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createModelPackage:[AWSSageMakerServiceCreateModelPackageInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateModelPackageCompletionHandler {
    NSString *key = @"testCreateModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createModelPackage:[AWSSageMakerServiceCreateModelPackageInput new] completionHandler:^(AWSSageMakerServiceCreateModelPackageOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateMonitoringSchedule {
    NSString *key = @"testCreateMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createMonitoringSchedule:[AWSSageMakerServiceCreateMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateMonitoringScheduleCompletionHandler {
    NSString *key = @"testCreateMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createMonitoringSchedule:[AWSSageMakerServiceCreateMonitoringScheduleRequest new] completionHandler:^(AWSSageMakerServiceCreateMonitoringScheduleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateNotebookInstance {
    NSString *key = @"testCreateNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createNotebookInstance:[AWSSageMakerServiceCreateNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateNotebookInstanceCompletionHandler {
    NSString *key = @"testCreateNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createNotebookInstance:[AWSSageMakerServiceCreateNotebookInstanceInput new] completionHandler:^(AWSSageMakerServiceCreateNotebookInstanceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateNotebookInstanceLifecycleConfig {
    NSString *key = @"testCreateNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createNotebookInstanceLifecycleConfig:[AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateNotebookInstanceLifecycleConfigCompletionHandler {
    NSString *key = @"testCreateNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createNotebookInstanceLifecycleConfig:[AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigInput new] completionHandler:^(AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreatePresignedDomainUrl {
    NSString *key = @"testCreatePresignedDomainUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createPresignedDomainUrl:[AWSSageMakerServiceCreatePresignedDomainUrlRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreatePresignedDomainUrlCompletionHandler {
    NSString *key = @"testCreatePresignedDomainUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createPresignedDomainUrl:[AWSSageMakerServiceCreatePresignedDomainUrlRequest new] completionHandler:^(AWSSageMakerServiceCreatePresignedDomainUrlResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreatePresignedNotebookInstanceUrl {
    NSString *key = @"testCreatePresignedNotebookInstanceUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createPresignedNotebookInstanceUrl:[AWSSageMakerServiceCreatePresignedNotebookInstanceUrlInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreatePresignedNotebookInstanceUrlCompletionHandler {
    NSString *key = @"testCreatePresignedNotebookInstanceUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createPresignedNotebookInstanceUrl:[AWSSageMakerServiceCreatePresignedNotebookInstanceUrlInput new] completionHandler:^(AWSSageMakerServiceCreatePresignedNotebookInstanceUrlOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateProcessingJob {
    NSString *key = @"testCreateProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createProcessingJob:[AWSSageMakerServiceCreateProcessingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateProcessingJobCompletionHandler {
    NSString *key = @"testCreateProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createProcessingJob:[AWSSageMakerServiceCreateProcessingJobRequest new] completionHandler:^(AWSSageMakerServiceCreateProcessingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateTrainingJob {
    NSString *key = @"testCreateTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createTrainingJob:[AWSSageMakerServiceCreateTrainingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateTrainingJobCompletionHandler {
    NSString *key = @"testCreateTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createTrainingJob:[AWSSageMakerServiceCreateTrainingJobRequest new] completionHandler:^(AWSSageMakerServiceCreateTrainingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateTransformJob {
    NSString *key = @"testCreateTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createTransformJob:[AWSSageMakerServiceCreateTransformJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateTransformJobCompletionHandler {
    NSString *key = @"testCreateTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createTransformJob:[AWSSageMakerServiceCreateTransformJobRequest new] completionHandler:^(AWSSageMakerServiceCreateTransformJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateTrial {
    NSString *key = @"testCreateTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createTrial:[AWSSageMakerServiceCreateTrialRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateTrialCompletionHandler {
    NSString *key = @"testCreateTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createTrial:[AWSSageMakerServiceCreateTrialRequest new] completionHandler:^(AWSSageMakerServiceCreateTrialResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateTrialComponent {
    NSString *key = @"testCreateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createTrialComponent:[AWSSageMakerServiceCreateTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateTrialComponentCompletionHandler {
    NSString *key = @"testCreateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createTrialComponent:[AWSSageMakerServiceCreateTrialComponentRequest new] completionHandler:^(AWSSageMakerServiceCreateTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateUserProfile {
    NSString *key = @"testCreateUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createUserProfile:[AWSSageMakerServiceCreateUserProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateUserProfileCompletionHandler {
    NSString *key = @"testCreateUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createUserProfile:[AWSSageMakerServiceCreateUserProfileRequest new] completionHandler:^(AWSSageMakerServiceCreateUserProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateWorkteam {
    NSString *key = @"testCreateWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] createWorkteam:[AWSSageMakerServiceCreateWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testCreateWorkteamCompletionHandler {
    NSString *key = @"testCreateWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] createWorkteam:[AWSSageMakerServiceCreateWorkteamRequest new] completionHandler:^(AWSSageMakerServiceCreateWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteAlgorithm {
    NSString *key = @"testDeleteAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteAlgorithm:[AWSSageMakerServiceDeleteAlgorithmInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteAlgorithmCompletionHandler {
    NSString *key = @"testDeleteAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteAlgorithm:[AWSSageMakerServiceDeleteAlgorithmInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteApp {
    NSString *key = @"testDeleteApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteApp:[AWSSageMakerServiceDeleteAppRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteAppCompletionHandler {
    NSString *key = @"testDeleteApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteApp:[AWSSageMakerServiceDeleteAppRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteCodeRepository {
    NSString *key = @"testDeleteCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteCodeRepository:[AWSSageMakerServiceDeleteCodeRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteCodeRepositoryCompletionHandler {
    NSString *key = @"testDeleteCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteCodeRepository:[AWSSageMakerServiceDeleteCodeRepositoryInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteDomain {
    NSString *key = @"testDeleteDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteDomain:[AWSSageMakerServiceDeleteDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteDomainCompletionHandler {
    NSString *key = @"testDeleteDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteDomain:[AWSSageMakerServiceDeleteDomainRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteEndpoint {
    NSString *key = @"testDeleteEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteEndpoint:[AWSSageMakerServiceDeleteEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteEndpointCompletionHandler {
    NSString *key = @"testDeleteEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteEndpoint:[AWSSageMakerServiceDeleteEndpointInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteEndpointConfig {
    NSString *key = @"testDeleteEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteEndpointConfig:[AWSSageMakerServiceDeleteEndpointConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteEndpointConfigCompletionHandler {
    NSString *key = @"testDeleteEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteEndpointConfig:[AWSSageMakerServiceDeleteEndpointConfigInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteExperiment {
    NSString *key = @"testDeleteExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteExperiment:[AWSSageMakerServiceDeleteExperimentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteExperimentCompletionHandler {
    NSString *key = @"testDeleteExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteExperiment:[AWSSageMakerServiceDeleteExperimentRequest new] completionHandler:^(AWSSageMakerServiceDeleteExperimentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteFlowDefinition {
    NSString *key = @"testDeleteFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteFlowDefinition:[AWSSageMakerServiceDeleteFlowDefinitionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteFlowDefinitionCompletionHandler {
    NSString *key = @"testDeleteFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteFlowDefinition:[AWSSageMakerServiceDeleteFlowDefinitionRequest new] completionHandler:^(AWSSageMakerServiceDeleteFlowDefinitionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteModel {
    NSString *key = @"testDeleteModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteModel:[AWSSageMakerServiceDeleteModelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteModelCompletionHandler {
    NSString *key = @"testDeleteModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteModel:[AWSSageMakerServiceDeleteModelInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteModelPackage {
    NSString *key = @"testDeleteModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteModelPackage:[AWSSageMakerServiceDeleteModelPackageInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteModelPackageCompletionHandler {
    NSString *key = @"testDeleteModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteModelPackage:[AWSSageMakerServiceDeleteModelPackageInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteMonitoringSchedule {
    NSString *key = @"testDeleteMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteMonitoringSchedule:[AWSSageMakerServiceDeleteMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteMonitoringScheduleCompletionHandler {
    NSString *key = @"testDeleteMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteMonitoringSchedule:[AWSSageMakerServiceDeleteMonitoringScheduleRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteNotebookInstance {
    NSString *key = @"testDeleteNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteNotebookInstance:[AWSSageMakerServiceDeleteNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteNotebookInstanceCompletionHandler {
    NSString *key = @"testDeleteNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteNotebookInstance:[AWSSageMakerServiceDeleteNotebookInstanceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteNotebookInstanceLifecycleConfig {
    NSString *key = @"testDeleteNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteNotebookInstanceLifecycleConfig:[AWSSageMakerServiceDeleteNotebookInstanceLifecycleConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteNotebookInstanceLifecycleConfigCompletionHandler {
    NSString *key = @"testDeleteNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteNotebookInstanceLifecycleConfig:[AWSSageMakerServiceDeleteNotebookInstanceLifecycleConfigInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteTags {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteTags:[AWSSageMakerServiceDeleteTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteTagsCompletionHandler {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteTags:[AWSSageMakerServiceDeleteTagsInput new] completionHandler:^(AWSSageMakerServiceDeleteTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteTrial {
    NSString *key = @"testDeleteTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteTrial:[AWSSageMakerServiceDeleteTrialRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteTrialCompletionHandler {
    NSString *key = @"testDeleteTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteTrial:[AWSSageMakerServiceDeleteTrialRequest new] completionHandler:^(AWSSageMakerServiceDeleteTrialResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteTrialComponent {
    NSString *key = @"testDeleteTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteTrialComponent:[AWSSageMakerServiceDeleteTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteTrialComponentCompletionHandler {
    NSString *key = @"testDeleteTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteTrialComponent:[AWSSageMakerServiceDeleteTrialComponentRequest new] completionHandler:^(AWSSageMakerServiceDeleteTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteUserProfile {
    NSString *key = @"testDeleteUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteUserProfile:[AWSSageMakerServiceDeleteUserProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteUserProfileCompletionHandler {
    NSString *key = @"testDeleteUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteUserProfile:[AWSSageMakerServiceDeleteUserProfileRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteWorkteam {
    NSString *key = @"testDeleteWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] deleteWorkteam:[AWSSageMakerServiceDeleteWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDeleteWorkteamCompletionHandler {
    NSString *key = @"testDeleteWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] deleteWorkteam:[AWSSageMakerServiceDeleteWorkteamRequest new] completionHandler:^(AWSSageMakerServiceDeleteWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeAlgorithm {
    NSString *key = @"testDescribeAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeAlgorithm:[AWSSageMakerServiceDescribeAlgorithmInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeAlgorithmCompletionHandler {
    NSString *key = @"testDescribeAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeAlgorithm:[AWSSageMakerServiceDescribeAlgorithmInput new] completionHandler:^(AWSSageMakerServiceDescribeAlgorithmOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeApp {
    NSString *key = @"testDescribeApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeApp:[AWSSageMakerServiceDescribeAppRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeAppCompletionHandler {
    NSString *key = @"testDescribeApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeApp:[AWSSageMakerServiceDescribeAppRequest new] completionHandler:^(AWSSageMakerServiceDescribeAppResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeAutoMLJob {
    NSString *key = @"testDescribeAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeAutoMLJob:[AWSSageMakerServiceDescribeAutoMLJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeAutoMLJobCompletionHandler {
    NSString *key = @"testDescribeAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeAutoMLJob:[AWSSageMakerServiceDescribeAutoMLJobRequest new] completionHandler:^(AWSSageMakerServiceDescribeAutoMLJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeCodeRepository {
    NSString *key = @"testDescribeCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeCodeRepository:[AWSSageMakerServiceDescribeCodeRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeCodeRepositoryCompletionHandler {
    NSString *key = @"testDescribeCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeCodeRepository:[AWSSageMakerServiceDescribeCodeRepositoryInput new] completionHandler:^(AWSSageMakerServiceDescribeCodeRepositoryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeCompilationJob {
    NSString *key = @"testDescribeCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeCompilationJob:[AWSSageMakerServiceDescribeCompilationJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeCompilationJobCompletionHandler {
    NSString *key = @"testDescribeCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeCompilationJob:[AWSSageMakerServiceDescribeCompilationJobRequest new] completionHandler:^(AWSSageMakerServiceDescribeCompilationJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeDomain {
    NSString *key = @"testDescribeDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeDomain:[AWSSageMakerServiceDescribeDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeDomainCompletionHandler {
    NSString *key = @"testDescribeDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeDomain:[AWSSageMakerServiceDescribeDomainRequest new] completionHandler:^(AWSSageMakerServiceDescribeDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeEndpoint {
    NSString *key = @"testDescribeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeEndpoint:[AWSSageMakerServiceDescribeEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeEndpointCompletionHandler {
    NSString *key = @"testDescribeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeEndpoint:[AWSSageMakerServiceDescribeEndpointInput new] completionHandler:^(AWSSageMakerServiceDescribeEndpointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeEndpointConfig {
    NSString *key = @"testDescribeEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeEndpointConfig:[AWSSageMakerServiceDescribeEndpointConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeEndpointConfigCompletionHandler {
    NSString *key = @"testDescribeEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeEndpointConfig:[AWSSageMakerServiceDescribeEndpointConfigInput new] completionHandler:^(AWSSageMakerServiceDescribeEndpointConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeExperiment {
    NSString *key = @"testDescribeExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeExperiment:[AWSSageMakerServiceDescribeExperimentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeExperimentCompletionHandler {
    NSString *key = @"testDescribeExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeExperiment:[AWSSageMakerServiceDescribeExperimentRequest new] completionHandler:^(AWSSageMakerServiceDescribeExperimentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeFlowDefinition {
    NSString *key = @"testDescribeFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeFlowDefinition:[AWSSageMakerServiceDescribeFlowDefinitionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeFlowDefinitionCompletionHandler {
    NSString *key = @"testDescribeFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeFlowDefinition:[AWSSageMakerServiceDescribeFlowDefinitionRequest new] completionHandler:^(AWSSageMakerServiceDescribeFlowDefinitionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeHumanTaskUi {
    NSString *key = @"testDescribeHumanTaskUi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeHumanTaskUi:[AWSSageMakerServiceDescribeHumanTaskUiRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeHumanTaskUiCompletionHandler {
    NSString *key = @"testDescribeHumanTaskUi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeHumanTaskUi:[AWSSageMakerServiceDescribeHumanTaskUiRequest new] completionHandler:^(AWSSageMakerServiceDescribeHumanTaskUiResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeHyperParameterTuningJob {
    NSString *key = @"testDescribeHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeHyperParameterTuningJob:[AWSSageMakerServiceDescribeHyperParameterTuningJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeHyperParameterTuningJobCompletionHandler {
    NSString *key = @"testDescribeHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeHyperParameterTuningJob:[AWSSageMakerServiceDescribeHyperParameterTuningJobRequest new] completionHandler:^(AWSSageMakerServiceDescribeHyperParameterTuningJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeLabelingJob {
    NSString *key = @"testDescribeLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeLabelingJob:[AWSSageMakerServiceDescribeLabelingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeLabelingJobCompletionHandler {
    NSString *key = @"testDescribeLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeLabelingJob:[AWSSageMakerServiceDescribeLabelingJobRequest new] completionHandler:^(AWSSageMakerServiceDescribeLabelingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeModel {
    NSString *key = @"testDescribeModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeModel:[AWSSageMakerServiceDescribeModelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeModelCompletionHandler {
    NSString *key = @"testDescribeModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeModel:[AWSSageMakerServiceDescribeModelInput new] completionHandler:^(AWSSageMakerServiceDescribeModelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeModelPackage {
    NSString *key = @"testDescribeModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeModelPackage:[AWSSageMakerServiceDescribeModelPackageInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeModelPackageCompletionHandler {
    NSString *key = @"testDescribeModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeModelPackage:[AWSSageMakerServiceDescribeModelPackageInput new] completionHandler:^(AWSSageMakerServiceDescribeModelPackageOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeMonitoringSchedule {
    NSString *key = @"testDescribeMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeMonitoringSchedule:[AWSSageMakerServiceDescribeMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeMonitoringScheduleCompletionHandler {
    NSString *key = @"testDescribeMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeMonitoringSchedule:[AWSSageMakerServiceDescribeMonitoringScheduleRequest new] completionHandler:^(AWSSageMakerServiceDescribeMonitoringScheduleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeNotebookInstance {
    NSString *key = @"testDescribeNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeNotebookInstance:[AWSSageMakerServiceDescribeNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeNotebookInstanceCompletionHandler {
    NSString *key = @"testDescribeNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeNotebookInstance:[AWSSageMakerServiceDescribeNotebookInstanceInput new] completionHandler:^(AWSSageMakerServiceDescribeNotebookInstanceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeNotebookInstanceLifecycleConfig {
    NSString *key = @"testDescribeNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeNotebookInstanceLifecycleConfig:[AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeNotebookInstanceLifecycleConfigCompletionHandler {
    NSString *key = @"testDescribeNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeNotebookInstanceLifecycleConfig:[AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigInput new] completionHandler:^(AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeProcessingJob {
    NSString *key = @"testDescribeProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeProcessingJob:[AWSSageMakerServiceDescribeProcessingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeProcessingJobCompletionHandler {
    NSString *key = @"testDescribeProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeProcessingJob:[AWSSageMakerServiceDescribeProcessingJobRequest new] completionHandler:^(AWSSageMakerServiceDescribeProcessingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeSubscribedWorkteam {
    NSString *key = @"testDescribeSubscribedWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeSubscribedWorkteam:[AWSSageMakerServiceDescribeSubscribedWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeSubscribedWorkteamCompletionHandler {
    NSString *key = @"testDescribeSubscribedWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeSubscribedWorkteam:[AWSSageMakerServiceDescribeSubscribedWorkteamRequest new] completionHandler:^(AWSSageMakerServiceDescribeSubscribedWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeTrainingJob {
    NSString *key = @"testDescribeTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeTrainingJob:[AWSSageMakerServiceDescribeTrainingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeTrainingJobCompletionHandler {
    NSString *key = @"testDescribeTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeTrainingJob:[AWSSageMakerServiceDescribeTrainingJobRequest new] completionHandler:^(AWSSageMakerServiceDescribeTrainingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeTransformJob {
    NSString *key = @"testDescribeTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeTransformJob:[AWSSageMakerServiceDescribeTransformJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeTransformJobCompletionHandler {
    NSString *key = @"testDescribeTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeTransformJob:[AWSSageMakerServiceDescribeTransformJobRequest new] completionHandler:^(AWSSageMakerServiceDescribeTransformJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeTrial {
    NSString *key = @"testDescribeTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeTrial:[AWSSageMakerServiceDescribeTrialRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeTrialCompletionHandler {
    NSString *key = @"testDescribeTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeTrial:[AWSSageMakerServiceDescribeTrialRequest new] completionHandler:^(AWSSageMakerServiceDescribeTrialResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeTrialComponent {
    NSString *key = @"testDescribeTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeTrialComponent:[AWSSageMakerServiceDescribeTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeTrialComponentCompletionHandler {
    NSString *key = @"testDescribeTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeTrialComponent:[AWSSageMakerServiceDescribeTrialComponentRequest new] completionHandler:^(AWSSageMakerServiceDescribeTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeUserProfile {
    NSString *key = @"testDescribeUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeUserProfile:[AWSSageMakerServiceDescribeUserProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeUserProfileCompletionHandler {
    NSString *key = @"testDescribeUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeUserProfile:[AWSSageMakerServiceDescribeUserProfileRequest new] completionHandler:^(AWSSageMakerServiceDescribeUserProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeWorkforce {
    NSString *key = @"testDescribeWorkforce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeWorkforce:[AWSSageMakerServiceDescribeWorkforceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeWorkforceCompletionHandler {
    NSString *key = @"testDescribeWorkforce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeWorkforce:[AWSSageMakerServiceDescribeWorkforceRequest new] completionHandler:^(AWSSageMakerServiceDescribeWorkforceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeWorkteam {
    NSString *key = @"testDescribeWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] describeWorkteam:[AWSSageMakerServiceDescribeWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDescribeWorkteamCompletionHandler {
    NSString *key = @"testDescribeWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] describeWorkteam:[AWSSageMakerServiceDescribeWorkteamRequest new] completionHandler:^(AWSSageMakerServiceDescribeWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDisassociateTrialComponent {
    NSString *key = @"testDisassociateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] disassociateTrialComponent:[AWSSageMakerServiceDisassociateTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testDisassociateTrialComponentCompletionHandler {
    NSString *key = @"testDisassociateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] disassociateTrialComponent:[AWSSageMakerServiceDisassociateTrialComponentRequest new] completionHandler:^(AWSSageMakerServiceDisassociateTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testGetSearchSuggestions {
    NSString *key = @"testGetSearchSuggestions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] getSearchSuggestions:[AWSSageMakerServiceGetSearchSuggestionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testGetSearchSuggestionsCompletionHandler {
    NSString *key = @"testGetSearchSuggestions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] getSearchSuggestions:[AWSSageMakerServiceGetSearchSuggestionsRequest new] completionHandler:^(AWSSageMakerServiceGetSearchSuggestionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListAlgorithms {
    NSString *key = @"testListAlgorithms";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listAlgorithms:[AWSSageMakerServiceListAlgorithmsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListAlgorithmsCompletionHandler {
    NSString *key = @"testListAlgorithms";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listAlgorithms:[AWSSageMakerServiceListAlgorithmsInput new] completionHandler:^(AWSSageMakerServiceListAlgorithmsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListApps {
    NSString *key = @"testListApps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listApps:[AWSSageMakerServiceListAppsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListAppsCompletionHandler {
    NSString *key = @"testListApps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listApps:[AWSSageMakerServiceListAppsRequest new] completionHandler:^(AWSSageMakerServiceListAppsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListAutoMLJobs {
    NSString *key = @"testListAutoMLJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listAutoMLJobs:[AWSSageMakerServiceListAutoMLJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListAutoMLJobsCompletionHandler {
    NSString *key = @"testListAutoMLJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listAutoMLJobs:[AWSSageMakerServiceListAutoMLJobsRequest new] completionHandler:^(AWSSageMakerServiceListAutoMLJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListCandidatesForAutoMLJob {
    NSString *key = @"testListCandidatesForAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listCandidatesForAutoMLJob:[AWSSageMakerServiceListCandidatesForAutoMLJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListCandidatesForAutoMLJobCompletionHandler {
    NSString *key = @"testListCandidatesForAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listCandidatesForAutoMLJob:[AWSSageMakerServiceListCandidatesForAutoMLJobRequest new] completionHandler:^(AWSSageMakerServiceListCandidatesForAutoMLJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListCodeRepositories {
    NSString *key = @"testListCodeRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listCodeRepositories:[AWSSageMakerServiceListCodeRepositoriesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListCodeRepositoriesCompletionHandler {
    NSString *key = @"testListCodeRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listCodeRepositories:[AWSSageMakerServiceListCodeRepositoriesInput new] completionHandler:^(AWSSageMakerServiceListCodeRepositoriesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListCompilationJobs {
    NSString *key = @"testListCompilationJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listCompilationJobs:[AWSSageMakerServiceListCompilationJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListCompilationJobsCompletionHandler {
    NSString *key = @"testListCompilationJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listCompilationJobs:[AWSSageMakerServiceListCompilationJobsRequest new] completionHandler:^(AWSSageMakerServiceListCompilationJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListDomains {
    NSString *key = @"testListDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listDomains:[AWSSageMakerServiceListDomainsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListDomainsCompletionHandler {
    NSString *key = @"testListDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listDomains:[AWSSageMakerServiceListDomainsRequest new] completionHandler:^(AWSSageMakerServiceListDomainsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListEndpointConfigs {
    NSString *key = @"testListEndpointConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listEndpointConfigs:[AWSSageMakerServiceListEndpointConfigsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListEndpointConfigsCompletionHandler {
    NSString *key = @"testListEndpointConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listEndpointConfigs:[AWSSageMakerServiceListEndpointConfigsInput new] completionHandler:^(AWSSageMakerServiceListEndpointConfigsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListEndpoints {
    NSString *key = @"testListEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listEndpoints:[AWSSageMakerServiceListEndpointsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListEndpointsCompletionHandler {
    NSString *key = @"testListEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listEndpoints:[AWSSageMakerServiceListEndpointsInput new] completionHandler:^(AWSSageMakerServiceListEndpointsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListExperiments {
    NSString *key = @"testListExperiments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listExperiments:[AWSSageMakerServiceListExperimentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListExperimentsCompletionHandler {
    NSString *key = @"testListExperiments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listExperiments:[AWSSageMakerServiceListExperimentsRequest new] completionHandler:^(AWSSageMakerServiceListExperimentsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListFlowDefinitions {
    NSString *key = @"testListFlowDefinitions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listFlowDefinitions:[AWSSageMakerServiceListFlowDefinitionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListFlowDefinitionsCompletionHandler {
    NSString *key = @"testListFlowDefinitions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listFlowDefinitions:[AWSSageMakerServiceListFlowDefinitionsRequest new] completionHandler:^(AWSSageMakerServiceListFlowDefinitionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListHumanTaskUis {
    NSString *key = @"testListHumanTaskUis";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listHumanTaskUis:[AWSSageMakerServiceListHumanTaskUisRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListHumanTaskUisCompletionHandler {
    NSString *key = @"testListHumanTaskUis";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listHumanTaskUis:[AWSSageMakerServiceListHumanTaskUisRequest new] completionHandler:^(AWSSageMakerServiceListHumanTaskUisResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListHyperParameterTuningJobs {
    NSString *key = @"testListHyperParameterTuningJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listHyperParameterTuningJobs:[AWSSageMakerServiceListHyperParameterTuningJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListHyperParameterTuningJobsCompletionHandler {
    NSString *key = @"testListHyperParameterTuningJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listHyperParameterTuningJobs:[AWSSageMakerServiceListHyperParameterTuningJobsRequest new] completionHandler:^(AWSSageMakerServiceListHyperParameterTuningJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListLabelingJobs {
    NSString *key = @"testListLabelingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listLabelingJobs:[AWSSageMakerServiceListLabelingJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListLabelingJobsCompletionHandler {
    NSString *key = @"testListLabelingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listLabelingJobs:[AWSSageMakerServiceListLabelingJobsRequest new] completionHandler:^(AWSSageMakerServiceListLabelingJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListLabelingJobsForWorkteam {
    NSString *key = @"testListLabelingJobsForWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listLabelingJobsForWorkteam:[AWSSageMakerServiceListLabelingJobsForWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListLabelingJobsForWorkteamCompletionHandler {
    NSString *key = @"testListLabelingJobsForWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listLabelingJobsForWorkteam:[AWSSageMakerServiceListLabelingJobsForWorkteamRequest new] completionHandler:^(AWSSageMakerServiceListLabelingJobsForWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListModelPackages {
    NSString *key = @"testListModelPackages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listModelPackages:[AWSSageMakerServiceListModelPackagesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListModelPackagesCompletionHandler {
    NSString *key = @"testListModelPackages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listModelPackages:[AWSSageMakerServiceListModelPackagesInput new] completionHandler:^(AWSSageMakerServiceListModelPackagesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListModels {
    NSString *key = @"testListModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listModels:[AWSSageMakerServiceListModelsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListModelsCompletionHandler {
    NSString *key = @"testListModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listModels:[AWSSageMakerServiceListModelsInput new] completionHandler:^(AWSSageMakerServiceListModelsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListMonitoringExecutions {
    NSString *key = @"testListMonitoringExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listMonitoringExecutions:[AWSSageMakerServiceListMonitoringExecutionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListMonitoringExecutionsCompletionHandler {
    NSString *key = @"testListMonitoringExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listMonitoringExecutions:[AWSSageMakerServiceListMonitoringExecutionsRequest new] completionHandler:^(AWSSageMakerServiceListMonitoringExecutionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListMonitoringSchedules {
    NSString *key = @"testListMonitoringSchedules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listMonitoringSchedules:[AWSSageMakerServiceListMonitoringSchedulesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListMonitoringSchedulesCompletionHandler {
    NSString *key = @"testListMonitoringSchedules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listMonitoringSchedules:[AWSSageMakerServiceListMonitoringSchedulesRequest new] completionHandler:^(AWSSageMakerServiceListMonitoringSchedulesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListNotebookInstanceLifecycleConfigs {
    NSString *key = @"testListNotebookInstanceLifecycleConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listNotebookInstanceLifecycleConfigs:[AWSSageMakerServiceListNotebookInstanceLifecycleConfigsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListNotebookInstanceLifecycleConfigsCompletionHandler {
    NSString *key = @"testListNotebookInstanceLifecycleConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listNotebookInstanceLifecycleConfigs:[AWSSageMakerServiceListNotebookInstanceLifecycleConfigsInput new] completionHandler:^(AWSSageMakerServiceListNotebookInstanceLifecycleConfigsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListNotebookInstances {
    NSString *key = @"testListNotebookInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listNotebookInstances:[AWSSageMakerServiceListNotebookInstancesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListNotebookInstancesCompletionHandler {
    NSString *key = @"testListNotebookInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listNotebookInstances:[AWSSageMakerServiceListNotebookInstancesInput new] completionHandler:^(AWSSageMakerServiceListNotebookInstancesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListProcessingJobs {
    NSString *key = @"testListProcessingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listProcessingJobs:[AWSSageMakerServiceListProcessingJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListProcessingJobsCompletionHandler {
    NSString *key = @"testListProcessingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listProcessingJobs:[AWSSageMakerServiceListProcessingJobsRequest new] completionHandler:^(AWSSageMakerServiceListProcessingJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListSubscribedWorkteams {
    NSString *key = @"testListSubscribedWorkteams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listSubscribedWorkteams:[AWSSageMakerServiceListSubscribedWorkteamsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListSubscribedWorkteamsCompletionHandler {
    NSString *key = @"testListSubscribedWorkteams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listSubscribedWorkteams:[AWSSageMakerServiceListSubscribedWorkteamsRequest new] completionHandler:^(AWSSageMakerServiceListSubscribedWorkteamsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListTags {
    NSString *key = @"testListTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listTags:[AWSSageMakerServiceListTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListTagsCompletionHandler {
    NSString *key = @"testListTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listTags:[AWSSageMakerServiceListTagsInput new] completionHandler:^(AWSSageMakerServiceListTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListTrainingJobs {
    NSString *key = @"testListTrainingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listTrainingJobs:[AWSSageMakerServiceListTrainingJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListTrainingJobsCompletionHandler {
    NSString *key = @"testListTrainingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listTrainingJobs:[AWSSageMakerServiceListTrainingJobsRequest new] completionHandler:^(AWSSageMakerServiceListTrainingJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListTrainingJobsForHyperParameterTuningJob {
    NSString *key = @"testListTrainingJobsForHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listTrainingJobsForHyperParameterTuningJob:[AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListTrainingJobsForHyperParameterTuningJobCompletionHandler {
    NSString *key = @"testListTrainingJobsForHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listTrainingJobsForHyperParameterTuningJob:[AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobRequest new] completionHandler:^(AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListTransformJobs {
    NSString *key = @"testListTransformJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listTransformJobs:[AWSSageMakerServiceListTransformJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListTransformJobsCompletionHandler {
    NSString *key = @"testListTransformJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listTransformJobs:[AWSSageMakerServiceListTransformJobsRequest new] completionHandler:^(AWSSageMakerServiceListTransformJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListTrialComponents {
    NSString *key = @"testListTrialComponents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listTrialComponents:[AWSSageMakerServiceListTrialComponentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListTrialComponentsCompletionHandler {
    NSString *key = @"testListTrialComponents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listTrialComponents:[AWSSageMakerServiceListTrialComponentsRequest new] completionHandler:^(AWSSageMakerServiceListTrialComponentsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListTrials {
    NSString *key = @"testListTrials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listTrials:[AWSSageMakerServiceListTrialsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListTrialsCompletionHandler {
    NSString *key = @"testListTrials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listTrials:[AWSSageMakerServiceListTrialsRequest new] completionHandler:^(AWSSageMakerServiceListTrialsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListUserProfiles {
    NSString *key = @"testListUserProfiles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listUserProfiles:[AWSSageMakerServiceListUserProfilesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListUserProfilesCompletionHandler {
    NSString *key = @"testListUserProfiles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listUserProfiles:[AWSSageMakerServiceListUserProfilesRequest new] completionHandler:^(AWSSageMakerServiceListUserProfilesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListWorkteams {
    NSString *key = @"testListWorkteams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] listWorkteams:[AWSSageMakerServiceListWorkteamsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testListWorkteamsCompletionHandler {
    NSString *key = @"testListWorkteams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] listWorkteams:[AWSSageMakerServiceListWorkteamsRequest new] completionHandler:^(AWSSageMakerServiceListWorkteamsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testRenderUiTemplate {
    NSString *key = @"testRenderUiTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] renderUiTemplate:[AWSSageMakerServiceRenderUiTemplateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testRenderUiTemplateCompletionHandler {
    NSString *key = @"testRenderUiTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] renderUiTemplate:[AWSSageMakerServiceRenderUiTemplateRequest new] completionHandler:^(AWSSageMakerServiceRenderUiTemplateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testSearch {
    NSString *key = @"testSearch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] search:[AWSSageMakerServiceSearchRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testSearchCompletionHandler {
    NSString *key = @"testSearch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] search:[AWSSageMakerServiceSearchRequest new] completionHandler:^(AWSSageMakerServiceSearchResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStartMonitoringSchedule {
    NSString *key = @"testStartMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] startMonitoringSchedule:[AWSSageMakerServiceStartMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStartMonitoringScheduleCompletionHandler {
    NSString *key = @"testStartMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] startMonitoringSchedule:[AWSSageMakerServiceStartMonitoringScheduleRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStartNotebookInstance {
    NSString *key = @"testStartNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] startNotebookInstance:[AWSSageMakerServiceStartNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStartNotebookInstanceCompletionHandler {
    NSString *key = @"testStartNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] startNotebookInstance:[AWSSageMakerServiceStartNotebookInstanceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopAutoMLJob {
    NSString *key = @"testStopAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] stopAutoMLJob:[AWSSageMakerServiceStopAutoMLJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopAutoMLJobCompletionHandler {
    NSString *key = @"testStopAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] stopAutoMLJob:[AWSSageMakerServiceStopAutoMLJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopCompilationJob {
    NSString *key = @"testStopCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] stopCompilationJob:[AWSSageMakerServiceStopCompilationJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopCompilationJobCompletionHandler {
    NSString *key = @"testStopCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] stopCompilationJob:[AWSSageMakerServiceStopCompilationJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopHyperParameterTuningJob {
    NSString *key = @"testStopHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] stopHyperParameterTuningJob:[AWSSageMakerServiceStopHyperParameterTuningJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopHyperParameterTuningJobCompletionHandler {
    NSString *key = @"testStopHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] stopHyperParameterTuningJob:[AWSSageMakerServiceStopHyperParameterTuningJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopLabelingJob {
    NSString *key = @"testStopLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] stopLabelingJob:[AWSSageMakerServiceStopLabelingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopLabelingJobCompletionHandler {
    NSString *key = @"testStopLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] stopLabelingJob:[AWSSageMakerServiceStopLabelingJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopMonitoringSchedule {
    NSString *key = @"testStopMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] stopMonitoringSchedule:[AWSSageMakerServiceStopMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopMonitoringScheduleCompletionHandler {
    NSString *key = @"testStopMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] stopMonitoringSchedule:[AWSSageMakerServiceStopMonitoringScheduleRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopNotebookInstance {
    NSString *key = @"testStopNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] stopNotebookInstance:[AWSSageMakerServiceStopNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopNotebookInstanceCompletionHandler {
    NSString *key = @"testStopNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] stopNotebookInstance:[AWSSageMakerServiceStopNotebookInstanceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopProcessingJob {
    NSString *key = @"testStopProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] stopProcessingJob:[AWSSageMakerServiceStopProcessingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopProcessingJobCompletionHandler {
    NSString *key = @"testStopProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] stopProcessingJob:[AWSSageMakerServiceStopProcessingJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopTrainingJob {
    NSString *key = @"testStopTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] stopTrainingJob:[AWSSageMakerServiceStopTrainingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopTrainingJobCompletionHandler {
    NSString *key = @"testStopTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] stopTrainingJob:[AWSSageMakerServiceStopTrainingJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopTransformJob {
    NSString *key = @"testStopTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] stopTransformJob:[AWSSageMakerServiceStopTransformJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testStopTransformJobCompletionHandler {
    NSString *key = @"testStopTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] stopTransformJob:[AWSSageMakerServiceStopTransformJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateCodeRepository {
    NSString *key = @"testUpdateCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] updateCodeRepository:[AWSSageMakerServiceUpdateCodeRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateCodeRepositoryCompletionHandler {
    NSString *key = @"testUpdateCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] updateCodeRepository:[AWSSageMakerServiceUpdateCodeRepositoryInput new] completionHandler:^(AWSSageMakerServiceUpdateCodeRepositoryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateDomain {
    NSString *key = @"testUpdateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] updateDomain:[AWSSageMakerServiceUpdateDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateDomainCompletionHandler {
    NSString *key = @"testUpdateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] updateDomain:[AWSSageMakerServiceUpdateDomainRequest new] completionHandler:^(AWSSageMakerServiceUpdateDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateEndpoint {
    NSString *key = @"testUpdateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] updateEndpoint:[AWSSageMakerServiceUpdateEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateEndpointCompletionHandler {
    NSString *key = @"testUpdateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] updateEndpoint:[AWSSageMakerServiceUpdateEndpointInput new] completionHandler:^(AWSSageMakerServiceUpdateEndpointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateEndpointWeightsAndCapacities {
    NSString *key = @"testUpdateEndpointWeightsAndCapacities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] updateEndpointWeightsAndCapacities:[AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateEndpointWeightsAndCapacitiesCompletionHandler {
    NSString *key = @"testUpdateEndpointWeightsAndCapacities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] updateEndpointWeightsAndCapacities:[AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesInput new] completionHandler:^(AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateExperiment {
    NSString *key = @"testUpdateExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] updateExperiment:[AWSSageMakerServiceUpdateExperimentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateExperimentCompletionHandler {
    NSString *key = @"testUpdateExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] updateExperiment:[AWSSageMakerServiceUpdateExperimentRequest new] completionHandler:^(AWSSageMakerServiceUpdateExperimentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateMonitoringSchedule {
    NSString *key = @"testUpdateMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] updateMonitoringSchedule:[AWSSageMakerServiceUpdateMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateMonitoringScheduleCompletionHandler {
    NSString *key = @"testUpdateMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] updateMonitoringSchedule:[AWSSageMakerServiceUpdateMonitoringScheduleRequest new] completionHandler:^(AWSSageMakerServiceUpdateMonitoringScheduleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateNotebookInstance {
    NSString *key = @"testUpdateNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] updateNotebookInstance:[AWSSageMakerServiceUpdateNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateNotebookInstanceCompletionHandler {
    NSString *key = @"testUpdateNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] updateNotebookInstance:[AWSSageMakerServiceUpdateNotebookInstanceInput new] completionHandler:^(AWSSageMakerServiceUpdateNotebookInstanceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateNotebookInstanceLifecycleConfig {
    NSString *key = @"testUpdateNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] updateNotebookInstanceLifecycleConfig:[AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateNotebookInstanceLifecycleConfigCompletionHandler {
    NSString *key = @"testUpdateNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] updateNotebookInstanceLifecycleConfig:[AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigInput new] completionHandler:^(AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateTrial {
    NSString *key = @"testUpdateTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] updateTrial:[AWSSageMakerServiceUpdateTrialRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateTrialCompletionHandler {
    NSString *key = @"testUpdateTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] updateTrial:[AWSSageMakerServiceUpdateTrialRequest new] completionHandler:^(AWSSageMakerServiceUpdateTrialResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateTrialComponent {
    NSString *key = @"testUpdateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] updateTrialComponent:[AWSSageMakerServiceUpdateTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateTrialComponentCompletionHandler {
    NSString *key = @"testUpdateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] updateTrialComponent:[AWSSageMakerServiceUpdateTrialComponentRequest new] completionHandler:^(AWSSageMakerServiceUpdateTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateUserProfile {
    NSString *key = @"testUpdateUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] updateUserProfile:[AWSSageMakerServiceUpdateUserProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateUserProfileCompletionHandler {
    NSString *key = @"testUpdateUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] updateUserProfile:[AWSSageMakerServiceUpdateUserProfileRequest new] completionHandler:^(AWSSageMakerServiceUpdateUserProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateWorkforce {
    NSString *key = @"testUpdateWorkforce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] updateWorkforce:[AWSSageMakerServiceUpdateWorkforceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateWorkforceCompletionHandler {
    NSString *key = @"testUpdateWorkforce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] updateWorkforce:[AWSSageMakerServiceUpdateWorkforceRequest new] completionHandler:^(AWSSageMakerServiceUpdateWorkforceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateWorkteam {
    NSString *key = @"testUpdateWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSSageMakerService SageMakerServiceForKey:key] updateWorkteam:[AWSSageMakerServiceUpdateWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

- (void)testUpdateWorkteamCompletionHandler {
    NSString *key = @"testUpdateWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSSageMakerService registerSageMakerServiceWithConfiguration:configuration forKey:key];

    AWSSageMakerService *awsClient = [AWSSageMakerService SageMakerServiceForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSSageMakerService SageMakerServiceForKey:key] updateWorkteam:[AWSSageMakerServiceUpdateWorkteamRequest new] completionHandler:^(AWSSageMakerServiceUpdateWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSSageMakerService removeSageMakerServiceForKey:key];
}

@end
