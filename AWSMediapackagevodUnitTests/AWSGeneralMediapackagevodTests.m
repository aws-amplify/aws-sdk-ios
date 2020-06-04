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
#import "AWSMediapackagevodService.h"

static id mockNetworking = nil;

@interface AWSGeneralMediapackagevodTests : XCTestCase

@end

@implementation AWSGeneralMediapackagevodTests

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
    NSString *key = @"testMediapackagevodConstructors";
    XCTAssertNotNil([AWSMediapackagevod defaultMediapackagevod]);
    XCTAssertEqual([[AWSMediapackagevod defaultMediapackagevod] class], [AWSMediapackagevod class]);
    XCTAssertNil([AWSMediapackagevod MediapackagevodForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSMediapackagevod MediapackagevodForKey:key]);
    XCTAssertEqual([[AWSMediapackagevod MediapackagevodForKey:key] class], [AWSMediapackagevod class]);
    XCTAssertEqual([AWSMediapackagevod MediapackagevodForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
    XCTAssertNil([AWSMediapackagevod MediapackagevodForKey:key]);

}

- (void)testCreateAsset {
    NSString *key = @"testCreateAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] createAsset:[AWSMediapackagevodCreateAssetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testCreateAssetCompletionHandler {
    NSString *key = @"testCreateAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] createAsset:[AWSMediapackagevodCreateAssetRequest new] completionHandler:^(AWSMediapackagevodCreateAssetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testCreatePackagingConfiguration {
    NSString *key = @"testCreatePackagingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] createPackagingConfiguration:[AWSMediapackagevodCreatePackagingConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testCreatePackagingConfigurationCompletionHandler {
    NSString *key = @"testCreatePackagingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] createPackagingConfiguration:[AWSMediapackagevodCreatePackagingConfigurationRequest new] completionHandler:^(AWSMediapackagevodCreatePackagingConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testCreatePackagingGroup {
    NSString *key = @"testCreatePackagingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] createPackagingGroup:[AWSMediapackagevodCreatePackagingGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testCreatePackagingGroupCompletionHandler {
    NSString *key = @"testCreatePackagingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] createPackagingGroup:[AWSMediapackagevodCreatePackagingGroupRequest new] completionHandler:^(AWSMediapackagevodCreatePackagingGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testDeleteAsset {
    NSString *key = @"testDeleteAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] deleteAsset:[AWSMediapackagevodDeleteAssetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testDeleteAssetCompletionHandler {
    NSString *key = @"testDeleteAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] deleteAsset:[AWSMediapackagevodDeleteAssetRequest new] completionHandler:^(AWSMediapackagevodDeleteAssetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testDeletePackagingConfiguration {
    NSString *key = @"testDeletePackagingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] deletePackagingConfiguration:[AWSMediapackagevodDeletePackagingConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testDeletePackagingConfigurationCompletionHandler {
    NSString *key = @"testDeletePackagingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] deletePackagingConfiguration:[AWSMediapackagevodDeletePackagingConfigurationRequest new] completionHandler:^(AWSMediapackagevodDeletePackagingConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testDeletePackagingGroup {
    NSString *key = @"testDeletePackagingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] deletePackagingGroup:[AWSMediapackagevodDeletePackagingGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testDeletePackagingGroupCompletionHandler {
    NSString *key = @"testDeletePackagingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] deletePackagingGroup:[AWSMediapackagevodDeletePackagingGroupRequest new] completionHandler:^(AWSMediapackagevodDeletePackagingGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testDescribeAsset {
    NSString *key = @"testDescribeAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] describeAsset:[AWSMediapackagevodDescribeAssetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testDescribeAssetCompletionHandler {
    NSString *key = @"testDescribeAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] describeAsset:[AWSMediapackagevodDescribeAssetRequest new] completionHandler:^(AWSMediapackagevodDescribeAssetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testDescribePackagingConfiguration {
    NSString *key = @"testDescribePackagingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] describePackagingConfiguration:[AWSMediapackagevodDescribePackagingConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testDescribePackagingConfigurationCompletionHandler {
    NSString *key = @"testDescribePackagingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] describePackagingConfiguration:[AWSMediapackagevodDescribePackagingConfigurationRequest new] completionHandler:^(AWSMediapackagevodDescribePackagingConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testDescribePackagingGroup {
    NSString *key = @"testDescribePackagingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] describePackagingGroup:[AWSMediapackagevodDescribePackagingGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testDescribePackagingGroupCompletionHandler {
    NSString *key = @"testDescribePackagingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] describePackagingGroup:[AWSMediapackagevodDescribePackagingGroupRequest new] completionHandler:^(AWSMediapackagevodDescribePackagingGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testListAssets {
    NSString *key = @"testListAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] listAssets:[AWSMediapackagevodListAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testListAssetsCompletionHandler {
    NSString *key = @"testListAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] listAssets:[AWSMediapackagevodListAssetsRequest new] completionHandler:^(AWSMediapackagevodListAssetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testListPackagingConfigurations {
    NSString *key = @"testListPackagingConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] listPackagingConfigurations:[AWSMediapackagevodListPackagingConfigurationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testListPackagingConfigurationsCompletionHandler {
    NSString *key = @"testListPackagingConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] listPackagingConfigurations:[AWSMediapackagevodListPackagingConfigurationsRequest new] completionHandler:^(AWSMediapackagevodListPackagingConfigurationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testListPackagingGroups {
    NSString *key = @"testListPackagingGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] listPackagingGroups:[AWSMediapackagevodListPackagingGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testListPackagingGroupsCompletionHandler {
    NSString *key = @"testListPackagingGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] listPackagingGroups:[AWSMediapackagevodListPackagingGroupsRequest new] completionHandler:^(AWSMediapackagevodListPackagingGroupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] listTagsForResource:[AWSMediapackagevodListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] listTagsForResource:[AWSMediapackagevodListTagsForResourceRequest new] completionHandler:^(AWSMediapackagevodListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] tagResource:[AWSMediapackagevodTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] tagResource:[AWSMediapackagevodTagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] untagResource:[AWSMediapackagevodUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] untagResource:[AWSMediapackagevodUntagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testUpdatePackagingGroup {
    NSString *key = @"testUpdatePackagingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSMediapackagevod MediapackagevodForKey:key] updatePackagingGroup:[AWSMediapackagevodUpdatePackagingGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

- (void)testUpdatePackagingGroupCompletionHandler {
    NSString *key = @"testUpdatePackagingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSMediapackagevod registerMediapackagevodWithConfiguration:configuration forKey:key];

    AWSMediapackagevod *awsClient = [AWSMediapackagevod MediapackagevodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSMediapackagevod MediapackagevodForKey:key] updatePackagingGroup:[AWSMediapackagevodUpdatePackagingGroupRequest new] completionHandler:^(AWSMediapackagevodUpdatePackagingGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSMediapackagevod removeMediapackagevodForKey:key];
}

@end
