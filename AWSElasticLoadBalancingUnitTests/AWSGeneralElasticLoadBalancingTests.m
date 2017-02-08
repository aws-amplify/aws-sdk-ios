//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AWSElasticLoadBalancingService.h"

static id mockNetworking = nil;

@interface AWSGeneralElasticLoadBalancingTests : XCTestCase

@end

@implementation AWSGeneralElasticLoadBalancingTests

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
    NSString *key = @"testElasticLoadBalancingConstructors";
    XCTAssertNotNil([AWSElasticLoadBalancing defaultElasticLoadBalancing]);
    XCTAssertEqual([[AWSElasticLoadBalancing defaultElasticLoadBalancing] class], [AWSElasticLoadBalancing class]);
    XCTAssertNil([AWSElasticLoadBalancing ElasticLoadBalancingForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSElasticLoadBalancing ElasticLoadBalancingForKey:key]);
    XCTAssertEqual([[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] class], [AWSElasticLoadBalancing class]);
    XCTAssertEqual([AWSElasticLoadBalancing ElasticLoadBalancingForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
    XCTAssertNil([AWSElasticLoadBalancing ElasticLoadBalancingForKey:key]);

}

- (void)testAddTags {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] addTags:[AWSElasticLoadBalancingAddTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testAddTagsCompletionHandler {
    NSString *key = @"testAddTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] addTags:[AWSElasticLoadBalancingAddTagsInput new] completionHandler:^(AWSElasticLoadBalancingAddTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testApplySecurityGroupsToLoadBalancer {
    NSString *key = @"testApplySecurityGroupsToLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] applySecurityGroupsToLoadBalancer:[AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testApplySecurityGroupsToLoadBalancerCompletionHandler {
    NSString *key = @"testApplySecurityGroupsToLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] applySecurityGroupsToLoadBalancer:[AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput new] completionHandler:^(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testAttachLoadBalancerToSubnets {
    NSString *key = @"testAttachLoadBalancerToSubnets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] attachLoadBalancerToSubnets:[AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testAttachLoadBalancerToSubnetsCompletionHandler {
    NSString *key = @"testAttachLoadBalancerToSubnets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] attachLoadBalancerToSubnets:[AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput new] completionHandler:^(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testConfigureHealthCheck {
    NSString *key = @"testConfigureHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] configureHealthCheck:[AWSElasticLoadBalancingConfigureHealthCheckInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testConfigureHealthCheckCompletionHandler {
    NSString *key = @"testConfigureHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] configureHealthCheck:[AWSElasticLoadBalancingConfigureHealthCheckInput new] completionHandler:^(AWSElasticLoadBalancingConfigureHealthCheckOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateAppCookieStickinessPolicy {
    NSString *key = @"testCreateAppCookieStickinessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createAppCookieStickinessPolicy:[AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateAppCookieStickinessPolicyCompletionHandler {
    NSString *key = @"testCreateAppCookieStickinessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createAppCookieStickinessPolicy:[AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput new] completionHandler:^(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLBCookieStickinessPolicy {
    NSString *key = @"testCreateLBCookieStickinessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLBCookieStickinessPolicy:[AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLBCookieStickinessPolicyCompletionHandler {
    NSString *key = @"testCreateLBCookieStickinessPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLBCookieStickinessPolicy:[AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput new] completionHandler:^(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLoadBalancer {
    NSString *key = @"testCreateLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLoadBalancer:[AWSElasticLoadBalancingCreateAccessPointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLoadBalancerCompletionHandler {
    NSString *key = @"testCreateLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLoadBalancer:[AWSElasticLoadBalancingCreateAccessPointInput new] completionHandler:^(AWSElasticLoadBalancingCreateAccessPointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLoadBalancerListeners {
    NSString *key = @"testCreateLoadBalancerListeners";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLoadBalancerListeners:[AWSElasticLoadBalancingCreateLoadBalancerListenerInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLoadBalancerListenersCompletionHandler {
    NSString *key = @"testCreateLoadBalancerListeners";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLoadBalancerListeners:[AWSElasticLoadBalancingCreateLoadBalancerListenerInput new] completionHandler:^(AWSElasticLoadBalancingCreateLoadBalancerListenerOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLoadBalancerPolicy {
    NSString *key = @"testCreateLoadBalancerPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLoadBalancerPolicy:[AWSElasticLoadBalancingCreateLoadBalancerPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateLoadBalancerPolicyCompletionHandler {
    NSString *key = @"testCreateLoadBalancerPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLoadBalancerPolicy:[AWSElasticLoadBalancingCreateLoadBalancerPolicyInput new] completionHandler:^(AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteLoadBalancer {
    NSString *key = @"testDeleteLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteLoadBalancer:[AWSElasticLoadBalancingDeleteAccessPointInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteLoadBalancerCompletionHandler {
    NSString *key = @"testDeleteLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteLoadBalancer:[AWSElasticLoadBalancingDeleteAccessPointInput new] completionHandler:^(AWSElasticLoadBalancingDeleteAccessPointOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteLoadBalancerListeners {
    NSString *key = @"testDeleteLoadBalancerListeners";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteLoadBalancerListeners:[AWSElasticLoadBalancingDeleteLoadBalancerListenerInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteLoadBalancerListenersCompletionHandler {
    NSString *key = @"testDeleteLoadBalancerListeners";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteLoadBalancerListeners:[AWSElasticLoadBalancingDeleteLoadBalancerListenerInput new] completionHandler:^(AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteLoadBalancerPolicy {
    NSString *key = @"testDeleteLoadBalancerPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteLoadBalancerPolicy:[AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteLoadBalancerPolicyCompletionHandler {
    NSString *key = @"testDeleteLoadBalancerPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteLoadBalancerPolicy:[AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput new] completionHandler:^(AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeregisterInstancesFromLoadBalancer {
    NSString *key = @"testDeregisterInstancesFromLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deregisterInstancesFromLoadBalancer:[AWSElasticLoadBalancingDeregisterEndPointsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeregisterInstancesFromLoadBalancerCompletionHandler {
    NSString *key = @"testDeregisterInstancesFromLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deregisterInstancesFromLoadBalancer:[AWSElasticLoadBalancingDeregisterEndPointsInput new] completionHandler:^(AWSElasticLoadBalancingDeregisterEndPointsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeInstanceHealth {
    NSString *key = @"testDescribeInstanceHealth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeInstanceHealth:[AWSElasticLoadBalancingDescribeEndPointStateInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeInstanceHealthCompletionHandler {
    NSString *key = @"testDescribeInstanceHealth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeInstanceHealth:[AWSElasticLoadBalancingDescribeEndPointStateInput new] completionHandler:^(AWSElasticLoadBalancingDescribeEndPointStateOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancerAttributes {
    NSString *key = @"testDescribeLoadBalancerAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancerAttributes:[AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancerAttributesCompletionHandler {
    NSString *key = @"testDescribeLoadBalancerAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancerAttributes:[AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput new] completionHandler:^(AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancerPolicies {
    NSString *key = @"testDescribeLoadBalancerPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancerPolicies:[AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancerPoliciesCompletionHandler {
    NSString *key = @"testDescribeLoadBalancerPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancerPolicies:[AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput new] completionHandler:^(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancerPolicyTypes {
    NSString *key = @"testDescribeLoadBalancerPolicyTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancerPolicyTypes:[AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancerPolicyTypesCompletionHandler {
    NSString *key = @"testDescribeLoadBalancerPolicyTypes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancerPolicyTypes:[AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput new] completionHandler:^(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancers {
    NSString *key = @"testDescribeLoadBalancers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancers:[AWSElasticLoadBalancingDescribeAccessPointsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeLoadBalancersCompletionHandler {
    NSString *key = @"testDescribeLoadBalancers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancers:[AWSElasticLoadBalancingDescribeAccessPointsInput new] completionHandler:^(AWSElasticLoadBalancingDescribeAccessPointsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeTags {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTags:[AWSElasticLoadBalancingDescribeTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeTagsCompletionHandler {
    NSString *key = @"testDescribeTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTags:[AWSElasticLoadBalancingDescribeTagsInput new] completionHandler:^(AWSElasticLoadBalancingDescribeTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDetachLoadBalancerFromSubnets {
    NSString *key = @"testDetachLoadBalancerFromSubnets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] detachLoadBalancerFromSubnets:[AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDetachLoadBalancerFromSubnetsCompletionHandler {
    NSString *key = @"testDetachLoadBalancerFromSubnets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] detachLoadBalancerFromSubnets:[AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput new] completionHandler:^(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDisableAvailabilityZonesForLoadBalancer {
    NSString *key = @"testDisableAvailabilityZonesForLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] disableAvailabilityZonesForLoadBalancer:[AWSElasticLoadBalancingRemoveAvailabilityZonesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDisableAvailabilityZonesForLoadBalancerCompletionHandler {
    NSString *key = @"testDisableAvailabilityZonesForLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] disableAvailabilityZonesForLoadBalancer:[AWSElasticLoadBalancingRemoveAvailabilityZonesInput new] completionHandler:^(AWSElasticLoadBalancingRemoveAvailabilityZonesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testEnableAvailabilityZonesForLoadBalancer {
    NSString *key = @"testEnableAvailabilityZonesForLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] enableAvailabilityZonesForLoadBalancer:[AWSElasticLoadBalancingAddAvailabilityZonesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testEnableAvailabilityZonesForLoadBalancerCompletionHandler {
    NSString *key = @"testEnableAvailabilityZonesForLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] enableAvailabilityZonesForLoadBalancer:[AWSElasticLoadBalancingAddAvailabilityZonesInput new] completionHandler:^(AWSElasticLoadBalancingAddAvailabilityZonesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testModifyLoadBalancerAttributes {
    NSString *key = @"testModifyLoadBalancerAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] modifyLoadBalancerAttributes:[AWSElasticLoadBalancingModifyLoadBalancerAttributesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testModifyLoadBalancerAttributesCompletionHandler {
    NSString *key = @"testModifyLoadBalancerAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] modifyLoadBalancerAttributes:[AWSElasticLoadBalancingModifyLoadBalancerAttributesInput new] completionHandler:^(AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testRegisterInstancesWithLoadBalancer {
    NSString *key = @"testRegisterInstancesWithLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] registerInstancesWithLoadBalancer:[AWSElasticLoadBalancingRegisterEndPointsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testRegisterInstancesWithLoadBalancerCompletionHandler {
    NSString *key = @"testRegisterInstancesWithLoadBalancer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] registerInstancesWithLoadBalancer:[AWSElasticLoadBalancingRegisterEndPointsInput new] completionHandler:^(AWSElasticLoadBalancingRegisterEndPointsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testRemoveTags {
    NSString *key = @"testRemoveTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] removeTags:[AWSElasticLoadBalancingRemoveTagsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testRemoveTagsCompletionHandler {
    NSString *key = @"testRemoveTags";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] removeTags:[AWSElasticLoadBalancingRemoveTagsInput new] completionHandler:^(AWSElasticLoadBalancingRemoveTagsOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetLoadBalancerListenerSSLCertificate {
    NSString *key = @"testSetLoadBalancerListenerSSLCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setLoadBalancerListenerSSLCertificate:[AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetLoadBalancerListenerSSLCertificateCompletionHandler {
    NSString *key = @"testSetLoadBalancerListenerSSLCertificate";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setLoadBalancerListenerSSLCertificate:[AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput new] completionHandler:^(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetLoadBalancerPoliciesForBackendServer {
    NSString *key = @"testSetLoadBalancerPoliciesForBackendServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setLoadBalancerPoliciesForBackendServer:[AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetLoadBalancerPoliciesForBackendServerCompletionHandler {
    NSString *key = @"testSetLoadBalancerPoliciesForBackendServer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setLoadBalancerPoliciesForBackendServer:[AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput new] completionHandler:^(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetLoadBalancerPoliciesOfListener {
    NSString *key = @"testSetLoadBalancerPoliciesOfListener";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setLoadBalancerPoliciesOfListener:[AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetLoadBalancerPoliciesOfListenerCompletionHandler {
    NSString *key = @"testSetLoadBalancerPoliciesOfListener";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setLoadBalancerPoliciesOfListener:[AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput new] completionHandler:^(AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

@end
