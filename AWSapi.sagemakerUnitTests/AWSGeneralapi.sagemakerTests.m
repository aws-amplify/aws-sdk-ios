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
#import "AWSapi.sagemakerService.h"

static id mockNetworking = nil;

@interface AWSGeneralapi.sagemakerTests : XCTestCase

@end

@implementation AWSGeneralapi.sagemakerTests

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
    NSString *key = @"testapi.sagemakerConstructors";
    XCTAssertNotNil([AWSapi.sagemaker defaultapi.sagemaker]);
    XCTAssertEqual([[AWSapi.sagemaker defaultapi.sagemaker] class], [AWSapi.sagemaker class]);
    XCTAssertNil([AWSapi.sagemaker api.sagemakerForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSapi.sagemaker api.sagemakerForKey:key]);
    XCTAssertEqual([[AWSapi.sagemaker api.sagemakerForKey:key] class], [AWSapi.sagemaker class]);
    XCTAssertEqual([AWSapi.sagemaker api.sagemakerForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
    XCTAssertNil([AWSapi.sagemaker api.sagemakerForKey:key]);

}

- (void)testAddTags {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] addTags:[AWSapi.sagemakerAddTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testAddTagsCompletionHandler {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] addTags:[AWSapi.sagemakerAddTagsInput new] completionHandler:^(AWSapi.sagemakerAddTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testAssociateTrialComponent {
    NSString *key = @"testAssociateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] associateTrialComponent:[AWSapi.sagemakerAssociateTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testAssociateTrialComponentCompletionHandler {
    NSString *key = @"testAssociateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] associateTrialComponent:[AWSapi.sagemakerAssociateTrialComponentRequest new] completionHandler:^(AWSapi.sagemakerAssociateTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateAlgorithm {
    NSString *key = @"testCreateAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createAlgorithm:[AWSapi.sagemakerCreateAlgorithmInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateAlgorithmCompletionHandler {
    NSString *key = @"testCreateAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createAlgorithm:[AWSapi.sagemakerCreateAlgorithmInput new] completionHandler:^(AWSapi.sagemakerCreateAlgorithmOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateApp {
    NSString *key = @"testCreateApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createApp:[AWSapi.sagemakerCreateAppRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateAppCompletionHandler {
    NSString *key = @"testCreateApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createApp:[AWSapi.sagemakerCreateAppRequest new] completionHandler:^(AWSapi.sagemakerCreateAppResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateAutoMLJob {
    NSString *key = @"testCreateAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createAutoMLJob:[AWSapi.sagemakerCreateAutoMLJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateAutoMLJobCompletionHandler {
    NSString *key = @"testCreateAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createAutoMLJob:[AWSapi.sagemakerCreateAutoMLJobRequest new] completionHandler:^(AWSapi.sagemakerCreateAutoMLJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateCodeRepository {
    NSString *key = @"testCreateCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createCodeRepository:[AWSapi.sagemakerCreateCodeRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateCodeRepositoryCompletionHandler {
    NSString *key = @"testCreateCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createCodeRepository:[AWSapi.sagemakerCreateCodeRepositoryInput new] completionHandler:^(AWSapi.sagemakerCreateCodeRepositoryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateCompilationJob {
    NSString *key = @"testCreateCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createCompilationJob:[AWSapi.sagemakerCreateCompilationJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateCompilationJobCompletionHandler {
    NSString *key = @"testCreateCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createCompilationJob:[AWSapi.sagemakerCreateCompilationJobRequest new] completionHandler:^(AWSapi.sagemakerCreateCompilationJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateDomain {
    NSString *key = @"testCreateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createDomain:[AWSapi.sagemakerCreateDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateDomainCompletionHandler {
    NSString *key = @"testCreateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createDomain:[AWSapi.sagemakerCreateDomainRequest new] completionHandler:^(AWSapi.sagemakerCreateDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateEndpoint {
    NSString *key = @"testCreateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createEndpoint:[AWSapi.sagemakerCreateEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateEndpointCompletionHandler {
    NSString *key = @"testCreateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createEndpoint:[AWSapi.sagemakerCreateEndpointInput new] completionHandler:^(AWSapi.sagemakerCreateEndpointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateEndpointConfig {
    NSString *key = @"testCreateEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createEndpointConfig:[AWSapi.sagemakerCreateEndpointConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateEndpointConfigCompletionHandler {
    NSString *key = @"testCreateEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createEndpointConfig:[AWSapi.sagemakerCreateEndpointConfigInput new] completionHandler:^(AWSapi.sagemakerCreateEndpointConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateExperiment {
    NSString *key = @"testCreateExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createExperiment:[AWSapi.sagemakerCreateExperimentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateExperimentCompletionHandler {
    NSString *key = @"testCreateExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createExperiment:[AWSapi.sagemakerCreateExperimentRequest new] completionHandler:^(AWSapi.sagemakerCreateExperimentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateFlowDefinition {
    NSString *key = @"testCreateFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createFlowDefinition:[AWSapi.sagemakerCreateFlowDefinitionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateFlowDefinitionCompletionHandler {
    NSString *key = @"testCreateFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createFlowDefinition:[AWSapi.sagemakerCreateFlowDefinitionRequest new] completionHandler:^(AWSapi.sagemakerCreateFlowDefinitionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateHumanTaskUi {
    NSString *key = @"testCreateHumanTaskUi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createHumanTaskUi:[AWSapi.sagemakerCreateHumanTaskUiRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateHumanTaskUiCompletionHandler {
    NSString *key = @"testCreateHumanTaskUi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createHumanTaskUi:[AWSapi.sagemakerCreateHumanTaskUiRequest new] completionHandler:^(AWSapi.sagemakerCreateHumanTaskUiResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateHyperParameterTuningJob {
    NSString *key = @"testCreateHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createHyperParameterTuningJob:[AWSapi.sagemakerCreateHyperParameterTuningJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateHyperParameterTuningJobCompletionHandler {
    NSString *key = @"testCreateHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createHyperParameterTuningJob:[AWSapi.sagemakerCreateHyperParameterTuningJobRequest new] completionHandler:^(AWSapi.sagemakerCreateHyperParameterTuningJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateLabelingJob {
    NSString *key = @"testCreateLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createLabelingJob:[AWSapi.sagemakerCreateLabelingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateLabelingJobCompletionHandler {
    NSString *key = @"testCreateLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createLabelingJob:[AWSapi.sagemakerCreateLabelingJobRequest new] completionHandler:^(AWSapi.sagemakerCreateLabelingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateModel {
    NSString *key = @"testCreateModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createModel:[AWSapi.sagemakerCreateModelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateModelCompletionHandler {
    NSString *key = @"testCreateModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createModel:[AWSapi.sagemakerCreateModelInput new] completionHandler:^(AWSapi.sagemakerCreateModelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateModelPackage {
    NSString *key = @"testCreateModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createModelPackage:[AWSapi.sagemakerCreateModelPackageInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateModelPackageCompletionHandler {
    NSString *key = @"testCreateModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createModelPackage:[AWSapi.sagemakerCreateModelPackageInput new] completionHandler:^(AWSapi.sagemakerCreateModelPackageOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateMonitoringSchedule {
    NSString *key = @"testCreateMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createMonitoringSchedule:[AWSapi.sagemakerCreateMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateMonitoringScheduleCompletionHandler {
    NSString *key = @"testCreateMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createMonitoringSchedule:[AWSapi.sagemakerCreateMonitoringScheduleRequest new] completionHandler:^(AWSapi.sagemakerCreateMonitoringScheduleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateNotebookInstance {
    NSString *key = @"testCreateNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createNotebookInstance:[AWSapi.sagemakerCreateNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateNotebookInstanceCompletionHandler {
    NSString *key = @"testCreateNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createNotebookInstance:[AWSapi.sagemakerCreateNotebookInstanceInput new] completionHandler:^(AWSapi.sagemakerCreateNotebookInstanceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateNotebookInstanceLifecycleConfig {
    NSString *key = @"testCreateNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createNotebookInstanceLifecycleConfig:[AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateNotebookInstanceLifecycleConfigCompletionHandler {
    NSString *key = @"testCreateNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createNotebookInstanceLifecycleConfig:[AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigInput new] completionHandler:^(AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreatePresignedDomainUrl {
    NSString *key = @"testCreatePresignedDomainUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createPresignedDomainUrl:[AWSapi.sagemakerCreatePresignedDomainUrlRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreatePresignedDomainUrlCompletionHandler {
    NSString *key = @"testCreatePresignedDomainUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createPresignedDomainUrl:[AWSapi.sagemakerCreatePresignedDomainUrlRequest new] completionHandler:^(AWSapi.sagemakerCreatePresignedDomainUrlResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreatePresignedNotebookInstanceUrl {
    NSString *key = @"testCreatePresignedNotebookInstanceUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createPresignedNotebookInstanceUrl:[AWSapi.sagemakerCreatePresignedNotebookInstanceUrlInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreatePresignedNotebookInstanceUrlCompletionHandler {
    NSString *key = @"testCreatePresignedNotebookInstanceUrl";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createPresignedNotebookInstanceUrl:[AWSapi.sagemakerCreatePresignedNotebookInstanceUrlInput new] completionHandler:^(AWSapi.sagemakerCreatePresignedNotebookInstanceUrlOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateProcessingJob {
    NSString *key = @"testCreateProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createProcessingJob:[AWSapi.sagemakerCreateProcessingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateProcessingJobCompletionHandler {
    NSString *key = @"testCreateProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createProcessingJob:[AWSapi.sagemakerCreateProcessingJobRequest new] completionHandler:^(AWSapi.sagemakerCreateProcessingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateTrainingJob {
    NSString *key = @"testCreateTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createTrainingJob:[AWSapi.sagemakerCreateTrainingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateTrainingJobCompletionHandler {
    NSString *key = @"testCreateTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createTrainingJob:[AWSapi.sagemakerCreateTrainingJobRequest new] completionHandler:^(AWSapi.sagemakerCreateTrainingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateTransformJob {
    NSString *key = @"testCreateTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createTransformJob:[AWSapi.sagemakerCreateTransformJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateTransformJobCompletionHandler {
    NSString *key = @"testCreateTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createTransformJob:[AWSapi.sagemakerCreateTransformJobRequest new] completionHandler:^(AWSapi.sagemakerCreateTransformJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateTrial {
    NSString *key = @"testCreateTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createTrial:[AWSapi.sagemakerCreateTrialRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateTrialCompletionHandler {
    NSString *key = @"testCreateTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createTrial:[AWSapi.sagemakerCreateTrialRequest new] completionHandler:^(AWSapi.sagemakerCreateTrialResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateTrialComponent {
    NSString *key = @"testCreateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createTrialComponent:[AWSapi.sagemakerCreateTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateTrialComponentCompletionHandler {
    NSString *key = @"testCreateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createTrialComponent:[AWSapi.sagemakerCreateTrialComponentRequest new] completionHandler:^(AWSapi.sagemakerCreateTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateUserProfile {
    NSString *key = @"testCreateUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createUserProfile:[AWSapi.sagemakerCreateUserProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateUserProfileCompletionHandler {
    NSString *key = @"testCreateUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createUserProfile:[AWSapi.sagemakerCreateUserProfileRequest new] completionHandler:^(AWSapi.sagemakerCreateUserProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateWorkteam {
    NSString *key = @"testCreateWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] createWorkteam:[AWSapi.sagemakerCreateWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testCreateWorkteamCompletionHandler {
    NSString *key = @"testCreateWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] createWorkteam:[AWSapi.sagemakerCreateWorkteamRequest new] completionHandler:^(AWSapi.sagemakerCreateWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteAlgorithm {
    NSString *key = @"testDeleteAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteAlgorithm:[AWSapi.sagemakerDeleteAlgorithmInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteAlgorithmCompletionHandler {
    NSString *key = @"testDeleteAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteAlgorithm:[AWSapi.sagemakerDeleteAlgorithmInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteApp {
    NSString *key = @"testDeleteApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteApp:[AWSapi.sagemakerDeleteAppRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteAppCompletionHandler {
    NSString *key = @"testDeleteApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteApp:[AWSapi.sagemakerDeleteAppRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteCodeRepository {
    NSString *key = @"testDeleteCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteCodeRepository:[AWSapi.sagemakerDeleteCodeRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteCodeRepositoryCompletionHandler {
    NSString *key = @"testDeleteCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteCodeRepository:[AWSapi.sagemakerDeleteCodeRepositoryInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteDomain {
    NSString *key = @"testDeleteDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteDomain:[AWSapi.sagemakerDeleteDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteDomainCompletionHandler {
    NSString *key = @"testDeleteDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteDomain:[AWSapi.sagemakerDeleteDomainRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteEndpoint {
    NSString *key = @"testDeleteEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteEndpoint:[AWSapi.sagemakerDeleteEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteEndpointCompletionHandler {
    NSString *key = @"testDeleteEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteEndpoint:[AWSapi.sagemakerDeleteEndpointInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteEndpointConfig {
    NSString *key = @"testDeleteEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteEndpointConfig:[AWSapi.sagemakerDeleteEndpointConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteEndpointConfigCompletionHandler {
    NSString *key = @"testDeleteEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteEndpointConfig:[AWSapi.sagemakerDeleteEndpointConfigInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteExperiment {
    NSString *key = @"testDeleteExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteExperiment:[AWSapi.sagemakerDeleteExperimentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteExperimentCompletionHandler {
    NSString *key = @"testDeleteExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteExperiment:[AWSapi.sagemakerDeleteExperimentRequest new] completionHandler:^(AWSapi.sagemakerDeleteExperimentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteFlowDefinition {
    NSString *key = @"testDeleteFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteFlowDefinition:[AWSapi.sagemakerDeleteFlowDefinitionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteFlowDefinitionCompletionHandler {
    NSString *key = @"testDeleteFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteFlowDefinition:[AWSapi.sagemakerDeleteFlowDefinitionRequest new] completionHandler:^(AWSapi.sagemakerDeleteFlowDefinitionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteModel {
    NSString *key = @"testDeleteModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteModel:[AWSapi.sagemakerDeleteModelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteModelCompletionHandler {
    NSString *key = @"testDeleteModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteModel:[AWSapi.sagemakerDeleteModelInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteModelPackage {
    NSString *key = @"testDeleteModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteModelPackage:[AWSapi.sagemakerDeleteModelPackageInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteModelPackageCompletionHandler {
    NSString *key = @"testDeleteModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteModelPackage:[AWSapi.sagemakerDeleteModelPackageInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteMonitoringSchedule {
    NSString *key = @"testDeleteMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteMonitoringSchedule:[AWSapi.sagemakerDeleteMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteMonitoringScheduleCompletionHandler {
    NSString *key = @"testDeleteMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteMonitoringSchedule:[AWSapi.sagemakerDeleteMonitoringScheduleRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteNotebookInstance {
    NSString *key = @"testDeleteNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteNotebookInstance:[AWSapi.sagemakerDeleteNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteNotebookInstanceCompletionHandler {
    NSString *key = @"testDeleteNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteNotebookInstance:[AWSapi.sagemakerDeleteNotebookInstanceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteNotebookInstanceLifecycleConfig {
    NSString *key = @"testDeleteNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteNotebookInstanceLifecycleConfig:[AWSapi.sagemakerDeleteNotebookInstanceLifecycleConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteNotebookInstanceLifecycleConfigCompletionHandler {
    NSString *key = @"testDeleteNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteNotebookInstanceLifecycleConfig:[AWSapi.sagemakerDeleteNotebookInstanceLifecycleConfigInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteTags {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteTags:[AWSapi.sagemakerDeleteTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteTagsCompletionHandler {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteTags:[AWSapi.sagemakerDeleteTagsInput new] completionHandler:^(AWSapi.sagemakerDeleteTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteTrial {
    NSString *key = @"testDeleteTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteTrial:[AWSapi.sagemakerDeleteTrialRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteTrialCompletionHandler {
    NSString *key = @"testDeleteTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteTrial:[AWSapi.sagemakerDeleteTrialRequest new] completionHandler:^(AWSapi.sagemakerDeleteTrialResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteTrialComponent {
    NSString *key = @"testDeleteTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteTrialComponent:[AWSapi.sagemakerDeleteTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteTrialComponentCompletionHandler {
    NSString *key = @"testDeleteTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteTrialComponent:[AWSapi.sagemakerDeleteTrialComponentRequest new] completionHandler:^(AWSapi.sagemakerDeleteTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteUserProfile {
    NSString *key = @"testDeleteUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteUserProfile:[AWSapi.sagemakerDeleteUserProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteUserProfileCompletionHandler {
    NSString *key = @"testDeleteUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteUserProfile:[AWSapi.sagemakerDeleteUserProfileRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteWorkteam {
    NSString *key = @"testDeleteWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] deleteWorkteam:[AWSapi.sagemakerDeleteWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDeleteWorkteamCompletionHandler {
    NSString *key = @"testDeleteWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] deleteWorkteam:[AWSapi.sagemakerDeleteWorkteamRequest new] completionHandler:^(AWSapi.sagemakerDeleteWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeAlgorithm {
    NSString *key = @"testDescribeAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeAlgorithm:[AWSapi.sagemakerDescribeAlgorithmInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeAlgorithmCompletionHandler {
    NSString *key = @"testDescribeAlgorithm";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeAlgorithm:[AWSapi.sagemakerDescribeAlgorithmInput new] completionHandler:^(AWSapi.sagemakerDescribeAlgorithmOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeApp {
    NSString *key = @"testDescribeApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeApp:[AWSapi.sagemakerDescribeAppRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeAppCompletionHandler {
    NSString *key = @"testDescribeApp";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeApp:[AWSapi.sagemakerDescribeAppRequest new] completionHandler:^(AWSapi.sagemakerDescribeAppResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeAutoMLJob {
    NSString *key = @"testDescribeAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeAutoMLJob:[AWSapi.sagemakerDescribeAutoMLJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeAutoMLJobCompletionHandler {
    NSString *key = @"testDescribeAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeAutoMLJob:[AWSapi.sagemakerDescribeAutoMLJobRequest new] completionHandler:^(AWSapi.sagemakerDescribeAutoMLJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeCodeRepository {
    NSString *key = @"testDescribeCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeCodeRepository:[AWSapi.sagemakerDescribeCodeRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeCodeRepositoryCompletionHandler {
    NSString *key = @"testDescribeCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeCodeRepository:[AWSapi.sagemakerDescribeCodeRepositoryInput new] completionHandler:^(AWSapi.sagemakerDescribeCodeRepositoryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeCompilationJob {
    NSString *key = @"testDescribeCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeCompilationJob:[AWSapi.sagemakerDescribeCompilationJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeCompilationJobCompletionHandler {
    NSString *key = @"testDescribeCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeCompilationJob:[AWSapi.sagemakerDescribeCompilationJobRequest new] completionHandler:^(AWSapi.sagemakerDescribeCompilationJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeDomain {
    NSString *key = @"testDescribeDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeDomain:[AWSapi.sagemakerDescribeDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeDomainCompletionHandler {
    NSString *key = @"testDescribeDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeDomain:[AWSapi.sagemakerDescribeDomainRequest new] completionHandler:^(AWSapi.sagemakerDescribeDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeEndpoint {
    NSString *key = @"testDescribeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeEndpoint:[AWSapi.sagemakerDescribeEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeEndpointCompletionHandler {
    NSString *key = @"testDescribeEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeEndpoint:[AWSapi.sagemakerDescribeEndpointInput new] completionHandler:^(AWSapi.sagemakerDescribeEndpointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeEndpointConfig {
    NSString *key = @"testDescribeEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeEndpointConfig:[AWSapi.sagemakerDescribeEndpointConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeEndpointConfigCompletionHandler {
    NSString *key = @"testDescribeEndpointConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeEndpointConfig:[AWSapi.sagemakerDescribeEndpointConfigInput new] completionHandler:^(AWSapi.sagemakerDescribeEndpointConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeExperiment {
    NSString *key = @"testDescribeExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeExperiment:[AWSapi.sagemakerDescribeExperimentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeExperimentCompletionHandler {
    NSString *key = @"testDescribeExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeExperiment:[AWSapi.sagemakerDescribeExperimentRequest new] completionHandler:^(AWSapi.sagemakerDescribeExperimentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeFlowDefinition {
    NSString *key = @"testDescribeFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeFlowDefinition:[AWSapi.sagemakerDescribeFlowDefinitionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeFlowDefinitionCompletionHandler {
    NSString *key = @"testDescribeFlowDefinition";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeFlowDefinition:[AWSapi.sagemakerDescribeFlowDefinitionRequest new] completionHandler:^(AWSapi.sagemakerDescribeFlowDefinitionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeHumanTaskUi {
    NSString *key = @"testDescribeHumanTaskUi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeHumanTaskUi:[AWSapi.sagemakerDescribeHumanTaskUiRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeHumanTaskUiCompletionHandler {
    NSString *key = @"testDescribeHumanTaskUi";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeHumanTaskUi:[AWSapi.sagemakerDescribeHumanTaskUiRequest new] completionHandler:^(AWSapi.sagemakerDescribeHumanTaskUiResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeHyperParameterTuningJob {
    NSString *key = @"testDescribeHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeHyperParameterTuningJob:[AWSapi.sagemakerDescribeHyperParameterTuningJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeHyperParameterTuningJobCompletionHandler {
    NSString *key = @"testDescribeHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeHyperParameterTuningJob:[AWSapi.sagemakerDescribeHyperParameterTuningJobRequest new] completionHandler:^(AWSapi.sagemakerDescribeHyperParameterTuningJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeLabelingJob {
    NSString *key = @"testDescribeLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeLabelingJob:[AWSapi.sagemakerDescribeLabelingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeLabelingJobCompletionHandler {
    NSString *key = @"testDescribeLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeLabelingJob:[AWSapi.sagemakerDescribeLabelingJobRequest new] completionHandler:^(AWSapi.sagemakerDescribeLabelingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeModel {
    NSString *key = @"testDescribeModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeModel:[AWSapi.sagemakerDescribeModelInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeModelCompletionHandler {
    NSString *key = @"testDescribeModel";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeModel:[AWSapi.sagemakerDescribeModelInput new] completionHandler:^(AWSapi.sagemakerDescribeModelOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeModelPackage {
    NSString *key = @"testDescribeModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeModelPackage:[AWSapi.sagemakerDescribeModelPackageInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeModelPackageCompletionHandler {
    NSString *key = @"testDescribeModelPackage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeModelPackage:[AWSapi.sagemakerDescribeModelPackageInput new] completionHandler:^(AWSapi.sagemakerDescribeModelPackageOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeMonitoringSchedule {
    NSString *key = @"testDescribeMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeMonitoringSchedule:[AWSapi.sagemakerDescribeMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeMonitoringScheduleCompletionHandler {
    NSString *key = @"testDescribeMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeMonitoringSchedule:[AWSapi.sagemakerDescribeMonitoringScheduleRequest new] completionHandler:^(AWSapi.sagemakerDescribeMonitoringScheduleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeNotebookInstance {
    NSString *key = @"testDescribeNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeNotebookInstance:[AWSapi.sagemakerDescribeNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeNotebookInstanceCompletionHandler {
    NSString *key = @"testDescribeNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeNotebookInstance:[AWSapi.sagemakerDescribeNotebookInstanceInput new] completionHandler:^(AWSapi.sagemakerDescribeNotebookInstanceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeNotebookInstanceLifecycleConfig {
    NSString *key = @"testDescribeNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeNotebookInstanceLifecycleConfig:[AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeNotebookInstanceLifecycleConfigCompletionHandler {
    NSString *key = @"testDescribeNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeNotebookInstanceLifecycleConfig:[AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigInput new] completionHandler:^(AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeProcessingJob {
    NSString *key = @"testDescribeProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeProcessingJob:[AWSapi.sagemakerDescribeProcessingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeProcessingJobCompletionHandler {
    NSString *key = @"testDescribeProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeProcessingJob:[AWSapi.sagemakerDescribeProcessingJobRequest new] completionHandler:^(AWSapi.sagemakerDescribeProcessingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeSubscribedWorkteam {
    NSString *key = @"testDescribeSubscribedWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeSubscribedWorkteam:[AWSapi.sagemakerDescribeSubscribedWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeSubscribedWorkteamCompletionHandler {
    NSString *key = @"testDescribeSubscribedWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeSubscribedWorkteam:[AWSapi.sagemakerDescribeSubscribedWorkteamRequest new] completionHandler:^(AWSapi.sagemakerDescribeSubscribedWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeTrainingJob {
    NSString *key = @"testDescribeTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeTrainingJob:[AWSapi.sagemakerDescribeTrainingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeTrainingJobCompletionHandler {
    NSString *key = @"testDescribeTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeTrainingJob:[AWSapi.sagemakerDescribeTrainingJobRequest new] completionHandler:^(AWSapi.sagemakerDescribeTrainingJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeTransformJob {
    NSString *key = @"testDescribeTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeTransformJob:[AWSapi.sagemakerDescribeTransformJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeTransformJobCompletionHandler {
    NSString *key = @"testDescribeTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeTransformJob:[AWSapi.sagemakerDescribeTransformJobRequest new] completionHandler:^(AWSapi.sagemakerDescribeTransformJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeTrial {
    NSString *key = @"testDescribeTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeTrial:[AWSapi.sagemakerDescribeTrialRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeTrialCompletionHandler {
    NSString *key = @"testDescribeTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeTrial:[AWSapi.sagemakerDescribeTrialRequest new] completionHandler:^(AWSapi.sagemakerDescribeTrialResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeTrialComponent {
    NSString *key = @"testDescribeTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeTrialComponent:[AWSapi.sagemakerDescribeTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeTrialComponentCompletionHandler {
    NSString *key = @"testDescribeTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeTrialComponent:[AWSapi.sagemakerDescribeTrialComponentRequest new] completionHandler:^(AWSapi.sagemakerDescribeTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeUserProfile {
    NSString *key = @"testDescribeUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeUserProfile:[AWSapi.sagemakerDescribeUserProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeUserProfileCompletionHandler {
    NSString *key = @"testDescribeUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeUserProfile:[AWSapi.sagemakerDescribeUserProfileRequest new] completionHandler:^(AWSapi.sagemakerDescribeUserProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeWorkforce {
    NSString *key = @"testDescribeWorkforce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeWorkforce:[AWSapi.sagemakerDescribeWorkforceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeWorkforceCompletionHandler {
    NSString *key = @"testDescribeWorkforce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeWorkforce:[AWSapi.sagemakerDescribeWorkforceRequest new] completionHandler:^(AWSapi.sagemakerDescribeWorkforceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeWorkteam {
    NSString *key = @"testDescribeWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] describeWorkteam:[AWSapi.sagemakerDescribeWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDescribeWorkteamCompletionHandler {
    NSString *key = @"testDescribeWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] describeWorkteam:[AWSapi.sagemakerDescribeWorkteamRequest new] completionHandler:^(AWSapi.sagemakerDescribeWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDisassociateTrialComponent {
    NSString *key = @"testDisassociateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] disassociateTrialComponent:[AWSapi.sagemakerDisassociateTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testDisassociateTrialComponentCompletionHandler {
    NSString *key = @"testDisassociateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] disassociateTrialComponent:[AWSapi.sagemakerDisassociateTrialComponentRequest new] completionHandler:^(AWSapi.sagemakerDisassociateTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testGetSearchSuggestions {
    NSString *key = @"testGetSearchSuggestions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] getSearchSuggestions:[AWSapi.sagemakerGetSearchSuggestionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testGetSearchSuggestionsCompletionHandler {
    NSString *key = @"testGetSearchSuggestions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] getSearchSuggestions:[AWSapi.sagemakerGetSearchSuggestionsRequest new] completionHandler:^(AWSapi.sagemakerGetSearchSuggestionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListAlgorithms {
    NSString *key = @"testListAlgorithms";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listAlgorithms:[AWSapi.sagemakerListAlgorithmsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListAlgorithmsCompletionHandler {
    NSString *key = @"testListAlgorithms";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listAlgorithms:[AWSapi.sagemakerListAlgorithmsInput new] completionHandler:^(AWSapi.sagemakerListAlgorithmsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListApps {
    NSString *key = @"testListApps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listApps:[AWSapi.sagemakerListAppsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListAppsCompletionHandler {
    NSString *key = @"testListApps";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listApps:[AWSapi.sagemakerListAppsRequest new] completionHandler:^(AWSapi.sagemakerListAppsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListAutoMLJobs {
    NSString *key = @"testListAutoMLJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listAutoMLJobs:[AWSapi.sagemakerListAutoMLJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListAutoMLJobsCompletionHandler {
    NSString *key = @"testListAutoMLJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listAutoMLJobs:[AWSapi.sagemakerListAutoMLJobsRequest new] completionHandler:^(AWSapi.sagemakerListAutoMLJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListCandidatesForAutoMLJob {
    NSString *key = @"testListCandidatesForAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listCandidatesForAutoMLJob:[AWSapi.sagemakerListCandidatesForAutoMLJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListCandidatesForAutoMLJobCompletionHandler {
    NSString *key = @"testListCandidatesForAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listCandidatesForAutoMLJob:[AWSapi.sagemakerListCandidatesForAutoMLJobRequest new] completionHandler:^(AWSapi.sagemakerListCandidatesForAutoMLJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListCodeRepositories {
    NSString *key = @"testListCodeRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listCodeRepositories:[AWSapi.sagemakerListCodeRepositoriesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListCodeRepositoriesCompletionHandler {
    NSString *key = @"testListCodeRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listCodeRepositories:[AWSapi.sagemakerListCodeRepositoriesInput new] completionHandler:^(AWSapi.sagemakerListCodeRepositoriesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListCompilationJobs {
    NSString *key = @"testListCompilationJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listCompilationJobs:[AWSapi.sagemakerListCompilationJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListCompilationJobsCompletionHandler {
    NSString *key = @"testListCompilationJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listCompilationJobs:[AWSapi.sagemakerListCompilationJobsRequest new] completionHandler:^(AWSapi.sagemakerListCompilationJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListDomains {
    NSString *key = @"testListDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listDomains:[AWSapi.sagemakerListDomainsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListDomainsCompletionHandler {
    NSString *key = @"testListDomains";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listDomains:[AWSapi.sagemakerListDomainsRequest new] completionHandler:^(AWSapi.sagemakerListDomainsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListEndpointConfigs {
    NSString *key = @"testListEndpointConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listEndpointConfigs:[AWSapi.sagemakerListEndpointConfigsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListEndpointConfigsCompletionHandler {
    NSString *key = @"testListEndpointConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listEndpointConfigs:[AWSapi.sagemakerListEndpointConfigsInput new] completionHandler:^(AWSapi.sagemakerListEndpointConfigsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListEndpoints {
    NSString *key = @"testListEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listEndpoints:[AWSapi.sagemakerListEndpointsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListEndpointsCompletionHandler {
    NSString *key = @"testListEndpoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listEndpoints:[AWSapi.sagemakerListEndpointsInput new] completionHandler:^(AWSapi.sagemakerListEndpointsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListExperiments {
    NSString *key = @"testListExperiments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listExperiments:[AWSapi.sagemakerListExperimentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListExperimentsCompletionHandler {
    NSString *key = @"testListExperiments";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listExperiments:[AWSapi.sagemakerListExperimentsRequest new] completionHandler:^(AWSapi.sagemakerListExperimentsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListFlowDefinitions {
    NSString *key = @"testListFlowDefinitions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listFlowDefinitions:[AWSapi.sagemakerListFlowDefinitionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListFlowDefinitionsCompletionHandler {
    NSString *key = @"testListFlowDefinitions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listFlowDefinitions:[AWSapi.sagemakerListFlowDefinitionsRequest new] completionHandler:^(AWSapi.sagemakerListFlowDefinitionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListHumanTaskUis {
    NSString *key = @"testListHumanTaskUis";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listHumanTaskUis:[AWSapi.sagemakerListHumanTaskUisRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListHumanTaskUisCompletionHandler {
    NSString *key = @"testListHumanTaskUis";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listHumanTaskUis:[AWSapi.sagemakerListHumanTaskUisRequest new] completionHandler:^(AWSapi.sagemakerListHumanTaskUisResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListHyperParameterTuningJobs {
    NSString *key = @"testListHyperParameterTuningJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listHyperParameterTuningJobs:[AWSapi.sagemakerListHyperParameterTuningJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListHyperParameterTuningJobsCompletionHandler {
    NSString *key = @"testListHyperParameterTuningJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listHyperParameterTuningJobs:[AWSapi.sagemakerListHyperParameterTuningJobsRequest new] completionHandler:^(AWSapi.sagemakerListHyperParameterTuningJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListLabelingJobs {
    NSString *key = @"testListLabelingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listLabelingJobs:[AWSapi.sagemakerListLabelingJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListLabelingJobsCompletionHandler {
    NSString *key = @"testListLabelingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listLabelingJobs:[AWSapi.sagemakerListLabelingJobsRequest new] completionHandler:^(AWSapi.sagemakerListLabelingJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListLabelingJobsForWorkteam {
    NSString *key = @"testListLabelingJobsForWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listLabelingJobsForWorkteam:[AWSapi.sagemakerListLabelingJobsForWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListLabelingJobsForWorkteamCompletionHandler {
    NSString *key = @"testListLabelingJobsForWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listLabelingJobsForWorkteam:[AWSapi.sagemakerListLabelingJobsForWorkteamRequest new] completionHandler:^(AWSapi.sagemakerListLabelingJobsForWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListModelPackages {
    NSString *key = @"testListModelPackages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listModelPackages:[AWSapi.sagemakerListModelPackagesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListModelPackagesCompletionHandler {
    NSString *key = @"testListModelPackages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listModelPackages:[AWSapi.sagemakerListModelPackagesInput new] completionHandler:^(AWSapi.sagemakerListModelPackagesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListModels {
    NSString *key = @"testListModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listModels:[AWSapi.sagemakerListModelsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListModelsCompletionHandler {
    NSString *key = @"testListModels";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listModels:[AWSapi.sagemakerListModelsInput new] completionHandler:^(AWSapi.sagemakerListModelsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListMonitoringExecutions {
    NSString *key = @"testListMonitoringExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listMonitoringExecutions:[AWSapi.sagemakerListMonitoringExecutionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListMonitoringExecutionsCompletionHandler {
    NSString *key = @"testListMonitoringExecutions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listMonitoringExecutions:[AWSapi.sagemakerListMonitoringExecutionsRequest new] completionHandler:^(AWSapi.sagemakerListMonitoringExecutionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListMonitoringSchedules {
    NSString *key = @"testListMonitoringSchedules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listMonitoringSchedules:[AWSapi.sagemakerListMonitoringSchedulesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListMonitoringSchedulesCompletionHandler {
    NSString *key = @"testListMonitoringSchedules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listMonitoringSchedules:[AWSapi.sagemakerListMonitoringSchedulesRequest new] completionHandler:^(AWSapi.sagemakerListMonitoringSchedulesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListNotebookInstanceLifecycleConfigs {
    NSString *key = @"testListNotebookInstanceLifecycleConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listNotebookInstanceLifecycleConfigs:[AWSapi.sagemakerListNotebookInstanceLifecycleConfigsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListNotebookInstanceLifecycleConfigsCompletionHandler {
    NSString *key = @"testListNotebookInstanceLifecycleConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listNotebookInstanceLifecycleConfigs:[AWSapi.sagemakerListNotebookInstanceLifecycleConfigsInput new] completionHandler:^(AWSapi.sagemakerListNotebookInstanceLifecycleConfigsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListNotebookInstances {
    NSString *key = @"testListNotebookInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listNotebookInstances:[AWSapi.sagemakerListNotebookInstancesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListNotebookInstancesCompletionHandler {
    NSString *key = @"testListNotebookInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listNotebookInstances:[AWSapi.sagemakerListNotebookInstancesInput new] completionHandler:^(AWSapi.sagemakerListNotebookInstancesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListProcessingJobs {
    NSString *key = @"testListProcessingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listProcessingJobs:[AWSapi.sagemakerListProcessingJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListProcessingJobsCompletionHandler {
    NSString *key = @"testListProcessingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listProcessingJobs:[AWSapi.sagemakerListProcessingJobsRequest new] completionHandler:^(AWSapi.sagemakerListProcessingJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListSubscribedWorkteams {
    NSString *key = @"testListSubscribedWorkteams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listSubscribedWorkteams:[AWSapi.sagemakerListSubscribedWorkteamsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListSubscribedWorkteamsCompletionHandler {
    NSString *key = @"testListSubscribedWorkteams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listSubscribedWorkteams:[AWSapi.sagemakerListSubscribedWorkteamsRequest new] completionHandler:^(AWSapi.sagemakerListSubscribedWorkteamsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListTags {
    NSString *key = @"testListTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listTags:[AWSapi.sagemakerListTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListTagsCompletionHandler {
    NSString *key = @"testListTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listTags:[AWSapi.sagemakerListTagsInput new] completionHandler:^(AWSapi.sagemakerListTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListTrainingJobs {
    NSString *key = @"testListTrainingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listTrainingJobs:[AWSapi.sagemakerListTrainingJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListTrainingJobsCompletionHandler {
    NSString *key = @"testListTrainingJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listTrainingJobs:[AWSapi.sagemakerListTrainingJobsRequest new] completionHandler:^(AWSapi.sagemakerListTrainingJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListTrainingJobsForHyperParameterTuningJob {
    NSString *key = @"testListTrainingJobsForHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listTrainingJobsForHyperParameterTuningJob:[AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListTrainingJobsForHyperParameterTuningJobCompletionHandler {
    NSString *key = @"testListTrainingJobsForHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listTrainingJobsForHyperParameterTuningJob:[AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobRequest new] completionHandler:^(AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListTransformJobs {
    NSString *key = @"testListTransformJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listTransformJobs:[AWSapi.sagemakerListTransformJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListTransformJobsCompletionHandler {
    NSString *key = @"testListTransformJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listTransformJobs:[AWSapi.sagemakerListTransformJobsRequest new] completionHandler:^(AWSapi.sagemakerListTransformJobsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListTrialComponents {
    NSString *key = @"testListTrialComponents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listTrialComponents:[AWSapi.sagemakerListTrialComponentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListTrialComponentsCompletionHandler {
    NSString *key = @"testListTrialComponents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listTrialComponents:[AWSapi.sagemakerListTrialComponentsRequest new] completionHandler:^(AWSapi.sagemakerListTrialComponentsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListTrials {
    NSString *key = @"testListTrials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listTrials:[AWSapi.sagemakerListTrialsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListTrialsCompletionHandler {
    NSString *key = @"testListTrials";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listTrials:[AWSapi.sagemakerListTrialsRequest new] completionHandler:^(AWSapi.sagemakerListTrialsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListUserProfiles {
    NSString *key = @"testListUserProfiles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listUserProfiles:[AWSapi.sagemakerListUserProfilesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListUserProfilesCompletionHandler {
    NSString *key = @"testListUserProfiles";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listUserProfiles:[AWSapi.sagemakerListUserProfilesRequest new] completionHandler:^(AWSapi.sagemakerListUserProfilesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListWorkteams {
    NSString *key = @"testListWorkteams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] listWorkteams:[AWSapi.sagemakerListWorkteamsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testListWorkteamsCompletionHandler {
    NSString *key = @"testListWorkteams";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] listWorkteams:[AWSapi.sagemakerListWorkteamsRequest new] completionHandler:^(AWSapi.sagemakerListWorkteamsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testRenderUiTemplate {
    NSString *key = @"testRenderUiTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] renderUiTemplate:[AWSapi.sagemakerRenderUiTemplateRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testRenderUiTemplateCompletionHandler {
    NSString *key = @"testRenderUiTemplate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] renderUiTemplate:[AWSapi.sagemakerRenderUiTemplateRequest new] completionHandler:^(AWSapi.sagemakerRenderUiTemplateResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testSearch {
    NSString *key = @"testSearch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] search:[AWSapi.sagemakerSearchRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testSearchCompletionHandler {
    NSString *key = @"testSearch";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] search:[AWSapi.sagemakerSearchRequest new] completionHandler:^(AWSapi.sagemakerSearchResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStartMonitoringSchedule {
    NSString *key = @"testStartMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] startMonitoringSchedule:[AWSapi.sagemakerStartMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStartMonitoringScheduleCompletionHandler {
    NSString *key = @"testStartMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] startMonitoringSchedule:[AWSapi.sagemakerStartMonitoringScheduleRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStartNotebookInstance {
    NSString *key = @"testStartNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] startNotebookInstance:[AWSapi.sagemakerStartNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStartNotebookInstanceCompletionHandler {
    NSString *key = @"testStartNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] startNotebookInstance:[AWSapi.sagemakerStartNotebookInstanceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopAutoMLJob {
    NSString *key = @"testStopAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] stopAutoMLJob:[AWSapi.sagemakerStopAutoMLJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopAutoMLJobCompletionHandler {
    NSString *key = @"testStopAutoMLJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] stopAutoMLJob:[AWSapi.sagemakerStopAutoMLJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopCompilationJob {
    NSString *key = @"testStopCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] stopCompilationJob:[AWSapi.sagemakerStopCompilationJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopCompilationJobCompletionHandler {
    NSString *key = @"testStopCompilationJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] stopCompilationJob:[AWSapi.sagemakerStopCompilationJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopHyperParameterTuningJob {
    NSString *key = @"testStopHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] stopHyperParameterTuningJob:[AWSapi.sagemakerStopHyperParameterTuningJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopHyperParameterTuningJobCompletionHandler {
    NSString *key = @"testStopHyperParameterTuningJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] stopHyperParameterTuningJob:[AWSapi.sagemakerStopHyperParameterTuningJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopLabelingJob {
    NSString *key = @"testStopLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] stopLabelingJob:[AWSapi.sagemakerStopLabelingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopLabelingJobCompletionHandler {
    NSString *key = @"testStopLabelingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] stopLabelingJob:[AWSapi.sagemakerStopLabelingJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopMonitoringSchedule {
    NSString *key = @"testStopMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] stopMonitoringSchedule:[AWSapi.sagemakerStopMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopMonitoringScheduleCompletionHandler {
    NSString *key = @"testStopMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] stopMonitoringSchedule:[AWSapi.sagemakerStopMonitoringScheduleRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopNotebookInstance {
    NSString *key = @"testStopNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] stopNotebookInstance:[AWSapi.sagemakerStopNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopNotebookInstanceCompletionHandler {
    NSString *key = @"testStopNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] stopNotebookInstance:[AWSapi.sagemakerStopNotebookInstanceInput new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopProcessingJob {
    NSString *key = @"testStopProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] stopProcessingJob:[AWSapi.sagemakerStopProcessingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopProcessingJobCompletionHandler {
    NSString *key = @"testStopProcessingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] stopProcessingJob:[AWSapi.sagemakerStopProcessingJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopTrainingJob {
    NSString *key = @"testStopTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] stopTrainingJob:[AWSapi.sagemakerStopTrainingJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopTrainingJobCompletionHandler {
    NSString *key = @"testStopTrainingJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] stopTrainingJob:[AWSapi.sagemakerStopTrainingJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopTransformJob {
    NSString *key = @"testStopTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] stopTransformJob:[AWSapi.sagemakerStopTransformJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testStopTransformJobCompletionHandler {
    NSString *key = @"testStopTransformJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] stopTransformJob:[AWSapi.sagemakerStopTransformJobRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateCodeRepository {
    NSString *key = @"testUpdateCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] updateCodeRepository:[AWSapi.sagemakerUpdateCodeRepositoryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateCodeRepositoryCompletionHandler {
    NSString *key = @"testUpdateCodeRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] updateCodeRepository:[AWSapi.sagemakerUpdateCodeRepositoryInput new] completionHandler:^(AWSapi.sagemakerUpdateCodeRepositoryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateDomain {
    NSString *key = @"testUpdateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] updateDomain:[AWSapi.sagemakerUpdateDomainRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateDomainCompletionHandler {
    NSString *key = @"testUpdateDomain";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] updateDomain:[AWSapi.sagemakerUpdateDomainRequest new] completionHandler:^(AWSapi.sagemakerUpdateDomainResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateEndpoint {
    NSString *key = @"testUpdateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] updateEndpoint:[AWSapi.sagemakerUpdateEndpointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateEndpointCompletionHandler {
    NSString *key = @"testUpdateEndpoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] updateEndpoint:[AWSapi.sagemakerUpdateEndpointInput new] completionHandler:^(AWSapi.sagemakerUpdateEndpointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateEndpointWeightsAndCapacities {
    NSString *key = @"testUpdateEndpointWeightsAndCapacities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] updateEndpointWeightsAndCapacities:[AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateEndpointWeightsAndCapacitiesCompletionHandler {
    NSString *key = @"testUpdateEndpointWeightsAndCapacities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] updateEndpointWeightsAndCapacities:[AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesInput new] completionHandler:^(AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateExperiment {
    NSString *key = @"testUpdateExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] updateExperiment:[AWSapi.sagemakerUpdateExperimentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateExperimentCompletionHandler {
    NSString *key = @"testUpdateExperiment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] updateExperiment:[AWSapi.sagemakerUpdateExperimentRequest new] completionHandler:^(AWSapi.sagemakerUpdateExperimentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateMonitoringSchedule {
    NSString *key = @"testUpdateMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] updateMonitoringSchedule:[AWSapi.sagemakerUpdateMonitoringScheduleRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateMonitoringScheduleCompletionHandler {
    NSString *key = @"testUpdateMonitoringSchedule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] updateMonitoringSchedule:[AWSapi.sagemakerUpdateMonitoringScheduleRequest new] completionHandler:^(AWSapi.sagemakerUpdateMonitoringScheduleResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateNotebookInstance {
    NSString *key = @"testUpdateNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] updateNotebookInstance:[AWSapi.sagemakerUpdateNotebookInstanceInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateNotebookInstanceCompletionHandler {
    NSString *key = @"testUpdateNotebookInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] updateNotebookInstance:[AWSapi.sagemakerUpdateNotebookInstanceInput new] completionHandler:^(AWSapi.sagemakerUpdateNotebookInstanceOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateNotebookInstanceLifecycleConfig {
    NSString *key = @"testUpdateNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] updateNotebookInstanceLifecycleConfig:[AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateNotebookInstanceLifecycleConfigCompletionHandler {
    NSString *key = @"testUpdateNotebookInstanceLifecycleConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] updateNotebookInstanceLifecycleConfig:[AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigInput new] completionHandler:^(AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateTrial {
    NSString *key = @"testUpdateTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] updateTrial:[AWSapi.sagemakerUpdateTrialRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateTrialCompletionHandler {
    NSString *key = @"testUpdateTrial";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] updateTrial:[AWSapi.sagemakerUpdateTrialRequest new] completionHandler:^(AWSapi.sagemakerUpdateTrialResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateTrialComponent {
    NSString *key = @"testUpdateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] updateTrialComponent:[AWSapi.sagemakerUpdateTrialComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateTrialComponentCompletionHandler {
    NSString *key = @"testUpdateTrialComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] updateTrialComponent:[AWSapi.sagemakerUpdateTrialComponentRequest new] completionHandler:^(AWSapi.sagemakerUpdateTrialComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateUserProfile {
    NSString *key = @"testUpdateUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] updateUserProfile:[AWSapi.sagemakerUpdateUserProfileRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateUserProfileCompletionHandler {
    NSString *key = @"testUpdateUserProfile";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] updateUserProfile:[AWSapi.sagemakerUpdateUserProfileRequest new] completionHandler:^(AWSapi.sagemakerUpdateUserProfileResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateWorkforce {
    NSString *key = @"testUpdateWorkforce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] updateWorkforce:[AWSapi.sagemakerUpdateWorkforceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateWorkforceCompletionHandler {
    NSString *key = @"testUpdateWorkforce";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] updateWorkforce:[AWSapi.sagemakerUpdateWorkforceRequest new] completionHandler:^(AWSapi.sagemakerUpdateWorkforceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateWorkteam {
    NSString *key = @"testUpdateWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.sagemaker api.sagemakerForKey:key] updateWorkteam:[AWSapi.sagemakerUpdateWorkteamRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

- (void)testUpdateWorkteamCompletionHandler {
    NSString *key = @"testUpdateWorkteam";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:configuration forKey:key];

    AWSapi.sagemaker *awsClient = [AWSapi.sagemaker api.sagemakerForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.sagemaker api.sagemakerForKey:key] updateWorkteam:[AWSapi.sagemakerUpdateWorkteamRequest new] completionHandler:^(AWSapi.sagemakerUpdateWorkteamResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.sagemaker removeapi.sagemakerForKey:key];
}

@end
