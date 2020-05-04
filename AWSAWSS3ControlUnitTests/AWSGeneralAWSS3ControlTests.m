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
#import "AWSAWSS3ControlService.h"

static id mockNetworking = nil;

@interface AWSGeneralAWSS3ControlTests : XCTestCase

@end

@implementation AWSGeneralAWSS3ControlTests

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
    NSString *key = @"testAWSS3ControlConstructors";
    XCTAssertNotNil([AWSAWSS3Control defaultAWSS3Control]);
    XCTAssertEqual([[AWSAWSS3Control defaultAWSS3Control] class], [AWSAWSS3Control class]);
    XCTAssertNil([AWSAWSS3Control AWSS3ControlForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSAWSS3Control AWSS3ControlForKey:key]);
    XCTAssertEqual([[AWSAWSS3Control AWSS3ControlForKey:key] class], [AWSAWSS3Control class]);
    XCTAssertEqual([AWSAWSS3Control AWSS3ControlForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
    XCTAssertNil([AWSAWSS3Control AWSS3ControlForKey:key]);

}

- (void)testCreateAccessPoint {
    NSString *key = @"testCreateAccessPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] createAccessPoint:[AWSAWSS3ControlCreateAccessPointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testCreateAccessPointCompletionHandler {
    NSString *key = @"testCreateAccessPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] createAccessPoint:[AWSAWSS3ControlCreateAccessPointRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testCreateJob {
    NSString *key = @"testCreateJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] createJob:[AWSAWSS3ControlCreateJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testCreateJobCompletionHandler {
    NSString *key = @"testCreateJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] createJob:[AWSAWSS3ControlCreateJobRequest new] completionHandler:^(AWSAWSS3ControlCreateJobResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testDeleteAccessPoint {
    NSString *key = @"testDeleteAccessPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] deleteAccessPoint:[AWSAWSS3ControlDeleteAccessPointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testDeleteAccessPointCompletionHandler {
    NSString *key = @"testDeleteAccessPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] deleteAccessPoint:[AWSAWSS3ControlDeleteAccessPointRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testDeleteAccessPointPolicy {
    NSString *key = @"testDeleteAccessPointPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] deleteAccessPointPolicy:[AWSAWSS3ControlDeleteAccessPointPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testDeleteAccessPointPolicyCompletionHandler {
    NSString *key = @"testDeleteAccessPointPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] deleteAccessPointPolicy:[AWSAWSS3ControlDeleteAccessPointPolicyRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testDeleteJobTagging {
    NSString *key = @"testDeleteJobTagging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] deleteJobTagging:[AWSAWSS3ControlDeleteJobTaggingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testDeleteJobTaggingCompletionHandler {
    NSString *key = @"testDeleteJobTagging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] deleteJobTagging:[AWSAWSS3ControlDeleteJobTaggingRequest new] completionHandler:^(AWSAWSS3ControlDeleteJobTaggingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testDeletePublicAccessBlock {
    NSString *key = @"testDeletePublicAccessBlock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] deletePublicAccessBlock:[AWSAWSS3ControlDeletePublicAccessBlockRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testDeletePublicAccessBlockCompletionHandler {
    NSString *key = @"testDeletePublicAccessBlock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] deletePublicAccessBlock:[AWSAWSS3ControlDeletePublicAccessBlockRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testDescribeJob {
    NSString *key = @"testDescribeJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] describeJob:[AWSAWSS3ControlDescribeJobRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testDescribeJobCompletionHandler {
    NSString *key = @"testDescribeJob";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] describeJob:[AWSAWSS3ControlDescribeJobRequest new] completionHandler:^(AWSAWSS3ControlDescribeJobResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testGetAccessPoint {
    NSString *key = @"testGetAccessPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] getAccessPoint:[AWSAWSS3ControlGetAccessPointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testGetAccessPointCompletionHandler {
    NSString *key = @"testGetAccessPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] getAccessPoint:[AWSAWSS3ControlGetAccessPointRequest new] completionHandler:^(AWSAWSS3ControlGetAccessPointResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testGetAccessPointPolicy {
    NSString *key = @"testGetAccessPointPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] getAccessPointPolicy:[AWSAWSS3ControlGetAccessPointPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testGetAccessPointPolicyCompletionHandler {
    NSString *key = @"testGetAccessPointPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] getAccessPointPolicy:[AWSAWSS3ControlGetAccessPointPolicyRequest new] completionHandler:^(AWSAWSS3ControlGetAccessPointPolicyResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testGetAccessPointPolicyStatus {
    NSString *key = @"testGetAccessPointPolicyStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] getAccessPointPolicyStatus:[AWSAWSS3ControlGetAccessPointPolicyStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testGetAccessPointPolicyStatusCompletionHandler {
    NSString *key = @"testGetAccessPointPolicyStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] getAccessPointPolicyStatus:[AWSAWSS3ControlGetAccessPointPolicyStatusRequest new] completionHandler:^(AWSAWSS3ControlGetAccessPointPolicyStatusResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testGetJobTagging {
    NSString *key = @"testGetJobTagging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] getJobTagging:[AWSAWSS3ControlGetJobTaggingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testGetJobTaggingCompletionHandler {
    NSString *key = @"testGetJobTagging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] getJobTagging:[AWSAWSS3ControlGetJobTaggingRequest new] completionHandler:^(AWSAWSS3ControlGetJobTaggingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testGetPublicAccessBlock {
    NSString *key = @"testGetPublicAccessBlock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] getPublicAccessBlock:[AWSAWSS3ControlGetPublicAccessBlockRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testGetPublicAccessBlockCompletionHandler {
    NSString *key = @"testGetPublicAccessBlock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] getPublicAccessBlock:[AWSAWSS3ControlGetPublicAccessBlockRequest new] completionHandler:^(AWSAWSS3ControlGetPublicAccessBlockOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testListAccessPoints {
    NSString *key = @"testListAccessPoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] listAccessPoints:[AWSAWSS3ControlListAccessPointsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testListAccessPointsCompletionHandler {
    NSString *key = @"testListAccessPoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] listAccessPoints:[AWSAWSS3ControlListAccessPointsRequest new] completionHandler:^(AWSAWSS3ControlListAccessPointsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testListJobs {
    NSString *key = @"testListJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] listJobs:[AWSAWSS3ControlListJobsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testListJobsCompletionHandler {
    NSString *key = @"testListJobs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] listJobs:[AWSAWSS3ControlListJobsRequest new] completionHandler:^(AWSAWSS3ControlListJobsResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testPutAccessPointPolicy {
    NSString *key = @"testPutAccessPointPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] putAccessPointPolicy:[AWSAWSS3ControlPutAccessPointPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testPutAccessPointPolicyCompletionHandler {
    NSString *key = @"testPutAccessPointPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] putAccessPointPolicy:[AWSAWSS3ControlPutAccessPointPolicyRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testPutJobTagging {
    NSString *key = @"testPutJobTagging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] putJobTagging:[AWSAWSS3ControlPutJobTaggingRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testPutJobTaggingCompletionHandler {
    NSString *key = @"testPutJobTagging";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] putJobTagging:[AWSAWSS3ControlPutJobTaggingRequest new] completionHandler:^(AWSAWSS3ControlPutJobTaggingResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testPutPublicAccessBlock {
    NSString *key = @"testPutPublicAccessBlock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] putPublicAccessBlock:[AWSAWSS3ControlPutPublicAccessBlockRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testPutPublicAccessBlockCompletionHandler {
    NSString *key = @"testPutPublicAccessBlock";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] putPublicAccessBlock:[AWSAWSS3ControlPutPublicAccessBlockRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testUpdateJobPriority {
    NSString *key = @"testUpdateJobPriority";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] updateJobPriority:[AWSAWSS3ControlUpdateJobPriorityRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testUpdateJobPriorityCompletionHandler {
    NSString *key = @"testUpdateJobPriority";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] updateJobPriority:[AWSAWSS3ControlUpdateJobPriorityRequest new] completionHandler:^(AWSAWSS3ControlUpdateJobPriorityResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testUpdateJobStatus {
    NSString *key = @"testUpdateJobStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSAWSS3Control AWSS3ControlForKey:key] updateJobStatus:[AWSAWSS3ControlUpdateJobStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

- (void)testUpdateJobStatusCompletionHandler {
    NSString *key = @"testUpdateJobStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSAWSS3Control registerAWSS3ControlWithConfiguration:configuration forKey:key];

    AWSAWSS3Control *awsClient = [AWSAWSS3Control AWSS3ControlForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSAWSS3Control AWSS3ControlForKey:key] updateJobStatus:[AWSAWSS3ControlUpdateJobStatusRequest new] completionHandler:^(AWSAWSS3ControlUpdateJobStatusResult* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSAWSS3Control removeAWSS3ControlForKey:key];
}

@end
