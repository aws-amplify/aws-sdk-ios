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
#import "AWSResourceGroupsTaggingAPIService.h"

static id mockNetworking = nil;

@interface AWSGeneralResourceGroupsTaggingAPITests : XCTestCase

@end

@implementation AWSGeneralResourceGroupsTaggingAPITests

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
    NSString *key = @"testResourceGroupsTaggingAPIConstructors";
    XCTAssertNotNil([AWSResourceGroupsTaggingAPI defaultResourceGroupsTaggingAPI]);
    XCTAssertEqual([[AWSResourceGroupsTaggingAPI defaultResourceGroupsTaggingAPI] class], [AWSResourceGroupsTaggingAPI class]);
    XCTAssertNil([AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key]);
    XCTAssertEqual([[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] class], [AWSResourceGroupsTaggingAPI class]);
    XCTAssertEqual([AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
    XCTAssertNil([AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key]);

}

- (void)testDescribeReportCreation {
    NSString *key = @"testDescribeReportCreation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] describeReportCreation:[AWSResourceGroupsTaggingAPIDescribeReportCreationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testDescribeReportCreationCompletionHandler {
    NSString *key = @"testDescribeReportCreation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] describeReportCreation:[AWSResourceGroupsTaggingAPIDescribeReportCreationInput new] completionHandler:^(AWSResourceGroupsTaggingAPIDescribeReportCreationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testGetComplianceSummary {
    NSString *key = @"testGetComplianceSummary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] getComplianceSummary:[AWSResourceGroupsTaggingAPIGetComplianceSummaryInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testGetComplianceSummaryCompletionHandler {
    NSString *key = @"testGetComplianceSummary";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] getComplianceSummary:[AWSResourceGroupsTaggingAPIGetComplianceSummaryInput new] completionHandler:^(AWSResourceGroupsTaggingAPIGetComplianceSummaryOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testGetResources {
    NSString *key = @"testGetResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] getResources:[AWSResourceGroupsTaggingAPIGetResourcesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testGetResourcesCompletionHandler {
    NSString *key = @"testGetResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] getResources:[AWSResourceGroupsTaggingAPIGetResourcesInput new] completionHandler:^(AWSResourceGroupsTaggingAPIGetResourcesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testGetTagKeys {
    NSString *key = @"testGetTagKeys";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] getTagKeys:[AWSResourceGroupsTaggingAPIGetTagKeysInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testGetTagKeysCompletionHandler {
    NSString *key = @"testGetTagKeys";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] getTagKeys:[AWSResourceGroupsTaggingAPIGetTagKeysInput new] completionHandler:^(AWSResourceGroupsTaggingAPIGetTagKeysOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testGetTagValues {
    NSString *key = @"testGetTagValues";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] getTagValues:[AWSResourceGroupsTaggingAPIGetTagValuesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testGetTagValuesCompletionHandler {
    NSString *key = @"testGetTagValues";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] getTagValues:[AWSResourceGroupsTaggingAPIGetTagValuesInput new] completionHandler:^(AWSResourceGroupsTaggingAPIGetTagValuesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testStartReportCreation {
    NSString *key = @"testStartReportCreation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] startReportCreation:[AWSResourceGroupsTaggingAPIStartReportCreationInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testStartReportCreationCompletionHandler {
    NSString *key = @"testStartReportCreation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] startReportCreation:[AWSResourceGroupsTaggingAPIStartReportCreationInput new] completionHandler:^(AWSResourceGroupsTaggingAPIStartReportCreationOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testTagResources {
    NSString *key = @"testTagResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] tagResources:[AWSResourceGroupsTaggingAPITagResourcesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testTagResourcesCompletionHandler {
    NSString *key = @"testTagResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] tagResources:[AWSResourceGroupsTaggingAPITagResourcesInput new] completionHandler:^(AWSResourceGroupsTaggingAPITagResourcesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testUntagResources {
    NSString *key = @"testUntagResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] untagResources:[AWSResourceGroupsTaggingAPIUntagResourcesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

- (void)testUntagResourcesCompletionHandler {
    NSString *key = @"testUntagResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:configuration forKey:key];

    AWSResourceGroupsTaggingAPI *awsClient = [AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSResourceGroupsTaggingAPI ResourceGroupsTaggingAPIForKey:key] untagResources:[AWSResourceGroupsTaggingAPIUntagResourcesInput new] completionHandler:^(AWSResourceGroupsTaggingAPIUntagResourcesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSResourceGroupsTaggingAPI removeResourceGroupsTaggingAPIForKey:key];
}

@end
