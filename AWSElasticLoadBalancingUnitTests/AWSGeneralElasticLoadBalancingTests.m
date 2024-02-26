//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

- (void)testAddListenerCertificates {
    NSString *key = @"testAddListenerCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] addListenerCertificates:[AWSElasticLoadBalancingAddListenerCertificatesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testAddListenerCertificatesCompletionHandler {
    NSString *key = @"testAddListenerCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] addListenerCertificates:[AWSElasticLoadBalancingAddListenerCertificatesInput new] completionHandler:^(AWSElasticLoadBalancingAddListenerCertificatesOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testAddTrustStoreRevocations {
    NSString *key = @"testAddTrustStoreRevocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] addTrustStoreRevocations:[AWSElasticLoadBalancingAddTrustStoreRevocationsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testAddTrustStoreRevocationsCompletionHandler {
    NSString *key = @"testAddTrustStoreRevocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] addTrustStoreRevocations:[AWSElasticLoadBalancingAddTrustStoreRevocationsInput new] completionHandler:^(AWSElasticLoadBalancingAddTrustStoreRevocationsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testCreateListener {
    NSString *key = @"testCreateListener";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createListener:[AWSElasticLoadBalancingCreateListenerInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateListenerCompletionHandler {
    NSString *key = @"testCreateListener";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createListener:[AWSElasticLoadBalancingCreateListenerInput new] completionHandler:^(AWSElasticLoadBalancingCreateListenerOutput* _Nullable response, NSError * _Nullable error) {
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
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLoadBalancer:[AWSElasticLoadBalancingCreateLoadBalancerInput new]] continueWithBlock:^id(AWSTask *task) {
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

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createLoadBalancer:[AWSElasticLoadBalancingCreateLoadBalancerInput new] completionHandler:^(AWSElasticLoadBalancingCreateLoadBalancerOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testCreateRule {
    NSString *key = @"testCreateRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createRule:[AWSElasticLoadBalancingCreateRuleInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateRuleCompletionHandler {
    NSString *key = @"testCreateRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createRule:[AWSElasticLoadBalancingCreateRuleInput new] completionHandler:^(AWSElasticLoadBalancingCreateRuleOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testCreateTargetGroup {
    NSString *key = @"testCreateTargetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createTargetGroup:[AWSElasticLoadBalancingCreateTargetGroupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateTargetGroupCompletionHandler {
    NSString *key = @"testCreateTargetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createTargetGroup:[AWSElasticLoadBalancingCreateTargetGroupInput new] completionHandler:^(AWSElasticLoadBalancingCreateTargetGroupOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testCreateTrustStore {
    NSString *key = @"testCreateTrustStore";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createTrustStore:[AWSElasticLoadBalancingCreateTrustStoreInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testCreateTrustStoreCompletionHandler {
    NSString *key = @"testCreateTrustStore";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] createTrustStore:[AWSElasticLoadBalancingCreateTrustStoreInput new] completionHandler:^(AWSElasticLoadBalancingCreateTrustStoreOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDeleteListener {
    NSString *key = @"testDeleteListener";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteListener:[AWSElasticLoadBalancingDeleteListenerInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteListenerCompletionHandler {
    NSString *key = @"testDeleteListener";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteListener:[AWSElasticLoadBalancingDeleteListenerInput new] completionHandler:^(AWSElasticLoadBalancingDeleteListenerOutput* _Nullable response, NSError * _Nullable error) {
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
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteLoadBalancer:[AWSElasticLoadBalancingDeleteLoadBalancerInput new]] continueWithBlock:^id(AWSTask *task) {
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

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteLoadBalancer:[AWSElasticLoadBalancingDeleteLoadBalancerInput new] completionHandler:^(AWSElasticLoadBalancingDeleteLoadBalancerOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDeleteRule {
    NSString *key = @"testDeleteRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteRule:[AWSElasticLoadBalancingDeleteRuleInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteRuleCompletionHandler {
    NSString *key = @"testDeleteRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteRule:[AWSElasticLoadBalancingDeleteRuleInput new] completionHandler:^(AWSElasticLoadBalancingDeleteRuleOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDeleteTargetGroup {
    NSString *key = @"testDeleteTargetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteTargetGroup:[AWSElasticLoadBalancingDeleteTargetGroupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteTargetGroupCompletionHandler {
    NSString *key = @"testDeleteTargetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteTargetGroup:[AWSElasticLoadBalancingDeleteTargetGroupInput new] completionHandler:^(AWSElasticLoadBalancingDeleteTargetGroupOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDeleteTrustStore {
    NSString *key = @"testDeleteTrustStore";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteTrustStore:[AWSElasticLoadBalancingDeleteTrustStoreInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeleteTrustStoreCompletionHandler {
    NSString *key = @"testDeleteTrustStore";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deleteTrustStore:[AWSElasticLoadBalancingDeleteTrustStoreInput new] completionHandler:^(AWSElasticLoadBalancingDeleteTrustStoreOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDeregisterTargets {
    NSString *key = @"testDeregisterTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deregisterTargets:[AWSElasticLoadBalancingDeregisterTargetsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDeregisterTargetsCompletionHandler {
    NSString *key = @"testDeregisterTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] deregisterTargets:[AWSElasticLoadBalancingDeregisterTargetsInput new] completionHandler:^(AWSElasticLoadBalancingDeregisterTargetsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeAccountLimits {
    NSString *key = @"testDescribeAccountLimits";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeAccountLimits:[AWSElasticLoadBalancingDescribeAccountLimitsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeAccountLimitsCompletionHandler {
    NSString *key = @"testDescribeAccountLimits";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeAccountLimits:[AWSElasticLoadBalancingDescribeAccountLimitsInput new] completionHandler:^(AWSElasticLoadBalancingDescribeAccountLimitsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeListenerCertificates {
    NSString *key = @"testDescribeListenerCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeListenerCertificates:[AWSElasticLoadBalancingDescribeListenerCertificatesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeListenerCertificatesCompletionHandler {
    NSString *key = @"testDescribeListenerCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeListenerCertificates:[AWSElasticLoadBalancingDescribeListenerCertificatesInput new] completionHandler:^(AWSElasticLoadBalancingDescribeListenerCertificatesOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeListeners {
    NSString *key = @"testDescribeListeners";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeListeners:[AWSElasticLoadBalancingDescribeListenersInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeListenersCompletionHandler {
    NSString *key = @"testDescribeListeners";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeListeners:[AWSElasticLoadBalancingDescribeListenersInput new] completionHandler:^(AWSElasticLoadBalancingDescribeListenersOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeLoadBalancers {
    NSString *key = @"testDescribeLoadBalancers";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancers:[AWSElasticLoadBalancingDescribeLoadBalancersInput new]] continueWithBlock:^id(AWSTask *task) {
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

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeLoadBalancers:[AWSElasticLoadBalancingDescribeLoadBalancersInput new] completionHandler:^(AWSElasticLoadBalancingDescribeLoadBalancersOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeRules {
    NSString *key = @"testDescribeRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeRules:[AWSElasticLoadBalancingDescribeRulesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeRulesCompletionHandler {
    NSString *key = @"testDescribeRules";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeRules:[AWSElasticLoadBalancingDescribeRulesInput new] completionHandler:^(AWSElasticLoadBalancingDescribeRulesOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeSSLPolicies {
    NSString *key = @"testDescribeSSLPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeSSLPolicies:[AWSElasticLoadBalancingDescribeSSLPoliciesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeSSLPoliciesCompletionHandler {
    NSString *key = @"testDescribeSSLPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeSSLPolicies:[AWSElasticLoadBalancingDescribeSSLPoliciesInput new] completionHandler:^(AWSElasticLoadBalancingDescribeSSLPoliciesOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeTargetGroupAttributes {
    NSString *key = @"testDescribeTargetGroupAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTargetGroupAttributes:[AWSElasticLoadBalancingDescribeTargetGroupAttributesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeTargetGroupAttributesCompletionHandler {
    NSString *key = @"testDescribeTargetGroupAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTargetGroupAttributes:[AWSElasticLoadBalancingDescribeTargetGroupAttributesInput new] completionHandler:^(AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeTargetGroups {
    NSString *key = @"testDescribeTargetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTargetGroups:[AWSElasticLoadBalancingDescribeTargetGroupsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeTargetGroupsCompletionHandler {
    NSString *key = @"testDescribeTargetGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTargetGroups:[AWSElasticLoadBalancingDescribeTargetGroupsInput new] completionHandler:^(AWSElasticLoadBalancingDescribeTargetGroupsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeTargetHealth {
    NSString *key = @"testDescribeTargetHealth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTargetHealth:[AWSElasticLoadBalancingDescribeTargetHealthInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeTargetHealthCompletionHandler {
    NSString *key = @"testDescribeTargetHealth";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTargetHealth:[AWSElasticLoadBalancingDescribeTargetHealthInput new] completionHandler:^(AWSElasticLoadBalancingDescribeTargetHealthOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeTrustStoreAssociations {
    NSString *key = @"testDescribeTrustStoreAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTrustStoreAssociations:[AWSElasticLoadBalancingDescribeTrustStoreAssociationsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeTrustStoreAssociationsCompletionHandler {
    NSString *key = @"testDescribeTrustStoreAssociations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTrustStoreAssociations:[AWSElasticLoadBalancingDescribeTrustStoreAssociationsInput new] completionHandler:^(AWSElasticLoadBalancingDescribeTrustStoreAssociationsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeTrustStoreRevocations {
    NSString *key = @"testDescribeTrustStoreRevocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTrustStoreRevocations:[AWSElasticLoadBalancingDescribeTrustStoreRevocationsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeTrustStoreRevocationsCompletionHandler {
    NSString *key = @"testDescribeTrustStoreRevocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTrustStoreRevocations:[AWSElasticLoadBalancingDescribeTrustStoreRevocationsInput new] completionHandler:^(AWSElasticLoadBalancingDescribeTrustStoreRevocationsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testDescribeTrustStores {
    NSString *key = @"testDescribeTrustStores";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTrustStores:[AWSElasticLoadBalancingDescribeTrustStoresInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testDescribeTrustStoresCompletionHandler {
    NSString *key = @"testDescribeTrustStores";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] describeTrustStores:[AWSElasticLoadBalancingDescribeTrustStoresInput new] completionHandler:^(AWSElasticLoadBalancingDescribeTrustStoresOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testGetTrustStoreCaCertificatesBundle {
    NSString *key = @"testGetTrustStoreCaCertificatesBundle";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] getTrustStoreCaCertificatesBundle:[AWSElasticLoadBalancingGetTrustStoreCaCertificatesBundleInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testGetTrustStoreCaCertificatesBundleCompletionHandler {
    NSString *key = @"testGetTrustStoreCaCertificatesBundle";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] getTrustStoreCaCertificatesBundle:[AWSElasticLoadBalancingGetTrustStoreCaCertificatesBundleInput new] completionHandler:^(AWSElasticLoadBalancingGetTrustStoreCaCertificatesBundleOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testGetTrustStoreRevocationContent {
    NSString *key = @"testGetTrustStoreRevocationContent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] getTrustStoreRevocationContent:[AWSElasticLoadBalancingGetTrustStoreRevocationContentInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testGetTrustStoreRevocationContentCompletionHandler {
    NSString *key = @"testGetTrustStoreRevocationContent";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] getTrustStoreRevocationContent:[AWSElasticLoadBalancingGetTrustStoreRevocationContentInput new] completionHandler:^(AWSElasticLoadBalancingGetTrustStoreRevocationContentOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testModifyListener {
    NSString *key = @"testModifyListener";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] modifyListener:[AWSElasticLoadBalancingModifyListenerInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testModifyListenerCompletionHandler {
    NSString *key = @"testModifyListener";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] modifyListener:[AWSElasticLoadBalancingModifyListenerInput new] completionHandler:^(AWSElasticLoadBalancingModifyListenerOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testModifyRule {
    NSString *key = @"testModifyRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] modifyRule:[AWSElasticLoadBalancingModifyRuleInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testModifyRuleCompletionHandler {
    NSString *key = @"testModifyRule";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] modifyRule:[AWSElasticLoadBalancingModifyRuleInput new] completionHandler:^(AWSElasticLoadBalancingModifyRuleOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testModifyTargetGroup {
    NSString *key = @"testModifyTargetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] modifyTargetGroup:[AWSElasticLoadBalancingModifyTargetGroupInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testModifyTargetGroupCompletionHandler {
    NSString *key = @"testModifyTargetGroup";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] modifyTargetGroup:[AWSElasticLoadBalancingModifyTargetGroupInput new] completionHandler:^(AWSElasticLoadBalancingModifyTargetGroupOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testModifyTargetGroupAttributes {
    NSString *key = @"testModifyTargetGroupAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] modifyTargetGroupAttributes:[AWSElasticLoadBalancingModifyTargetGroupAttributesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testModifyTargetGroupAttributesCompletionHandler {
    NSString *key = @"testModifyTargetGroupAttributes";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] modifyTargetGroupAttributes:[AWSElasticLoadBalancingModifyTargetGroupAttributesInput new] completionHandler:^(AWSElasticLoadBalancingModifyTargetGroupAttributesOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testModifyTrustStore {
    NSString *key = @"testModifyTrustStore";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] modifyTrustStore:[AWSElasticLoadBalancingModifyTrustStoreInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testModifyTrustStoreCompletionHandler {
    NSString *key = @"testModifyTrustStore";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] modifyTrustStore:[AWSElasticLoadBalancingModifyTrustStoreInput new] completionHandler:^(AWSElasticLoadBalancingModifyTrustStoreOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testRegisterTargets {
    NSString *key = @"testRegisterTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] registerTargets:[AWSElasticLoadBalancingRegisterTargetsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testRegisterTargetsCompletionHandler {
    NSString *key = @"testRegisterTargets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] registerTargets:[AWSElasticLoadBalancingRegisterTargetsInput new] completionHandler:^(AWSElasticLoadBalancingRegisterTargetsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testRemoveListenerCertificates {
    NSString *key = @"testRemoveListenerCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] removeListenerCertificates:[AWSElasticLoadBalancingRemoveListenerCertificatesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testRemoveListenerCertificatesCompletionHandler {
    NSString *key = @"testRemoveListenerCertificates";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] removeListenerCertificates:[AWSElasticLoadBalancingRemoveListenerCertificatesInput new] completionHandler:^(AWSElasticLoadBalancingRemoveListenerCertificatesOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testRemoveTrustStoreRevocations {
    NSString *key = @"testRemoveTrustStoreRevocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] removeTrustStoreRevocations:[AWSElasticLoadBalancingRemoveTrustStoreRevocationsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testRemoveTrustStoreRevocationsCompletionHandler {
    NSString *key = @"testRemoveTrustStoreRevocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] removeTrustStoreRevocations:[AWSElasticLoadBalancingRemoveTrustStoreRevocationsInput new] completionHandler:^(AWSElasticLoadBalancingRemoveTrustStoreRevocationsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testSetIpAddressType {
    NSString *key = @"testSetIpAddressType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setIpAddressType:[AWSElasticLoadBalancingSetIpAddressTypeInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetIpAddressTypeCompletionHandler {
    NSString *key = @"testSetIpAddressType";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setIpAddressType:[AWSElasticLoadBalancingSetIpAddressTypeInput new] completionHandler:^(AWSElasticLoadBalancingSetIpAddressTypeOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testSetRulePriorities {
    NSString *key = @"testSetRulePriorities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setRulePriorities:[AWSElasticLoadBalancingSetRulePrioritiesInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetRulePrioritiesCompletionHandler {
    NSString *key = @"testSetRulePriorities";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setRulePriorities:[AWSElasticLoadBalancingSetRulePrioritiesInput new] completionHandler:^(AWSElasticLoadBalancingSetRulePrioritiesOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testSetSecurityGroups {
    NSString *key = @"testSetSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setSecurityGroups:[AWSElasticLoadBalancingSetSecurityGroupsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetSecurityGroupsCompletionHandler {
    NSString *key = @"testSetSecurityGroups";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setSecurityGroups:[AWSElasticLoadBalancingSetSecurityGroupsInput new] completionHandler:^(AWSElasticLoadBalancingSetSecurityGroupsOutput* _Nullable response, NSError * _Nullable error) {
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

- (void)testSetSubnets {
    NSString *key = @"testSetSubnets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setSubnets:[AWSElasticLoadBalancingSetSubnetsInput new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSElasticLoadBalancing removeElasticLoadBalancingForKey:key];
}

- (void)testSetSubnetsCompletionHandler {
    NSString *key = @"testSetSubnets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:configuration forKey:key];

    AWSElasticLoadBalancing *awsClient = [AWSElasticLoadBalancing ElasticLoadBalancingForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSElasticLoadBalancing ElasticLoadBalancingForKey:key] setSubnets:[AWSElasticLoadBalancingSetSubnetsInput new] completionHandler:^(AWSElasticLoadBalancingSetSubnetsOutput* _Nullable response, NSError * _Nullable error) {
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
