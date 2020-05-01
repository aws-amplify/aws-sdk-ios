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
#import "AWSelasticfilesystemService.h"

static id mockNetworking = nil;

@interface AWSGeneralelasticfilesystemTests : XCTestCase

@end

@implementation AWSGeneralelasticfilesystemTests

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
    NSString *key = @"testelasticfilesystemConstructors";
    XCTAssertNotNil([AWSelasticfilesystem defaultelasticfilesystem]);
    XCTAssertEqual([[AWSelasticfilesystem defaultelasticfilesystem] class], [AWSelasticfilesystem class]);
    XCTAssertNil([AWSelasticfilesystem elasticfilesystemForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSelasticfilesystem elasticfilesystemForKey:key]);
    XCTAssertEqual([[AWSelasticfilesystem elasticfilesystemForKey:key] class], [AWSelasticfilesystem class]);
    XCTAssertEqual([AWSelasticfilesystem elasticfilesystemForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
    XCTAssertNil([AWSelasticfilesystem elasticfilesystemForKey:key]);

}

- (void)testCreateAccessPoint {
    NSString *key = @"testCreateAccessPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] createAccessPoint:[AWSelasticfilesystemCreateAccessPointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testCreateAccessPointCompletionHandler {
    NSString *key = @"testCreateAccessPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] createAccessPoint:[AWSelasticfilesystemCreateAccessPointRequest new] completionHandler:^(AWSelasticfilesystemAccessPointDescription* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testCreateFileSystem {
    NSString *key = @"testCreateFileSystem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] createFileSystem:[AWSelasticfilesystemCreateFileSystemRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testCreateFileSystemCompletionHandler {
    NSString *key = @"testCreateFileSystem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] createFileSystem:[AWSelasticfilesystemCreateFileSystemRequest new] completionHandler:^(AWSelasticfilesystemFileSystemDescription* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testCreateMountTarget {
    NSString *key = @"testCreateMountTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] createMountTarget:[AWSelasticfilesystemCreateMountTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testCreateMountTargetCompletionHandler {
    NSString *key = @"testCreateMountTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] createMountTarget:[AWSelasticfilesystemCreateMountTargetRequest new] completionHandler:^(AWSelasticfilesystemMountTargetDescription* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testCreateTags {
    NSString *key = @"testCreateTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] createTags:[AWSelasticfilesystemCreateTagsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testCreateTagsCompletionHandler {
    NSString *key = @"testCreateTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] createTags:[AWSelasticfilesystemCreateTagsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDeleteAccessPoint {
    NSString *key = @"testDeleteAccessPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] deleteAccessPoint:[AWSelasticfilesystemDeleteAccessPointRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDeleteAccessPointCompletionHandler {
    NSString *key = @"testDeleteAccessPoint";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] deleteAccessPoint:[AWSelasticfilesystemDeleteAccessPointRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDeleteFileSystem {
    NSString *key = @"testDeleteFileSystem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] deleteFileSystem:[AWSelasticfilesystemDeleteFileSystemRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDeleteFileSystemCompletionHandler {
    NSString *key = @"testDeleteFileSystem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] deleteFileSystem:[AWSelasticfilesystemDeleteFileSystemRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDeleteFileSystemPolicy {
    NSString *key = @"testDeleteFileSystemPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] deleteFileSystemPolicy:[AWSelasticfilesystemDeleteFileSystemPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDeleteFileSystemPolicyCompletionHandler {
    NSString *key = @"testDeleteFileSystemPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] deleteFileSystemPolicy:[AWSelasticfilesystemDeleteFileSystemPolicyRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDeleteMountTarget {
    NSString *key = @"testDeleteMountTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] deleteMountTarget:[AWSelasticfilesystemDeleteMountTargetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDeleteMountTargetCompletionHandler {
    NSString *key = @"testDeleteMountTarget";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] deleteMountTarget:[AWSelasticfilesystemDeleteMountTargetRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDeleteTags {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] deleteTags:[AWSelasticfilesystemDeleteTagsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDeleteTagsCompletionHandler {
    NSString *key = @"testDeleteTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] deleteTags:[AWSelasticfilesystemDeleteTagsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDescribeAccessPoints {
    NSString *key = @"testDescribeAccessPoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] describeAccessPoints:[AWSelasticfilesystemDescribeAccessPointsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDescribeAccessPointsCompletionHandler {
    NSString *key = @"testDescribeAccessPoints";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] describeAccessPoints:[AWSelasticfilesystemDescribeAccessPointsRequest new] completionHandler:^(AWSelasticfilesystemDescribeAccessPointsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDescribeFileSystemPolicy {
    NSString *key = @"testDescribeFileSystemPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] describeFileSystemPolicy:[AWSelasticfilesystemDescribeFileSystemPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDescribeFileSystemPolicyCompletionHandler {
    NSString *key = @"testDescribeFileSystemPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] describeFileSystemPolicy:[AWSelasticfilesystemDescribeFileSystemPolicyRequest new] completionHandler:^(AWSelasticfilesystemFileSystemPolicyDescription* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDescribeFileSystems {
    NSString *key = @"testDescribeFileSystems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] describeFileSystems:[AWSelasticfilesystemDescribeFileSystemsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDescribeFileSystemsCompletionHandler {
    NSString *key = @"testDescribeFileSystems";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] describeFileSystems:[AWSelasticfilesystemDescribeFileSystemsRequest new] completionHandler:^(AWSelasticfilesystemDescribeFileSystemsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDescribeLifecycleConfiguration {
    NSString *key = @"testDescribeLifecycleConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] describeLifecycleConfiguration:[AWSelasticfilesystemDescribeLifecycleConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDescribeLifecycleConfigurationCompletionHandler {
    NSString *key = @"testDescribeLifecycleConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] describeLifecycleConfiguration:[AWSelasticfilesystemDescribeLifecycleConfigurationRequest new] completionHandler:^(AWSelasticfilesystemLifecycleConfigurationDescription* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDescribeMountTargetSecurityGroups {
    NSString *key = @"testDescribeMountTargetSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] describeMountTargetSecurityGroups:[AWSelasticfilesystemDescribeMountTargetSecurityGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDescribeMountTargetSecurityGroupsCompletionHandler {
    NSString *key = @"testDescribeMountTargetSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] describeMountTargetSecurityGroups:[AWSelasticfilesystemDescribeMountTargetSecurityGroupsRequest new] completionHandler:^(AWSelasticfilesystemDescribeMountTargetSecurityGroupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDescribeMountTargets {
    NSString *key = @"testDescribeMountTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] describeMountTargets:[AWSelasticfilesystemDescribeMountTargetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDescribeMountTargetsCompletionHandler {
    NSString *key = @"testDescribeMountTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] describeMountTargets:[AWSelasticfilesystemDescribeMountTargetsRequest new] completionHandler:^(AWSelasticfilesystemDescribeMountTargetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDescribeTags {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] describeTags:[AWSelasticfilesystemDescribeTagsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testDescribeTagsCompletionHandler {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] describeTags:[AWSelasticfilesystemDescribeTagsRequest new] completionHandler:^(AWSelasticfilesystemDescribeTagsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] listTagsForResource:[AWSelasticfilesystemListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] listTagsForResource:[AWSelasticfilesystemListTagsForResourceRequest new] completionHandler:^(AWSelasticfilesystemListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testModifyMountTargetSecurityGroups {
    NSString *key = @"testModifyMountTargetSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] modifyMountTargetSecurityGroups:[AWSelasticfilesystemModifyMountTargetSecurityGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testModifyMountTargetSecurityGroupsCompletionHandler {
    NSString *key = @"testModifyMountTargetSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] modifyMountTargetSecurityGroups:[AWSelasticfilesystemModifyMountTargetSecurityGroupsRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testPutFileSystemPolicy {
    NSString *key = @"testPutFileSystemPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] putFileSystemPolicy:[AWSelasticfilesystemPutFileSystemPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testPutFileSystemPolicyCompletionHandler {
    NSString *key = @"testPutFileSystemPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] putFileSystemPolicy:[AWSelasticfilesystemPutFileSystemPolicyRequest new] completionHandler:^(AWSelasticfilesystemFileSystemPolicyDescription* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testPutLifecycleConfiguration {
    NSString *key = @"testPutLifecycleConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] putLifecycleConfiguration:[AWSelasticfilesystemPutLifecycleConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testPutLifecycleConfigurationCompletionHandler {
    NSString *key = @"testPutLifecycleConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] putLifecycleConfiguration:[AWSelasticfilesystemPutLifecycleConfigurationRequest new] completionHandler:^(AWSelasticfilesystemLifecycleConfigurationDescription* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] tagResource:[AWSelasticfilesystemTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] tagResource:[AWSelasticfilesystemTagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] untagResource:[AWSelasticfilesystemUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] untagResource:[AWSelasticfilesystemUntagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testUpdateFileSystem {
    NSString *key = @"testUpdateFileSystem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSelasticfilesystem elasticfilesystemForKey:key] updateFileSystem:[AWSelasticfilesystemUpdateFileSystemRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

- (void)testUpdateFileSystemCompletionHandler {
    NSString *key = @"testUpdateFileSystem";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSelasticfilesystem registerelasticfilesystemWithConfiguration:configuration forKey:key];

    AWSelasticfilesystem *awsClient = [AWSelasticfilesystem elasticfilesystemForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSelasticfilesystem elasticfilesystemForKey:key] updateFileSystem:[AWSelasticfilesystemUpdateFileSystemRequest new] completionHandler:^(AWSelasticfilesystemFileSystemDescription* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSelasticfilesystem removeelasticfilesystemForKey:key];
}

@end
