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
#import "AWSapi.ecrService.h"

static id mockNetworking = nil;

@interface AWSGeneralapi.ecrTests : XCTestCase

@end

@implementation AWSGeneralapi.ecrTests

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
    NSString *key = @"testapi.ecrConstructors";
    XCTAssertNotNil([AWSapi.ecr defaultapi.ecr]);
    XCTAssertEqual([[AWSapi.ecr defaultapi.ecr] class], [AWSapi.ecr class]);
    XCTAssertNil([AWSapi.ecr api.ecrForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSapi.ecr api.ecrForKey:key]);
    XCTAssertEqual([[AWSapi.ecr api.ecrForKey:key] class], [AWSapi.ecr class]);
    XCTAssertEqual([AWSapi.ecr api.ecrForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSapi.ecr removeapi.ecrForKey:key];
    XCTAssertNil([AWSapi.ecr api.ecrForKey:key]);

}

- (void)testBatchCheckLayerAvailability {
    NSString *key = @"testBatchCheckLayerAvailability";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] batchCheckLayerAvailability:[AWSapi.ecrBatchCheckLayerAvailabilityRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testBatchCheckLayerAvailabilityCompletionHandler {
    NSString *key = @"testBatchCheckLayerAvailability";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] batchCheckLayerAvailability:[AWSapi.ecrBatchCheckLayerAvailabilityRequest new] completionHandler:^(AWSapi.ecrBatchCheckLayerAvailabilityResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testBatchDeleteImage {
    NSString *key = @"testBatchDeleteImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] batchDeleteImage:[AWSapi.ecrBatchDeleteImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testBatchDeleteImageCompletionHandler {
    NSString *key = @"testBatchDeleteImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] batchDeleteImage:[AWSapi.ecrBatchDeleteImageRequest new] completionHandler:^(AWSapi.ecrBatchDeleteImageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testBatchGetImage {
    NSString *key = @"testBatchGetImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] batchGetImage:[AWSapi.ecrBatchGetImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testBatchGetImageCompletionHandler {
    NSString *key = @"testBatchGetImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] batchGetImage:[AWSapi.ecrBatchGetImageRequest new] completionHandler:^(AWSapi.ecrBatchGetImageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testCompleteLayerUpload {
    NSString *key = @"testCompleteLayerUpload";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] completeLayerUpload:[AWSapi.ecrCompleteLayerUploadRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testCompleteLayerUploadCompletionHandler {
    NSString *key = @"testCompleteLayerUpload";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] completeLayerUpload:[AWSapi.ecrCompleteLayerUploadRequest new] completionHandler:^(AWSapi.ecrCompleteLayerUploadResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testCreateRepository {
    NSString *key = @"testCreateRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] createRepository:[AWSapi.ecrCreateRepositoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testCreateRepositoryCompletionHandler {
    NSString *key = @"testCreateRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] createRepository:[AWSapi.ecrCreateRepositoryRequest new] completionHandler:^(AWSapi.ecrCreateRepositoryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testDeleteLifecyclePolicy {
    NSString *key = @"testDeleteLifecyclePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] deleteLifecyclePolicy:[AWSapi.ecrDeleteLifecyclePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testDeleteLifecyclePolicyCompletionHandler {
    NSString *key = @"testDeleteLifecyclePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] deleteLifecyclePolicy:[AWSapi.ecrDeleteLifecyclePolicyRequest new] completionHandler:^(AWSapi.ecrDeleteLifecyclePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testDeleteRepository {
    NSString *key = @"testDeleteRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] deleteRepository:[AWSapi.ecrDeleteRepositoryRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testDeleteRepositoryCompletionHandler {
    NSString *key = @"testDeleteRepository";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] deleteRepository:[AWSapi.ecrDeleteRepositoryRequest new] completionHandler:^(AWSapi.ecrDeleteRepositoryResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testDeleteRepositoryPolicy {
    NSString *key = @"testDeleteRepositoryPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] deleteRepositoryPolicy:[AWSapi.ecrDeleteRepositoryPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testDeleteRepositoryPolicyCompletionHandler {
    NSString *key = @"testDeleteRepositoryPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] deleteRepositoryPolicy:[AWSapi.ecrDeleteRepositoryPolicyRequest new] completionHandler:^(AWSapi.ecrDeleteRepositoryPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testDescribeImageScanFindings {
    NSString *key = @"testDescribeImageScanFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] describeImageScanFindings:[AWSapi.ecrDescribeImageScanFindingsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testDescribeImageScanFindingsCompletionHandler {
    NSString *key = @"testDescribeImageScanFindings";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] describeImageScanFindings:[AWSapi.ecrDescribeImageScanFindingsRequest new] completionHandler:^(AWSapi.ecrDescribeImageScanFindingsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testDescribeImages {
    NSString *key = @"testDescribeImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] describeImages:[AWSapi.ecrDescribeImagesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testDescribeImagesCompletionHandler {
    NSString *key = @"testDescribeImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] describeImages:[AWSapi.ecrDescribeImagesRequest new] completionHandler:^(AWSapi.ecrDescribeImagesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testDescribeRepositories {
    NSString *key = @"testDescribeRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] describeRepositories:[AWSapi.ecrDescribeRepositoriesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testDescribeRepositoriesCompletionHandler {
    NSString *key = @"testDescribeRepositories";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] describeRepositories:[AWSapi.ecrDescribeRepositoriesRequest new] completionHandler:^(AWSapi.ecrDescribeRepositoriesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testGetAuthorizationToken {
    NSString *key = @"testGetAuthorizationToken";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] getAuthorizationToken:[AWSapi.ecrGetAuthorizationTokenRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testGetAuthorizationTokenCompletionHandler {
    NSString *key = @"testGetAuthorizationToken";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] getAuthorizationToken:[AWSapi.ecrGetAuthorizationTokenRequest new] completionHandler:^(AWSapi.ecrGetAuthorizationTokenResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testGetDownloadUrlForLayer {
    NSString *key = @"testGetDownloadUrlForLayer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] getDownloadUrlForLayer:[AWSapi.ecrGetDownloadUrlForLayerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testGetDownloadUrlForLayerCompletionHandler {
    NSString *key = @"testGetDownloadUrlForLayer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] getDownloadUrlForLayer:[AWSapi.ecrGetDownloadUrlForLayerRequest new] completionHandler:^(AWSapi.ecrGetDownloadUrlForLayerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testGetLifecyclePolicy {
    NSString *key = @"testGetLifecyclePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] getLifecyclePolicy:[AWSapi.ecrGetLifecyclePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testGetLifecyclePolicyCompletionHandler {
    NSString *key = @"testGetLifecyclePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] getLifecyclePolicy:[AWSapi.ecrGetLifecyclePolicyRequest new] completionHandler:^(AWSapi.ecrGetLifecyclePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testGetLifecyclePolicyPreview {
    NSString *key = @"testGetLifecyclePolicyPreview";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] getLifecyclePolicyPreview:[AWSapi.ecrGetLifecyclePolicyPreviewRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testGetLifecyclePolicyPreviewCompletionHandler {
    NSString *key = @"testGetLifecyclePolicyPreview";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] getLifecyclePolicyPreview:[AWSapi.ecrGetLifecyclePolicyPreviewRequest new] completionHandler:^(AWSapi.ecrGetLifecyclePolicyPreviewResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testGetRepositoryPolicy {
    NSString *key = @"testGetRepositoryPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] getRepositoryPolicy:[AWSapi.ecrGetRepositoryPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testGetRepositoryPolicyCompletionHandler {
    NSString *key = @"testGetRepositoryPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] getRepositoryPolicy:[AWSapi.ecrGetRepositoryPolicyRequest new] completionHandler:^(AWSapi.ecrGetRepositoryPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testInitiateLayerUpload {
    NSString *key = @"testInitiateLayerUpload";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] initiateLayerUpload:[AWSapi.ecrInitiateLayerUploadRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testInitiateLayerUploadCompletionHandler {
    NSString *key = @"testInitiateLayerUpload";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] initiateLayerUpload:[AWSapi.ecrInitiateLayerUploadRequest new] completionHandler:^(AWSapi.ecrInitiateLayerUploadResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testListImages {
    NSString *key = @"testListImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] listImages:[AWSapi.ecrListImagesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testListImagesCompletionHandler {
    NSString *key = @"testListImages";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] listImages:[AWSapi.ecrListImagesRequest new] completionHandler:^(AWSapi.ecrListImagesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] listTagsForResource:[AWSapi.ecrListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] listTagsForResource:[AWSapi.ecrListTagsForResourceRequest new] completionHandler:^(AWSapi.ecrListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testPutImage {
    NSString *key = @"testPutImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] putImage:[AWSapi.ecrPutImageRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testPutImageCompletionHandler {
    NSString *key = @"testPutImage";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] putImage:[AWSapi.ecrPutImageRequest new] completionHandler:^(AWSapi.ecrPutImageResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testPutImageScanningConfiguration {
    NSString *key = @"testPutImageScanningConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] putImageScanningConfiguration:[AWSapi.ecrPutImageScanningConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testPutImageScanningConfigurationCompletionHandler {
    NSString *key = @"testPutImageScanningConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] putImageScanningConfiguration:[AWSapi.ecrPutImageScanningConfigurationRequest new] completionHandler:^(AWSapi.ecrPutImageScanningConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testPutImageTagMutability {
    NSString *key = @"testPutImageTagMutability";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] putImageTagMutability:[AWSapi.ecrPutImageTagMutabilityRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testPutImageTagMutabilityCompletionHandler {
    NSString *key = @"testPutImageTagMutability";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] putImageTagMutability:[AWSapi.ecrPutImageTagMutabilityRequest new] completionHandler:^(AWSapi.ecrPutImageTagMutabilityResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testPutLifecyclePolicy {
    NSString *key = @"testPutLifecyclePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] putLifecyclePolicy:[AWSapi.ecrPutLifecyclePolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testPutLifecyclePolicyCompletionHandler {
    NSString *key = @"testPutLifecyclePolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] putLifecyclePolicy:[AWSapi.ecrPutLifecyclePolicyRequest new] completionHandler:^(AWSapi.ecrPutLifecyclePolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testSetRepositoryPolicy {
    NSString *key = @"testSetRepositoryPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] setRepositoryPolicy:[AWSapi.ecrSetRepositoryPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testSetRepositoryPolicyCompletionHandler {
    NSString *key = @"testSetRepositoryPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] setRepositoryPolicy:[AWSapi.ecrSetRepositoryPolicyRequest new] completionHandler:^(AWSapi.ecrSetRepositoryPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testStartImageScan {
    NSString *key = @"testStartImageScan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] startImageScan:[AWSapi.ecrStartImageScanRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testStartImageScanCompletionHandler {
    NSString *key = @"testStartImageScan";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] startImageScan:[AWSapi.ecrStartImageScanRequest new] completionHandler:^(AWSapi.ecrStartImageScanResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testStartLifecyclePolicyPreview {
    NSString *key = @"testStartLifecyclePolicyPreview";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] startLifecyclePolicyPreview:[AWSapi.ecrStartLifecyclePolicyPreviewRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testStartLifecyclePolicyPreviewCompletionHandler {
    NSString *key = @"testStartLifecyclePolicyPreview";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] startLifecyclePolicyPreview:[AWSapi.ecrStartLifecyclePolicyPreviewRequest new] completionHandler:^(AWSapi.ecrStartLifecyclePolicyPreviewResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] tagResource:[AWSapi.ecrTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] tagResource:[AWSapi.ecrTagResourceRequest new] completionHandler:^(AWSapi.ecrTagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] untagResource:[AWSapi.ecrUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] untagResource:[AWSapi.ecrUntagResourceRequest new] completionHandler:^(AWSapi.ecrUntagResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testUploadLayerPart {
    NSString *key = @"testUploadLayerPart";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSapi.ecr api.ecrForKey:key] uploadLayerPart:[AWSapi.ecrUploadLayerPartRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

- (void)testUploadLayerPartCompletionHandler {
    NSString *key = @"testUploadLayerPart";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSapi.ecr registerapi.ecrWithConfiguration:configuration forKey:key];

    AWSapi.ecr *awsClient = [AWSapi.ecr api.ecrForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSapi.ecr api.ecrForKey:key] uploadLayerPart:[AWSapi.ecrUploadLayerPartRequest new] completionHandler:^(AWSapi.ecrUploadLayerPartResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSapi.ecr removeapi.ecrForKey:key];
}

@end
