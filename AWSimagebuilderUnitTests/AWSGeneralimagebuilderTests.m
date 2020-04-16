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
#import "AWSimagebuilderService.h"

static id mockNetworking = nil;

@interface AWSGeneralimagebuilderTests : XCTestCase

@end

@implementation AWSGeneralimagebuilderTests

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
    NSString *key = @"testimagebuilderConstructors";
    XCTAssertNotNil([AWSimagebuilder defaultimagebuilder]);
    XCTAssertEqual([[AWSimagebuilder defaultimagebuilder] class], [AWSimagebuilder class]);
    XCTAssertNil([AWSimagebuilder imagebuilderForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSimagebuilder imagebuilderForKey:key]);
    XCTAssertEqual([[AWSimagebuilder imagebuilderForKey:key] class], [AWSimagebuilder class]);
    XCTAssertEqual([AWSimagebuilder imagebuilderForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSimagebuilder removeimagebuilderForKey:key];
    XCTAssertNil([AWSimagebuilder imagebuilderForKey:key]);

}

- (void)testCancelImageCreation {
    NSString *key = @"testCancelImageCreation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] cancelImageCreation:[AWSimagebuilderCancelImageCreationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testCancelImageCreationCompletionHandler {
    NSString *key = @"testCancelImageCreation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] cancelImageCreation:[AWSimagebuilderCancelImageCreationRequest new] completionHandler:^(AWSimagebuilderCancelImageCreationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testCreateComponent {
    NSString *key = @"testCreateComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] createComponent:[AWSimagebuilderCreateComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testCreateComponentCompletionHandler {
    NSString *key = @"testCreateComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] createComponent:[AWSimagebuilderCreateComponentRequest new] completionHandler:^(AWSimagebuilderCreateComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testCreateDistributionConfiguration {
    NSString *key = @"testCreateDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] createDistributionConfiguration:[AWSimagebuilderCreateDistributionConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testCreateDistributionConfigurationCompletionHandler {
    NSString *key = @"testCreateDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] createDistributionConfiguration:[AWSimagebuilderCreateDistributionConfigurationRequest new] completionHandler:^(AWSimagebuilderCreateDistributionConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testCreateImage {
    NSString *key = @"testCreateImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] createImage:[AWSimagebuilderCreateImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testCreateImageCompletionHandler {
    NSString *key = @"testCreateImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] createImage:[AWSimagebuilderCreateImageRequest new] completionHandler:^(AWSimagebuilderCreateImageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testCreateImagePipeline {
    NSString *key = @"testCreateImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] createImagePipeline:[AWSimagebuilderCreateImagePipelineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testCreateImagePipelineCompletionHandler {
    NSString *key = @"testCreateImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] createImagePipeline:[AWSimagebuilderCreateImagePipelineRequest new] completionHandler:^(AWSimagebuilderCreateImagePipelineResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testCreateImageRecipe {
    NSString *key = @"testCreateImageRecipe";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] createImageRecipe:[AWSimagebuilderCreateImageRecipeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testCreateImageRecipeCompletionHandler {
    NSString *key = @"testCreateImageRecipe";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] createImageRecipe:[AWSimagebuilderCreateImageRecipeRequest new] completionHandler:^(AWSimagebuilderCreateImageRecipeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testCreateInfrastructureConfiguration {
    NSString *key = @"testCreateInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] createInfrastructureConfiguration:[AWSimagebuilderCreateInfrastructureConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testCreateInfrastructureConfigurationCompletionHandler {
    NSString *key = @"testCreateInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] createInfrastructureConfiguration:[AWSimagebuilderCreateInfrastructureConfigurationRequest new] completionHandler:^(AWSimagebuilderCreateInfrastructureConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testDeleteComponent {
    NSString *key = @"testDeleteComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] deleteComponent:[AWSimagebuilderDeleteComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testDeleteComponentCompletionHandler {
    NSString *key = @"testDeleteComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] deleteComponent:[AWSimagebuilderDeleteComponentRequest new] completionHandler:^(AWSimagebuilderDeleteComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testDeleteDistributionConfiguration {
    NSString *key = @"testDeleteDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] deleteDistributionConfiguration:[AWSimagebuilderDeleteDistributionConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testDeleteDistributionConfigurationCompletionHandler {
    NSString *key = @"testDeleteDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] deleteDistributionConfiguration:[AWSimagebuilderDeleteDistributionConfigurationRequest new] completionHandler:^(AWSimagebuilderDeleteDistributionConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testDeleteImage {
    NSString *key = @"testDeleteImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] deleteImage:[AWSimagebuilderDeleteImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testDeleteImageCompletionHandler {
    NSString *key = @"testDeleteImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] deleteImage:[AWSimagebuilderDeleteImageRequest new] completionHandler:^(AWSimagebuilderDeleteImageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testDeleteImagePipeline {
    NSString *key = @"testDeleteImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] deleteImagePipeline:[AWSimagebuilderDeleteImagePipelineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testDeleteImagePipelineCompletionHandler {
    NSString *key = @"testDeleteImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] deleteImagePipeline:[AWSimagebuilderDeleteImagePipelineRequest new] completionHandler:^(AWSimagebuilderDeleteImagePipelineResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testDeleteImageRecipe {
    NSString *key = @"testDeleteImageRecipe";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] deleteImageRecipe:[AWSimagebuilderDeleteImageRecipeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testDeleteImageRecipeCompletionHandler {
    NSString *key = @"testDeleteImageRecipe";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] deleteImageRecipe:[AWSimagebuilderDeleteImageRecipeRequest new] completionHandler:^(AWSimagebuilderDeleteImageRecipeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testDeleteInfrastructureConfiguration {
    NSString *key = @"testDeleteInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] deleteInfrastructureConfiguration:[AWSimagebuilderDeleteInfrastructureConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testDeleteInfrastructureConfigurationCompletionHandler {
    NSString *key = @"testDeleteInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] deleteInfrastructureConfiguration:[AWSimagebuilderDeleteInfrastructureConfigurationRequest new] completionHandler:^(AWSimagebuilderDeleteInfrastructureConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetComponent {
    NSString *key = @"testGetComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] getComponent:[AWSimagebuilderGetComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetComponentCompletionHandler {
    NSString *key = @"testGetComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] getComponent:[AWSimagebuilderGetComponentRequest new] completionHandler:^(AWSimagebuilderGetComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetComponentPolicy {
    NSString *key = @"testGetComponentPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] getComponentPolicy:[AWSimagebuilderGetComponentPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetComponentPolicyCompletionHandler {
    NSString *key = @"testGetComponentPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] getComponentPolicy:[AWSimagebuilderGetComponentPolicyRequest new] completionHandler:^(AWSimagebuilderGetComponentPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetDistributionConfiguration {
    NSString *key = @"testGetDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] getDistributionConfiguration:[AWSimagebuilderGetDistributionConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetDistributionConfigurationCompletionHandler {
    NSString *key = @"testGetDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] getDistributionConfiguration:[AWSimagebuilderGetDistributionConfigurationRequest new] completionHandler:^(AWSimagebuilderGetDistributionConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetImage {
    NSString *key = @"testGetImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] getImage:[AWSimagebuilderGetImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetImageCompletionHandler {
    NSString *key = @"testGetImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] getImage:[AWSimagebuilderGetImageRequest new] completionHandler:^(AWSimagebuilderGetImageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetImagePipeline {
    NSString *key = @"testGetImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] getImagePipeline:[AWSimagebuilderGetImagePipelineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetImagePipelineCompletionHandler {
    NSString *key = @"testGetImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] getImagePipeline:[AWSimagebuilderGetImagePipelineRequest new] completionHandler:^(AWSimagebuilderGetImagePipelineResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetImagePolicy {
    NSString *key = @"testGetImagePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] getImagePolicy:[AWSimagebuilderGetImagePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetImagePolicyCompletionHandler {
    NSString *key = @"testGetImagePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] getImagePolicy:[AWSimagebuilderGetImagePolicyRequest new] completionHandler:^(AWSimagebuilderGetImagePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetImageRecipe {
    NSString *key = @"testGetImageRecipe";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] getImageRecipe:[AWSimagebuilderGetImageRecipeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetImageRecipeCompletionHandler {
    NSString *key = @"testGetImageRecipe";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] getImageRecipe:[AWSimagebuilderGetImageRecipeRequest new] completionHandler:^(AWSimagebuilderGetImageRecipeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetImageRecipePolicy {
    NSString *key = @"testGetImageRecipePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] getImageRecipePolicy:[AWSimagebuilderGetImageRecipePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetImageRecipePolicyCompletionHandler {
    NSString *key = @"testGetImageRecipePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] getImageRecipePolicy:[AWSimagebuilderGetImageRecipePolicyRequest new] completionHandler:^(AWSimagebuilderGetImageRecipePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetInfrastructureConfiguration {
    NSString *key = @"testGetInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] getInfrastructureConfiguration:[AWSimagebuilderGetInfrastructureConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testGetInfrastructureConfigurationCompletionHandler {
    NSString *key = @"testGetInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] getInfrastructureConfiguration:[AWSimagebuilderGetInfrastructureConfigurationRequest new] completionHandler:^(AWSimagebuilderGetInfrastructureConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testImportComponent {
    NSString *key = @"testImportComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] importComponent:[AWSimagebuilderImportComponentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testImportComponentCompletionHandler {
    NSString *key = @"testImportComponent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] importComponent:[AWSimagebuilderImportComponentRequest new] completionHandler:^(AWSimagebuilderImportComponentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListComponentBuildVersions {
    NSString *key = @"testListComponentBuildVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] listComponentBuildVersions:[AWSimagebuilderListComponentBuildVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListComponentBuildVersionsCompletionHandler {
    NSString *key = @"testListComponentBuildVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] listComponentBuildVersions:[AWSimagebuilderListComponentBuildVersionsRequest new] completionHandler:^(AWSimagebuilderListComponentBuildVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListComponents {
    NSString *key = @"testListComponents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] listComponents:[AWSimagebuilderListComponentsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListComponentsCompletionHandler {
    NSString *key = @"testListComponents";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] listComponents:[AWSimagebuilderListComponentsRequest new] completionHandler:^(AWSimagebuilderListComponentsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListDistributionConfigurations {
    NSString *key = @"testListDistributionConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] listDistributionConfigurations:[AWSimagebuilderListDistributionConfigurationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListDistributionConfigurationsCompletionHandler {
    NSString *key = @"testListDistributionConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] listDistributionConfigurations:[AWSimagebuilderListDistributionConfigurationsRequest new] completionHandler:^(AWSimagebuilderListDistributionConfigurationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListImageBuildVersions {
    NSString *key = @"testListImageBuildVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] listImageBuildVersions:[AWSimagebuilderListImageBuildVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListImageBuildVersionsCompletionHandler {
    NSString *key = @"testListImageBuildVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] listImageBuildVersions:[AWSimagebuilderListImageBuildVersionsRequest new] completionHandler:^(AWSimagebuilderListImageBuildVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListImagePipelineImages {
    NSString *key = @"testListImagePipelineImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] listImagePipelineImages:[AWSimagebuilderListImagePipelineImagesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListImagePipelineImagesCompletionHandler {
    NSString *key = @"testListImagePipelineImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] listImagePipelineImages:[AWSimagebuilderListImagePipelineImagesRequest new] completionHandler:^(AWSimagebuilderListImagePipelineImagesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListImagePipelines {
    NSString *key = @"testListImagePipelines";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] listImagePipelines:[AWSimagebuilderListImagePipelinesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListImagePipelinesCompletionHandler {
    NSString *key = @"testListImagePipelines";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] listImagePipelines:[AWSimagebuilderListImagePipelinesRequest new] completionHandler:^(AWSimagebuilderListImagePipelinesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListImageRecipes {
    NSString *key = @"testListImageRecipes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] listImageRecipes:[AWSimagebuilderListImageRecipesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListImageRecipesCompletionHandler {
    NSString *key = @"testListImageRecipes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] listImageRecipes:[AWSimagebuilderListImageRecipesRequest new] completionHandler:^(AWSimagebuilderListImageRecipesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListImages {
    NSString *key = @"testListImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] listImages:[AWSimagebuilderListImagesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListImagesCompletionHandler {
    NSString *key = @"testListImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] listImages:[AWSimagebuilderListImagesRequest new] completionHandler:^(AWSimagebuilderListImagesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListInfrastructureConfigurations {
    NSString *key = @"testListInfrastructureConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] listInfrastructureConfigurations:[AWSimagebuilderListInfrastructureConfigurationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListInfrastructureConfigurationsCompletionHandler {
    NSString *key = @"testListInfrastructureConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] listInfrastructureConfigurations:[AWSimagebuilderListInfrastructureConfigurationsRequest new] completionHandler:^(AWSimagebuilderListInfrastructureConfigurationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] listTagsForResource:[AWSimagebuilderListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] listTagsForResource:[AWSimagebuilderListTagsForResourceRequest new] completionHandler:^(AWSimagebuilderListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testPutComponentPolicy {
    NSString *key = @"testPutComponentPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] putComponentPolicy:[AWSimagebuilderPutComponentPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testPutComponentPolicyCompletionHandler {
    NSString *key = @"testPutComponentPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] putComponentPolicy:[AWSimagebuilderPutComponentPolicyRequest new] completionHandler:^(AWSimagebuilderPutComponentPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testPutImagePolicy {
    NSString *key = @"testPutImagePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] putImagePolicy:[AWSimagebuilderPutImagePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testPutImagePolicyCompletionHandler {
    NSString *key = @"testPutImagePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] putImagePolicy:[AWSimagebuilderPutImagePolicyRequest new] completionHandler:^(AWSimagebuilderPutImagePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testPutImageRecipePolicy {
    NSString *key = @"testPutImageRecipePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] putImageRecipePolicy:[AWSimagebuilderPutImageRecipePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testPutImageRecipePolicyCompletionHandler {
    NSString *key = @"testPutImageRecipePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] putImageRecipePolicy:[AWSimagebuilderPutImageRecipePolicyRequest new] completionHandler:^(AWSimagebuilderPutImageRecipePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testStartImagePipelineExecution {
    NSString *key = @"testStartImagePipelineExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] startImagePipelineExecution:[AWSimagebuilderStartImagePipelineExecutionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testStartImagePipelineExecutionCompletionHandler {
    NSString *key = @"testStartImagePipelineExecution";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] startImagePipelineExecution:[AWSimagebuilderStartImagePipelineExecutionRequest new] completionHandler:^(AWSimagebuilderStartImagePipelineExecutionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] tagResource:[AWSimagebuilderTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] tagResource:[AWSimagebuilderTagResourceRequest new] completionHandler:^(AWSimagebuilderTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] untagResource:[AWSimagebuilderUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] untagResource:[AWSimagebuilderUntagResourceRequest new] completionHandler:^(AWSimagebuilderUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testUpdateDistributionConfiguration {
    NSString *key = @"testUpdateDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] updateDistributionConfiguration:[AWSimagebuilderUpdateDistributionConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testUpdateDistributionConfigurationCompletionHandler {
    NSString *key = @"testUpdateDistributionConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] updateDistributionConfiguration:[AWSimagebuilderUpdateDistributionConfigurationRequest new] completionHandler:^(AWSimagebuilderUpdateDistributionConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testUpdateImagePipeline {
    NSString *key = @"testUpdateImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] updateImagePipeline:[AWSimagebuilderUpdateImagePipelineRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testUpdateImagePipelineCompletionHandler {
    NSString *key = @"testUpdateImagePipeline";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] updateImagePipeline:[AWSimagebuilderUpdateImagePipelineRequest new] completionHandler:^(AWSimagebuilderUpdateImagePipelineResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testUpdateInfrastructureConfiguration {
    NSString *key = @"testUpdateInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSimagebuilder imagebuilderForKey:key] updateInfrastructureConfiguration:[AWSimagebuilderUpdateInfrastructureConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

- (void)testUpdateInfrastructureConfigurationCompletionHandler {
    NSString *key = @"testUpdateInfrastructureConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSimagebuilder registerimagebuilderWithConfiguration:configuration forKey:key];

    AWSimagebuilder *awsClient = [AWSimagebuilder imagebuilderForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSimagebuilder imagebuilderForKey:key] updateInfrastructureConfiguration:[AWSimagebuilderUpdateInfrastructureConfigurationRequest new] completionHandler:^(AWSimagebuilderUpdateInfrastructureConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSimagebuilder removeimagebuilderForKey:key];
}

@end
