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
#import "AWSImagebuilderService.h"

static id mockNetworking = nil;

@interface AWSGeneralImagebuilderTests : XCTestCase

@end

@implementation AWSGeneralImagebuilderTests

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
    NSString *key = @"testImagebuilderConstructors";
    XCTAssertNotNil([AWSImagebuilder defaultImagebuilder]);
    XCTAssertEqual([[AWSImagebuilder defaultImagebuilder] class], [AWSImagebuilder class]);
    XCTAssertNil([AWSImagebuilder ImagebuilderForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSImagebuilder ImagebuilderForKey:key]);
    XCTAssertEqual([[AWSImagebuilder ImagebuilderForKey:key] class], [AWSImagebuilder class]);
    XCTAssertEqual([AWSImagebuilder ImagebuilderForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSImagebuilder removeImagebuilderForKey:key];
    XCTAssertNil([AWSImagebuilder ImagebuilderForKey:key]);

}

- (void)testCancelImageCreation {
    NSString *key = @"testCancelImageCreation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] cancelImageCreation:[AWSImagebuilderCancelImageCreationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testCancelImageCreationCompletionHandler {
    NSString *key = @"testCancelImageCreation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] cancelImageCreation:[AWSImagebuilderCancelImageCreationRequest new] completionHandler:^(AWSImagebuilderCancelImageCreationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testCreateComponent {
    NSString *key = @"testCreateComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] createComponent:[AWSImagebuilderCreateComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testCreateComponentCompletionHandler {
    NSString *key = @"testCreateComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] createComponent:[AWSImagebuilderCreateComponentRequest new] completionHandler:^(AWSImagebuilderCreateComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testCreateDistributionConfiguration {
    NSString *key = @"testCreateDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] createDistributionConfiguration:[AWSImagebuilderCreateDistributionConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testCreateDistributionConfigurationCompletionHandler {
    NSString *key = @"testCreateDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] createDistributionConfiguration:[AWSImagebuilderCreateDistributionConfigurationRequest new] completionHandler:^(AWSImagebuilderCreateDistributionConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testCreateImage {
    NSString *key = @"testCreateImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] createImage:[AWSImagebuilderCreateImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testCreateImageCompletionHandler {
    NSString *key = @"testCreateImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] createImage:[AWSImagebuilderCreateImageRequest new] completionHandler:^(AWSImagebuilderCreateImageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testCreateImagePipeline {
    NSString *key = @"testCreateImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] createImagePipeline:[AWSImagebuilderCreateImagePipelineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testCreateImagePipelineCompletionHandler {
    NSString *key = @"testCreateImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] createImagePipeline:[AWSImagebuilderCreateImagePipelineRequest new] completionHandler:^(AWSImagebuilderCreateImagePipelineResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testCreateImageRecipe {
    NSString *key = @"testCreateImageRecipe";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] createImageRecipe:[AWSImagebuilderCreateImageRecipeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testCreateImageRecipeCompletionHandler {
    NSString *key = @"testCreateImageRecipe";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] createImageRecipe:[AWSImagebuilderCreateImageRecipeRequest new] completionHandler:^(AWSImagebuilderCreateImageRecipeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testCreateInfrastructureConfiguration {
    NSString *key = @"testCreateInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] createInfrastructureConfiguration:[AWSImagebuilderCreateInfrastructureConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testCreateInfrastructureConfigurationCompletionHandler {
    NSString *key = @"testCreateInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] createInfrastructureConfiguration:[AWSImagebuilderCreateInfrastructureConfigurationRequest new] completionHandler:^(AWSImagebuilderCreateInfrastructureConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testDeleteComponent {
    NSString *key = @"testDeleteComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] deleteComponent:[AWSImagebuilderDeleteComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testDeleteComponentCompletionHandler {
    NSString *key = @"testDeleteComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] deleteComponent:[AWSImagebuilderDeleteComponentRequest new] completionHandler:^(AWSImagebuilderDeleteComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testDeleteDistributionConfiguration {
    NSString *key = @"testDeleteDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] deleteDistributionConfiguration:[AWSImagebuilderDeleteDistributionConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testDeleteDistributionConfigurationCompletionHandler {
    NSString *key = @"testDeleteDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] deleteDistributionConfiguration:[AWSImagebuilderDeleteDistributionConfigurationRequest new] completionHandler:^(AWSImagebuilderDeleteDistributionConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testDeleteImage {
    NSString *key = @"testDeleteImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] deleteImage:[AWSImagebuilderDeleteImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testDeleteImageCompletionHandler {
    NSString *key = @"testDeleteImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] deleteImage:[AWSImagebuilderDeleteImageRequest new] completionHandler:^(AWSImagebuilderDeleteImageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testDeleteImagePipeline {
    NSString *key = @"testDeleteImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] deleteImagePipeline:[AWSImagebuilderDeleteImagePipelineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testDeleteImagePipelineCompletionHandler {
    NSString *key = @"testDeleteImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] deleteImagePipeline:[AWSImagebuilderDeleteImagePipelineRequest new] completionHandler:^(AWSImagebuilderDeleteImagePipelineResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testDeleteImageRecipe {
    NSString *key = @"testDeleteImageRecipe";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] deleteImageRecipe:[AWSImagebuilderDeleteImageRecipeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testDeleteImageRecipeCompletionHandler {
    NSString *key = @"testDeleteImageRecipe";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] deleteImageRecipe:[AWSImagebuilderDeleteImageRecipeRequest new] completionHandler:^(AWSImagebuilderDeleteImageRecipeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testDeleteInfrastructureConfiguration {
    NSString *key = @"testDeleteInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] deleteInfrastructureConfiguration:[AWSImagebuilderDeleteInfrastructureConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testDeleteInfrastructureConfigurationCompletionHandler {
    NSString *key = @"testDeleteInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] deleteInfrastructureConfiguration:[AWSImagebuilderDeleteInfrastructureConfigurationRequest new] completionHandler:^(AWSImagebuilderDeleteInfrastructureConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetComponent {
    NSString *key = @"testGetComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] getComponent:[AWSImagebuilderGetComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetComponentCompletionHandler {
    NSString *key = @"testGetComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] getComponent:[AWSImagebuilderGetComponentRequest new] completionHandler:^(AWSImagebuilderGetComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetComponentPolicy {
    NSString *key = @"testGetComponentPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] getComponentPolicy:[AWSImagebuilderGetComponentPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetComponentPolicyCompletionHandler {
    NSString *key = @"testGetComponentPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] getComponentPolicy:[AWSImagebuilderGetComponentPolicyRequest new] completionHandler:^(AWSImagebuilderGetComponentPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetDistributionConfiguration {
    NSString *key = @"testGetDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] getDistributionConfiguration:[AWSImagebuilderGetDistributionConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetDistributionConfigurationCompletionHandler {
    NSString *key = @"testGetDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] getDistributionConfiguration:[AWSImagebuilderGetDistributionConfigurationRequest new] completionHandler:^(AWSImagebuilderGetDistributionConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetImage {
    NSString *key = @"testGetImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] getImage:[AWSImagebuilderGetImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetImageCompletionHandler {
    NSString *key = @"testGetImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] getImage:[AWSImagebuilderGetImageRequest new] completionHandler:^(AWSImagebuilderGetImageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetImagePipeline {
    NSString *key = @"testGetImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] getImagePipeline:[AWSImagebuilderGetImagePipelineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetImagePipelineCompletionHandler {
    NSString *key = @"testGetImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] getImagePipeline:[AWSImagebuilderGetImagePipelineRequest new] completionHandler:^(AWSImagebuilderGetImagePipelineResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetImagePolicy {
    NSString *key = @"testGetImagePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] getImagePolicy:[AWSImagebuilderGetImagePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetImagePolicyCompletionHandler {
    NSString *key = @"testGetImagePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] getImagePolicy:[AWSImagebuilderGetImagePolicyRequest new] completionHandler:^(AWSImagebuilderGetImagePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetImageRecipe {
    NSString *key = @"testGetImageRecipe";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] getImageRecipe:[AWSImagebuilderGetImageRecipeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetImageRecipeCompletionHandler {
    NSString *key = @"testGetImageRecipe";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] getImageRecipe:[AWSImagebuilderGetImageRecipeRequest new] completionHandler:^(AWSImagebuilderGetImageRecipeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetImageRecipePolicy {
    NSString *key = @"testGetImageRecipePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] getImageRecipePolicy:[AWSImagebuilderGetImageRecipePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetImageRecipePolicyCompletionHandler {
    NSString *key = @"testGetImageRecipePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] getImageRecipePolicy:[AWSImagebuilderGetImageRecipePolicyRequest new] completionHandler:^(AWSImagebuilderGetImageRecipePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetInfrastructureConfiguration {
    NSString *key = @"testGetInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] getInfrastructureConfiguration:[AWSImagebuilderGetInfrastructureConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testGetInfrastructureConfigurationCompletionHandler {
    NSString *key = @"testGetInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] getInfrastructureConfiguration:[AWSImagebuilderGetInfrastructureConfigurationRequest new] completionHandler:^(AWSImagebuilderGetInfrastructureConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testImportComponent {
    NSString *key = @"testImportComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] importComponent:[AWSImagebuilderImportComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testImportComponentCompletionHandler {
    NSString *key = @"testImportComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] importComponent:[AWSImagebuilderImportComponentRequest new] completionHandler:^(AWSImagebuilderImportComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListComponentBuildVersions {
    NSString *key = @"testListComponentBuildVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] listComponentBuildVersions:[AWSImagebuilderListComponentBuildVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListComponentBuildVersionsCompletionHandler {
    NSString *key = @"testListComponentBuildVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] listComponentBuildVersions:[AWSImagebuilderListComponentBuildVersionsRequest new] completionHandler:^(AWSImagebuilderListComponentBuildVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListComponents {
    NSString *key = @"testListComponents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] listComponents:[AWSImagebuilderListComponentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListComponentsCompletionHandler {
    NSString *key = @"testListComponents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] listComponents:[AWSImagebuilderListComponentsRequest new] completionHandler:^(AWSImagebuilderListComponentsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListDistributionConfigurations {
    NSString *key = @"testListDistributionConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] listDistributionConfigurations:[AWSImagebuilderListDistributionConfigurationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListDistributionConfigurationsCompletionHandler {
    NSString *key = @"testListDistributionConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] listDistributionConfigurations:[AWSImagebuilderListDistributionConfigurationsRequest new] completionHandler:^(AWSImagebuilderListDistributionConfigurationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListImageBuildVersions {
    NSString *key = @"testListImageBuildVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] listImageBuildVersions:[AWSImagebuilderListImageBuildVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListImageBuildVersionsCompletionHandler {
    NSString *key = @"testListImageBuildVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] listImageBuildVersions:[AWSImagebuilderListImageBuildVersionsRequest new] completionHandler:^(AWSImagebuilderListImageBuildVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListImagePipelineImages {
    NSString *key = @"testListImagePipelineImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] listImagePipelineImages:[AWSImagebuilderListImagePipelineImagesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListImagePipelineImagesCompletionHandler {
    NSString *key = @"testListImagePipelineImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] listImagePipelineImages:[AWSImagebuilderListImagePipelineImagesRequest new] completionHandler:^(AWSImagebuilderListImagePipelineImagesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListImagePipelines {
    NSString *key = @"testListImagePipelines";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] listImagePipelines:[AWSImagebuilderListImagePipelinesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListImagePipelinesCompletionHandler {
    NSString *key = @"testListImagePipelines";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] listImagePipelines:[AWSImagebuilderListImagePipelinesRequest new] completionHandler:^(AWSImagebuilderListImagePipelinesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListImageRecipes {
    NSString *key = @"testListImageRecipes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] listImageRecipes:[AWSImagebuilderListImageRecipesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListImageRecipesCompletionHandler {
    NSString *key = @"testListImageRecipes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] listImageRecipes:[AWSImagebuilderListImageRecipesRequest new] completionHandler:^(AWSImagebuilderListImageRecipesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListImages {
    NSString *key = @"testListImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] listImages:[AWSImagebuilderListImagesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListImagesCompletionHandler {
    NSString *key = @"testListImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] listImages:[AWSImagebuilderListImagesRequest new] completionHandler:^(AWSImagebuilderListImagesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListInfrastructureConfigurations {
    NSString *key = @"testListInfrastructureConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] listInfrastructureConfigurations:[AWSImagebuilderListInfrastructureConfigurationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListInfrastructureConfigurationsCompletionHandler {
    NSString *key = @"testListInfrastructureConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] listInfrastructureConfigurations:[AWSImagebuilderListInfrastructureConfigurationsRequest new] completionHandler:^(AWSImagebuilderListInfrastructureConfigurationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] listTagsForResource:[AWSImagebuilderListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] listTagsForResource:[AWSImagebuilderListTagsForResourceRequest new] completionHandler:^(AWSImagebuilderListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testPutComponentPolicy {
    NSString *key = @"testPutComponentPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] putComponentPolicy:[AWSImagebuilderPutComponentPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testPutComponentPolicyCompletionHandler {
    NSString *key = @"testPutComponentPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] putComponentPolicy:[AWSImagebuilderPutComponentPolicyRequest new] completionHandler:^(AWSImagebuilderPutComponentPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testPutImagePolicy {
    NSString *key = @"testPutImagePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] putImagePolicy:[AWSImagebuilderPutImagePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testPutImagePolicyCompletionHandler {
    NSString *key = @"testPutImagePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] putImagePolicy:[AWSImagebuilderPutImagePolicyRequest new] completionHandler:^(AWSImagebuilderPutImagePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testPutImageRecipePolicy {
    NSString *key = @"testPutImageRecipePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] putImageRecipePolicy:[AWSImagebuilderPutImageRecipePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testPutImageRecipePolicyCompletionHandler {
    NSString *key = @"testPutImageRecipePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] putImageRecipePolicy:[AWSImagebuilderPutImageRecipePolicyRequest new] completionHandler:^(AWSImagebuilderPutImageRecipePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testStartImagePipelineExecution {
    NSString *key = @"testStartImagePipelineExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] startImagePipelineExecution:[AWSImagebuilderStartImagePipelineExecutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testStartImagePipelineExecutionCompletionHandler {
    NSString *key = @"testStartImagePipelineExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] startImagePipelineExecution:[AWSImagebuilderStartImagePipelineExecutionRequest new] completionHandler:^(AWSImagebuilderStartImagePipelineExecutionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] tagResource:[AWSImagebuilderTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] tagResource:[AWSImagebuilderTagResourceRequest new] completionHandler:^(AWSImagebuilderTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] untagResource:[AWSImagebuilderUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] untagResource:[AWSImagebuilderUntagResourceRequest new] completionHandler:^(AWSImagebuilderUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testUpdateDistributionConfiguration {
    NSString *key = @"testUpdateDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] updateDistributionConfiguration:[AWSImagebuilderUpdateDistributionConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testUpdateDistributionConfigurationCompletionHandler {
    NSString *key = @"testUpdateDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] updateDistributionConfiguration:[AWSImagebuilderUpdateDistributionConfigurationRequest new] completionHandler:^(AWSImagebuilderUpdateDistributionConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testUpdateImagePipeline {
    NSString *key = @"testUpdateImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] updateImagePipeline:[AWSImagebuilderUpdateImagePipelineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testUpdateImagePipelineCompletionHandler {
    NSString *key = @"testUpdateImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] updateImagePipeline:[AWSImagebuilderUpdateImagePipelineRequest new] completionHandler:^(AWSImagebuilderUpdateImagePipelineResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testUpdateInfrastructureConfiguration {
    NSString *key = @"testUpdateInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSImagebuilder ImagebuilderForKey:key] updateInfrastructureConfiguration:[AWSImagebuilderUpdateInfrastructureConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

- (void)testUpdateInfrastructureConfigurationCompletionHandler {
    NSString *key = @"testUpdateInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSImagebuilder registerImagebuilderWithConfiguration:configuration forKey:key];

    AWSImagebuilder *awsClient = [AWSImagebuilder ImagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSImagebuilder ImagebuilderForKey:key] updateInfrastructureConfiguration:[AWSImagebuilderUpdateInfrastructureConfigurationRequest new] completionHandler:^(AWSImagebuilderUpdateInfrastructureConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSImagebuilder removeImagebuilderForKey:key];
}

@end
