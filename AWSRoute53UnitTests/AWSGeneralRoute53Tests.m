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
#import "AWSRoute53Service.h"

static id mockNetworking = nil;

@interface AWSGeneralRoute53Tests : XCTestCase

@end

@implementation AWSGeneralRoute53Tests

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
    NSString *key = @"testRoute53Constructors";
    XCTAssertNotNil([AWSRoute53 defaultRoute53]);
    XCTAssertEqual([[AWSRoute53 defaultRoute53] class], [AWSRoute53 class]);
    XCTAssertNil([AWSRoute53 Route53ForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSRoute53 Route53ForKey:key]);
    XCTAssertEqual([[AWSRoute53 Route53ForKey:key] class], [AWSRoute53 class]);
    XCTAssertEqual([AWSRoute53 Route53ForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSRoute53 removeRoute53ForKey:key];
    XCTAssertNil([AWSRoute53 Route53ForKey:key]);

}

- (void)testAssociateVPCWithHostedZone {
    NSString *key = @"testAssociateVPCWithHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] associateVPCWithHostedZone:[AWSRoute53AssociateVPCWithHostedZoneRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testAssociateVPCWithHostedZoneCompletionHandler {
    NSString *key = @"testAssociateVPCWithHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] associateVPCWithHostedZone:[AWSRoute53AssociateVPCWithHostedZoneRequest new] completionHandler:^(AWSRoute53AssociateVPCWithHostedZoneResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testChangeResourceRecordSets {
    NSString *key = @"testChangeResourceRecordSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] changeResourceRecordSets:[AWSRoute53ChangeResourceRecordSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testChangeResourceRecordSetsCompletionHandler {
    NSString *key = @"testChangeResourceRecordSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] changeResourceRecordSets:[AWSRoute53ChangeResourceRecordSetsRequest new] completionHandler:^(AWSRoute53ChangeResourceRecordSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testChangeTagsForResource {
    NSString *key = @"testChangeTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] changeTagsForResource:[AWSRoute53ChangeTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testChangeTagsForResourceCompletionHandler {
    NSString *key = @"testChangeTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] changeTagsForResource:[AWSRoute53ChangeTagsForResourceRequest new] completionHandler:^(AWSRoute53ChangeTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateHealthCheck {
    NSString *key = @"testCreateHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] createHealthCheck:[AWSRoute53CreateHealthCheckRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateHealthCheckCompletionHandler {
    NSString *key = @"testCreateHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] createHealthCheck:[AWSRoute53CreateHealthCheckRequest new] completionHandler:^(AWSRoute53CreateHealthCheckResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateHostedZone {
    NSString *key = @"testCreateHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] createHostedZone:[AWSRoute53CreateHostedZoneRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateHostedZoneCompletionHandler {
    NSString *key = @"testCreateHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] createHostedZone:[AWSRoute53CreateHostedZoneRequest new] completionHandler:^(AWSRoute53CreateHostedZoneResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateQueryLoggingConfig {
    NSString *key = @"testCreateQueryLoggingConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] createQueryLoggingConfig:[AWSRoute53CreateQueryLoggingConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateQueryLoggingConfigCompletionHandler {
    NSString *key = @"testCreateQueryLoggingConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] createQueryLoggingConfig:[AWSRoute53CreateQueryLoggingConfigRequest new] completionHandler:^(AWSRoute53CreateQueryLoggingConfigResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateReusableDelegationSet {
    NSString *key = @"testCreateReusableDelegationSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] createReusableDelegationSet:[AWSRoute53CreateReusableDelegationSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateReusableDelegationSetCompletionHandler {
    NSString *key = @"testCreateReusableDelegationSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] createReusableDelegationSet:[AWSRoute53CreateReusableDelegationSetRequest new] completionHandler:^(AWSRoute53CreateReusableDelegationSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateTrafficPolicy {
    NSString *key = @"testCreateTrafficPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] createTrafficPolicy:[AWSRoute53CreateTrafficPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateTrafficPolicyCompletionHandler {
    NSString *key = @"testCreateTrafficPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] createTrafficPolicy:[AWSRoute53CreateTrafficPolicyRequest new] completionHandler:^(AWSRoute53CreateTrafficPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateTrafficPolicyInstance {
    NSString *key = @"testCreateTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] createTrafficPolicyInstance:[AWSRoute53CreateTrafficPolicyInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateTrafficPolicyInstanceCompletionHandler {
    NSString *key = @"testCreateTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] createTrafficPolicyInstance:[AWSRoute53CreateTrafficPolicyInstanceRequest new] completionHandler:^(AWSRoute53CreateTrafficPolicyInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateTrafficPolicyVersion {
    NSString *key = @"testCreateTrafficPolicyVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] createTrafficPolicyVersion:[AWSRoute53CreateTrafficPolicyVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateTrafficPolicyVersionCompletionHandler {
    NSString *key = @"testCreateTrafficPolicyVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] createTrafficPolicyVersion:[AWSRoute53CreateTrafficPolicyVersionRequest new] completionHandler:^(AWSRoute53CreateTrafficPolicyVersionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateVPCAssociationAuthorization {
    NSString *key = @"testCreateVPCAssociationAuthorization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] createVPCAssociationAuthorization:[AWSRoute53CreateVPCAssociationAuthorizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testCreateVPCAssociationAuthorizationCompletionHandler {
    NSString *key = @"testCreateVPCAssociationAuthorization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] createVPCAssociationAuthorization:[AWSRoute53CreateVPCAssociationAuthorizationRequest new] completionHandler:^(AWSRoute53CreateVPCAssociationAuthorizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDeleteHealthCheck {
    NSString *key = @"testDeleteHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] deleteHealthCheck:[AWSRoute53DeleteHealthCheckRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDeleteHealthCheckCompletionHandler {
    NSString *key = @"testDeleteHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] deleteHealthCheck:[AWSRoute53DeleteHealthCheckRequest new] completionHandler:^(AWSRoute53DeleteHealthCheckResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDeleteHostedZone {
    NSString *key = @"testDeleteHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] deleteHostedZone:[AWSRoute53DeleteHostedZoneRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDeleteHostedZoneCompletionHandler {
    NSString *key = @"testDeleteHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] deleteHostedZone:[AWSRoute53DeleteHostedZoneRequest new] completionHandler:^(AWSRoute53DeleteHostedZoneResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDeleteQueryLoggingConfig {
    NSString *key = @"testDeleteQueryLoggingConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] deleteQueryLoggingConfig:[AWSRoute53DeleteQueryLoggingConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDeleteQueryLoggingConfigCompletionHandler {
    NSString *key = @"testDeleteQueryLoggingConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] deleteQueryLoggingConfig:[AWSRoute53DeleteQueryLoggingConfigRequest new] completionHandler:^(AWSRoute53DeleteQueryLoggingConfigResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDeleteReusableDelegationSet {
    NSString *key = @"testDeleteReusableDelegationSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] deleteReusableDelegationSet:[AWSRoute53DeleteReusableDelegationSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDeleteReusableDelegationSetCompletionHandler {
    NSString *key = @"testDeleteReusableDelegationSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] deleteReusableDelegationSet:[AWSRoute53DeleteReusableDelegationSetRequest new] completionHandler:^(AWSRoute53DeleteReusableDelegationSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDeleteTrafficPolicy {
    NSString *key = @"testDeleteTrafficPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] deleteTrafficPolicy:[AWSRoute53DeleteTrafficPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDeleteTrafficPolicyCompletionHandler {
    NSString *key = @"testDeleteTrafficPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] deleteTrafficPolicy:[AWSRoute53DeleteTrafficPolicyRequest new] completionHandler:^(AWSRoute53DeleteTrafficPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDeleteTrafficPolicyInstance {
    NSString *key = @"testDeleteTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] deleteTrafficPolicyInstance:[AWSRoute53DeleteTrafficPolicyInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDeleteTrafficPolicyInstanceCompletionHandler {
    NSString *key = @"testDeleteTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] deleteTrafficPolicyInstance:[AWSRoute53DeleteTrafficPolicyInstanceRequest new] completionHandler:^(AWSRoute53DeleteTrafficPolicyInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDeleteVPCAssociationAuthorization {
    NSString *key = @"testDeleteVPCAssociationAuthorization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] deleteVPCAssociationAuthorization:[AWSRoute53DeleteVPCAssociationAuthorizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDeleteVPCAssociationAuthorizationCompletionHandler {
    NSString *key = @"testDeleteVPCAssociationAuthorization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] deleteVPCAssociationAuthorization:[AWSRoute53DeleteVPCAssociationAuthorizationRequest new] completionHandler:^(AWSRoute53DeleteVPCAssociationAuthorizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDisassociateVPCFromHostedZone {
    NSString *key = @"testDisassociateVPCFromHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] disassociateVPCFromHostedZone:[AWSRoute53DisassociateVPCFromHostedZoneRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testDisassociateVPCFromHostedZoneCompletionHandler {
    NSString *key = @"testDisassociateVPCFromHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] disassociateVPCFromHostedZone:[AWSRoute53DisassociateVPCFromHostedZoneRequest new] completionHandler:^(AWSRoute53DisassociateVPCFromHostedZoneResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetAccountLimit {
    NSString *key = @"testGetAccountLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getAccountLimit:[AWSRoute53GetAccountLimitRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetAccountLimitCompletionHandler {
    NSString *key = @"testGetAccountLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getAccountLimit:[AWSRoute53GetAccountLimitRequest new] completionHandler:^(AWSRoute53GetAccountLimitResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetChange {
    NSString *key = @"testGetChange";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getChange:[AWSRoute53GetChangeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetChangeCompletionHandler {
    NSString *key = @"testGetChange";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getChange:[AWSRoute53GetChangeRequest new] completionHandler:^(AWSRoute53GetChangeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetCheckerIpRanges {
    NSString *key = @"testGetCheckerIpRanges";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getCheckerIpRanges:[AWSRoute53GetCheckerIpRangesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetCheckerIpRangesCompletionHandler {
    NSString *key = @"testGetCheckerIpRanges";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getCheckerIpRanges:[AWSRoute53GetCheckerIpRangesRequest new] completionHandler:^(AWSRoute53GetCheckerIpRangesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetGeoLocation {
    NSString *key = @"testGetGeoLocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getGeoLocation:[AWSRoute53GetGeoLocationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetGeoLocationCompletionHandler {
    NSString *key = @"testGetGeoLocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getGeoLocation:[AWSRoute53GetGeoLocationRequest new] completionHandler:^(AWSRoute53GetGeoLocationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetHealthCheck {
    NSString *key = @"testGetHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getHealthCheck:[AWSRoute53GetHealthCheckRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetHealthCheckCompletionHandler {
    NSString *key = @"testGetHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getHealthCheck:[AWSRoute53GetHealthCheckRequest new] completionHandler:^(AWSRoute53GetHealthCheckResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetHealthCheckCount {
    NSString *key = @"testGetHealthCheckCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getHealthCheckCount:[AWSRoute53GetHealthCheckCountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetHealthCheckCountCompletionHandler {
    NSString *key = @"testGetHealthCheckCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getHealthCheckCount:[AWSRoute53GetHealthCheckCountRequest new] completionHandler:^(AWSRoute53GetHealthCheckCountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetHealthCheckLastFailureReason {
    NSString *key = @"testGetHealthCheckLastFailureReason";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getHealthCheckLastFailureReason:[AWSRoute53GetHealthCheckLastFailureReasonRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetHealthCheckLastFailureReasonCompletionHandler {
    NSString *key = @"testGetHealthCheckLastFailureReason";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getHealthCheckLastFailureReason:[AWSRoute53GetHealthCheckLastFailureReasonRequest new] completionHandler:^(AWSRoute53GetHealthCheckLastFailureReasonResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetHealthCheckStatus {
    NSString *key = @"testGetHealthCheckStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getHealthCheckStatus:[AWSRoute53GetHealthCheckStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetHealthCheckStatusCompletionHandler {
    NSString *key = @"testGetHealthCheckStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getHealthCheckStatus:[AWSRoute53GetHealthCheckStatusRequest new] completionHandler:^(AWSRoute53GetHealthCheckStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetHostedZone {
    NSString *key = @"testGetHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getHostedZone:[AWSRoute53GetHostedZoneRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetHostedZoneCompletionHandler {
    NSString *key = @"testGetHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getHostedZone:[AWSRoute53GetHostedZoneRequest new] completionHandler:^(AWSRoute53GetHostedZoneResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetHostedZoneCount {
    NSString *key = @"testGetHostedZoneCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getHostedZoneCount:[AWSRoute53GetHostedZoneCountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetHostedZoneCountCompletionHandler {
    NSString *key = @"testGetHostedZoneCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getHostedZoneCount:[AWSRoute53GetHostedZoneCountRequest new] completionHandler:^(AWSRoute53GetHostedZoneCountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetHostedZoneLimit {
    NSString *key = @"testGetHostedZoneLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getHostedZoneLimit:[AWSRoute53GetHostedZoneLimitRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetHostedZoneLimitCompletionHandler {
    NSString *key = @"testGetHostedZoneLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getHostedZoneLimit:[AWSRoute53GetHostedZoneLimitRequest new] completionHandler:^(AWSRoute53GetHostedZoneLimitResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetQueryLoggingConfig {
    NSString *key = @"testGetQueryLoggingConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getQueryLoggingConfig:[AWSRoute53GetQueryLoggingConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetQueryLoggingConfigCompletionHandler {
    NSString *key = @"testGetQueryLoggingConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getQueryLoggingConfig:[AWSRoute53GetQueryLoggingConfigRequest new] completionHandler:^(AWSRoute53GetQueryLoggingConfigResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetReusableDelegationSet {
    NSString *key = @"testGetReusableDelegationSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getReusableDelegationSet:[AWSRoute53GetReusableDelegationSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetReusableDelegationSetCompletionHandler {
    NSString *key = @"testGetReusableDelegationSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getReusableDelegationSet:[AWSRoute53GetReusableDelegationSetRequest new] completionHandler:^(AWSRoute53GetReusableDelegationSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetReusableDelegationSetLimit {
    NSString *key = @"testGetReusableDelegationSetLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getReusableDelegationSetLimit:[AWSRoute53GetReusableDelegationSetLimitRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetReusableDelegationSetLimitCompletionHandler {
    NSString *key = @"testGetReusableDelegationSetLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getReusableDelegationSetLimit:[AWSRoute53GetReusableDelegationSetLimitRequest new] completionHandler:^(AWSRoute53GetReusableDelegationSetLimitResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetTrafficPolicy {
    NSString *key = @"testGetTrafficPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getTrafficPolicy:[AWSRoute53GetTrafficPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetTrafficPolicyCompletionHandler {
    NSString *key = @"testGetTrafficPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getTrafficPolicy:[AWSRoute53GetTrafficPolicyRequest new] completionHandler:^(AWSRoute53GetTrafficPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetTrafficPolicyInstance {
    NSString *key = @"testGetTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getTrafficPolicyInstance:[AWSRoute53GetTrafficPolicyInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetTrafficPolicyInstanceCompletionHandler {
    NSString *key = @"testGetTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getTrafficPolicyInstance:[AWSRoute53GetTrafficPolicyInstanceRequest new] completionHandler:^(AWSRoute53GetTrafficPolicyInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetTrafficPolicyInstanceCount {
    NSString *key = @"testGetTrafficPolicyInstanceCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] getTrafficPolicyInstanceCount:[AWSRoute53GetTrafficPolicyInstanceCountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testGetTrafficPolicyInstanceCountCompletionHandler {
    NSString *key = @"testGetTrafficPolicyInstanceCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] getTrafficPolicyInstanceCount:[AWSRoute53GetTrafficPolicyInstanceCountRequest new] completionHandler:^(AWSRoute53GetTrafficPolicyInstanceCountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListGeoLocations {
    NSString *key = @"testListGeoLocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listGeoLocations:[AWSRoute53ListGeoLocationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListGeoLocationsCompletionHandler {
    NSString *key = @"testListGeoLocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listGeoLocations:[AWSRoute53ListGeoLocationsRequest new] completionHandler:^(AWSRoute53ListGeoLocationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListHealthChecks {
    NSString *key = @"testListHealthChecks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listHealthChecks:[AWSRoute53ListHealthChecksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListHealthChecksCompletionHandler {
    NSString *key = @"testListHealthChecks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listHealthChecks:[AWSRoute53ListHealthChecksRequest new] completionHandler:^(AWSRoute53ListHealthChecksResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListHostedZones {
    NSString *key = @"testListHostedZones";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listHostedZones:[AWSRoute53ListHostedZonesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListHostedZonesCompletionHandler {
    NSString *key = @"testListHostedZones";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listHostedZones:[AWSRoute53ListHostedZonesRequest new] completionHandler:^(AWSRoute53ListHostedZonesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListHostedZonesByName {
    NSString *key = @"testListHostedZonesByName";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listHostedZonesByName:[AWSRoute53ListHostedZonesByNameRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListHostedZonesByNameCompletionHandler {
    NSString *key = @"testListHostedZonesByName";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listHostedZonesByName:[AWSRoute53ListHostedZonesByNameRequest new] completionHandler:^(AWSRoute53ListHostedZonesByNameResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListHostedZonesByVPC {
    NSString *key = @"testListHostedZonesByVPC";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listHostedZonesByVPC:[AWSRoute53ListHostedZonesByVPCRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListHostedZonesByVPCCompletionHandler {
    NSString *key = @"testListHostedZonesByVPC";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listHostedZonesByVPC:[AWSRoute53ListHostedZonesByVPCRequest new] completionHandler:^(AWSRoute53ListHostedZonesByVPCResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListQueryLoggingConfigs {
    NSString *key = @"testListQueryLoggingConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listQueryLoggingConfigs:[AWSRoute53ListQueryLoggingConfigsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListQueryLoggingConfigsCompletionHandler {
    NSString *key = @"testListQueryLoggingConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listQueryLoggingConfigs:[AWSRoute53ListQueryLoggingConfigsRequest new] completionHandler:^(AWSRoute53ListQueryLoggingConfigsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListResourceRecordSets {
    NSString *key = @"testListResourceRecordSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listResourceRecordSets:[AWSRoute53ListResourceRecordSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListResourceRecordSetsCompletionHandler {
    NSString *key = @"testListResourceRecordSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listResourceRecordSets:[AWSRoute53ListResourceRecordSetsRequest new] completionHandler:^(AWSRoute53ListResourceRecordSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListReusableDelegationSets {
    NSString *key = @"testListReusableDelegationSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listReusableDelegationSets:[AWSRoute53ListReusableDelegationSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListReusableDelegationSetsCompletionHandler {
    NSString *key = @"testListReusableDelegationSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listReusableDelegationSets:[AWSRoute53ListReusableDelegationSetsRequest new] completionHandler:^(AWSRoute53ListReusableDelegationSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listTagsForResource:[AWSRoute53ListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listTagsForResource:[AWSRoute53ListTagsForResourceRequest new] completionHandler:^(AWSRoute53ListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListTagsForResources {
    NSString *key = @"testListTagsForResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listTagsForResources:[AWSRoute53ListTagsForResourcesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListTagsForResourcesCompletionHandler {
    NSString *key = @"testListTagsForResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listTagsForResources:[AWSRoute53ListTagsForResourcesRequest new] completionHandler:^(AWSRoute53ListTagsForResourcesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListTrafficPolicies {
    NSString *key = @"testListTrafficPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listTrafficPolicies:[AWSRoute53ListTrafficPoliciesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListTrafficPoliciesCompletionHandler {
    NSString *key = @"testListTrafficPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listTrafficPolicies:[AWSRoute53ListTrafficPoliciesRequest new] completionHandler:^(AWSRoute53ListTrafficPoliciesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListTrafficPolicyInstances {
    NSString *key = @"testListTrafficPolicyInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listTrafficPolicyInstances:[AWSRoute53ListTrafficPolicyInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListTrafficPolicyInstancesCompletionHandler {
    NSString *key = @"testListTrafficPolicyInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listTrafficPolicyInstances:[AWSRoute53ListTrafficPolicyInstancesRequest new] completionHandler:^(AWSRoute53ListTrafficPolicyInstancesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListTrafficPolicyInstancesByHostedZone {
    NSString *key = @"testListTrafficPolicyInstancesByHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listTrafficPolicyInstancesByHostedZone:[AWSRoute53ListTrafficPolicyInstancesByHostedZoneRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListTrafficPolicyInstancesByHostedZoneCompletionHandler {
    NSString *key = @"testListTrafficPolicyInstancesByHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listTrafficPolicyInstancesByHostedZone:[AWSRoute53ListTrafficPolicyInstancesByHostedZoneRequest new] completionHandler:^(AWSRoute53ListTrafficPolicyInstancesByHostedZoneResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListTrafficPolicyInstancesByPolicy {
    NSString *key = @"testListTrafficPolicyInstancesByPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listTrafficPolicyInstancesByPolicy:[AWSRoute53ListTrafficPolicyInstancesByPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListTrafficPolicyInstancesByPolicyCompletionHandler {
    NSString *key = @"testListTrafficPolicyInstancesByPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listTrafficPolicyInstancesByPolicy:[AWSRoute53ListTrafficPolicyInstancesByPolicyRequest new] completionHandler:^(AWSRoute53ListTrafficPolicyInstancesByPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListTrafficPolicyVersions {
    NSString *key = @"testListTrafficPolicyVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listTrafficPolicyVersions:[AWSRoute53ListTrafficPolicyVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListTrafficPolicyVersionsCompletionHandler {
    NSString *key = @"testListTrafficPolicyVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listTrafficPolicyVersions:[AWSRoute53ListTrafficPolicyVersionsRequest new] completionHandler:^(AWSRoute53ListTrafficPolicyVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListVPCAssociationAuthorizations {
    NSString *key = @"testListVPCAssociationAuthorizations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] listVPCAssociationAuthorizations:[AWSRoute53ListVPCAssociationAuthorizationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testListVPCAssociationAuthorizationsCompletionHandler {
    NSString *key = @"testListVPCAssociationAuthorizations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] listVPCAssociationAuthorizations:[AWSRoute53ListVPCAssociationAuthorizationsRequest new] completionHandler:^(AWSRoute53ListVPCAssociationAuthorizationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testTestDNSAnswer {
    NSString *key = @"testTestDNSAnswer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] testDNSAnswer:[AWSRoute53TestDNSAnswerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testTestDNSAnswerCompletionHandler {
    NSString *key = @"testTestDNSAnswer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] testDNSAnswer:[AWSRoute53TestDNSAnswerRequest new] completionHandler:^(AWSRoute53TestDNSAnswerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testUpdateHealthCheck {
    NSString *key = @"testUpdateHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] updateHealthCheck:[AWSRoute53UpdateHealthCheckRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testUpdateHealthCheckCompletionHandler {
    NSString *key = @"testUpdateHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] updateHealthCheck:[AWSRoute53UpdateHealthCheckRequest new] completionHandler:^(AWSRoute53UpdateHealthCheckResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testUpdateHostedZoneComment {
    NSString *key = @"testUpdateHostedZoneComment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] updateHostedZoneComment:[AWSRoute53UpdateHostedZoneCommentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testUpdateHostedZoneCommentCompletionHandler {
    NSString *key = @"testUpdateHostedZoneComment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] updateHostedZoneComment:[AWSRoute53UpdateHostedZoneCommentRequest new] completionHandler:^(AWSRoute53UpdateHostedZoneCommentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testUpdateTrafficPolicyComment {
    NSString *key = @"testUpdateTrafficPolicyComment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] updateTrafficPolicyComment:[AWSRoute53UpdateTrafficPolicyCommentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testUpdateTrafficPolicyCommentCompletionHandler {
    NSString *key = @"testUpdateTrafficPolicyComment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] updateTrafficPolicyComment:[AWSRoute53UpdateTrafficPolicyCommentRequest new] completionHandler:^(AWSRoute53UpdateTrafficPolicyCommentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testUpdateTrafficPolicyInstance {
    NSString *key = @"testUpdateTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSRoute53 Route53ForKey:key] updateTrafficPolicyInstance:[AWSRoute53UpdateTrafficPolicyInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

- (void)testUpdateTrafficPolicyInstanceCompletionHandler {
    NSString *key = @"testUpdateTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSRoute53 registerRoute53WithConfiguration:configuration forKey:key];

    AWSRoute53 *awsClient = [AWSRoute53 Route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSRoute53 Route53ForKey:key] updateTrafficPolicyInstance:[AWSRoute53UpdateTrafficPolicyInstanceRequest new] completionHandler:^(AWSRoute53UpdateTrafficPolicyInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSRoute53 removeRoute53ForKey:key];
}

@end
