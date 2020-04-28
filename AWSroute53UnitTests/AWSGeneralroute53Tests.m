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
#import "AWSroute53Service.h"

static id mockNetworking = nil;

@interface AWSGeneralroute53Tests : XCTestCase

@end

@implementation AWSGeneralroute53Tests

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
    NSString *key = @"testroute53Constructors";
    XCTAssertNotNil([AWSroute53 defaultroute53]);
    XCTAssertEqual([[AWSroute53 defaultroute53] class], [AWSroute53 class]);
    XCTAssertNil([AWSroute53 route53ForKey:key]);

    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionSAEast1 credentialsProvider:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];
    XCTAssertNotNil([AWSroute53 route53ForKey:key]);
    XCTAssertEqual([[AWSroute53 route53ForKey:key] class], [AWSroute53 class]);
    XCTAssertEqual([AWSroute53 route53ForKey:key].configuration.regionType, AWSRegionSAEast1);

    [AWSroute53 removeroute53ForKey:key];
    XCTAssertNil([AWSroute53 route53ForKey:key]);

}

- (void)testAssociateVPCWithHostedZone {
    NSString *key = @"testAssociateVPCWithHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] associateVPCWithHostedZone:[AWSroute53AssociateVPCWithHostedZoneRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testAssociateVPCWithHostedZoneCompletionHandler {
    NSString *key = @"testAssociateVPCWithHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] associateVPCWithHostedZone:[AWSroute53AssociateVPCWithHostedZoneRequest new] completionHandler:^(AWSroute53AssociateVPCWithHostedZoneResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testChangeResourceRecordSets {
    NSString *key = @"testChangeResourceRecordSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] changeResourceRecordSets:[AWSroute53ChangeResourceRecordSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testChangeResourceRecordSetsCompletionHandler {
    NSString *key = @"testChangeResourceRecordSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] changeResourceRecordSets:[AWSroute53ChangeResourceRecordSetsRequest new] completionHandler:^(AWSroute53ChangeResourceRecordSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testChangeTagsForResource {
    NSString *key = @"testChangeTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] changeTagsForResource:[AWSroute53ChangeTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testChangeTagsForResourceCompletionHandler {
    NSString *key = @"testChangeTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] changeTagsForResource:[AWSroute53ChangeTagsForResourceRequest new] completionHandler:^(AWSroute53ChangeTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateHealthCheck {
    NSString *key = @"testCreateHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] createHealthCheck:[AWSroute53CreateHealthCheckRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateHealthCheckCompletionHandler {
    NSString *key = @"testCreateHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] createHealthCheck:[AWSroute53CreateHealthCheckRequest new] completionHandler:^(AWSroute53CreateHealthCheckResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateHostedZone {
    NSString *key = @"testCreateHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] createHostedZone:[AWSroute53CreateHostedZoneRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateHostedZoneCompletionHandler {
    NSString *key = @"testCreateHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] createHostedZone:[AWSroute53CreateHostedZoneRequest new] completionHandler:^(AWSroute53CreateHostedZoneResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateQueryLoggingConfig {
    NSString *key = @"testCreateQueryLoggingConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] createQueryLoggingConfig:[AWSroute53CreateQueryLoggingConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateQueryLoggingConfigCompletionHandler {
    NSString *key = @"testCreateQueryLoggingConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] createQueryLoggingConfig:[AWSroute53CreateQueryLoggingConfigRequest new] completionHandler:^(AWSroute53CreateQueryLoggingConfigResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateReusableDelegationSet {
    NSString *key = @"testCreateReusableDelegationSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] createReusableDelegationSet:[AWSroute53CreateReusableDelegationSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateReusableDelegationSetCompletionHandler {
    NSString *key = @"testCreateReusableDelegationSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] createReusableDelegationSet:[AWSroute53CreateReusableDelegationSetRequest new] completionHandler:^(AWSroute53CreateReusableDelegationSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateTrafficPolicy {
    NSString *key = @"testCreateTrafficPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] createTrafficPolicy:[AWSroute53CreateTrafficPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateTrafficPolicyCompletionHandler {
    NSString *key = @"testCreateTrafficPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] createTrafficPolicy:[AWSroute53CreateTrafficPolicyRequest new] completionHandler:^(AWSroute53CreateTrafficPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateTrafficPolicyInstance {
    NSString *key = @"testCreateTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] createTrafficPolicyInstance:[AWSroute53CreateTrafficPolicyInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateTrafficPolicyInstanceCompletionHandler {
    NSString *key = @"testCreateTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] createTrafficPolicyInstance:[AWSroute53CreateTrafficPolicyInstanceRequest new] completionHandler:^(AWSroute53CreateTrafficPolicyInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateTrafficPolicyVersion {
    NSString *key = @"testCreateTrafficPolicyVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] createTrafficPolicyVersion:[AWSroute53CreateTrafficPolicyVersionRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateTrafficPolicyVersionCompletionHandler {
    NSString *key = @"testCreateTrafficPolicyVersion";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] createTrafficPolicyVersion:[AWSroute53CreateTrafficPolicyVersionRequest new] completionHandler:^(AWSroute53CreateTrafficPolicyVersionResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateVPCAssociationAuthorization {
    NSString *key = @"testCreateVPCAssociationAuthorization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] createVPCAssociationAuthorization:[AWSroute53CreateVPCAssociationAuthorizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testCreateVPCAssociationAuthorizationCompletionHandler {
    NSString *key = @"testCreateVPCAssociationAuthorization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] createVPCAssociationAuthorization:[AWSroute53CreateVPCAssociationAuthorizationRequest new] completionHandler:^(AWSroute53CreateVPCAssociationAuthorizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDeleteHealthCheck {
    NSString *key = @"testDeleteHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] deleteHealthCheck:[AWSroute53DeleteHealthCheckRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDeleteHealthCheckCompletionHandler {
    NSString *key = @"testDeleteHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] deleteHealthCheck:[AWSroute53DeleteHealthCheckRequest new] completionHandler:^(AWSroute53DeleteHealthCheckResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDeleteHostedZone {
    NSString *key = @"testDeleteHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] deleteHostedZone:[AWSroute53DeleteHostedZoneRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDeleteHostedZoneCompletionHandler {
    NSString *key = @"testDeleteHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] deleteHostedZone:[AWSroute53DeleteHostedZoneRequest new] completionHandler:^(AWSroute53DeleteHostedZoneResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDeleteQueryLoggingConfig {
    NSString *key = @"testDeleteQueryLoggingConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] deleteQueryLoggingConfig:[AWSroute53DeleteQueryLoggingConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDeleteQueryLoggingConfigCompletionHandler {
    NSString *key = @"testDeleteQueryLoggingConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] deleteQueryLoggingConfig:[AWSroute53DeleteQueryLoggingConfigRequest new] completionHandler:^(AWSroute53DeleteQueryLoggingConfigResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDeleteReusableDelegationSet {
    NSString *key = @"testDeleteReusableDelegationSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] deleteReusableDelegationSet:[AWSroute53DeleteReusableDelegationSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDeleteReusableDelegationSetCompletionHandler {
    NSString *key = @"testDeleteReusableDelegationSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] deleteReusableDelegationSet:[AWSroute53DeleteReusableDelegationSetRequest new] completionHandler:^(AWSroute53DeleteReusableDelegationSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDeleteTrafficPolicy {
    NSString *key = @"testDeleteTrafficPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] deleteTrafficPolicy:[AWSroute53DeleteTrafficPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDeleteTrafficPolicyCompletionHandler {
    NSString *key = @"testDeleteTrafficPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] deleteTrafficPolicy:[AWSroute53DeleteTrafficPolicyRequest new] completionHandler:^(AWSroute53DeleteTrafficPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDeleteTrafficPolicyInstance {
    NSString *key = @"testDeleteTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] deleteTrafficPolicyInstance:[AWSroute53DeleteTrafficPolicyInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDeleteTrafficPolicyInstanceCompletionHandler {
    NSString *key = @"testDeleteTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] deleteTrafficPolicyInstance:[AWSroute53DeleteTrafficPolicyInstanceRequest new] completionHandler:^(AWSroute53DeleteTrafficPolicyInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDeleteVPCAssociationAuthorization {
    NSString *key = @"testDeleteVPCAssociationAuthorization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] deleteVPCAssociationAuthorization:[AWSroute53DeleteVPCAssociationAuthorizationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDeleteVPCAssociationAuthorizationCompletionHandler {
    NSString *key = @"testDeleteVPCAssociationAuthorization";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] deleteVPCAssociationAuthorization:[AWSroute53DeleteVPCAssociationAuthorizationRequest new] completionHandler:^(AWSroute53DeleteVPCAssociationAuthorizationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDisassociateVPCFromHostedZone {
    NSString *key = @"testDisassociateVPCFromHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] disassociateVPCFromHostedZone:[AWSroute53DisassociateVPCFromHostedZoneRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testDisassociateVPCFromHostedZoneCompletionHandler {
    NSString *key = @"testDisassociateVPCFromHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] disassociateVPCFromHostedZone:[AWSroute53DisassociateVPCFromHostedZoneRequest new] completionHandler:^(AWSroute53DisassociateVPCFromHostedZoneResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetAccountLimit {
    NSString *key = @"testGetAccountLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getAccountLimit:[AWSroute53GetAccountLimitRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetAccountLimitCompletionHandler {
    NSString *key = @"testGetAccountLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getAccountLimit:[AWSroute53GetAccountLimitRequest new] completionHandler:^(AWSroute53GetAccountLimitResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetChange {
    NSString *key = @"testGetChange";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getChange:[AWSroute53GetChangeRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetChangeCompletionHandler {
    NSString *key = @"testGetChange";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getChange:[AWSroute53GetChangeRequest new] completionHandler:^(AWSroute53GetChangeResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetCheckerIpRanges {
    NSString *key = @"testGetCheckerIpRanges";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getCheckerIpRanges:[AWSroute53GetCheckerIpRangesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetCheckerIpRangesCompletionHandler {
    NSString *key = @"testGetCheckerIpRanges";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getCheckerIpRanges:[AWSroute53GetCheckerIpRangesRequest new] completionHandler:^(AWSroute53GetCheckerIpRangesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetGeoLocation {
    NSString *key = @"testGetGeoLocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getGeoLocation:[AWSroute53GetGeoLocationRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetGeoLocationCompletionHandler {
    NSString *key = @"testGetGeoLocation";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getGeoLocation:[AWSroute53GetGeoLocationRequest new] completionHandler:^(AWSroute53GetGeoLocationResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetHealthCheck {
    NSString *key = @"testGetHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getHealthCheck:[AWSroute53GetHealthCheckRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetHealthCheckCompletionHandler {
    NSString *key = @"testGetHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getHealthCheck:[AWSroute53GetHealthCheckRequest new] completionHandler:^(AWSroute53GetHealthCheckResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetHealthCheckCount {
    NSString *key = @"testGetHealthCheckCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getHealthCheckCount:[AWSroute53GetHealthCheckCountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetHealthCheckCountCompletionHandler {
    NSString *key = @"testGetHealthCheckCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getHealthCheckCount:[AWSroute53GetHealthCheckCountRequest new] completionHandler:^(AWSroute53GetHealthCheckCountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetHealthCheckLastFailureReason {
    NSString *key = @"testGetHealthCheckLastFailureReason";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getHealthCheckLastFailureReason:[AWSroute53GetHealthCheckLastFailureReasonRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetHealthCheckLastFailureReasonCompletionHandler {
    NSString *key = @"testGetHealthCheckLastFailureReason";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getHealthCheckLastFailureReason:[AWSroute53GetHealthCheckLastFailureReasonRequest new] completionHandler:^(AWSroute53GetHealthCheckLastFailureReasonResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetHealthCheckStatus {
    NSString *key = @"testGetHealthCheckStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getHealthCheckStatus:[AWSroute53GetHealthCheckStatusRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetHealthCheckStatusCompletionHandler {
    NSString *key = @"testGetHealthCheckStatus";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getHealthCheckStatus:[AWSroute53GetHealthCheckStatusRequest new] completionHandler:^(AWSroute53GetHealthCheckStatusResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetHostedZone {
    NSString *key = @"testGetHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getHostedZone:[AWSroute53GetHostedZoneRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetHostedZoneCompletionHandler {
    NSString *key = @"testGetHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getHostedZone:[AWSroute53GetHostedZoneRequest new] completionHandler:^(AWSroute53GetHostedZoneResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetHostedZoneCount {
    NSString *key = @"testGetHostedZoneCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getHostedZoneCount:[AWSroute53GetHostedZoneCountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetHostedZoneCountCompletionHandler {
    NSString *key = @"testGetHostedZoneCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getHostedZoneCount:[AWSroute53GetHostedZoneCountRequest new] completionHandler:^(AWSroute53GetHostedZoneCountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetHostedZoneLimit {
    NSString *key = @"testGetHostedZoneLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getHostedZoneLimit:[AWSroute53GetHostedZoneLimitRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetHostedZoneLimitCompletionHandler {
    NSString *key = @"testGetHostedZoneLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getHostedZoneLimit:[AWSroute53GetHostedZoneLimitRequest new] completionHandler:^(AWSroute53GetHostedZoneLimitResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetQueryLoggingConfig {
    NSString *key = @"testGetQueryLoggingConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getQueryLoggingConfig:[AWSroute53GetQueryLoggingConfigRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetQueryLoggingConfigCompletionHandler {
    NSString *key = @"testGetQueryLoggingConfig";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getQueryLoggingConfig:[AWSroute53GetQueryLoggingConfigRequest new] completionHandler:^(AWSroute53GetQueryLoggingConfigResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetReusableDelegationSet {
    NSString *key = @"testGetReusableDelegationSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getReusableDelegationSet:[AWSroute53GetReusableDelegationSetRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetReusableDelegationSetCompletionHandler {
    NSString *key = @"testGetReusableDelegationSet";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getReusableDelegationSet:[AWSroute53GetReusableDelegationSetRequest new] completionHandler:^(AWSroute53GetReusableDelegationSetResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetReusableDelegationSetLimit {
    NSString *key = @"testGetReusableDelegationSetLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getReusableDelegationSetLimit:[AWSroute53GetReusableDelegationSetLimitRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetReusableDelegationSetLimitCompletionHandler {
    NSString *key = @"testGetReusableDelegationSetLimit";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getReusableDelegationSetLimit:[AWSroute53GetReusableDelegationSetLimitRequest new] completionHandler:^(AWSroute53GetReusableDelegationSetLimitResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetTrafficPolicy {
    NSString *key = @"testGetTrafficPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getTrafficPolicy:[AWSroute53GetTrafficPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetTrafficPolicyCompletionHandler {
    NSString *key = @"testGetTrafficPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getTrafficPolicy:[AWSroute53GetTrafficPolicyRequest new] completionHandler:^(AWSroute53GetTrafficPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetTrafficPolicyInstance {
    NSString *key = @"testGetTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getTrafficPolicyInstance:[AWSroute53GetTrafficPolicyInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetTrafficPolicyInstanceCompletionHandler {
    NSString *key = @"testGetTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getTrafficPolicyInstance:[AWSroute53GetTrafficPolicyInstanceRequest new] completionHandler:^(AWSroute53GetTrafficPolicyInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetTrafficPolicyInstanceCount {
    NSString *key = @"testGetTrafficPolicyInstanceCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] getTrafficPolicyInstanceCount:[AWSroute53GetTrafficPolicyInstanceCountRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testGetTrafficPolicyInstanceCountCompletionHandler {
    NSString *key = @"testGetTrafficPolicyInstanceCount";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] getTrafficPolicyInstanceCount:[AWSroute53GetTrafficPolicyInstanceCountRequest new] completionHandler:^(AWSroute53GetTrafficPolicyInstanceCountResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListGeoLocations {
    NSString *key = @"testListGeoLocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listGeoLocations:[AWSroute53ListGeoLocationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListGeoLocationsCompletionHandler {
    NSString *key = @"testListGeoLocations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listGeoLocations:[AWSroute53ListGeoLocationsRequest new] completionHandler:^(AWSroute53ListGeoLocationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListHealthChecks {
    NSString *key = @"testListHealthChecks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listHealthChecks:[AWSroute53ListHealthChecksRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListHealthChecksCompletionHandler {
    NSString *key = @"testListHealthChecks";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listHealthChecks:[AWSroute53ListHealthChecksRequest new] completionHandler:^(AWSroute53ListHealthChecksResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListHostedZones {
    NSString *key = @"testListHostedZones";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listHostedZones:[AWSroute53ListHostedZonesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListHostedZonesCompletionHandler {
    NSString *key = @"testListHostedZones";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listHostedZones:[AWSroute53ListHostedZonesRequest new] completionHandler:^(AWSroute53ListHostedZonesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListHostedZonesByName {
    NSString *key = @"testListHostedZonesByName";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listHostedZonesByName:[AWSroute53ListHostedZonesByNameRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListHostedZonesByNameCompletionHandler {
    NSString *key = @"testListHostedZonesByName";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listHostedZonesByName:[AWSroute53ListHostedZonesByNameRequest new] completionHandler:^(AWSroute53ListHostedZonesByNameResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListQueryLoggingConfigs {
    NSString *key = @"testListQueryLoggingConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listQueryLoggingConfigs:[AWSroute53ListQueryLoggingConfigsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListQueryLoggingConfigsCompletionHandler {
    NSString *key = @"testListQueryLoggingConfigs";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listQueryLoggingConfigs:[AWSroute53ListQueryLoggingConfigsRequest new] completionHandler:^(AWSroute53ListQueryLoggingConfigsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListResourceRecordSets {
    NSString *key = @"testListResourceRecordSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listResourceRecordSets:[AWSroute53ListResourceRecordSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListResourceRecordSetsCompletionHandler {
    NSString *key = @"testListResourceRecordSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listResourceRecordSets:[AWSroute53ListResourceRecordSetsRequest new] completionHandler:^(AWSroute53ListResourceRecordSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListReusableDelegationSets {
    NSString *key = @"testListReusableDelegationSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listReusableDelegationSets:[AWSroute53ListReusableDelegationSetsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListReusableDelegationSetsCompletionHandler {
    NSString *key = @"testListReusableDelegationSets";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listReusableDelegationSets:[AWSroute53ListReusableDelegationSetsRequest new] completionHandler:^(AWSroute53ListReusableDelegationSetsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListTagsForResource {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listTagsForResource:[AWSroute53ListTagsForResourceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListTagsForResourceCompletionHandler {
    NSString *key = @"testListTagsForResource";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listTagsForResource:[AWSroute53ListTagsForResourceRequest new] completionHandler:^(AWSroute53ListTagsForResourceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListTagsForResources {
    NSString *key = @"testListTagsForResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listTagsForResources:[AWSroute53ListTagsForResourcesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListTagsForResourcesCompletionHandler {
    NSString *key = @"testListTagsForResources";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listTagsForResources:[AWSroute53ListTagsForResourcesRequest new] completionHandler:^(AWSroute53ListTagsForResourcesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListTrafficPolicies {
    NSString *key = @"testListTrafficPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listTrafficPolicies:[AWSroute53ListTrafficPoliciesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListTrafficPoliciesCompletionHandler {
    NSString *key = @"testListTrafficPolicies";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listTrafficPolicies:[AWSroute53ListTrafficPoliciesRequest new] completionHandler:^(AWSroute53ListTrafficPoliciesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListTrafficPolicyInstances {
    NSString *key = @"testListTrafficPolicyInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listTrafficPolicyInstances:[AWSroute53ListTrafficPolicyInstancesRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListTrafficPolicyInstancesCompletionHandler {
    NSString *key = @"testListTrafficPolicyInstances";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listTrafficPolicyInstances:[AWSroute53ListTrafficPolicyInstancesRequest new] completionHandler:^(AWSroute53ListTrafficPolicyInstancesResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListTrafficPolicyInstancesByHostedZone {
    NSString *key = @"testListTrafficPolicyInstancesByHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listTrafficPolicyInstancesByHostedZone:[AWSroute53ListTrafficPolicyInstancesByHostedZoneRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListTrafficPolicyInstancesByHostedZoneCompletionHandler {
    NSString *key = @"testListTrafficPolicyInstancesByHostedZone";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listTrafficPolicyInstancesByHostedZone:[AWSroute53ListTrafficPolicyInstancesByHostedZoneRequest new] completionHandler:^(AWSroute53ListTrafficPolicyInstancesByHostedZoneResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListTrafficPolicyInstancesByPolicy {
    NSString *key = @"testListTrafficPolicyInstancesByPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listTrafficPolicyInstancesByPolicy:[AWSroute53ListTrafficPolicyInstancesByPolicyRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListTrafficPolicyInstancesByPolicyCompletionHandler {
    NSString *key = @"testListTrafficPolicyInstancesByPolicy";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listTrafficPolicyInstancesByPolicy:[AWSroute53ListTrafficPolicyInstancesByPolicyRequest new] completionHandler:^(AWSroute53ListTrafficPolicyInstancesByPolicyResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListTrafficPolicyVersions {
    NSString *key = @"testListTrafficPolicyVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listTrafficPolicyVersions:[AWSroute53ListTrafficPolicyVersionsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListTrafficPolicyVersionsCompletionHandler {
    NSString *key = @"testListTrafficPolicyVersions";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listTrafficPolicyVersions:[AWSroute53ListTrafficPolicyVersionsRequest new] completionHandler:^(AWSroute53ListTrafficPolicyVersionsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListVPCAssociationAuthorizations {
    NSString *key = @"testListVPCAssociationAuthorizations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] listVPCAssociationAuthorizations:[AWSroute53ListVPCAssociationAuthorizationsRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testListVPCAssociationAuthorizationsCompletionHandler {
    NSString *key = @"testListVPCAssociationAuthorizations";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] listVPCAssociationAuthorizations:[AWSroute53ListVPCAssociationAuthorizationsRequest new] completionHandler:^(AWSroute53ListVPCAssociationAuthorizationsResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testTestDNSAnswer {
    NSString *key = @"testTestDNSAnswer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] testDNSAnswer:[AWSroute53TestDNSAnswerRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testTestDNSAnswerCompletionHandler {
    NSString *key = @"testTestDNSAnswer";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] testDNSAnswer:[AWSroute53TestDNSAnswerRequest new] completionHandler:^(AWSroute53TestDNSAnswerResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testUpdateHealthCheck {
    NSString *key = @"testUpdateHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] updateHealthCheck:[AWSroute53UpdateHealthCheckRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testUpdateHealthCheckCompletionHandler {
    NSString *key = @"testUpdateHealthCheck";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] updateHealthCheck:[AWSroute53UpdateHealthCheckRequest new] completionHandler:^(AWSroute53UpdateHealthCheckResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testUpdateHostedZoneComment {
    NSString *key = @"testUpdateHostedZoneComment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] updateHostedZoneComment:[AWSroute53UpdateHostedZoneCommentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testUpdateHostedZoneCommentCompletionHandler {
    NSString *key = @"testUpdateHostedZoneComment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] updateHostedZoneComment:[AWSroute53UpdateHostedZoneCommentRequest new] completionHandler:^(AWSroute53UpdateHostedZoneCommentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testUpdateTrafficPolicyComment {
    NSString *key = @"testUpdateTrafficPolicyComment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] updateTrafficPolicyComment:[AWSroute53UpdateTrafficPolicyCommentRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testUpdateTrafficPolicyCommentCompletionHandler {
    NSString *key = @"testUpdateTrafficPolicyComment";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] updateTrafficPolicyComment:[AWSroute53UpdateTrafficPolicyCommentRequest new] completionHandler:^(AWSroute53UpdateTrafficPolicyCommentResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testUpdateTrafficPolicyInstance {
    NSString *key = @"testUpdateTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];
    [[[[AWSroute53 route53ForKey:key] updateTrafficPolicyInstance:[AWSroute53UpdateTrafficPolicyInstanceRequest new]] continueWithBlock:^id(AWSTask *task) {
        XCTAssertNotNil(task.error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", task.error.domain);
        XCTAssertEqual(8848, task.error.code);
        XCTAssertNil(task.result);
        return nil;
    }] waitUntilFinished];

    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

- (void)testUpdateTrafficPolicyInstanceCompletionHandler {
    NSString *key = @"testUpdateTrafficPolicyInstance";
    AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
    [AWSroute53 registerroute53WithConfiguration:configuration forKey:key];

    AWSroute53 *awsClient = [AWSroute53 route53ForKey:key];
    XCTAssertNotNil(awsClient);
    XCTAssertNotNil(mockNetworking);
    [awsClient setValue:mockNetworking forKey:@"networking"];

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

	[[AWSroute53 route53ForKey:key] updateTrafficPolicyInstance:[AWSroute53UpdateTrafficPolicyInstanceRequest new] completionHandler:^(AWSroute53UpdateTrafficPolicyInstanceResponse* _Nullable response, NSError * _Nullable error) {
        XCTAssertNotNil(error);
        XCTAssertEqualObjects(@"OCMockExpectedNetworkingError", error.domain);
        XCTAssertEqual(8848, error.code);
        XCTAssertNil(response);
        dispatch_semaphore_signal(semaphore);
    }];
	
 	dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, (int)(2.0 * NSEC_PER_SEC)));
    OCMVerify([mockNetworking sendRequest:[OCMArg isNotNil]]);

    [AWSroute53 removeroute53ForKey:key];
}

@end
