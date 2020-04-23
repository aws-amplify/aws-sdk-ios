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
#import "AWSmediapackage-vodService.h"

static id mockNetworking = nil;

@interface AWSGeneralmediapackage-vodTests : XCTestCase

@end

@implementation AWSGeneralmediapackage-vodTests

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
    NSString *key = @"testmediapackage-vodConstructors";
    XCTAssertNotNil([AWSmediapackage-vod defaultmediapackage-vod]);
    XCTAssertEqual([[AWSmediapackage-vod defaultmediapackage-vod] class], [AWSmediapackage-vod class]);
    XCTAssertNil([AWSmediapackage-vod mediapackage-vodForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSmediapackage-vod mediapackage-vodForKey:key]);
    XCTAssertEqual([[AWSmediapackage-vod mediapackage-vodForKey:key] class], [AWSmediapackage-vod class]);
    XCTAssertEqual([AWSmediapackage-vod mediapackage-vodForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
    XCTAssertNil([AWSmediapackage-vod mediapackage-vodForKey:key]);

}

- (void)testCreateAsset {
    NSString *key = @"testCreateAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] createAsset:[AWSmediapackage-vodCreateAssetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testCreateAssetCompletionHandler {
    NSString *key = @"testCreateAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] createAsset:[AWSmediapackage-vodCreateAssetRequest new] completionHandler:^(AWSmediapackage-vodCreateAssetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testCreatePackagingConfiguration {
    NSString *key = @"testCreatePackagingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] createPackagingConfiguration:[AWSmediapackage-vodCreatePackagingConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testCreatePackagingConfigurationCompletionHandler {
    NSString *key = @"testCreatePackagingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] createPackagingConfiguration:[AWSmediapackage-vodCreatePackagingConfigurationRequest new] completionHandler:^(AWSmediapackage-vodCreatePackagingConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testCreatePackagingGroup {
    NSString *key = @"testCreatePackagingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] createPackagingGroup:[AWSmediapackage-vodCreatePackagingGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testCreatePackagingGroupCompletionHandler {
    NSString *key = @"testCreatePackagingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] createPackagingGroup:[AWSmediapackage-vodCreatePackagingGroupRequest new] completionHandler:^(AWSmediapackage-vodCreatePackagingGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testDeleteAsset {
    NSString *key = @"testDeleteAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] deleteAsset:[AWSmediapackage-vodDeleteAssetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testDeleteAssetCompletionHandler {
    NSString *key = @"testDeleteAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] deleteAsset:[AWSmediapackage-vodDeleteAssetRequest new] completionHandler:^(AWSmediapackage-vodDeleteAssetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testDeletePackagingConfiguration {
    NSString *key = @"testDeletePackagingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] deletePackagingConfiguration:[AWSmediapackage-vodDeletePackagingConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testDeletePackagingConfigurationCompletionHandler {
    NSString *key = @"testDeletePackagingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] deletePackagingConfiguration:[AWSmediapackage-vodDeletePackagingConfigurationRequest new] completionHandler:^(AWSmediapackage-vodDeletePackagingConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testDeletePackagingGroup {
    NSString *key = @"testDeletePackagingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] deletePackagingGroup:[AWSmediapackage-vodDeletePackagingGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testDeletePackagingGroupCompletionHandler {
    NSString *key = @"testDeletePackagingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] deletePackagingGroup:[AWSmediapackage-vodDeletePackagingGroupRequest new] completionHandler:^(AWSmediapackage-vodDeletePackagingGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testDescribeAsset {
    NSString *key = @"testDescribeAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] describeAsset:[AWSmediapackage-vodDescribeAssetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testDescribeAssetCompletionHandler {
    NSString *key = @"testDescribeAsset";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] describeAsset:[AWSmediapackage-vodDescribeAssetRequest new] completionHandler:^(AWSmediapackage-vodDescribeAssetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testDescribePackagingConfiguration {
    NSString *key = @"testDescribePackagingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] describePackagingConfiguration:[AWSmediapackage-vodDescribePackagingConfigurationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testDescribePackagingConfigurationCompletionHandler {
    NSString *key = @"testDescribePackagingConfiguration";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] describePackagingConfiguration:[AWSmediapackage-vodDescribePackagingConfigurationRequest new] completionHandler:^(AWSmediapackage-vodDescribePackagingConfigurationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testDescribePackagingGroup {
    NSString *key = @"testDescribePackagingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] describePackagingGroup:[AWSmediapackage-vodDescribePackagingGroupRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testDescribePackagingGroupCompletionHandler {
    NSString *key = @"testDescribePackagingGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] describePackagingGroup:[AWSmediapackage-vodDescribePackagingGroupRequest new] completionHandler:^(AWSmediapackage-vodDescribePackagingGroupResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testListAssets {
    NSString *key = @"testListAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] listAssets:[AWSmediapackage-vodListAssetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testListAssetsCompletionHandler {
    NSString *key = @"testListAssets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] listAssets:[AWSmediapackage-vodListAssetsRequest new] completionHandler:^(AWSmediapackage-vodListAssetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testListPackagingConfigurations {
    NSString *key = @"testListPackagingConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] listPackagingConfigurations:[AWSmediapackage-vodListPackagingConfigurationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testListPackagingConfigurationsCompletionHandler {
    NSString *key = @"testListPackagingConfigurations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] listPackagingConfigurations:[AWSmediapackage-vodListPackagingConfigurationsRequest new] completionHandler:^(AWSmediapackage-vodListPackagingConfigurationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testListPackagingGroups {
    NSString *key = @"testListPackagingGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] listPackagingGroups:[AWSmediapackage-vodListPackagingGroupsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testListPackagingGroupsCompletionHandler {
    NSString *key = @"testListPackagingGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] listPackagingGroups:[AWSmediapackage-vodListPackagingGroupsRequest new] completionHandler:^(AWSmediapackage-vodListPackagingGroupsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] listTagsForResource:[AWSmediapackage-vodListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] listTagsForResource:[AWSmediapackage-vodListTagsForResourceRequest new] completionHandler:^(AWSmediapackage-vodListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testTagResource {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] tagResource:[AWSmediapackage-vodTagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testTagResourceCompletionHandler {
    NSString *key = @"testTagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] tagResource:[AWSmediapackage-vodTagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testUntagResource {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSmediapackage-vod mediapackage-vodForKey:key] untagResource:[AWSmediapackage-vodUntagResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

- (void)testUntagResourceCompletionHandler {
    NSString *key = @"testUntagResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSmediapackage-vod registermediapackage-vodWithConfiguration:configuration forKey:key];

    AWSmediapackage-vod *awsClient = [AWSmediapackage-vod mediapackage-vodForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSmediapackage-vod mediapackage-vodForKey:key] untagResource:[AWSmediapackage-vodUntagResourceRequest new] completionHandler:^(NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSmediapackage-vod removemediapackage-vodForKey:key];
}

@end
